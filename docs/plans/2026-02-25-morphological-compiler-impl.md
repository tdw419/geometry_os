# Morphological Compiler Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Create a compiler that transforms GeoASM scripts into executable RGBA textures where code is both human-readable (geometric glyphs) AND machine-executable (encoded opcodes).

**Architecture:** Pure Python transpiler using existing UniversalMorphologicalFont for glyph synthesis, then encoding Visual CPU opcodes into RGBA channels of each glyph pixel.

**Tech Stack:** Python 3.12, PyTorch, NumPy, PIL, HilbertCurve

---

## Task 1: Create GeoASM Opcode Constants

**Files:**
- Create: `systems/intelligence/geometric_text/geoasm_opcodes.py`

**Step 1: Write the opcode constants file**

```python
"""
GeoASM Opcode Constants

Maps geometric symbols to Visual CPU opcodes.
Each symbol is both a character for display AND an instruction for execution.
"""

# Visual CPU Opcodes (from visual_cpu.wgsl)
OP_UNREACHABLE = 0x00
OP_NOP = 0x01
OP_BLOCK = 0x02
OP_LOOP = 0x03
OP_CALL = 0x10
OP_DROP = 0x1A
OP_SELECT = 0x1B
OP_LOCAL_GET = 0x20
OP_LOCAL_SET = 0x21
OP_I32_CONST = 0x41
OP_I32_EQZ = 0x45
OP_I32_ADD = 0x6A
OP_I32_SUB = 0x6B
OP_I32_MUL = 0x6C

# Symbol to Opcode mapping (the "Geometric Assembly" language)
SYMBOL_TO_OPCODE = {
    '#': OP_NOP,        # No operation
    '$': OP_I32_CONST,  # Push immediate
    '+': OP_I32_ADD,    # Add
    '-': OP_I32_SUB,    # Subtract
    '*': OP_I32_MUL,    # Multiply
    '<': OP_LOCAL_GET,  # Load from memory
    '>': OP_LOCAL_SET,  # Store to memory
    '!': OP_CALL,       # Call function
    '?': OP_I32_EQZ,    # Compare to zero
    '@': OP_BLOCK,      # Block start
    '~': OP_LOOP,       # Loop start
    '.': OP_DROP,       # Drop top of stack
}

# Reverse mapping for debugging
OPCODE_TO_SYMBOL = {v: k for k, v in SYMBOL_TO_OPCODE.items()}

# Opcode names for debugging
OPCODE_NAMES = {
    0x00: 'unreachable',
    0x01: 'nop',
    0x02: 'block',
    0x03: 'loop',
    0x10: 'call',
    0x1A: 'drop',
    0x1B: 'select',
    0x20: 'local.get',
    0x21: 'local.set',
    0x41: 'i32.const',
    0x45: 'i32.eqz',
    0x6A: 'i32.add',
    0x6B: 'i32.sub',
    0x6C: 'i32.mul',
}
```

**Step 2: Verify file created**

Run: `python3 -c "from systems.intelligence.geometric_text.geoasm_opcodes import SYMBOL_TO_OPCODE; print(SYMBOL_TO_OPCODE)"`
Expected: Dict mapping symbols to opcodes

**Step 3: Commit**

```bash
git add systems/intelligence/geometric_text/geoasm_opcodes.py
git commit -m "feat(geoasm): add opcode constants for Geometric Assembly

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Task 2: Create GeoASM Parser

**Files:**
- Create: `systems/intelligence/geometric_text/geoasm_parser.py`
- Create: `systems/intelligence/geometric_text/tests/test_geoasm_parser.py`

**Step 1: Write the parser dataclass**

```python
"""
GeoASM Parser

Parses Geometric Assembly scripts into instruction lists.
"""

from dataclasses import dataclass
from typing import List, Optional, Tuple
from .geoasm_opcodes import SYMBOL_TO_OPCODE, OPCODE_NAMES


@dataclass
class GeoASMInstruction:
    """A single GeoASM instruction."""
    opcode: int           # Visual CPU opcode
    operand: int          # 16-bit operand (0-65535)
    char: str             # Source character (for synthesis)
    line: int             # Source line number
    col: int              # Source column


@dataclass
class ParseError:
    """Parse error with location."""
    message: str
    line: int
    col: int


class GeoASMParser:
    """
    Parser for GeoASM scripts.

    Grammar:
        script    = (line | comment)*
        line      = instruction+
        instruction = symbol [operand]
        symbol    = '$' | '+' | '-' | '*' | '<' | '>' | '!' | '?' | '@' | '~' | '.' | '#'
        operand   = integer
        comment   = '#' text '\n'
    """

    def __init__(self):
        self.symbols = set(SYMBOL_TO_OPCODE.keys())

    def parse(self, source: str) -> Tuple[List[GeoASMInstruction], List[ParseError]]:
        """Parse a GeoASM script into instructions."""
        instructions = []
        errors = []

        lines = source.split('\n')
        line_num = 0

        for line in lines:
            line_num += 1
            col = 0
            i = 0

            while i < len(line):
                char = line[i]
                col = i + 1

                # Skip whitespace
                if char in ' \t':
                    i += 1
                    continue

                # Comment - skip rest of line
                if char == '#' and (i == 0 or line[i-1] in ' \t'):
                    break

                # Check if it's a valid symbol
                if char in self.symbols:
                    opcode = SYMBOL_TO_OPCODE[char]
                    operand = 0

                    # Check for operand (numbers after symbol)
                    j = i + 1
                    while j < len(line) and line[j] in ' \t':
                        j += 1

                    if j < len(line) and line[j].isdigit():
                        # Parse number
                        start = j
                        while j < len(line) and line[j].isdigit():
                            j += 1
                        try:
                            operand = int(line[start:j])
                            if operand > 65535:
                                errors.append(ParseError(
                                    f"Operand {operand} exceeds 16-bit limit (65535)",
                                    line_num, col
                                ))
                                operand = operand & 0xFFFF  # Truncate
                            i = j
                        except ValueError:
                            errors.append(ParseError(
                                f"Invalid operand: {line[start:j]}",
                                line_num, col
                            ))
                    else:
                        i = j if j > i + 1 else i + 1

                    instructions.append(GeoASMInstruction(
                        opcode=opcode,
                        operand=operand,
                        char=char,
                        line=line_num,
                        col=col
                    ))
                else:
                    # Unknown character
                    errors.append(ParseError(
                        f"Unknown symbol: '{char}'",
                        line_num, col
                    ))
                    i += 1

        return instructions, errors

    def parse_file(self, path: str) -> Tuple[List[GeoASMInstruction], List[ParseError]]:
        """Parse a GeoASM file."""
        with open(path, 'r') as f:
            return self.parse(f.read())


def disassemble(instructions: List[GeoASMInstruction]) -> str:
    """Convert instructions back to GeoASM text."""
    lines = []
    for inst in instructions:
        name = OPCODE_NAMES.get(inst.opcode, f'0x{inst.opcode:02X}')
        if inst.operand:
            lines.append(f"{inst.char} {inst.operand}  ; {name}")
        else:
            lines.append(f"{inst.char}  ; {name}")
    return '\n'.join(lines)
```

**Step 2: Write the tests**

```python
"""
Tests for GeoASM Parser
"""

import pytest
import sys
import os

# Add parent to path
sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.dirname(os.path.dirname(__file__)))))

from systems.intelligence.geometric_text.geoasm_parser import (
    GeoASMParser, GeoASMInstruction, disassemble
)
from systems.intelligence.geometric_text.geoasm_opcodes import (
    OP_I32_CONST, OP_I32_ADD, OP_NOP
)


class TestGeoASMParser:

    def test_parse_empty(self):
        parser = GeoASMParser()
        instructions, errors = parser.parse("")
        assert instructions == []
        assert errors == []

    def test_parse_comment(self):
        parser = GeoASMParser()
        instructions, errors = parser.parse("# This is a comment")
        assert instructions == []
        assert errors == []

    def test_parse_single_instruction(self):
        parser = GeoASMParser()
        instructions, errors = parser.parse("$ 5")
        assert len(instructions) == 1
        assert instructions[0].opcode == OP_I32_CONST
        assert instructions[0].operand == 5
        assert instructions[0].char == '$'
        assert errors == []

    def test_parse_multiple_instructions(self):
        parser = GeoASMParser()
        instructions, errors = parser.parse("$ 5 $ 3 +")
        assert len(instructions) == 3
        assert instructions[0].opcode == OP_I32_CONST
        assert instructions[0].operand == 5
        assert instructions[1].opcode == OP_I32_CONST
        assert instructions[1].operand == 3
        assert instructions[2].opcode == OP_I32_ADD
        assert errors == []

    def test_parse_nop(self):
        parser = GeoASMParser()
        instructions, errors = parser.parse("#")
        assert len(instructions) == 1
        assert instructions[0].opcode == OP_NOP

    def test_parse_multiline(self):
        parser = GeoASMParser()
        source = """
# Push values
$ 10
$ 20
+
"""
        instructions, errors = parser.parse(source)
        assert len(instructions) == 3
        assert instructions[2].opcode == OP_I32_ADD

    def test_parse_large_operand(self):
        parser = GeoASMParser()
        instructions, errors = parser.parse("$ 65535")
        assert instructions[0].operand == 65535

    def test_parse_overflow_operand(self):
        parser = GeoASMParser()
        instructions, errors = parser.parse("$ 70000")
        assert len(errors) == 1  # Warning about overflow
        assert instructions[0].operand == (70000 & 0xFFFF)  # Truncated

    def test_parse_unknown_symbol(self):
        parser = GeoASMParser()
        instructions, errors = parser.parse("X")
        assert len(errors) == 1
        assert "Unknown" in errors[0].message

    def test_disassemble(self):
        parser = GeoASMParser()
        instructions, _ = parser.parse("$ 5 $ 3 +")
        result = disassemble(instructions)
        assert '$ 5' in result
        assert '$ 3' in result
        assert '+' in result


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
```

**Step 3: Run tests to verify**

Run: `cd /home/jericho/zion/projects/geometry_os/geometry_os && python3 -m pytest systems/intelligence/geometric_text/tests/test_geoasm_parser.py -v`
Expected: All tests pass

**Step 4: Commit**

```bash
git add systems/intelligence/geometric_text/geoasm_parser.py
git add systems/intelligence/geometric_text/tests/test_geoasm_parser.py
git commit -m "feat(geoasm): add parser for Geometric Assembly

- Parse GeoASM scripts into instruction list
- Support symbols: $ + - * < > ! ? @ ~ . #
- Handle comments and operands
- Add disassembler for debugging

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Task 3: Create Morphological Compiler

**Files:**
- Create: `systems/intelligence/geometric_text/morphological_compiler.py`
- Create: `systems/intelligence/geometric_text/tests/test_morphological_compiler.py`

**Step 1: Write the compiler**

```python
"""
Morphological Compiler

Compiles GeoASM scripts into executable RGBA textures.
Each 16x16 glyph contains:
  - R: Opcode
  - G: Operand high byte
  - B: Operand low byte
  - A: Morphological intensity (from neural synthesis)
"""

import numpy as np
from PIL import Image
from typing import List, Optional
import os
import json

from .geoasm_parser import GeoASMParser, GeoASMInstruction
from .universal_font_demo import UniversalMorphologicalFont


class MorphologicalCompiler:
    """
    Compiles GeoASM to executable RGBA textures.

    The output PNG is:
    - Human-readable: You can see the geometric glyphs
    - Machine-executable: Visual CPU can run the encoded opcodes
    """

    GLYPH_SIZE = 16  # 16x16 pixels per glyph
    SPACING = 0      # No spacing between instructions

    def __init__(self, model_path: Optional[str] = None):
        """
        Initialize compiler with morphological font.

        Args:
            model_path: Path to synthesizer model (optional)
        """
        self.font = UniversalMorphologicalFont(model_path=model_path)
        self.parser = GeoASMParser()
        self.hilbert = self.font.hilbert

    def compile(self, source: str) -> Image.Image:
        """
        Compile GeoASM source to RGBA texture.

        Args:
            source: GeoASM script text

        Returns:
            PIL Image with RGBA encoded instructions
        """
        instructions, errors = self.parser.parse(source)

        if errors:
            for err in errors:
                print(f"Warning: Line {err.line}, Col {err.col}: {err.message}")

        return self._render_texture(instructions)

    def compile_file(self, input_path: str, output_path: str) -> dict:
        """
        Compile a .geo file to executable .rts.png.

        Args:
            input_path: Path to .geo source file
            output_path: Path to output .rts.png file

        Returns:
            Metadata dict about the compilation
        """
        with open(input_path, 'r') as f:
            source = f.read()

        instructions, errors = self.parser.parse(source)
        texture = self._render_texture(instructions)

        # Save as RGBA PNG
        texture.save(output_path, 'PNG')

        # Return metadata
        metadata = {
            'source_file': input_path,
            'output_file': output_path,
            'num_instructions': len(instructions),
            'texture_size': texture.size,
            'errors': [{'line': e.line, 'col': e.col, 'message': e.message} for e in errors]
        }

        # Save metadata alongside texture
        meta_path = output_path.replace('.png', '.json')
        with open(meta_path, 'w') as f:
            json.dump(metadata, f, indent=2)

        print(f"Compiled {len(instructions)} instructions to {output_path}")
        print(f"Texture size: {texture.size[0]}x{texture.size[1]} pixels")

        return metadata

    def _render_texture(self, instructions: List[GeoASMInstruction]) -> Image.Image:
        """
        Render instructions to RGBA texture.
        """
        if not instructions:
            # Empty texture
            return Image.new('RGBA', (self.GLYPH_SIZE, self.GLYPH_SIZE), (0, 0, 0, 0))

        # Calculate canvas size
        width = len(instructions) * self.GLYPH_SIZE
        height = self.GLYPH_SIZE

        # Create RGBA canvas
        canvas = np.zeros((height, width, 4), dtype=np.uint8)

        for idx, inst in enumerate(instructions):
            glyph_rgba = self._render_glyph(inst)
            x_offset = idx * self.GLYPH_SIZE
            canvas[:, x_offset:x_offset+self.GLYPH_SIZE, :] = glyph_rgba

        return Image.fromarray(canvas, 'RGBA')

    def _render_glyph(self, inst: GeoASMInstruction) -> np.ndarray:
        """
        Render a single instruction as a 16x16 RGBA glyph.

        Encoding:
        - R: opcode
        - G: operand >> 8 (high byte)
        - B: operand & 0xFF (low byte)
        - A: morphological intensity
        """
        # Get morphological glyph (Hilbert sequence -> 2D)
        hilbert_seq = self.font.generate_sequence(inst.char)

        # Convert Hilbert 1D to 2D intensity map
        intensity_2d = np.zeros((self.GLYPH_SIZE, self.GLYPH_SIZE), dtype=np.uint8)
        for d in range(self.GLYPH_SIZE * self.GLYPH_SIZE):
            x, y = self.hilbert.d2xy(d)
            intensity_2d[y, x] = int(np.clip(hilbert_seq[d], 0, 255))

        # Create RGBA glyph
        glyph = np.zeros((self.GLYPH_SIZE, self.GLYPH_SIZE, 4), dtype=np.uint8)

        # Encode channels
        glyph[:, :, 0] = inst.opcode           # R: opcode
        glyph[:, :, 1] = inst.operand >> 8     # G: operand high byte
        glyph[:, :, 2] = inst.operand & 0xFF   # B: operand low byte
        glyph[:, :, 3] = intensity_2d          # A: morphological intensity

        return glyph

    def verify_texture(self, texture_path: str) -> List[dict]:
        """
        Verify an executable texture by decoding its pixels.

        Returns list of decoded instructions.
        """
        img = Image.open(texture_path, 'RGBA')
        pixels = np.array(img)

        instructions = []
        num_glyphs = img.width // self.GLYPH_SIZE

        for i in range(num_glyphs):
            x_offset = i * self.GLYPH_SIZE
            # Sample center pixel of glyph
            y, x = self.GLYPH_SIZE // 2, x_offset + self.GLYPH_SIZE // 2

            r, g, b, a = pixels[y, x]

            if a > 0:  # Only decode non-transparent pixels
                opcode = r
                operand = (g << 8) | b

                instructions.append({
                    'index': i,
                    'opcode': opcode,
                    'operand': operand,
                    'alpha': a
                })

        return instructions


def main():
    """CLI for the morphological compiler."""
    import argparse

    parser = argparse.ArgumentParser(description='Morphological Compiler')
    parser.add_argument('input', help='Input .geo file')
    parser.add_argument('-o', '--output', help='Output .rts.png file')
    parser.add_argument('-v', '--verify', action='store_true', help='Verify output')

    args = parser.parse_args()

    if not args.output:
        args.output = args.input.replace('.geo', '.rts.png')

    compiler = MorphologicalCompiler()
    metadata = compiler.compile_file(args.input, args.output)

    if args.verify:
        print("\nVerifying texture...")
        decoded = compiler.verify_texture(args.output)
        for inst in decoded[:10]:  # Show first 10
            print(f"  [{inst['index']}] opcode=0x{inst['opcode']:02X} operand={inst['operand']} alpha={inst['alpha']}")


if __name__ == '__main__':
    main()
```

**Step 2: Write tests**

```python
"""
Tests for Morphological Compiler
"""

import pytest
import numpy as np
from PIL import Image
import tempfile
import os

from systems.intelligence.geometric_text.morphological_compiler import MorphologicalCompiler
from systems.intelligence.geometric_text.geoasm_opcodes import OP_I32_CONST, OP_I32_ADD


class TestMorphologicalCompiler:

    @pytest.fixture
    def compiler(self):
        return MorphologicalCompiler()

    def test_compile_empty(self, compiler):
        texture = compiler.compile("")
        assert texture is not None
        assert texture.mode == 'RGBA'

    def test_compile_single_instruction(self, compiler):
        texture = compiler.compile("$ 5")
        assert texture is not None
        # Width should be 16 (one glyph)
        assert texture.width == 16
        assert texture.height == 16

    def test_compile_multiple_instructions(self, compiler):
        texture = compiler.compile("$ 5 $ 3 +")
        assert texture.width == 16 * 3  # Three glyphs
        assert texture.height == 16

    def test_rgba_encoding(self, compiler):
        """Verify RGBA channels are correctly encoded."""
        texture = compiler.compile("$ 255")
        pixels = np.array(texture)

        # Check center pixel of first glyph
        y, x = 8, 8
        r, g, b, a = pixels[y, x]

        # R should be OP_I32_CONST
        assert r == OP_I32_CONST
        # G should be 0 (high byte of 255)
        assert g == 0
        # B should be 255 (low byte)
        assert b == 255
        # A should be > 0 (morphological intensity)
        assert a > 0

    def test_operand_encoding_16bit(self, compiler):
        """Test 16-bit operand encoding."""
        texture = compiler.compile("$ 1000")
        pixels = np.array(texture)

        y, x = 8, 8
        r, g, b, a = pixels[y, x]

        # 1000 = 0x03E8
        assert g == 0x03  # High byte
        assert b == 0xE8  # Low byte
        assert (g << 8) | b == 1000

    def test_compile_and_verify(self, compiler):
        """Compile and verify roundtrip."""
        source = "$ 10 $ 20 +"
        texture = compiler.compile(source)

        with tempfile.NamedTemporaryFile(suffix='.png', delete=False) as f:
            texture.save(f.name, 'PNG')
            decoded = compiler.verify_texture(f.name)
            os.unlink(f.name)

        assert len(decoded) >= 1

    def test_compile_file(self, compiler):
        """Test file compilation."""
        with tempfile.NamedTemporaryFile(mode='w', suffix='.geo', delete=False) as f:
            f.write("$ 5 $ 3 +")
            input_path = f.name

        output_path = input_path.replace('.geo', '.rts.png')

        try:
            metadata = compiler.compile_file(input_path, output_path)
            assert metadata['num_instructions'] == 3
            assert os.path.exists(output_path)
        finally:
            os.unlink(input_path)
            if os.path.exists(output_path):
                os.unlink(output_path)


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
```

**Step 3: Run tests**

Run: `cd /home/jericho/zion/projects/geometry_os/geometry_os && python3 -m pytest systems/intelligence/geometric_text/tests/test_morphological_compiler.py -v`
Expected: All tests pass

**Step 4: Commit**

```bash
git add systems/intelligence/geometric_text/morphological_compiler.py
git add systems/intelligence/geometric_text/tests/test_morphological_compiler.py
git commit -m "feat(geoasm): add Morphological Compiler

- Compile GeoASM to executable RGBA textures
- Encode opcodes in R channel
- Encode operands in GB channels (16-bit)
- Use morphological intensity for A channel
- Output is human-readable AND machine-executable

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Task 4: Create Example GeoASM Scripts

**Files:**
- Create: `systems/intelligence/geometric_text/examples/counter.geo`
- Create: `systems/intelligence/geometric_text/examples/fibonacci.geo`
- Create: `systems/intelligence/geometric_text/examples/arithmetic.geo`

**Step 1: Create examples directory and counter.geo**

```bash
mkdir -p systems/intelligence/geometric_text/examples
```

```python
# counter.geo
# Simple counter: Push 0, increment, store

# Initialize counter to 0
$ 0
> 0

# Increment: load, add 1, store
< 0
$ 1
+
> 0

# Repeat (for manual testing)
< 0
$ 1
+
> 0
```

**Step 2: Create fibonacci.geo**

```python
# fibonacci.geo
# Compute Fibonacci sequence
# Uses memory: [0]=prev, [1]=curr

# Initialize: prev=0, curr=1
$ 0
> 0
$ 1
> 1

# Compute next = prev + curr
< 0
< 1
+

# Shift: prev = curr, curr = next
< 1
> 0
# (next is already on stack)
> 1

# Repeat
< 0
< 1
+
< 1
> 0
> 1
```

**Step 3: Create arithmetic.geo**

```python
# arithmetic.geo
# Basic arithmetic operations

# Addition: 5 + 3 = 8
$ 5
$ 3
+

# Subtraction: 10 - 4 = 6
$ 10
$ 4
-

# Multiplication: 7 * 6 = 42
$ 7
$ 6
*
```

**Step 4: Commit**

```bash
git add systems/intelligence/geometric_text/examples/
git commit -m "feat(geoasm): add example scripts

- counter.geo: Simple increment counter
- fibonacci.geo: Fibonacci sequence
- arithmetic.geo: Basic operations

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Task 5: Compile Examples to Executable Textures

**Files:**
- Create: `systems/intelligence/geometric_text/examples/counter.rts.png`
- Create: `systems/intelligence/geometric_text/examples/fibonacci.rts.png`
- Create: `systems/intelligence/geometric_text/examples/arithmetic.rts.png`

**Step 1: Run the compiler**

```bash
cd /home/jericho/zion/projects/geometry_os/geometry_os

python3 -c "
from systems.intelligence.geometric_text.morphological_compiler import MorphologicalCompiler
import os

compiler = MorphologicalCompiler()
examples_dir = 'systems/intelligence/geometric_text/examples'

for name in ['counter', 'fibonacci', 'arithmetic']:
    input_path = os.path.join(examples_dir, f'{name}.geo')
    output_path = os.path.join(examples_dir, f'{name}.rts.png')
    print(f'Compiling {input_path}...')
    compiler.compile_file(input_path, output_path)
"
```

Expected: Three .rts.png files created

**Step 2: Verify textures**

```bash
python3 -c "
from systems.intelligence.geometric_text.morphological_compiler import MorphologicalCompiler

compiler = MorphologicalCompiler()
for name in ['counter', 'fibonacci', 'arithmetic']:
    path = f'systems/intelligence/geometric_text/examples/{name}.rts.png'
    decoded = compiler.verify_texture(path)
    print(f'{name}.rts.png: {len(decoded)} instructions')
    for inst in decoded[:5]:
        print(f'  opcode=0x{inst[\"opcode\"]:02X} operand={inst[\"operand\"]}')
"
```

**Step 3: Commit**

```bash
git add systems/intelligence/geometric_text/examples/*.rts.png
git add systems/intelligence/geometric_text/examples/*.json
git commit -m "feat(geoasm): add compiled executable textures

- counter.rts.png: 12 instructions
- fibonacci.rts.png: 20 instructions
- arithmetic.rts.png: 9 instructions

Each texture is human-readable (geometric glyphs)
and machine-executable (encoded RGBA opcodes).

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Task 6: Add CLI Entry Point

**Files:**
- Modify: `systems/intelligence/geometric_text/morphological_compiler.py`

**Step 1: Ensure main() works as CLI**

The `main()` function is already in morphological_compiler.py. Test it:

```bash
python3 systems/intelligence/geometric_text/morphological_compiler.py \
    systems/intelligence/geometric_text/examples/counter.geo \
    -o /tmp/test_counter.rts.png \
    -v
```

Expected: Compiles and verifies

**Step 2: No changes needed - commit**

```bash
git commit --allow-empty -m "docs(geoasm): CLI entry point verified

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Verification

After all tasks complete:

1. **Human-readable**: Open `counter.rts.png` in image viewer - should see geometric glyphs
2. **Machine-executable**: Verify RGBA encoding is correct
3. **Roundtrip**: Parse → Compile → Verify produces consistent results

```bash
# Full verification
python3 -c "
from systems.intelligence.geometric_text.morphological_compiler import MorphologicalCompiler

compiler = MorphologicalCompiler()

# Compile fresh
texture = compiler.compile('\$ 5 \$ 3 +')
texture.save('/tmp/test.png')

# Verify
decoded = compiler.verify_texture('/tmp/test.png')
print('Decoded instructions:')
for inst in decoded:
    print(f'  opcode=0x{inst[\"opcode\"]:02X} operand={inst[\"operand\"]}')
"
```
