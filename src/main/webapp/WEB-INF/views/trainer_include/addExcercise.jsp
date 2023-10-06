
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="content-wrapper">
	<div class="container-fluid">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="#">Activity</a></li>
			<li class="breadcrumb-item active">Add Excercise</li>
			<li class="breadcrumb-item"><a class="btn btn-primary right"
				href='<spring:url value="/trainer/trainer_dashboard"/>'>Back</a></li>
		</ol>
		<div class="alert alert-primary text-center" role="alert">
			<h2>Week Excercise</h2>
		</div>

		<h3
			style="color: red; background-color: white; margin-right: 150px; margin-left: 150px;">${requestScope.message}</h3>
		<div class="container mt-3">
			<form method="post" enctype="multipart/form-data">
				<div class="form-group">
					<label for="email">Excercise Title:</label> <input type="text"
						class="form-control" id="title" name="title">
				</div>
				<p>Category Image:</p>
				<input type="file" id="myFile" name="image"> <input
					type="submit" class="btn btn-primary" value="Add New" />

			</form>
		</div>
	

	<hr>
		<script>
			$(".custom-file-input").on(
					"change",
					function() {
						var fileName = $(this).val().split("\\").pop();
						$(this).siblings(".custom-file-label").addClass(
								"selected").html(fileName);
					});
		</script>
		<div class="row">
			<div class="col-12">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th scope="col">Sr No</th>
							<th scope="col">Category Image</th>
							
							<th scope="col">Actions</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="cat" items="${sessionScope.excerciseList}">
							<tr>
								<td scope="row">${cat.id}</td>
								<td><img src="data:image/jpeg;base64,${cat.imgUtility}" height=100px width=100px/></td>
							
								<td>  <a
									href='<spring:url value="/trainer/deleteExcercise?eid=${cat.id}"/>'><button
											type="button" class="btn btn-danger">
											<i class="far fa-trash-alt"></i>
										</button></a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>