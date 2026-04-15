"""
Pixelpack Corpus - Target programs for dictionary building.

This is the fixed corpus used to build the auto-dictionary.
DO NOT modify existing entries (breaks backward compatibility).
Add new entries only at the end.
"""

CORPUS = [
    # Python programs
    b'print("Hello")\n',
    b'print("Hello, World!")\n',
    b'print(42)\n',
    b'x = "Hello"\nprint(x)\n',
    b'def greet(name):\n    print(name)\n\n',
    b'for i in range(10):\n    print(i)\n\n',
    b'def main():\n    print("ok")\n\n',
    b'x = 1\ny = 2\nprint(x + y)\n',
    b'if x > 0:\n    print(x)\n',
    b'while True:\n    break\n',
    b'class Foo:\n    pass\n',
    b'return 0\n',
    b'import sys\n',

    # Shell scripts
    b'echo Hello\n',
    b'echo "Hello, World!"\n',
    b'MSG="Hello"\necho $MSG\n',
    b'#!/bin/bash\necho "hi"\n',
    b'for i in 1 2 3; do\n  echo $i\ndone\n',
    b'if [ -f file ]; then\n  cat file\nfi\n',

    # C programs
    b'void main(){}\n',
    b'int main(){puts("Hello");}\n',
    b'#include <stdio.h>\nint main(){puts("Hello");}\n',
    b'int main(){return 0;}\n',
    b'int x = 1;\n',

    # Assembly / Geometry OS
    b'mov r0, #1\n',
    b'PSET 10 20\nCOLOR 255 0 0\nDRAW\n',
    b'push 42\npop r0\n',
    b'ld a, 0\n',

    # JavaScript
    b'console.log("hi");\n',
    b'function f() {\n  return 1;\n}\n',

    # Rust-like
    b'fn main() {\n    println!("hi");\n}\n',
    b'let x = 1;\n',

    # Common fragments
    b'Hello, World!\n',
    b'42\n',
    b'true\n',
    b'false\n',
    b'null\n',
]
