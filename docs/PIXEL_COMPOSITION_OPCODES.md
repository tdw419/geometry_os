# Pixel Composition Opcodes

## The Core Idea

Keystrokes produce colors. Colors compose into patterns. Patterns are opcodes.

This separates the visual medium (pixels) from the instruction set (opcodes). Programs are paintings first and code second.

```
Key press → ASCII hex → pixel color
Pixel sequence → pattern → opcode
```

## Layer 1: Keystroke → Pixel Color

Every key on a standard keyboard has an ASCII hex value. That value IS the pixel color. No lookup, no translation -- the hex code goes straight to the screen.

| Key | ASCII Hex | Pixel Color |
|-----|-----------|-------------|
| A   | 0x41      | #000041     |
| B   | 0x42      | #000042     |
| Z   | 0x5A      | #00005A     |
| a   | 0x61      | #000061     |
| 0   | 0x30      | #000030     |
| 9   | 0x39      | #000039     |
| !   | 0x21      | #000021     |
| Space | 0x20    | #000020     |

In RGB, the ASCII hex value sits in the blue channel. The red and green channels are zero. This means all keystroke colors are deep blues, which gives the default palette a cohesive look. The palette can be remapped later, but the identity mapping (ASCII hex = pixel value) is always the foundation.

**What this means for the user:** You type, you paint. Every keystroke stamps a pixel. The color is deterministic -- press the same key, get the same color. You learn the palette by feel.

## Layer 2: Pixel Sequence → Opcode

A single pixel is a color. A sequence of pixels is an instruction.

The VM reads pixels left-to-right, top-to-bottom, just like reading text. Each instruction is a fixed-width **pixel word** -- a horizontal run of N pixels that the VM interprets as one opcode plus its arguments.

### Instruction Format

```
[opcode pixel] [arg1 pixel] [arg2 pixel] ... [argN pixel]
```

The first pixel in each word is the opcode selector. The remaining pixels are arguments (register numbers, addresses, immediate values, etc.).

### Example: ADD r0, r1

Say ADD is opcode pattern `0x41` (the color produced by pressing A). Arguments are register indices represented as pixel colors.

```
Pixel 0: 0x41 (A)        → opcode: ADD
Pixel 1: 0x30 (0)        → arg1: r0 (destination)
Pixel 2: 0x31 (1)        → arg2: r1 (source)
```

You type `A01` and you've written ADD r0, r1. Three keystrokes. Three pixels. One instruction.

### Example: LDI r0, 42

```
Pixel 0: 0x49 (I)        → opcode: LDI (Load Immediate)
Pixel 1: 0x30 (0)        → arg1: r0
Pixel 2: 0x2A (*)        → arg2: 42 (0x2A is the ASCII for '*', value 42)
```

You type `I0*`. The `*` key's ASCII value IS the number 42. No indirection.

### Opcode Table (Sequential, 1-pixel selector)

Because the opcode pixel is just a color value, the instruction set is defined by a mapping from pixel colors to VM operations. This mapping lives in the VM, not in the key layout.

The initial mapping keeps the same mnemonic assignments from the ASCII opcode table for familiarity, but the key difference is: the opcode is defined by the pixel pattern, not by the key. The key is just how you produce the color.

| Pixel Color | Opcode | Name     | Width | Args              |
|-------------|--------|----------|-------|-------------------|
| 0x41        | ADD    | Add      | 3     | dst, src          |
| 0x42        | BRANCH | Branch   | 3     | cond, addr        |
| 0x43        | CALL   | Call     | 2     | addr              |
| 0x44        | DIV    | Divide   | 3     | dst, src          |
| 0x45        | EXEC   | Execute  | 3     | addr, arg         |
| 0x46        | RECTF  | RectFill | 5     | x, y, w, h        |
| 0x47        | CIRCLEF| Circle   | 4     | cx, cy, r         |
| 0x48        | HALT   | Halt     | 1     | (none)            |
| 0x49        | LDI    | Load Imm | 3     | dst, value        |
| 0x4A        | JMP    | Jump     | 2     | addr              |
| 0x4B        | SHL    | Shift L  | 3     | dst, amount       |
| 0x4C        | LOAD   | Load     | 3     | dst, addr         |
| 0x4D        | MOV    | Move     | 3     | dst, src          |
| 0x4E        | NOP    | No-op    | 1     | (none)            |
| 0x4F        | OR     | Or       | 3     | dst, src          |
| 0x50        | PSET   | PixelSet | 4     | x, y, color       |
| 0x51        | SPAWN  | Spawn    | 3     | addr, arg         |
| 0x52        | RET    | Return   | 1     | (none)            |
| 0x53        | STORE  | Store    | 3     | addr, src         |
| 0x54        | TEXT   | Text     | 4     | x, y, str_addr    |
| 0x55        | SUB    | Subtract | 3     | dst, src          |
| 0x56        | LINE   | Line     | 5     | x1, y1, x2, y2   |
| 0x57        | BLIT   | Blit     | 4     | dst, src, count   |
| 0x58        | XOR    | Xor      | 3     | dst, src          |
| 0x59        | YIELD  | Yield    | 1     | (none)            |
| 0x5A        | SPAWN+ | Spatial  | 4     | x, y, addr        |

Lowercase opcodes (secondary operations):

| Pixel Color | Opcode | Name      | Width | Args              |
|-------------|--------|-----------|-------|-------------------|
| 0x61        | AND    | And       | 3     | dst, src          |
| 0x62        | MOD    | Modulo    | 3     | dst, src          |
| 0x64        | LDB    | LoadByte  | 3     | dst, addr         |
| 0x67        | PGET   | PixelGet  | 3     | x, y              |
| 0x69        | INT    | Interrupt | 2     | vector            |
| 0x6B        | SHR    | Shift R   | 3     | dst, amount       |
| 0x6D        | MUL    | Multiply  | 3     | dst, src          |
| 0x6E        | NOT    | Not       | 2     | dst               |
| 0x70        | PUSH   | Push      | 2     | value             |
| 0x72        | POP    | Pop       | 2     | dst               |
| 0x73        | STB    | StoreByte | 3     | addr, src         |

## How Width Works

Each opcode has a fixed **width** -- the total number of pixels the VM consumes for that instruction, including the opcode pixel itself.

- HALT is width 1: just the opcode pixel, no arguments.
- ADD is width 3: opcode + 2 register arguments.
- LINE is width 5: opcode + 4 coordinate arguments.

The VM's instruction pointer advances by the instruction's width after executing it. This means programs are dense -- every pixel is used, every pixel has meaning.

## The Key Insight: Decoupling

With the old design, the key press WAS the opcode. The visual and the semantic were the same thing. That meant:

- You could never have more opcodes than keys on a keyboard.
- Programs looked like random noise because pixel colors were determined by opcodes.
- Changing the instruction set changed the visual palette.

With composition opcodes, these layers are independent:

- **Visual layer:** key → color. Deterministic, aesthetic, learnable.
- **Semantic layer:** pixel pattern → opcode. Defined by the VM, changeable without affecting the palette.
- **Encoding layer:** how pixel sequences map to opcodes. Currently 1-pixel selectors, but could evolve to multi-pixel patterns for expansion.

## Reading Programs Visually

Because each opcode has a distinct color and a known width, you can read a program by eye. A trained user sees:

```
[deep blue] [navy] [midnight] [indigo] [dark] → ADD r0, r1
[bright blue] [teal] → JMP addr
[royal blue] → HALT
```

The program IS its own visual documentation. No disassembler needed for simple programs. You learn the color language the same way you learn hex or Morse code -- by exposure.

## Encoding Arguments

Arguments are pixel colors too. This is where the ASCII-to-color identity mapping shines:

- **Registers:** pixel colors 0x30-0x37 (keys 0-7) map to r0-r7. Type the digit, get the register.
- **Small immediates:** the literal pixel color value IS the number. Key `*` produces 0x2A = 42. That's your value.
- **Addresses:** composed from multi-pixel sequences. A 2-pixel address can address 65536 locations (each pixel is a byte of the address).

This keeps everything consistent. There is one representation: pixel colors. Keystrokes produce them, the VM consumes them, the screen displays them.

## Future: Multi-Pixel Opcodes

The 1-pixel opcode selector gives ~256 possible opcodes (one per color value). If that's ever not enough, the opcode pixel can be extended to 2 pixels:

```
[opcode1] [opcode2] [arg1] [arg2] ...
```

Two pixels give 65,536 possible opcodes. The VM just needs to know whether it's in 1-pixel or 2-pixel opcode mode. This can be a boot flag or an initial preamble pixel.

This is the escape hatch. The system starts simple (1-pixel opcodes) and can grow without breaking the fundamental model.

## Comparison With Previous Design

| Aspect             | Old (ASCII=Opcode)         | New (Composition)              |
|--------------------|----------------------------|--------------------------------|
| Key press produces | Opcode byte                | Pixel color                    |
| Opcode defined by  | The key you pressed        | Pixel pattern the VM reads     |
| Max opcodes        | ~52 (printable ASCII)      | 256+ (1-pixel), 65K+ (2-pixel) |
| Programs look like | Random colored pixels      | Intentional color patterns     |
| Palette change     | Breaks all programs        | Independent of opcodes         |
| Instruction set    | Fixed to keyboard layout   | Arbitrary, VM-defined          |
| Build-by-typing    | Stamps opcodes directly    | Paints colors, VM reads patterns |

## Migration

Programs written for the old ASCII-opcode encoding need re-encoding. However, because the pixel colors haven't changed (A still produces 0x41), the visual appearance of old programs is identical. Only the VM's interpretation changes.

A compatibility mode is possible: the VM detects whether a program uses old encoding (1:1 pixel-to-opcode) or new encoding (pixel words with width-based parsing). A preamble pixel at address 0 could signal the encoding version.

```
Address 0: 0xFF → old encoding (1 pixel = 1 opcode, no arguments)
Address 0: 0xFE → new encoding (pixel words with width-based parsing)
```

This lets both formats coexist during transition.
