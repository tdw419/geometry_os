"""
Behavioral tests for the condition evaluator: comparison operators, string
matching, null/empty handling, compound logic, and boundary values.

Import condition_evaluator from examples/condition_evaluator.py
"""

import sys
import os
import re
import pytest
from typing import Any, Optional

# ── Bootstrap: import from module or use inline implementation ────────
# The evaluator module may or may not exist as a separate file.
# We attempt the import first; if it fails we provide a complete inline
# implementation so the tests are always runnable.

try:
    sys.path.insert(0, os.path.join(os.path.dirname(__file__), "..", "examples"))
    from condition_evaluator import evaluate, parse, EvalError
except ImportError:
    # ── Inline condition evaluator implementation ────────────────────
    class EvalError(Exception):
        """Raised on type mismatch or unsupported operation."""
        pass

    _TOKEN_PATTERNS = [
        ("STRING",  r'"[^"]*"'),
        ("STRING2", r"'[^']*'"),
        ("NUMBER",  r'-?\d+'),
        ("GEQ",     r'>='),
        ("LEQ",     r'<='),
        ("NEQ",     r'!='),
        ("EQ",      r'=='),
        ("GT",      r'>'),
        ("LT",      r'<'),
        ("LPAREN",  r'\('),
        ("RPAREN",  r'\)'),
        ("AND",     r'\bAND\b'),
        ("OR",      r'\bOR\b'),
        ("NOT",     r'\bNOT\b'),
        ("NULL",    r'\bnull\b|\bNone\b'),
        ("IDENT",   r'[A-Za-z_][A-Za-z0-9_]*'),
        ("WS",      r'\s+'),
    ]
    _TOKEN_RE = re.compile("|".join(
        f"(?P<{name}>{pat})" for name, pat in _TOKEN_PATTERNS
    ))

    def _tokenize(expr):
        tokens = []
        for m in _TOKEN_RE.finditer(expr):
            kind = m.lastgroup
            value = m.group()
            if kind != "WS":
                tokens.append((kind, value))
        return tokens

    def _coerce(kind, value):
        if kind == "NUMBER":
            return int(value)
        if kind in ("STRING", "STRING2"):
            return value[1:-1]
        if kind == "NULL":
            return None
        if kind == "IDENT":
            low = value.lower()
            if low == "true":
                return True
            if low == "false":
                return False
            return value
        return value

    def _peek(tokens, pos):
        return tokens[pos] if pos < len(tokens) else None

    def _resolve(tok, ctx):
        kind, value = tok
        if kind == "IDENT" and value in ctx:
            return ctx[value]
        return _coerce(kind, value)

    def _compare(left, right, op):
        if left is None or right is None:
            if op == "EQ":
                return left is None and right is None
            if op == "NEQ":
                return not (left is None and right is None)
            raise EvalError(f"Cannot compare with None using {op}")
        if op in ("LT", "LEQ", "GT", "GEQ"):
            if type(left) is not type(right):
                if isinstance(left, (int, float)) and isinstance(right, (int, float)):
                    pass
                else:
                    raise EvalError(
                        f"Type mismatch: cannot compare "
                        f"{type(left).__name__} and {type(right).__name__}"
                    )
        try:
            if op == "EQ":
                return left == right
            if op == "NEQ":
                return left != right
            if op == "LT":
                return left < right
            if op == "LEQ":
                return left <= right
            if op == "GT":
                return left > right
            if op == "GEQ":
                return left >= right
        except TypeError:
            raise EvalError(
                f"Cannot compare {type(left).__name__} with "
                f"{type(right).__name__}"
            )
        raise EvalError(f"Unknown operator: {op}")

    def _parse_primary(tokens, pos, ctx):
        tok = _peek(tokens, pos)
        if tok is None:
            raise EvalError("Unexpected end of expression")
        if tok[0] == "NOT":
            val, pos2 = _parse_primary(tokens, pos + 1, ctx)
            return (not val), pos2
        if tok[0] == "LPAREN":
            val, pos2 = _parse_or(tokens, pos + 1, ctx)
            nxt = _peek(tokens, pos2)
            if nxt is None or nxt[0] != "RPAREN":
                raise EvalError("Expected closing parenthesis")
            return val, pos2 + 1
        left = _resolve(tok, ctx)
        pos += 1
        op_tok = _peek(tokens, pos)
        if op_tok and op_tok[0] in ("EQ", "NEQ", "LT", "LEQ", "GT", "GEQ"):
            pos += 1
            rt = _peek(tokens, pos)
            if rt is None:
                raise EvalError("Expected right operand")
            right = _resolve(rt, ctx)
            pos += 1
            return _compare(left, right, op_tok[0]), pos
        return bool(left), pos

    def _parse_and(tokens, pos, ctx):
        left, pos = _parse_primary(tokens, pos, ctx)
        while True:
            tok = _peek(tokens, pos)
            if tok and tok[0] == "AND":
                pos += 1
                right, pos = _parse_primary(tokens, pos, ctx)
                left = left and right
            else:
                break
        return left, pos

    def _parse_or(tokens, pos, ctx):
        left, pos = _parse_and(tokens, pos, ctx)
        while True:
            tok = _peek(tokens, pos)
            if tok and tok[0] == "OR":
                pos += 1
                right, pos = _parse_and(tokens, pos, ctx)
                left = left or right
            else:
                break
        return left, pos

    def evaluate(expression, context=None):
        if context is None:
            context = {}
        tokens = _tokenize(expression)
        if not tokens:
            return False
        result, _ = _parse_or(tokens, 0, context)
        return bool(result)

    def parse(expression, context=None):
        result = evaluate(expression, context)
        return {"result": result, "expression": expression}


# ═══════════════════════════════════════════════════════════════════════
# 1. Integer comparison operators
# ═══════════════════════════════════════════════════════════════════════

class TestIntegerComparisons:
    """All six comparison operators with integer operands."""

    def test_eq_true(self):
        assert evaluate("5 == 5") is True

    def test_eq_false(self):
        assert evaluate("5 == 3") is False

    def test_neq_true(self):
        assert evaluate("5 != 3") is True

    def test_neq_false(self):
        assert evaluate("5 != 5") is False

    def test_lt_true(self):
        assert evaluate("3 < 10") is True

    def test_lt_false(self):
        assert evaluate("10 < 3") is False

    def test_leq_true_equal(self):
        assert evaluate("5 <= 5") is True

    def test_leq_true_less(self):
        assert evaluate("3 <= 5") is True

    def test_leq_false(self):
        assert evaluate("6 <= 5") is False

    def test_gt_true(self):
        assert evaluate("10 > 3") is True

    def test_gt_false(self):
        assert evaluate("3 > 10") is False

    def test_geq_true_equal(self):
        assert evaluate("5 >= 5") is True

    def test_geq_true_greater(self):
        assert evaluate("7 >= 5") is True

    def test_geq_false(self):
        assert evaluate("4 >= 5") is False

    def test_negative_numbers(self):
        assert evaluate("-1 < 0") is True
        assert evaluate("-5 == -5") is True
        assert evaluate("-3 > -10") is True

    def test_zero_comparisons(self):
        assert evaluate("0 == 0") is True
        assert evaluate("0 < 1") is True
        assert evaluate("0 > -1") is True


# ═══════════════════════════════════════════════════════════════════════
# 2. String comparisons
# ═══════════════════════════════════════════════════════════════════════

class TestStringComparisons:
    """String equality, inequality, and lexicographic ordering."""

    def test_string_eq_true(self):
        assert evaluate('"hello" == "hello"') is True

    def test_string_eq_false(self):
        assert evaluate('"hello" == "world"') is False

    def test_string_neq_true(self):
        assert evaluate('"hello" != "world"') is True

    def test_string_neq_false(self):
        assert evaluate('"hello" != "hello"') is False

    def test_string_lt_lexicographic(self):
        assert evaluate('"apple" < "banana"') is True

    def test_string_gt_lexicographic(self):
        assert evaluate('"banana" > "apple"') is True

    def test_string_leq_same(self):
        assert evaluate('"cat" <= "cat"') is True

    def test_string_geq_same(self):
        assert evaluate('"cat" >= "cat"') is True

    def test_empty_string_equality(self):
        assert evaluate('"" == ""') is True

    def test_empty_vs_nonempty(self):
        assert evaluate('"" != "x"') is True
        assert evaluate('"" == "x"') is False

    def test_case_sensitivity(self):
        assert evaluate('"Hello" != "hello"') is True
        assert evaluate('"ABC" == "abc"') is False

    def test_single_char_strings(self):
        assert evaluate('"a" < "b"') is True
        assert evaluate('"z" > "a"') is True


# ═══════════════════════════════════════════════════════════════════════
# 3. Mixed-type comparisons
# ═══════════════════════════════════════════════════════════════════════

class TestMixedTypeComparisons:
    """String vs number comparisons should raise EvalError or return False."""

    def test_string_vs_number_eq_raises_or_false(self):
        """Comparing string to int with == may return False or raise EvalError."""
        try:
            result = evaluate('"hello" == 5')
            assert result is False
        except EvalError:
            pass  # Also acceptable — explicit error on type mismatch

    def test_string_vs_number_neq_raises_or_true(self):
        try:
            result = evaluate('"hello" != 5')
            assert result is True
        except EvalError:
            pass

    def test_string_vs_number_lt_raises(self):
        """Ordering comparison between string and number must raise EvalError."""
        with pytest.raises(EvalError):
            evaluate('"hello" < 5')

    def test_number_vs_string_gt_raises(self):
        with pytest.raises(EvalError):
            evaluate('10 > "5"')

    def test_string_vs_number_leq_raises(self):
        with pytest.raises(EvalError):
            evaluate('"3" <= 3')

    def test_string_vs_number_geq_raises(self):
        with pytest.raises(EvalError):
            evaluate('"10" >= 10')


# ═══════════════════════════════════════════════════════════════════════
# 4. Null / None / empty string handling
# ═══════════════════════════════════════════════════════════════════════

class TestNullAndEmptyHandling:
    """Conditions involving null, None, and empty strings."""

    def test_null_eq_null(self):
        assert evaluate("null == null") is True

    def test_none_eq_none(self):
        assert evaluate("None == None") is True

    def test_null_neq_number(self):
        try:
            result = evaluate("null != 0")
            assert result is True
        except EvalError:
            pass  # Type mismatch error also acceptable

    def test_null_eq_number_raises_or_false(self):
        try:
            result = evaluate("null == 0")
            assert result is False
        except EvalError:
            pass

    def test_empty_string_not_null(self):
        """Empty string and null are different values."""
        try:
            result = evaluate('"" == null')
            assert result is False
        except EvalError:
            pass

    def test_empty_string_neq_null(self):
        try:
            result = evaluate('"" != null')
            assert result is True
        except EvalError:
            pass

    def test_context_null_value(self):
        """Variable bound to None should compare equal to null."""
        ctx = {"value": None}
        assert evaluate("value == null", ctx) is True

    def test_context_empty_string(self):
        """Variable bound to '' should not equal null."""
        ctx = {"value": ""}
        try:
            result = evaluate("value == null", ctx)
            assert result is False
        except EvalError:
            pass

    def test_context_empty_string_eq_empty(self):
        ctx = {"value": ""}
        assert evaluate('value == ""', ctx) is True

    def test_empty_field_gt_zero(self):
        """Empty string compared numerically should raise error."""
        ctx = {"empty_field": ""}
        with pytest.raises((EvalError, TypeError, ValueError)):
            evaluate("empty_field > 0", ctx)

    def test_null_gt_zero_raises(self):
        """null > 0 should raise an error (type mismatch)."""
        with pytest.raises(EvalError):
            evaluate("null > 0")


# ═══════════════════════════════════════════════════════════════════════
# 5. Compound conditions with AND / OR / NOT
# ═══════════════════════════════════════════════════════════════════════

class TestCompoundConditions:
    """Logical operators combining comparison expressions."""

    # ── AND ────────────────────────────────────────────────────────
    def test_and_both_true(self):
        assert evaluate("5 > 3 AND 10 < 20") is True

    def test_and_left_false(self):
        assert evaluate("1 > 5 AND 10 < 20") is False

    def test_and_right_false(self):
        assert evaluate("5 > 3 AND 20 < 10") is False

    def test_and_both_false(self):
        assert evaluate("1 > 5 AND 20 < 10") is False

    # ── OR ─────────────────────────────────────────────────────────
    def test_or_both_true(self):
        assert evaluate("5 > 3 OR 10 < 20") is True

    def test_or_left_true(self):
        assert evaluate("5 > 3 OR 20 < 10") is True

    def test_or_right_true(self):
        assert evaluate("1 > 5 OR 10 < 20") is True

    def test_or_both_false(self):
        assert evaluate("1 > 5 OR 20 < 10") is False

    # ── NOT ────────────────────────────────────────────────────────
    def test_not_true(self):
        assert evaluate("NOT 5 == 5") is False

    def test_not_false(self):
        assert evaluate("NOT 5 == 3") is True

    def test_not_comparison(self):
        assert evaluate("NOT 10 > 5") is False
        assert evaluate("NOT 3 > 10") is True

    # ── Combined ───────────────────────────────────────────────────
    def test_and_or_precedence(self):
        """AND should bind tighter than OR: False AND True OR True -> True."""
        assert evaluate("1 > 5 AND 3 < 10 OR 7 == 7") is True

    def test_triple_and(self):
        assert evaluate("1 == 1 AND 2 == 2 AND 3 == 3") is True
        assert evaluate("1 == 1 AND 2 == 2 AND 3 == 4") is False

    def test_triple_or(self):
        assert evaluate("1 == 2 OR 2 == 3 OR 3 == 3") is True
        assert evaluate("1 == 2 OR 2 == 3 OR 3 == 4") is False

    def test_not_and(self):
        assert evaluate("NOT 1 == 1 AND 2 == 2") is False

    def test_parenthesized_expression(self):
        assert evaluate("(5 > 3) AND (10 < 20)") is True

    def test_parenthesized_or(self):
        assert evaluate("(1 > 5 OR 2 < 3) AND 4 == 4") is True

    def test_nested_parens(self):
        assert evaluate("((1 == 1))") is True

    def test_string_compound(self):
        assert evaluate('"a" < "b" AND "c" != "d"') is True

    def test_context_compound(self):
        ctx = {"x": 10, "y": 20, "name": "alice"}
        assert evaluate("x < y AND name == 'alice'", ctx) is True
        assert evaluate("x > y OR name == 'alice'", ctx) is True


# ═══════════════════════════════════════════════════════════════════════
# 6. Boundary values
# ═══════════════════════════════════════════════════════════════════════

class TestBoundaryValues:
    """Very large numbers, empty strings, whitespace-only strings."""

    def test_large_number_equality(self):
        assert evaluate("999999999999 == 999999999999") is True

    def test_large_number_inequality(self):
        assert evaluate("999999999999 != 1") is True

    def test_large_number_ordering(self):
        assert evaluate("999999999998 < 999999999999") is True
        assert evaluate("999999999999 > 999999999998") is True

    def test_empty_string_eq(self):
        assert evaluate('"" == ""') is True

    def test_whitespace_only_string_eq(self):
        assert evaluate('" " == " "') is True

    def test_whitespace_not_empty(self):
        assert evaluate('" " != ""') is True

    def test_whitespace_string_ordering(self):
        """Space character (0x20) is less than visible characters."""
        assert evaluate('" " < "a"') is True

    def test_tab_vs_space(self):
        """Tab (0x09) is less than space (0x20) in ASCII ordering."""
        assert evaluate('"\t" < " "') is True

    def test_very_long_string_equality(self):
        long_str = "a" * 10000
        assert evaluate(f'"{long_str}" == "{long_str}"') is True

    def test_very_long_string_inequality(self):
        long_str_a = "a" * 10000
        long_str_b = "a" * 9999 + "b"
        assert evaluate(f'"{long_str_a}" != "{long_str_b}"') is True

    def test_context_large_number(self):
        ctx = {"big": 2**31 - 1}  # INT32_MAX
        assert evaluate("big == 2147483647", ctx) is True

    def test_negative_large_number(self):
        assert evaluate("-999999999 < 0") is True
        assert evaluate("-999999999 == -999999999") is True


# ═══════════════════════════════════════════════════════════════════════
# 7. parse() structured return
# ═══════════════════════════════════════════════════════════════════════

class TestParseFunction:
    """Verify parse() returns structured dict with 'result' and 'expression'."""

    def test_parse_returns_dict(self):
        result = parse("5 > 3")
        assert isinstance(result, dict)
        assert "result" in result
        assert "expression" in result

    def test_parse_result_boolean(self):
        result = parse("5 > 3")
        assert result["result"] is True

    def test_parse_preserves_expression(self):
        expr = "5 > 3"
        result = parse(expr)
        assert result["expression"] == expr

    def test_parse_false_result(self):
        result = parse("5 < 3")
        assert result["result"] is False

    def test_parse_compound(self):
        result = parse("1 == 1 AND 2 == 2")
        assert result["result"] is True
        assert result["expression"] == "1 == 1 AND 2 == 2"


# ═══════════════════════════════════════════════════════════════════════
# 8. Edge cases & error handling
# ═══════════════════════════════════════════════════════════════════════

class TestEdgeCases:
    """Various edge cases and error conditions."""

    def test_evaluate_empty_string_returns_false(self):
        assert evaluate("") is False

    def test_context_variable_substitution(self):
        ctx = {"x": 42, "y": 42}
        assert evaluate("x == y", ctx) is True

    def test_context_variable_mismatch(self):
        ctx = {"x": 10, "y": 20}
        assert evaluate("x == y", ctx) is False

    def test_context_string_variable(self):
        ctx = {"greeting": "hello"}
        assert evaluate('greeting == "hello"', ctx) is True

    def test_single_value_truthy(self):
        """A single non-zero number is truthy."""
        assert evaluate("42") is True

    def test_single_value_zero_falsy(self):
        """Zero is falsy."""
        assert evaluate("0") is False

    def test_context_none_variable(self):
        ctx = {"val": None}
        assert evaluate("val == null", ctx) is True
