<cfscript>
describe( "workbookFromCsv", function(){

	beforeEach( function(){
		variables.csv = 'column1,column2#crlf#"Frumpo McNugget",12345';
		variables.basicExpectedQuery = QueryNew( "column1,column2", "", [ [ "Frumpo McNugget", "12345" ] ] );
	});

	it( "Returns a workbook from a csv", function(){
		var xls = s.workbookFromCsv( csv=csv, firstRowIsHeader=true );
		var xlsx = s.workbookFromCsv( csv=csv, firstRowIsHeader=true, xmlFormat=true );
		var workbooks = [ xls, xlsx ];
		workbooks.Each( function( wb ){
			actual = s.getSheetHelper().sheetToQuery( workbook=wb, headerRow=1 );
			expect( actual ).toBe( basicExpectedQuery );
		});
	});

	it( "is chainable", function(){
		var xls = s.newChainable()
			.fromCsv( csv=csv, firstRowIsHeader=true )
			.getWorkbook();
		var xlsx = s.newChainable()
			.fromCsv( csv=csv, firstRowIsHeader=true, xmlFormat=true )
			.getWorkbook();
		var workbooks = [ xls, xlsx ];
		workbooks.Each( function( wb ){
			actual = s.getSheetHelper().sheetToQuery( workbook=wb, headerRow=1 );
			expect( actual ).toBe( basicExpectedQuery );
		});
	});

});	
</cfscript>