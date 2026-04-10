"""
Tests for glyph_parser error handling and recovery for malformed input.

Covers: unclosed blocks, unexpected tokens, missing expressions,
unclosed parentheses, double operators, break/continue outside loops,
invalid syntax, exception type verification, error message context,
and rejection of partially valid input.
"""

import pytest

from glyph_parser import parse, ParseError


# ── 1. Unclosed block ─────────────────────────────────────────────────────

class TestUnclosedBlock:
    def test_unclosed_block_after_if(self):
        """if (x) { x = 1  — missing closing brace should raise ParseError."""
        with pytest.raises(ParseError):
            parse("if (x) { x = 1")

    def test_unclosed_block_error_mentions_position(self):
        """Error message should reference position or an unexpected token."""
        with pytest.raises(ParseError) as exc_info:
            parse("if (x) { x = 1")
        msg = str(exc_info.value).lower()
        assert "position" in msg or "expected" in msg or "unexpected" in msg

    def test_unclosed_block_single_brace(self):
        """A lone opening brace with content should raise ParseError."""
        with pytest.raises(ParseError):
            parse("{ x = 1")


# ── 2. Unexpected token ──────────────────────────────────────────────────

class TestUnexpectedToken:
    def test_else_without_matching_if(self):
        """else at top level should raise ParseError."""
        with pytest.raises(ParseError):
            parse("else x = 1")

    def test_else_without_if_error_message(self):
        """Error message should mention 'else' or the unexpected token."""
        with pytest.raises(ParseError) as exc_info:
            parse("else x = 1")
        msg = str(exc_info.value).lower()
        assert "else" in msg or "unexpected" in msg

    def test_stray_closing_brace(self):
        """A stray '}' at top level should raise ParseError."""
        with pytest.raises(ParseError):
            parse("}")

    def test_stray_closing_paren(self):
        """A stray ')' at top level should raise ParseError."""
        with pytest.raises(ParseError):
            parse(")")


# ── 3. Missing expression ────────────────────────────────────────────────

class TestMissingExpression:
    def test_assignment_with_no_rhs(self):
        """x = (nothing) should raise ParseError."""
        with pytest.raises(ParseError):
            parse("x =")

    def test_assignment_with_no_rhs_error_mentions_position(self):
        """Error should reference position information."""
        with pytest.raises(ParseError) as exc_info:
            parse("x =")
        msg = str(exc_info.value)
        assert "position" in msg

    def test_empty_source(self):
        """Empty source should parse successfully (returns empty list)."""
        result = parse("")
        assert result == []


# ── 4. Unclosed parenthesis ──────────────────────────────────────────────

class TestUnclosedParenthesis:
    def test_unclosed_paren_in_expression(self):
        """x = (1 + 2  — missing closing paren should raise ParseError."""
        with pytest.raises(ParseError):
            parse("x = (1 + 2")

    def test_unclosed_paren_error_mentions_rparen(self):
        """Error message should mention expected RPAREN or position."""
        with pytest.raises(ParseError) as exc_info:
            parse("x = (1 + 2")
        msg = str(exc_info.value)
        assert "RPAREN" in msg or "position" in msg

    def test_nested_unclosed_parens(self):
        """x = ((1 + 2) — one paren still unclosed."""
        with pytest.raises(ParseError):
            parse("x = ((1 + 2)")


# ── 5. Double operator ───────────────────────────────────────────────────

class TestDoubleOperator:
    def test_double_plus_operator(self):
        """x = 1 ++ 2 — double plus should raise ParseError."""
        with pytest.raises(ParseError):
            parse("x = 1 ++ 2")

    def test_double_plus_error_unexpected_token(self):
        """Error should identify the unexpected second operator."""
        with pytest.raises(ParseError) as exc_info:
            parse("x = 1 ++ 2")
        msg = str(exc_info.value).lower()
        assert "unexpected" in msg or "position" in msg

    def test_trailing_operator(self):
        """x = 1 + — operator with no right operand should raise ParseError."""
        with pytest.raises(ParseError):
            parse("x = 1 +")


# ── 6. Break / continue outside loop ─────────────────────────────────────

class TestBreakContinueOutsideLoop:
    def test_break_at_top_level(self):
        """break outside any loop should raise ParseError."""
        with pytest.raises(ParseError):
            parse("break")

    def test_continue_at_top_level(self):
        """continue outside any loop should raise ParseError."""
        with pytest.raises(ParseError):
            parse("continue")

    def test_break_error_mentions_loop(self):
        """Error message should mention 'break' and being outside a loop."""
        with pytest.raises(ParseError) as exc_info:
            parse("break")
        msg = str(exc_info.value).lower()
        assert "break" in msg
        assert "loop" in msg or "outside" in msg

    def test_continue_error_mentions_loop(self):
        """Error message should mention 'continue' and being outside a loop."""
        with pytest.raises(ParseError) as exc_info:
            parse("continue")
        msg = str(exc_info.value).lower()
        assert "continue" in msg
        assert "loop" in msg or "outside" in msg

    def test_break_inside_while_is_valid(self):
        """break inside a while loop should NOT raise ParseError."""
        result = parse("while (true) { break }")
        assert len(result) == 1

    def test_continue_inside_while_is_valid(self):
        """continue inside a while loop should NOT raise ParseError."""
        result = parse("while (true) { continue }")
        assert len(result) == 1

    def test_break_in_nested_while(self):
        """break in a nested while loop should NOT raise ParseError."""
        result = parse("while (true) { while (false) { break } }")
        assert len(result) == 1

    def test_continue_in_nested_while(self):
        """continue in a nested while loop should NOT raise ParseError."""
        result = parse("while (true) { while (false) { continue } }")
        assert len(result) == 1


# ── 7. Invalid function syntax ───────────────────────────────────────────

class TestInvalidFunctionSyntax:
    def test_fn_number_as_name(self):
        """fn 123() — 'fn' followed by a number then parens should raise ParseError."""
        with pytest.raises(ParseError):
            parse("fn 123()")

    def test_lone_open_paren(self):
        """A bare open paren should raise ParseError."""
        with pytest.raises(ParseError):
            parse("(")

    def test_lone_operator(self):
        """A bare operator should raise ParseError."""
        with pytest.raises(ParseError):
            parse("+")

    def test_assign_to_number(self):
        """123 = x — assigning to a number literal should raise ParseError."""
        with pytest.raises(ParseError):
            parse("123 = x")


# ── 8. Exception type and message content ────────────────────────────────

class TestExceptionTypeAndMessage:
    def test_parse_error_is_exception_subclass(self):
        """ParseError should be a subclass of Exception."""
        assert issubclass(ParseError, Exception)

    def test_error_message_contains_position(self):
        """Error messages should include position information."""
        with pytest.raises(ParseError) as exc_info:
            parse("x = (1 + 2")
        msg = str(exc_info.value)
        assert "position" in msg

    def test_error_message_contains_token_info(self):
        """Error messages should include token type or value information."""
        with pytest.raises(ParseError) as exc_info:
            parse("else x = 1")
        msg = str(exc_info.value)
        assert "ELSE" in msg or "else" in msg

    def test_break_error_contains_position(self):
        """Break-outside-loop error should include position."""
        with pytest.raises(ParseError) as exc_info:
            parse("break")
        msg = str(exc_info.value)
        assert "position" in msg

    def test_continue_error_contains_position(self):
        """Continue-outside-loop error should include position."""
        with pytest.raises(ParseError) as exc_info:
            parse("continue")
        msg = str(exc_info.value)
        assert "position" in msg


# ── 9. No partial success — whole parse must fail ───────────────────────

class TestNoPartialSuccess:
    def test_valid_then_invalid_does_not_succeed(self):
        """A valid statement followed by garbage should raise ParseError,
        not return a partial AST."""
        with pytest.raises(ParseError):
            parse("x = 1 }")

    def test_valid_if_then_unclosed_block(self):
        """Valid if start with unclosed block should fail entirely."""
        with pytest.raises(ParseError):
            parse("if (x) { x = 1")

    def test_multiple_valid_then_invalid(self):
        """Multiple valid statements then an error should still raise."""
        with pytest.raises(ParseError):
            parse("x = 1 y = 2 z =")

    def test_partial_parse_raises_not_returns(self):
        """Verify that parse() raises instead of returning a partial result."""
        try:
            result = parse("x = 1 if (")
            pytest.fail("parse() should have raised ParseError for malformed input")
        except ParseError:
            pass  # expected

    def test_valid_while_then_break_outside(self):
        """A valid while loop followed by a stray break should raise."""
        with pytest.raises(ParseError):
            parse("while (true) { x = 1 } break")
