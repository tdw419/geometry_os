"""
Condition Evaluator Module

Provides evaluate() and parse() functions for evaluating boolean expressions
with comparison operators, compound logic (AND/OR/NOT), and variable substitution.
"""

import re
from typing import Any, Dict, Optional, Tuple, List


class EvalError(Exception):
    """Raised on type mismatch or unsupported operation."""
    pass


# Token patterns for the lexer
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


def _tokenize(expr: str) -> List[Tuple[str, str]]:
    """Tokenize an expression string into a list of (type, value) tuples."""
    tokens = []
    for m in _TOKEN_RE.finditer(expr):
        kind = m.lastgroup
        value = m.group()
        if kind != "WS":
            tokens.append((kind, value))
    return tokens


def _coerce(kind: str, value: str) -> Any:
    """Convert a token value to its Python equivalent."""
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


def _peek(tokens: List[Tuple[str, str]], pos: int) -> Optional[Tuple[str, str]]:
    """Safely peek at a token at the given position."""
    return tokens[pos] if pos < len(tokens) else None


def _resolve(tok: Tuple[str, str], ctx: Dict[str, Any]) -> Any:
    """Resolve a token to its value, checking context for variables."""
    kind, value = tok
    if kind == "IDENT" and value in ctx:
        return ctx[value]
    return _coerce(kind, value)


def _compare(left: Any, right: Any, op: str) -> bool:
    """Compare two values using the given operator."""
    if left is None or right is None:
        if op == "EQ":
            return left is None and right is None
        if op == "NEQ":
            return not (left is None and right is None)
        raise EvalError(f"Cannot compare with None using {op}")
    
    if op in ("LT", "LEQ", "GT", "GEQ"):
        if type(left) is not type(right):
            if isinstance(left, (int, float)) and isinstance(right, (int, float)):
                pass  # Allow int/float comparison
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


def _parse_primary(
    tokens: List[Tuple[str, str]], 
    pos: int, 
    ctx: Dict[str, Any]
) -> Tuple[Any, int]:
    """Parse a primary expression (literal, parenthesized, or comparison)."""
    tok = _peek(tokens, pos)
    if tok is None:
        raise EvalError("Unexpected end of expression")
    
    # Handle NOT operator (unary)
    if tok[0] == "NOT":
        val, pos2 = _parse_primary(tokens, pos + 1, ctx)
        return (not val), pos2
    
    # Handle parenthesized expressions
    if tok[0] == "LPAREN":
        val, pos2 = _parse_or(tokens, pos + 1, ctx)
        nxt = _peek(tokens, pos2)
        if nxt is None or nxt[0] != "RPAREN":
            raise EvalError("Expected closing parenthesis")
        return val, pos2 + 1
    
    # Handle literals and identifiers
    left = _resolve(tok, ctx)
    pos += 1
    
    # Check for comparison operator
    op_tok = _peek(tokens, pos)
    if op_tok and op_tok[0] in ("EQ", "NEQ", "LT", "LEQ", "GT", "GEQ"):
        pos += 1
        rt = _peek(tokens, pos)
        if rt is None:
            raise EvalError("Expected right operand")
        right = _resolve(rt, ctx)
        pos += 1
        return _compare(left, right, op_tok[0]), pos
    
    # Return boolean value of the literal
    return bool(left), pos


def _parse_and(
    tokens: List[Tuple[str, str]], 
    pos: int, 
    ctx: Dict[str, Any]
) -> Tuple[Any, int]:
    """Parse AND expressions (higher precedence than OR)."""
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


def _parse_or(
    tokens: List[Tuple[str, str]], 
    pos: int, 
    ctx: Dict[str, Any]
) -> Tuple[Any, int]:
    """Parse OR expressions (lowest precedence)."""
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


def evaluate(expression: str, context: Optional[Dict[str, Any]] = None) -> bool:
    """
    Evaluate a boolean expression string.
    
    Args:
        expression: The expression string to evaluate
        context: Optional dictionary of variable names to values
        
    Returns:
        Boolean result of the expression
        
    Raises:
        EvalError: If the expression is invalid or types don't match
        
    Examples:
        >>> evaluate("5 > 3")
        True
        >>> evaluate("x > 5", {"x": 10})
        True
        >>> evaluate("true AND false")
        False
    """
    if context is None:
        context = {}
    tokens = _tokenize(expression)
    if not tokens:
        return False
    result, _ = _parse_or(tokens, 0, context)
    return bool(result)


def parse(expression: str, context: Optional[Dict[str, Any]] = None) -> Dict[str, Any]:
    """
    Parse and evaluate a boolean expression, returning a dict with result and expression.
    
    Args:
        expression: The expression string to evaluate
        context: Optional dictionary of variable names to values
        
    Returns:
        Dictionary with 'result' (bool) and 'expression' (str) keys
        
    Examples:
        >>> parse("5 > 3")
        {'result': True, 'expression': '5 > 3'}
    """
    result = evaluate(expression, context)
    return {"result": result, "expression": expression}
