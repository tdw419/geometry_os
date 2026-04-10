"""
Tests for glyph_parser assignment statement handling.

Covers: simple assignment, assignment with expressions, multiple assignments,
compound operators, function call result assignment, array index assignment,
invalid targets, and undeclared variables.
"""

import pytest

from glyph_parser import (
    parse,
    tokenize,
    ParseError,
    ASTNode,
    AssignExpr,
    BinaryExpr,
    CallExpr,
    ExprStmt,
    Identifier,
    IndexExpr,
    NumberLiteral,
)


# ── 1. Simple assignment ──────────────────────────────────────────────────

class TestSimpleAssignment:
    def test_simple_assign_produces_exprstmt_with_assignexpr(self):
        """x = 42 -> ExprStmt(AssignExpr(name='x', NumberLiteral(42)))"""
        result = parse("x = 42")
        assert len(result) == 1
        stmt = result[0]
        assert isinstance(stmt, ExprStmt)
        assign = stmt.expr
        assert isinstance(assign, AssignExpr)
        assert assign.name == "x"
        assert isinstance(assign.value, NumberLiteral)
        assert assign.value.value == 42.0

    def test_simple_assign_string_value(self):
        """name = "hello" -> AssignExpr with StringLiteral value."""
        from glyph_parser import StringLiteral
        result = parse('name = "hello"')
        assign = result[0].expr
        assert isinstance(assign, AssignExpr)
        assert assign.name == "name"
        assert isinstance(assign.value, StringLiteral)
        assert assign.value.value == "hello"


# ── 2. Assignment with expression ─────────────────────────────────────────

class TestAssignmentWithExpression:
    def test_assign_binary_add(self):
        """y = x + 10 -> value is BinaryExpr('+', Identifier('x'), NumberLiteral(10))"""
        result = parse("y = x + 10")
        assign = result[0].expr
        assert isinstance(assign, AssignExpr)
        assert assign.name == "y"
        val = assign.value
        assert isinstance(val, BinaryExpr)
        assert val.op == "+"
        assert isinstance(val.left, Identifier)
        assert val.left.name == "x"
        assert isinstance(val.right, NumberLiteral)
        assert val.right.value == 10.0

    def test_assign_binary_multiply(self):
        """z = a * b -> value is BinaryExpr('*', Identifier('a'), Identifier('b'))"""
        result = parse("z = a * b")
        val = result[0].expr.value
        assert isinstance(val, BinaryExpr)
        assert val.op == "*"
        assert isinstance(val.left, Identifier)
        assert val.left.name == "a"
        assert isinstance(val.right, Identifier)
        assert val.right.name == "b"

    def test_assign_nested_expression(self):
        """result = (x + 1) * 2 -> nested BinaryExpr"""
        result = parse("result = (x + 1) * 2")
        val = result[0].expr.value
        assert isinstance(val, BinaryExpr)
        assert val.op == "*"
        # left side is (x + 1)
        assert isinstance(val.left, BinaryExpr)
        assert val.left.op == "+"
        assert isinstance(val.left.left, Identifier)
        assert val.left.left.name == "x"
        # right side is 2
        assert isinstance(val.right, NumberLiteral)
        assert val.right.value == 2.0


# ── 3. Multiple assignments in sequence ───────────────────────────────────

class TestMultipleAssignments:
    def test_three_assignments_count(self):
        """a = 1\\nb = 2\\nc = 3 -> three top-level statements."""
        result = parse("a = 1\nb = 2\nc = 3")
        assert len(result) == 3

    def test_three_assignments_values(self):
        """Verify each assignment target and value."""
        result = parse("a = 1\nb = 2\nc = 3")
        expected = [("a", 1.0), ("b", 2.0), ("c", 3.0)]
        for stmt, (name, val) in zip(result, expected):
            assert isinstance(stmt, ExprStmt)
            assign = stmt.expr
            assert isinstance(assign, AssignExpr)
            assert assign.name == name
            assert isinstance(assign.value, NumberLiteral)
            assert assign.value.value == val

    def test_assignments_separated_by_semicolons(self):
        """a = 1; b = 2; -> two assignments with semicolons."""
        result = parse("a = 1; b = 2;")
        assert len(result) == 2
        assert result[0].expr.name == "a"
        assert result[1].expr.name == "b"


# ── 4. Compound assignment (+=, -=) ──────────────────────────────────────

class TestCompoundAssignment:
    def test_plus_equal_raises_parse_error(self):
        """x += 5 is not supported and should raise ParseError.

        The lexer tokenizes '+=' as PLUS followed by ASSIGN, so the parser
        tries to parse 'x +' and then hits '=' where it expects a primary
        expression, resulting in a ParseError.
        """
        with pytest.raises(ParseError):
            parse("x += 5")

    def test_minus_equal_raises_parse_error(self):
        """x -= 1 is not supported and should raise ParseError."""
        with pytest.raises(ParseError):
            parse("x -= 1")

    def test_star_equal_raises_parse_error(self):
        """x *= 2 is not supported and should raise ParseError."""
        with pytest.raises(ParseError):
            parse("x *= 2")

    def test_slash_equal_raises_parse_error(self):
        """x /= 2 is not supported and should raise ParseError."""
        with pytest.raises(ParseError):
            parse("x /= 2")


# ── 5. Assignment of function call result ─────────────────────────────────

class TestAssignFunctionCallResult:
    def test_assign_call_result(self):
        """result = foo(1, 2) -> value is CallExpr(callee='foo', args=[1, 2])"""
        result = parse("result = foo(1, 2)")
        assign = result[0].expr
        assert isinstance(assign, AssignExpr)
        assert assign.name == "result"
        call = assign.value
        assert isinstance(call, CallExpr)
        assert call.callee == "foo"
        assert len(call.args) == 2
        assert isinstance(call.args[0], NumberLiteral)
        assert call.args[0].value == 1.0
        assert isinstance(call.args[1], NumberLiteral)
        assert call.args[1].value == 2.0

    def test_assign_call_no_args(self):
        """val = bar() -> value is CallExpr with empty args list."""
        result = parse("val = bar()")
        call = result[0].expr.value
        assert isinstance(call, CallExpr)
        assert call.callee == "bar"
        assert call.args == []

    def test_assign_call_with_ident_args(self):
        """r = add(a, b) -> CallExpr with Identifier args."""
        result = parse("r = add(a, b)")
        call = result[0].expr.value
        assert isinstance(call, CallExpr)
        assert call.callee == "add"
        assert len(call.args) == 2
        assert isinstance(call.args[0], Identifier)
        assert call.args[0].name == "a"
        assert isinstance(call.args[1], Identifier)
        assert call.args[1].name == "b"


# ── 6. Assignment of array index ─────────────────────────────────────────

class TestAssignArrayIndex:
    def test_assign_index_expr(self):
        """val = arr[0] -> value is IndexExpr(obj=Identifier('arr'), index=NumberLiteral(0))"""
        result = parse("val = arr[0]")
        assign = result[0].expr
        assert isinstance(assign, AssignExpr)
        assert assign.name == "val"
        idx = assign.value
        assert isinstance(idx, IndexExpr)
        assert isinstance(idx.obj, Identifier)
        assert idx.obj.name == "arr"
        assert isinstance(idx.index, NumberLiteral)
        assert idx.index.value == 0.0

    def test_assign_nested_index(self):
        """v = m[1][2] -> value is IndexExpr(IndexExpr(Identifier('m'), 1), 2)"""
        result = parse("v = m[1][2]")
        idx = result[0].expr.value
        assert isinstance(idx, IndexExpr)
        assert isinstance(idx.index, NumberLiteral)
        assert idx.index.value == 2.0
        inner = idx.obj
        assert isinstance(inner, IndexExpr)
        assert isinstance(inner.obj, Identifier)
        assert inner.obj.name == "m"
        assert isinstance(inner.index, NumberLiteral)
        assert inner.index.value == 1.0

    def test_assign_index_with_expression(self):
        """val = arr[i + 1] -> index is a BinaryExpr."""
        result = parse("val = arr[i + 1]")
        idx = result[0].expr.value
        assert isinstance(idx, IndexExpr)
        assert isinstance(idx.obj, Identifier)
        assert idx.obj.name == "arr"
        assert isinstance(idx.index, BinaryExpr)
        assert idx.index.op == "+"


# ── 7. Invalid assignment targets ────────────────────────────────────────

class TestInvalidAssignmentTargets:
    def test_number_on_lhs_raises_parse_error(self):
        """42 = x -> ParseError: invalid assignment target."""
        with pytest.raises(ParseError):
            parse("42 = x")

    def test_expression_on_lhs_raises_parse_error(self):
        """1 + 2 = y -> ParseError: invalid assignment target."""
        with pytest.raises(ParseError):
            parse("1 + 2 = y")

    def test_parenthesized_expr_on_lhs(self):
        """(x) = 1 is accepted because the parser unwraps parentheses,
        yielding a bare Identifier('x') which is a valid assignment target.
        This verifies the parser does not crash and produces AssignExpr."""
        result = parse("(x) = 1")
        assert len(result) == 1
        assign = result[0].expr
        assert isinstance(assign, AssignExpr)
        assert assign.name == "x"
        assert isinstance(assign.value, NumberLiteral)
        assert assign.value.value == 1.0

    def test_call_on_lhs_raises_parse_error(self):
        """foo() = 1 -> ParseError: invalid assignment target."""
        with pytest.raises(ParseError):
            parse("foo() = 1")


# ── 8. Undeclared variable in expression ─────────────────────────────────

class TestUndeclaredVariable:
    def test_undeclared_var_no_crash(self):
        """z = unknown_var + 1 should parse without error (no semantic checks)."""
        result = parse("z = unknown_var + 1")
        assert len(result) == 1
        assign = result[0].expr
        assert isinstance(assign, AssignExpr)
        assert assign.name == "z"

    def test_undeclared_var_preserves_name(self):
        """The identifier name 'unknown_var' must appear in the AST."""
        result = parse("z = unknown_var + 1")
        val = result[0].expr.value
        assert isinstance(val, BinaryExpr)
        assert isinstance(val.left, Identifier)
        assert val.left.name == "unknown_var"
        assert isinstance(val.right, NumberLiteral)
        assert val.right.value == 1.0


# ── Chained assignment (bonus) ────────────────────────────────────────────

class TestChainedAssignment:
    def test_chained_assign(self):
        """a = b = 1 -> AssignExpr('a', AssignExpr('b', NumberLiteral(1)))."""
        result = parse("a = b = 1")
        assert len(result) == 1
        outer = result[0].expr
        assert isinstance(outer, AssignExpr)
        assert outer.name == "a"
        inner = outer.value
        assert isinstance(inner, AssignExpr)
        assert inner.name == "b"
        assert isinstance(inner.value, NumberLiteral)
        assert inner.value.value == 1.0

    def test_triple_chained_assign(self):
        """a = b = c = 0 -> deeply nested AssignExpr nodes."""
        result = parse("a = b = c = 0")
        outer = result[0].expr
        assert isinstance(outer, AssignExpr)
        assert outer.name == "a"
        mid = outer.value
        assert isinstance(mid, AssignExpr)
        assert mid.name == "b"
        inner = mid.value
        assert isinstance(inner, AssignExpr)
        assert inner.name == "c"
        assert isinstance(inner.value, NumberLiteral)
        assert inner.value.value == 0.0
