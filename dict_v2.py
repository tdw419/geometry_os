"""
Pixelpack Dictionary V2

Auto-built from corpus with aggressive deduplication.
Entries 0-31 are identical to V1 (backward compatible).
Entries 32-95 are auto-discovered programming fragments.

Built by dict_build.py, frozen here for determinism.
"""

# V1 frozen entries (0-31) - DO NOT MODIFY
V2_DICTIONARY = [
    # --- V1 base dictionary (0-15) ---
    b'print(',      # 0
    b')',           # 1
    b'"',           # 2
    b'Hello',       # 3
    b'\n',          # 4
    b'echo ',       # 5
    b'World',       # 6
    b'def ',        # 7
    b'42',          # 8
    b'main',        # 9
    b'()',          # 10
    b', ',          # 11
    b'!',           # 12
    b'void ',       # 13
    b'{',           # 14
    b'}',           # 15
    # --- V1 extended dictionary (16-31) ---
    b'x',           # 16
    b'=',           # 17
    b'+',           # 18
    b'-',           # 19
    b'*',           # 20
    b';',           # 21
    b'1',           # 22
    b'0',           # 23
    b'if ',         # 24
    b'return ',     # 25
    b'int ',        # 26
    b'for ',        # 27
    b'while ',      # 28
    b'class ',      # 29
    b' ',           # 30
    b'fn ',         # 31
    # --- V2 auto-discovered entries (32-95) ---
    b'main()',      # 32  - common C/Rust pattern
    b'():\n',       # 33  - Python function def tail
    b'")',          # 34  - close string+paren
    b'  ',          # 35  - double space (indent)
    b'");',         # 36  - close string+paren+semi
    b'$MSG\n',      # 37  - shell variable expansion
    b'int main',    # 38  - C main signature
    b'):\n    ',    # 39  - Python def with indent
    b'print(x',     # 40  - print variable
    b'    print',   # 41  - indented print
    b';}\n',        # 42  - close brace with newline
    b'= 0;\n',      # 43  - C zero init
    b'= 1;\n',      # 44  - C one init
    b'puts("',      # 45  - C puts call
    b'"Hello"',     # 46  - Hello string
    b'print(i',     # 47  - print loop var
    b'echo $',      # 48  - shell echo var
    b'    ',        # 49  - 4-space indent
    b'();\n',       # 50  - empty call + newline
    b'#include ',   # 51  - C include
    b'stdio.h',     # 52  - C stdio
    b'range(',      # 53  - Python range
    b'console',     # 54  - JS console
    b'.log(',       # 55  - JS log
    b'function',    # 56  - JS function
    b'break\n',     # 57  - Python break
    b'pass\n',      # 58  - Python pass
    b'sys\n',       # 59  - Python sys
    b'import ',     # 60  - Python import
    b'do\n',        # 61  - shell do
    b'done\n',      # 62  - shell done
    b'  echo ',     # 63  - indented echo
    b'cat ',        # 64  - shell cat
    b'PSET ',       # 65  - Geometry OS PSET
    b'COLOR ',      # 66  - Geometry OS COLOR
    b'_DRAW',       # 67  - placeholder
    b'println',     # 68  - Rust println
    b'!("hi")',     # 69  - Rust print macro
    b'void ',       # 70  - C void (duplicate of 13, but kept for new combos)
    b'let ',        # 71  - Rust let
    b'val ',        # 72  - Scala val
    b'pub ',        # 73  - Rust pub
    b'#1\n',        # 74  - assembly immediate
    b'r0',          # 75  - register 0
    b'push ',       # 76  - stack push
    b'pop ',        # 77  - stack pop
    b'ld ',         # 78  - load
    b'mov ',        # 79  - move
    b'True\n',      # 80  - Python True
    b'False',       # 81  - Python False
    b'null\n',      # 82  - null
    b'1234',        # 83  - test number
    b'name',        # 84  - name variable
    b'then\n',      # 85  - shell then
    b'file',        # 86  - filename
    b'x > 0',       # 87  - comparison
    b'(x + y)',     # 88  - arithmetic expression
    b'name)\n',     # 89  - close name paren
    b'greet(',      # 90  - greet function
    b'#!/bin',      # 91  - shebang
    b'/bash',       # 92  - bash path
    b'$i\n',        # 93  - shell loop var
    b'[ -f ',       # 94  - shell file test
    b' ];',         # 95  - shell test close
]
