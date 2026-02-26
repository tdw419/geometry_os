# Morphological Compiler Design

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Create a compiler that transforms GeoASM scripts into executable RGBA textures where code is both human-readable (geometric glyphs) AND machine-executable (encoded opcodes).

**Architecture:** Pure Python transpiler that synthesizes morphological glyphs using the existing UniversalMorphologicalFont, then encodes Visual CPU opcodes into the RGBA channels of each glyph pixel.

**Tech Stack:** Python 3.12, PyTorch, NumPy, PIL, HilbertCurve

---

## Overview

The Morphological Compiler bridges text synthesis and pixel execution:

```
[GeoASM Script] → [Parser] → [Opcode Sequence]
                              ↓
[UniversalMorphologicalFont] → [Hilbert Glyphs]
                              ↓
[Channel Encoder] → [RGBA Texture]
   - R: Opcode ID
   - G: Operand High Byte
   - B: Operand Low Byte
   - A: Morphological Intensity
                              ↓
[bootable.rts.png] → [Visual CPU executes]
```

---

## GeoASM Language Specification

### Opcode Mapping

Each character maps to a Visual CPU opcode:

| Symbol | Opcode | Name | Function |
|--------|--------|------|----------|
| `$` | 0x41 | OP_I32_CONST | Push immediate to stack |
| `+` | 0x6A | OP_I32_ADD | Add top two stack items |
| `-` | 0x6B | OP_I32_SUB | Subtract top two |
| `*` | 0x6C | OP_I32_MUL | Multiply top two |
| `>` | 0x21 | OP_LOCAL_SET | Store to memory |
| `<` | 0x20 | OP_LOCAL_GET | Load from memory |
| `#` | 0x01 | OP_NOP | No operation |
| `!` | 0x10 | OP_CALL | Call function |
| `?` | 0x45 | OP_I32_EQZ | Compare to zero |
| `@` | 0x02 | OP_BLOCK | Block start |
| `~` | 0x03 | OP_LOOP | Loop start |
| `.` | 0x1A | OP_DROP | Drop top of stack |

### Syntax

```
# Comments start with #
# Push 5, push 3, add them
$ 5 $ 3 +

# Store result to memory address 0
> 0

# Load from address 0 and multiply by 2
< 0 $ 2 *

# Labels (future: relative jumps)
:start
$ 1 +
```

### Operand Encoding

Operands follow the instruction character:
- `$ 255` → Push 255 (operand = 0x00FF)
- `$ 1000` → Push 1000 (operand = 0x03E8)

For 16-bit operands:
- Green channel = High byte (operand >> 8)
- Blue channel = Low byte (operand & 0xFF)

---

## Channel Encoding Protocol

Each 16x16 glyph pixel contains:

```
Pixel[x,y] = {
    R: opcode       # Which instruction (0x41, 0x6A, etc.)
    G: operand_hi   # Operand high byte
    B: operand_lo   # Operand low byte
    A: morphology   # Neural-geometric intensity (0-255)
}
```

### Alpha Channel (Morphological Intensity)

The alpha channel comes from the `MorphologicalSynthesizerV2`:
- Pixels that are part of the glyph stroke have high alpha (200-255)
- Background pixels have alpha = 0
- This creates natural "execution masking" - the CPU only executes where the letter exists

### Example: Encoding `$ 255`

1. Parse: opcode = 0x41, operand = 255
2. Synthesize glyph for `$` character
3. For each pixel in 16x16 grid:
   ```python
   R = 0x41          # OP_I32_CONST
   G = 0x00          # High byte of 255
   B = 0xFF          # Low byte of 255
   A = glyph[y, x]   # Morphological intensity
   ```

---

## Components

### 1. GeoASM Parser (`geoasm_parser.py`)

```python
@dataclass
class GeoASMInstruction:
    opcode: int
    operand: int
    line: int
    char: str

def parse_geoasm(source: str) -> List[GeoASMInstruction]:
    # Tokenize and parse GeoASM script
    # Handle comments, labels, operands
```

### 2. Morphological Compiler (`morphological_compiler.py`)

```python
class MorphologicalCompiler:
    def __init__(self):
        self.font = UniversalMorphologicalFont()
        self.hilbert = HilbertCurve(16)

    def compile(self, source: str) -> PIL.Image:
        instructions = parse_geoasm(source)
        return self.render_to_texture(instructions)

    def render_to_texture(self, instructions) -> PIL.Image:
        # Create canvas: width = len(instructions) * 16
        # For each instruction:
        #   - Get morphological glyph
        #   - Encode RGBA channels
        #   - Place on canvas
```

### 3. Texture Output

```python
def save_executable_texture(image: PIL.Image, path: str):
    # Save as PNG with RGBA
    # Metadata: include source script, compile timestamp
```

---

## File Structure

```
systems/intelligence/geometric_text/
├── morphological_compiler.py   # Main compiler
├── geoasm_parser.py            # Parser for GeoASM syntax
├── data/
│   ├── counter.geo             # Example: simple counter
│   ├── fibonacci.geo           # Example: Fibonacci sequence
│   └── bootable_counter.rts.png # Compiled executable texture
```

---

## Verification

After compilation, verify:

1. **Human-readable**: Open PNG - should see geometric glyphs
2. **Machine-executable**: Load into Visual CPU - should execute correctly
3. **Channel integrity**: Check RGBA values match expected encoding

```python
# Test: Verify pixel encoding
img = Image.open('bootable_counter.rts.png')
pixel = img.getpixel((8, 8))  # Center of first glyph
assert pixel[0] == 0x41  # R = opcode
assert pixel[3] > 0      # A = morphological intensity
```

---

## Future Extensions

- **Phase 4.2**: Real-time browser compiler for REPL
- **Phase 4.3**: Higher-level language (GeoScript) that transpiles to GeoASM
- **Phase 4.4**: Debugging overlay that highlights executing pixels

---

## Success Criteria

| Criterion | Verification |
|-----------|--------------|
| Parse GeoASM script | Unit tests pass |
| Generate RGBA texture | PNG file created |
| Glyphs visible | Human can read the code |
| Opcodes encoded | Pixel R values match opcodes |
| Executable | Visual CPU runs without errors |
| Correct output | Execution produces expected result |

---

*Design approved: 2026-02-25*
*Ready for implementation via writing-plans skill*
