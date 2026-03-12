"""
Lisp Interpreter in Python

Architecture decisions will be noted as we build incrementally.
"""

# ============================================================================
# STEP 1: Lexer/Tokenizer
# ============================================================================
# Decision: Use a simple tokenizer that handles:
# - Parentheses (for list structure)
# - Numbers (integers and floats)
# - Strings (double-quoted)
# - Symbols (any other atom)
# - Comments (semicolon to end of line)

def tokenize(source: str) -> list[str]:
    """Convert source string into a list of tokens."""
    tokens = []
    i = 0
    while i < len(source):
        c = source[i]

        # Skip whitespace
        if c.isspace():
            i += 1
            continue

        # Skip comments
        if c == ';':
            while i < len(source) and source[i] != '\n':
                i += 1
            continue

        # Parentheses
        if c in '()':
            tokens.append(c)
            i += 1
            continue

        # Strings
        if c == '"':
            j = i + 1
            while j < len(source) and source[j] != '"':
                if source[j] == '\\' and j + 1 < len(source):
                    j += 2  # Skip escaped character
                else:
                    j += 1
            if j >= len(source):
                raise SyntaxError("Unterminated string")
            tokens.append(source[i:j+1])  # Include quotes
            i = j + 1
            continue

        # Quote shorthand 'x -> (quote x)
        if c == "'":
            tokens.append('(')
            tokens.append('quote')
            # Find what follows the quote
            j = i + 1
            while j < len(source) and source[j].isspace():
                j += 1
            if j >= len(source):
                raise SyntaxError("Nothing to quote")

            # If it's a list, we need to track parentheses
            if source[j] == '(':
                depth = 0
                start = j
                while j < len(source):
                    if source[j] == '(':
                        depth += 1
                    elif source[j] == ')':
                        depth -= 1
                        if depth == 0:
                            j += 1
                            break
                    j += 1
                # Tokenize the quoted expression
                sub_tokens = tokenize(source[start:j])
                tokens.extend(sub_tokens)
            else:
                # Atom after quote - find end of atom
                start = j
                while j < len(source) and source[j] not in '() \t\n\r;':
                    j += 1
                atom = source[start:j]
                if atom:
                    tokens.append(atom)
            tokens.append(')')
            i = j
            continue

        # Numbers and symbols
        j = i
        while j < len(source) and source[j] not in '() \t\n\r;':
            j += 1
        token = source[i:j]
        if token:
            tokens.append(token)
        i = j

    return tokens


# ============================================================================
# STEP 2: Parser
# ============================================================================
# Decision: Parse tokens into an AST using Python lists for Lisp lists.
# - Numbers become Python int/float
# - Strings become Python str (with quotes stripped)
# - Symbols become a Symbol class (to distinguish from strings)
# - Lists become Python lists

class Symbol:
    """Represents a Lisp symbol."""
    def __init__(self, name: str):
        self.name = name

    def __repr__(self):
        return self.name

    def __eq__(self, other):
        return isinstance(other, Symbol) and self.name == other.name

    def __hash__(self):
        return hash(self.name)


def parse(tokens: list[str]) -> list:
    """Parse tokens into an AST (list of expressions)."""
    if not tokens:
        return []

    def parse_expr(index: int) -> tuple:
        """Parse a single expression, return (expr, next_index)."""
        if index >= len(tokens):
            raise SyntaxError("Unexpected end of input")

        token = tokens[index]

        if token == '(':
            # Parse a list
            lst = []
            index += 1
            while index < len(tokens) and tokens[index] != ')':
                expr, index = parse_expr(index)
                lst.append(expr)
            if index >= len(tokens):
                raise SyntaxError("Missing closing parenthesis")
            return lst, index + 1

        elif token == ')':
            raise SyntaxError("Unexpected closing parenthesis")

        else:
            # Parse an atom
            return parse_atom(token), index + 1

    expressions = []
    i = 0
    while i < len(tokens):
        expr, i = parse_expr(i)
        expressions.append(expr)

    return expressions


# Special singleton values for true/false
class LispBoolean:
    """Lisp boolean singleton."""
    def __init__(self, value: bool):
        self.value = value

    def __repr__(self):
        return '#t' if self.value else '#f'

    def __eq__(self, other):
        if isinstance(other, LispBoolean):
            return self.value == other.value
        return False

    def __bool__(self):
        return self.value

    def __hash__(self):
        return hash(self.value)


# Global singletons
TRUE = LispBoolean(True)
FALSE = LispBoolean(False)


def parse_atom(token: str) -> int | float | str | Symbol | LispBoolean:
    """Parse a single atom (number, string, symbol, or boolean)."""
    # Boolean literals
    if token == '#t':
        return TRUE
    if token == '#f':
        return FALSE

    # Try integer
    try:
        return int(token)
    except ValueError:
        pass

    # Try float
    try:
        return float(token)
    except ValueError:
        pass

    # String literal
    if token.startswith('"') and token.endswith('"'):
        # Unescape simple escape sequences
        s = token[1:-1]
        s = s.replace('\\n', '\n').replace('\\t', '\t').replace('\\"', '"').replace('\\\\', '\\')
        return s

    # Symbol
    return Symbol(token)


# ============================================================================
# STEP 3: Environment
# ============================================================================
# Decision: Use a class with parent pointer for lexical scoping.
# This allows nested scopes (for lambdas) to look up outer bindings.

class Environment:
    """Environment for variable bindings with lexical scoping."""

    def __init__(self, bindings: dict = None, parent: 'Environment' = None):
        self.bindings = bindings if bindings else {}
        self.parent = parent

    def get(self, symbol: Symbol):
        """Look up a symbol in this environment or parent scopes."""
        if symbol.name in self.bindings:
            return self.bindings[symbol.name]
        if self.parent:
            return self.parent.get(symbol)
        raise NameError(f"Undefined symbol: {symbol.name}")

    def set(self, symbol: Symbol, value):
        """Set a symbol in the current environment."""
        self.bindings[symbol.name] = value

    def define(self, symbol: Symbol, value):
        """Define a new binding in the current environment."""
        self.bindings[symbol.name] = value


# ============================================================================
# STEP 4: Lambda (User-defined functions)
# ============================================================================

class Lambda:
    """User-defined function with closure over defining environment."""

    def __init__(self, params: list[Symbol], body, env: Environment):
        self.params = params
        self.body = body
        self.env = env

    def __repr__(self):
        return f"<lambda ({' '.join(p.name for p in self.params)})>"


# ============================================================================
# STEP 5: Evaluator
# ============================================================================
# Decision: Use a recursive evaluator with pattern matching on expression type.
# Special forms are handled explicitly before evaluation.

def evaluate(expr, env: Environment):
    """Evaluate an expression in the given environment."""

    # Self-evaluating: numbers, strings, and booleans
    if isinstance(expr, (int, float, LispBoolean)):
        return expr
    if isinstance(expr, str):
        return expr

    # Symbol lookup
    if isinstance(expr, Symbol):
        return env.get(expr)

    # Empty list
    if expr == []:
        return []

    # List expression (function call or special form)
    if isinstance(expr, list):
        if not expr:
            return []

        first = expr[0]

        # Special forms
        if isinstance(first, Symbol):
            # quote
            if first.name == 'quote':
                if len(expr) != 2:
                    raise SyntaxError("quote requires exactly one argument")
                return expr[1]

            # if
            if first.name == 'if':
                if len(expr) < 3 or len(expr) > 4:
                    raise SyntaxError("if requires 2 or 3 arguments")
                condition = evaluate(expr[1], env)
                # In Scheme, only #f is false; everything else is true
                if condition is not FALSE:
                    return evaluate(expr[2], env)
                elif len(expr) == 4:
                    return evaluate(expr[3], env)
                else:
                    return None  # No else branch, condition was false

            # define
            if first.name == 'define':
                if len(expr) != 3:
                    raise SyntaxError("define requires exactly 2 arguments")
                if isinstance(expr[1], Symbol):
                    # Simple variable definition
                    value = evaluate(expr[2], env)
                    env.define(expr[1], value)
                    return value
                elif isinstance(expr[1], list) and len(expr[1]) > 0:
                    # Function shorthand: (define (f x) body)
                    func_name = expr[1][0]
                    params = expr[1][1:]
                    body = expr[2]
                    lam = Lambda(params, body, env)
                    env.define(func_name, lam)
                    return lam
                else:
                    raise SyntaxError("Invalid define syntax")

            # lambda
            if first.name == 'lambda':
                if len(expr) != 3:
                    raise SyntaxError("lambda requires exactly 2 arguments")
                params = expr[1]
                if not isinstance(params, list):
                    raise SyntaxError("lambda parameters must be a list")
                body = expr[2]
                return Lambda(params, body, env)

        # Function application
        func = evaluate(first, env)
        args = [evaluate(arg, env) for arg in expr[1:]]

        if callable(func):
            return func(*args)
        elif isinstance(func, Lambda):
            # Create new environment with parameter bindings
            if len(args) != len(func.params):
                raise TypeError(
                    f"Expected {len(func.params)} arguments, got {len(args)}"
                )
            new_env = Environment(
                bindings={p.name: a for p, a in zip(func.params, args)},
                parent=func.env
            )
            return evaluate(func.body, new_env)
        else:
            raise TypeError(f"Not a function: {func}")

    raise TypeError(f"Unknown expression type: {type(expr)}")


# ============================================================================
# STEP 6: Built-in Functions
# ============================================================================
# Decision: Create builtins as Python functions wrapped in the global env.

def make_global_env() -> Environment:
    """Create the global environment with built-in functions."""
    env = Environment()

    # Arithmetic
    env.define(Symbol('+'), lambda *args: sum(args))
    env.define(Symbol('-'), lambda *args: args[0] - sum(args[1:]) if len(args) > 1 else -args[0])

    def multiply(*args):
        result = 1
        for a in args:
            result *= a
        return result
    env.define(Symbol('*'), multiply)

    def divide(*args):
        if len(args) == 1:
            return 1 / args[0]
        result = args[0]
        for a in args[1:]:
            result /= a
        return result
    env.define(Symbol('/'), divide)

    # Modulo (integer remainder)
    env.define(Symbol('mod'), lambda a, b: a % b)

    # Comparison (return Lisp booleans)
    env.define(Symbol('='), lambda a, b: TRUE if a == b else FALSE)
    env.define(Symbol('<'), lambda a, b: TRUE if a < b else FALSE)
    env.define(Symbol('>'), lambda a, b: TRUE if a > b else FALSE)

    # List operations
    env.define(Symbol('cons'), lambda a, b: [a] + (b if isinstance(b, list) else [b]))
    env.define(Symbol('car'), lambda lst: lst[0] if lst else [])
    env.define(Symbol('cdr'), lambda lst: lst[1:] if len(lst) > 1 else [])
    env.define(Symbol('list'), lambda *args: list(args))
    env.define(Symbol('null?'), lambda x: TRUE if (x == [] or x is None) else FALSE)

    # Useful extras
    env.define(Symbol('print'), lambda x: print(x) or x)
    env.define(Symbol('not'), lambda x: TRUE if (x is FALSE or x == []) else FALSE)

    return env


# ============================================================================
# STEP 7: REPL and Entry Point
# ============================================================================

def run(source: str, env: Environment = None) -> list:
    """Parse and evaluate a source string, returning list of results."""
    if env is None:
        env = make_global_env()

    try:
        tokens = tokenize(source)
        expressions = parse(tokens)
        results = []
        for expr in expressions:
            result = evaluate(expr, env)
            results.append(result)
        return results
    except Exception as e:
        return [f"Error: {e}"]


def repl():
    """Interactive Read-Eval-Print Loop."""
    print("Lisp Interpreter - Type 'quit' to exit")
    env = make_global_env()

    while True:
        try:
            source = input("lisp> ")
            if source.strip().lower() == 'quit':
                break

            results = run(source, env)
            for result in results:
                if result is not None:
                    print(lisp_repr(result))

        except EOFError:
            break
        except KeyboardInterrupt:
            print("\nInterrupted")
            continue

    print("Goodbye!")


def lisp_repr(value) -> str:
    """Convert a Python value back to Lisp representation."""
    if isinstance(value, list):
        return '(' + ' '.join(lisp_repr(v) for v in value) + ')'
    if isinstance(value, Symbol):
        return value.name
    if isinstance(value, LispBoolean):
        return repr(value)
    if isinstance(value, str):
        return f'"{value}"'
    if value is None:
        return 'nil'
    return str(value)


if __name__ == '__main__':
    repl()
