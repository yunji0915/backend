<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*" %>

<%
    String id = request.getParameter("id");

    Connection con = null;
    PreparedStatement pstmt = null;

    try {
        Class.forName("org.mariadb.jdbc.Driver");

        String url = "jdbc:mariadb://localhost:3307/backend";
        String user = "jacki";
        String pass = "1111";
        con = DriverManager.getConnection(url, user, pass);

        String sql = "DELETE FROM stumember WHERE id = ?";
        pstmt = con.prepareStatement(sql);
        pstmt.setString(1, id);
        pstmt.executeUpdate();
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (pstmt != null) try { pstmt.close(); } catch (Exception e) {}
        if (con != null) try { con.close(); } catch (Exception e) {}
    }
%>

<script>
    alert("삭제되었습니다!");
    location.href = 'list.jsp';
</script>
