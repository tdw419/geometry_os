"""
Glyph language parser – minimal implementation for testing.

Provides a recursive-descent parser that produces an AST from Glyph source
code.  Supports:

  - if / else if / else  (with block bodies)
  - while loops
  - break / continue
  - expression statements (assignments, calls, literals)
  - block statements  { ... }

Public API
----------
    parse(source: str) -> list[ASTNode]
        Parse a full Glyph source string and return a list of top-level
        statements.

    tokenize(source: str) -> list[Token]
        Low-level lexer (exposed for unit-testing).

AST node classes are defined at module level for easy ``isinstance`` checks.
"""

from __future__ import annotations

import re
import dataclasses
from dataclasses import dataclass, field
from typing import List, Optional, Any, Union

# ── Token ──────────────────────────────────────────────────────────────

@dataclass
class Token:
    type: str
    value: str
    pos: int = 0

    def __repr__(self):
        return f"Token({self.type}, {self.value!r})"


# ── AST node types ─────────────────────────────────────────────────────

@dataclass
class ASTNode:
    """Base class for all AST nodes."""
    pass


@dataclass
class Block(ASTNode):
    statements: List[ASTNode] = field(default_factory=list)


@dataclass
class IfStmt(ASTNode):
    condition: ASTNode
    then_body: Block
    else_body: Optional[ASTNode] = None  # Block or IfStmt (for else-if)


@dataclass
class WhileStmt(ASTNode):
    condition: ASTNode
    body: Block


@dataclass
class BreakStmt(ASTNode):
    pass


@dataclass
class ContinueStmt(ASTNode):
    pass


@dataclass
class ExprStmt(ASTNode):
    expr: ASTNode


@dataclass
class BinaryExpr(ASTNode):
    op: str
    left: ASTNode
    right: ASTNode


@dataclass
class UnaryExpr(ASTNode):
    op: str
    operand: ASTNode


@dataclass
class AssignExpr(ASTNode):
    name: str
    value: ASTNode


@dataclass
class CallExpr(ASTNode):
    callee: str
    args: List[ASTNode] = field(default_factory=list)


@dataclass
class IndexExpr(ASTNode):
    obj: ASTNode
    index: ASTNode


@dataclass
class Identifier(ASTNode):
    name: str


@dataclass
class NumberLiteral(ASTNode):
    value: float


@dataclass
class StringLiteral(ASTNode):
    value: str


@dataclass
class BoolLiteral(ASTNode):
    value: bool


@dataclass
class ArrayLiteral(ASTNode):
    elements: List[ASTNode] = field(default_factory=list)


@dataclass
class NullLiteral(ASTNode):
    pass


# ── Lexer ──────────────────────────────────────────────────────────────

_KEYWORDS = {
    "if", "else", "while", "break", "continue",
    "true", "false", "null",
}

_TOKEN_SPEC = [
    ("STRING",    r'"[^"]*"'),
    ("STRING2",   r"'[^']*'"),
    ("NUMBER",    r'\d+(?:\.\d+)?'),
    ("GEQ",       r'>='),
    ("LEQ",       r'<='),
    ("EQ",        r'=='),
    ("NEQ",       r'!='),
    ("AND",       r'&&'),
    ("OR",        r'\|\|'),
    ("GT",        r'>'),
    ("LT",        r'<'),
    ("PLUS",      r'\+'),
    ("MINUS",     r'-'),
    ("STAR",      r'\*'),
    ("SLASH",     r'/'),
    ("PERCENT",   r'%'),
    ("ASSIGN",    r'='),
    ("BANG",      r'!'),
    ("TILDE",     r'~'),
    ("LPAREN",    r'\('),
    ("RPAREN",    r'\)'),
    ("LBRACE",    r'\{'),
    ("RBRACE",    r'\}'),
    ("LBRACKET",  r'\['),
    ("RBRACKET",  r'\]'),
    ("SEMICOLON", r';'),
    ("COMMA",     r','),
    ("DOT",       r'\.'),
    ("IDENT",     r'[A-Za-z_][A-Za-z0-9_]*'),
    ("WS",        r'\s+'),
    ("COMMENT",   r'//[^\n]*'),
    ("MISMATCH",  r'.'),
]

_TOKEN_RE = re.compile("|".join(
    f"(?P<{name}>{pat})" for name, pat in _TOKEN_SPEC
))


class ParseError(Exception):
    """Raised when the parser encounters unexpected tokens."""
    pass


def tokenize(source: str) -> List[Token]:
    tokens: List[Token] = []
    for m in _TOKEN_RE.finditer(source):
        kind = m.lastgroup
        value = m.group()
        pos = m.start()
        if kind == "WS" or kind == "COMMENT":
            continue
        if kind == "MISMATCH":
            raise ParseError(f"Unexpected character {value!r} at position {pos}")
        if kind == "IDENT" and value in _KEYWORDS:
            kind = value.upper()  # e.g. "if" -> "IF"
        if kind in ("STRING", "STRING2"):
            kind = "STRING"
            value = value[1:-1]  # strip quotes
        tokens.append(Token(kind, value, pos))
    tokens.append(Token("EOF", "", len(source)))
    return tokens


# ── Parser ─────────────────────────────────────────────────────────────

class Parser:
    def __init__(self, tokens: List[Token]):
        self.tokens = tokens
        self.pos = 0
        self._loop_depth = 0  # track nesting for break/continue validation

    # -- helpers --------------------------------------------------------

    def _peek(self) -> Token:
        return self.tokens[self.pos]

    def _advance(self) -> Token:
        tok = self.tokens[self.pos]
        self.pos += 1
        return tok

    def _expect(self, type_: str) -> Token:
        tok = self._peek()
        if tok.type != type_:
            raise ParseError(
                f"Expected {type_}, got {tok.type} ({tok.value!r}) "
                f"at position {tok.pos}"
            )
        return self._advance()

    def _match(self, *types: str) -> Optional[Token]:
        if self._peek().type in types:
            return self._advance()
        return None

    def _check(self, type_: str) -> bool:
        return self._peek().type == type_

    # -- public entry point --------------------------------------------

    def parse_program(self) -> List[ASTNode]:
        stmts: List[ASTNode] = []
        while not self._check("EOF"):
            stmts.append(self._parse_statement())
        return stmts

    # -- statements -----------------------------------------------------

    def _parse_statement(self) -> ASTNode:
        if self._check("IF"):
            return self._parse_if()
        if self._check("WHILE"):
            return self._parse_while()
        if self._check("BREAK"):
            return self._parse_break()
        if self._check("CONTINUE"):
            return self._parse_continue()
        if self._check("LBRACE"):
            return self._parse_block()
        return self._parse_expr_statement()

    def _parse_if(self) -> IfStmt:
        self._expect("IF")
        self._expect("LPAREN")
        condition = self._parse_expression()
        self._expect("RPAREN")
        then_body = self._parse_block_or_statement()
        else_body = None
        if self._match("ELSE"):
            if self._check("IF"):
                else_body = self._parse_if()
            else:
                else_body = self._parse_block_or_statement()
        return IfStmt(condition=condition, then_body=then_body, else_body=else_body)

    def _parse_while(self) -> WhileStmt:
        self._expect("WHILE")
        self._expect("LPAREN")
        condition = self._parse_expression()
        self._expect("RPAREN")
        self._loop_depth += 1
        try:
            body = self._parse_block_or_statement()
        finally:
            self._loop_depth -= 1
        return WhileStmt(condition=condition, body=body)

    def _parse_break(self) -> BreakStmt:
        tok = self._expect("BREAK")
        if self._loop_depth == 0:
            raise ParseError(
                f"'break' outside of loop at position {tok.pos}"
            )
        self._match("SEMICOLON")
        return BreakStmt()

    def _parse_continue(self) -> ContinueStmt:
        tok = self._expect("CONTINUE")
        if self._loop_depth == 0:
            raise ParseError(
                f"'continue' outside of loop at position {tok.pos}"
            )
        self._match("SEMICOLON")
        return ContinueStmt()

    def _parse_block_or_statement(self) -> Block:
        if self._check("LBRACE"):
            return self._parse_block()
        # single-statement body -> wrap in a Block
        stmt = self._parse_statement()
        return Block(statements=[stmt])

    def _parse_block(self) -> Block:
        self._expect("LBRACE")
        stmts: List[ASTNode] = []
        while not self._check("RBRACE") and not self._check("EOF"):
            stmts.append(self._parse_statement())
        self._expect("RBRACE")
        return Block(statements=stmts)

    def _parse_expr_statement(self) -> ExprStmt:
        expr = self._parse_expression()
        self._match("SEMICOLON")
        return ExprStmt(expr=expr)

    # -- expressions (precedence climbing) ------------------------------

    def _parse_expression(self) -> ASTNode:
        return self._parse_assignment()

    def _parse_assignment(self) -> ASTNode:
        expr = self._parse_or()
        if self._check("ASSIGN") and isinstance(expr, Identifier):
            self._advance()
            value = self._parse_assignment()
            return AssignExpr(name=expr.name, value=value)
        return expr

    def _parse_or(self) -> ASTNode:
        left = self._parse_and()
        while (tok := self._match("OR")):
            right = self._parse_and()
            left = BinaryExpr(op="||", left=left, right=right)
        return left

    def _parse_and(self) -> ASTNode:
        left = self._parse_equality()
        while (tok := self._match("AND")):
            right = self._parse_equality()
            left = BinaryExpr(op="&&", left=left, right=right)
        return left

    def _parse_equality(self) -> ASTNode:
        left = self._parse_comparison()
        while (tok := self._match("EQ", "NEQ")):
            op = tok.value
            right = self._parse_comparison()
            left = BinaryExpr(op=op, left=left, right=right)
        return left

    def _parse_comparison(self) -> ASTNode:
        left = self._parse_addition()
        while (tok := self._match("LT", "GT", "LEQ", "GEQ")):
            op = tok.value
            right = self._parse_addition()
            left = BinaryExpr(op=op, left=left, right=right)
        return left

    def _parse_addition(self) -> ASTNode:
        left = self._parse_multiplication()
        while (tok := self._match("PLUS", "MINUS")):
            op = tok.value
            right = self._parse_multiplication()
            left = BinaryExpr(op=op, left=left, right=right)
        return left

    def _parse_multiplication(self) -> ASTNode:
        left = self._parse_unary()
        while (tok := self._match("STAR", "SLASH", "PERCENT")):
            op = tok.value
            right = self._parse_unary()
            left = BinaryExpr(op=op, left=left, right=right)
        return left

    def _parse_unary(self) -> ASTNode:
        if tok := self._match("BANG", "MINUS", "TILDE"):
            operand = self._parse_unary()
            return UnaryExpr(op=tok.value, operand=operand)
        return self._parse_postfix()

    def _parse_postfix(self) -> ASTNode:
        expr = self._parse_primary()
        while True:
            if self._check("LPAREN") and isinstance(expr, Identifier):
                self._advance()
                args: List[ASTNode] = []
                if not self._check("RPAREN"):
                    args.append(self._parse_expression())
                    while self._match("COMMA"):
                        args.append(self._parse_expression())
                self._expect("RPAREN")
                expr = CallExpr(callee=expr.name, args=args)
            elif self._match("LBRACKET"):
                index = self._parse_expression()
                self._expect("RBRACKET")
                expr = IndexExpr(obj=expr, index=index)
            else:
                break
        return expr

    def _parse_primary(self) -> ASTNode:
        # Grouped expression
        if self._match("LPAREN"):
            expr = self._parse_expression()
            self._expect("RPAREN")
            return expr
        # Array literal
        if self._check("LBRACKET"):
            return self._parse_array_literal()
        # Literals
        if tok := self._match("NUMBER"):
            val = float(tok.value) if '.' in tok.value else float(int(tok.value))
            return NumberLiteral(value=val)
        if tok := self._match("STRING"):
            return StringLiteral(value=tok.value)
        if tok := self._match("TRUE"):
            return BoolLiteral(value=True)
        if tok := self._match("FALSE"):
            return BoolLiteral(value=False)
        if tok := self._match("NULL"):
            return NullLiteral()
        # Identifier
        if tok := self._match("IDENT"):
            return Identifier(name=tok.value)
        t = self._peek()
        raise ParseError(
            f"Unexpected token {t.type} ({t.value!r}) at position {t.pos}"
        )

    def _parse_array_literal(self) -> ArrayLiteral:
        self._expect("LBRACKET")
        elements: List[ASTNode] = []
        if not self._check("RBRACKET"):
            elements.append(self._parse_expression())
            while self._match("COMMA"):
                elements.append(self._parse_expression())
        self._expect("RBRACKET")
        return ArrayLiteral(elements=elements)


# ── Convenience function ───────────────────────────────────────────────

def parse(source: str) -> List[ASTNode]:
    """Tokenize + parse Glyph source, returning a list of AST statements."""
    tokens = tokenize(source)
    parser = Parser(tokens)
    return parser.parse_program()
