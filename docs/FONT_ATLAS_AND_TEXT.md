*Soli Deo Gloria.*

# Font Atlas and Pixel-Based Text Rendering

> How a GPU-native OS renders text without recompiling a single line of Rust.

---

## The Problem

Geometry OS runs on a GPU. Its "memory" is a 4096x4096 RGBA8 texture -- 16 million pixels, each one a 32-bit word. Programs are sequences of these pixels. The compute shader reads a pixel, decodes the opcode, executes it, writes results back.

But how do you display text? In a normal OS, you call a font renderer. In Geometry OS, there is no OS above you. There is no font renderer. There is only the texture.

The naive answer is "write a Rust function that renders text." But that defeats the point. The whole idea is to **build with pixels**, not with Rust. Every time you want to change what text displays, you should not need to recompile the engine.

The solution: bake a font into the texture at boot, then give programs an instruction that reads from it.

---

## How It Works

### 1. The Font Atlas (1024 pixels of ROM)

At address `0x00F00000` (15,728,640 -- near the far end of the 16M pixel texture, far from programs which start at 0), the system writes a complete 8x8 bitmap font. The classic PC BIOS font. 95 printable ASCII characters (32-126). Each character is 8 rows of 8 pixels, encoded as 8 bytes where bit 7 = leftmost pixel.

Layout:

```
Address                     Content
─────────────────────────────────────
FONT_BASE + (65 * 8) + 0   0x38    ┐
FONT_BASE + (65 * 8) + 1   0x6C    │
FONT_BASE + (65 * 8) + 2   0xC6    │  This is 'A'
FONT_BASE + (65 * 8) + 3   0xC6    │
FONT_BASE + (65 * 8) + 4   0xFE    │
FONT_BASE + (65 * 8) + 5   0xC6    │
FONT_BASE + (65 * 8) + 6   0xC6    │
FONT_BASE + (65 * 8) + 7   0x00    ┘
```

Total cost: 128 characters x 8 rows = 1024 pixels.
That is 0.006% of the texture. Practically free.

The font data lives in `src/font_atlas.rs` as a static 1024-byte array. At boot, `load_into_substrate()` copies it into the texture. After that, it's ROM -- programs can read it but the font never changes.

### 2. The CHAR Instruction (Opcode 15)

One instruction. Two register operands. No immediate data needed.

```
CHAR r_ascii, r_target
```

- `r_ascii` holds an ASCII code (e.g. 72 for 'H')
- `r_target` holds the Hilbert address where the character should be written

When the VM executes CHAR, it:

1. Reads the ASCII value from `r_ascii`
2. Computes the source address: `FONT_BASE + (ascii * 8)`
3. Reads 8 pixels from the font atlas (one per row of the glyph)
4. Writes those 8 pixels starting at `r_target`

That's it. One instruction blits an entire character. The program doesn't need to know how the font is stored. It just says "put 'H' at address 5000" and the VM handles the details.

Encoding in the 32-bit pixel:

```
Bits:  [31-24]  [23-16]  [15-8]   [7-0]
       p2       p1       stratum  opcode
       target   ascii    0        15
```

### 3. The Software VM (Deterministic Testing)

The CHAR opcode runs on both the GPU compute shader and the CPU-side software VM. The software VM is a line-for-line port of the WGSL shader logic, written in Rust. This means:

- Every CHAR instruction can be tested without a GPU roundtrip
- Tests run in milliseconds, not seconds
- The software VM and GPU VM must agree on results (cross-validated)

### 4. The Assembler (Building Programs)

Programs are built using the `Program` struct, which emits pixels:

```rust
let mut p = Program::new();
p.ldi(0, b'H' as u32);   // r0 = ASCII code for 'H'
p.ldi(1, 5000);           // r1 = target address
p.char_blit(0, 1);        // CHAR r0, r1 -- blit 'H' to address 5000
p.halt();                  // stop
```

This produces 4 pixels:

```
Address 0: 0x00000001  (LDI r0)
Address 1: 0x00000048  (data: 72 = 'H')
Address 2: 0x00010001  (LDI r1)
Address 3: 0x00001388  (data: 5000)
Address 4: 0x0100000F  (CHAR r0, r1)
Address 5: 0x0000000D  (HALT)
```

6 pixels. No Rust recompilation needed to change the text. Change the ASCII code or the target address, and you get a different character at a different position.

---

## Example: HELLO

The `hello_world()` function in `src/assembler.rs` builds a program that renders "HELLO" using 5 CHAR instructions:

```
LDI r0, 'H'      // r0 = 72
LDI r1, 5000     // screen position
CHAR r0, r1      // blit H

LDI r0, 'E'      // r0 = 69
LDI r1, 5010     // next position (10 pixels apart)
CHAR r0, r1      // blit E

LDI r0, 'L'      // r0 = 76
LDI r1, 5020
CHAR r0, r1      // blit L

LDI r0, 'L'      // r0 = 76
LDI r1, 5030
CHAR r0, r1      // blit L

LDI r0, 'O'      // r0 = 79
LDI r1, 5040
CHAR r0, r1      // blit O

HALT
```

26 pixels total. After execution, addresses 5000-5007 contain the 8 row bitmasks for 'H', 5010-5017 for 'E', etc.

The 'H' glyph, rendered as bits (X = pixel on, . = pixel off):

```
X...XX..    0xC6
X...XX..    0xC6
X...XX..    0xC6
XXXXXXX.    0xFE   <-- middle bar
X...XX..    0xC6
X...XX..    0xC6
X...XX..    0xC6
........    0x00
```

---

## The Bigger Picture: Why This Matters

### Compiled Once, Built Forever

This is the core architecture of Geometry OS:

```
┌──────────────────────────────────────────────────────┐
│  RUST LAYER (compiled once)                          │
│                                                      │
│  - The compute shader (WGSL)                         │
│  - The font atlas data (static array)                │
│  - The VM runtime (opcode dispatch)                  │
│  - The substrate (texture management)                │
│  - The software VM (testing mirror)                  │
│                                                      │
│  This is the ENGINE. It doesn't change often.        │
│  Compile once. Run forever.                          │
│                                                      │
├──────────────────────────────────────────────────────┤
│  PIXEL LAYER (never compiled)                        │
│                                                      │
│  - Programs built from the assembler                 │
│  - Each program = a Vec<u32> of pixels               │
│  - Text is just CHAR instructions pointing at        │
│    the font atlas                                    │
│  - New programs are just new pixel sequences          │
│                                                      │
│  This is where you BUILD. No recompilation.          │
│  Change a pixel, change the program.                 │
│                                                      │
└──────────────────────────────────────────────────────┘
```

The font atlas is the bridge between these layers. It makes characters available as *data* -- pixels in the texture that any program can read. The CHAR opcode is the interface -- one instruction that turns a character code into 8 pixels on screen.

### Characters as Building Blocks

Once you can render one character, you can render any text. And once programs can render text, they can:

- Display status messages ("REPLICATING...", "HALTED", "ERROR")
- Label memory regions in the visualization
- Build a text editor that runs entirely as pixel programs
- Create debug output without any host-side support
- Eventually: compile higher-level languages that target these primitives

The 8x8 font is small but complete. Every printable ASCII character is there: letters, digits, punctuation, symbols. That's enough to build anything textual.

---

## File Map

```
src/font_atlas.rs        -- Font data (1024 bytes), loading, lookup functions
src/assembler.rs          -- Program builder including char_blit(), hello_world()
src/software_vm.rs        -- CPU-side VM with CHAR opcode execution
src/vm.rs                 -- GPU VM state (VmState struct, 832 bytes)
src/visualization.rs      -- Opcode-to-color mapping for Hilbert visualization
src/hilbert.rs            -- Hilbert curve d2xy / xy2d address mapping
src/substrate.rs          -- GPU texture management, wgpu initialization
```

## Key Constants

```
FONT_BASE       = 0x00F00000  (15,728,640) -- where the font atlas lives
FONT_CHARS      = 128                         -- full ASCII range
FONT_CHAR_WIDTH = 8                           -- pixels per character row
FONT_CHAR_HEIGHT = 8                          -- rows per character
FONT_SIZE       = 1024                        -- total atlas in pixels
OP_CHAR         = 15                          -- CHAR opcode number
OP_BLIT         = 16                          -- BLIT opcode (bulk copy)
TEXTURE_SIZE    = 4096                        -- texture is 4096x4096
MAX_PIXELS      = 16,777,216                  -- total pixels in texture
```

## Font Atlas Address Formula

To find a character's data in the texture:

```
address = FONT_BASE + (ASCII_CODE * 8) + ROW
```

Where:
- `ASCII_CODE` = the character's ASCII value (0-127)
- `ROW` = which row of the 8x8 glyph (0-7)
- The value at that address is the row bitmask (bit 7 = leftmost pixel)

## Test Coverage

56 tests, all passing:

- 8 font_atlas tests (data integrity, loading, lookup)
- 2 CHAR opcode tests (single char blit, multi-char blit)
- 1 hello_world program test (end-to-end: atlas -> CHAR -> verify all 5 characters)
- 45+ other tests (all opcodes, self-replication, chain replication, GPU cross-validation)

---

*The font is 1024 pixels. The instruction is one pixel. The text it renders is unlimited.*
*That's the whole trick: bake the data once, build with it forever.*
