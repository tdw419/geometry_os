# Pixels as Compute: How Geometry OS Runs Programs from Images

Geometry OS has a 256x256 pixel grid that is simultaneously the screen, the RAM, and the program. This document traces the full arc from the original problem ("pixels should drive pixels, not just be driven by Rust code") through the production solution (programs as PNG files, executed natively by the GeOS VM) to the recursive proof (a CPU built entirely from pixels that executes pixel-encoded programs loaded from PNGs).

---

## Part 1: The Problem

### The Pixel-Driving-Pixels Gap

We built a system where the screen is a grid of colored cells. Each cell is a pixel. The pixel's color comes from its stored value. The value is also a character, and the character is also an instruction. One value, three meanings.

This works in one direction:

```
keystroke -> cell value -> colored glyph on screen
                       -> text that assembles to bytecode
```

But the moment a running program needs to change what's on screen, we write Rust code. The host language reaches into the pixel grid and changes it. The pixels themselves never drive other pixels.

```
what we want:  pixel on screen -> changes pixel on screen
what we get:   pixel on screen -> Rust code changes pixel on screen
```

### Two Separate Realities

Geometry OS has two realities that never touched each other:

**The Canvas** (visible, editable, human-facing) -- A 32x128 grid of cells in `canvas_buffer` (Vec<u32>, separate from VM RAM). You type on it. You see it. F8 reads it as text, assembles it, puts bytecode at 0x1000. F5 runs it. The grid stays visible showing your source while the VM runs invisible bytecode underneath.

**The VM** (invisible, running, machine-facing) -- Executes bytecode from RAM. Has registers, a stack, memory-mapped I/O. Can DRAW pixels to the screen buffer (PIXEL opcode). Can READ pixels back (PEEK opcode). Lives in Rust structs with its own Vec<u32> RAM.

The canvas couldn't run. It was dead text until F8 compiled it. The VM couldn't write to the canvas. A running program couldn't change its own source. Every dynamic behavior on the grid was implemented in Rust, not in the pixel language.

### What "Pixels Driving Pixels" Means

A system where pixels drive pixels has this property:

```
A cell's value changes -> adjacent cell's value changes -> visible effect
```

Without any host-language code in the loop. The grid is not just a display -- it's the compute substrate. The arrangement of values IS the program. Changing a value IS executing an instruction.

### What Was Already In Place

Not everything was missing:

- **PEEK** (0x4F) reads a pixel from the screen buffer into a register
- **PIXEL** (0x0D) writes a colored pixel to the screen
- **STORE/LOAD** read and write RAM
- **SPAWN** creates child processes
- The canvas already holds readable assembly text

The missing piece: the canvas buffer was not addressable from the VM. The VM had RAM, the canvas had canvas_buffer, and they didn't connect.

### The Solution That Actually Landed

Rather than mapping the canvas into VM RAM, the project evolved in a different direction that solved the same problem more completely: the screen buffer itself became the unified substrate. The GeOS VM's screen[] array (the 256x256 pixel grid) is mapped into the VM's address space at SCREEN_RAM_BASE (0x10000). LOAD/STORE to that range reads and writes screen pixels directly. Programs can read and modify the visible pixel grid from within the VM, without any Rust code in the loop.

The canvas buffer question became moot -- the screen IS the programmable surface. And then the question became: can the pixel grid carry programs, not just data?

---

## Part 2: Programs as PNG Files (Production Path)

### The Idea

If pixels can encode data, and programs are data, then a PNG image can be a program. Open the image, see the pixels. Load the image, run the program. The image IS the executable.

Geometry OS implements this through the pixelpack encoding scheme: each pixel's 32-bit RGBA value is a "seed" that expands to 1-16 bytes of data. A PNG file contains hundreds or thousands of these seeds. Decode them, and you get the original bytes -- whether that's bytecode or assembly source.

### Three Levels

**Level 1: Bytecode from PNG** (Phase 92)

A `.png` file contains pixelpack-encoded bytecode. Load the image, decode seeds to bytes, write directly to `RAM[0x1000]`, run. No assembler step. The image IS the binary executable.

**Level 2: Source from PNG** (Phase 93)

A `.png` file contains pixelpack-encoded assembly source code. Load the image, decode seeds to UTF-8 text, write onto the canvas buffer, auto-assemble to bytecode at `0x1000`, run. The image is both the source code AND the executable. Source code appears as colored syntax-highlighted text on the grid. PNG metadata `geo_boot=source` distinguishes from bytecode PNGs.

**Level 3: Universal Pixel Executable** (Phase 94)

One loader detects the PNG type automatically. `geo_boot=source` triggers Level 2. `geo_boot=bytecode` or no metadata triggers Level 1. Programs can bootstrap other programs from pixels at runtime:

```asm
; Program A loads program B from a PNG and runs it
LDI r5, path_str
LOADSRCIMG r5        ; decode source PNG -> canvas -> assemble -> bytecode at 0x1000
RUNNEXT              ; jump PC to 0x1000 to execute program B
```

### Pixelpack Encoding

Each pixel (32-bit RGBA) encodes data via a 4-bit strategy + 28-bit params:

```
[31:28] strategy  |  [27:0] params
     0x0-0x6      |  Dictionary lookup (1-7 entries from 16-word table)
     0x7          |  Nibble encoding (7 hex digits)
     0x8          |  4 raw bytes
     0x9          |  RLE (repeat byte N times)
     0xA          |  3 raw bytes
     0xB          |  XOR chain
     0xC          |  Linear sequence (start + step * N)
     0xD          |  Delta encoding
     0xE          |  Bytepack
     0xF          |  4-byte literal
```

The most common strategies: **0xA (raw3)** packs 3 raw bytes per pixel (used for source encoding), **0x8 (raw4)** packs 4 raw bytes per pixel, **0x0-0x6 (dict)** looks up entries from a 16-word dictionary of common assembly tokens (LDI, HALT, etc.).

### PNG Metadata

| Key | Value | Meaning |
|-----|-------|---------|
| `seedcnt` | integer | Number of seeds (pixels with data) |
| `bytecnt` | integer | Original byte count before encoding |
| `geo_boot` | `source` or absent | `source` = Level 2, absent = Level 1 |

### Pipeline

**Bytecode path:**
```
source.asm -> assembler -> bytecode -> encode_pixelpack_png() -> PNG image
                                                              -> decode_pixelpack_png() -> raw bytes
                                                              -> load_bytecode_to_ram() -> RAM[0x1000]
                                                              -> vm.step() -> execution
```

**Source path:**
```
source.asm -> encode_source_pixelpack_png() -> PNG image
           -> decode_pixelpack_source() -> source text -> canvas -> assemble -> RAM[0x1000] -> execution
```

### CLI Integration

```bash
# Boot bytecode from PNG
cargo run -- --cli --boot-png program.png

# Boot source from PNG
cargo run -- --cli --boot-src-png program.png

# Auto-detect (checks PNG metadata)
cargo run -- --cli program.png
```

Runtime opcodes: `LOADPNG` (0xB1) loads bytecode from PNG into RAM. `LOADSRCIMG` (0xB2) loads source from PNG, writes to canvas, and assembles.

### Tests

- `test_full_pixel_boot_roundtrip` -- assemble, encode, decode, load, run, verify
- `test_source_png_round_trip` -- source text encode/decode round-trip
- `test_loadsrcimg_opcode_basic` -- LOADSRCIMG loads source PNG, assembles, runs
- `test_universal_pixel_boot_bytecode` -- auto-detect bytecode PNG
- `test_universal_pixel_boot_source` -- auto-detect source PNG
- `test_pixel_chain_program_a_loads_b` -- program A loads program B from PNG

---

## Part 3: The Pixel VM (Recursive Proof)

### The Idea

The production path (Part 2) proves that a PNG can carry a program. The pixel VM asks the next question: what if the CPU itself is also made of pixels?

```
Production:  PNG file -> decode -> load into RAM -> native VM executes (131+ opcodes, Rust)
Pixel VM:    PNG file -> decode -> load into screen[] -> pixel-VM (9 opcodes, GeOS assembly) executes
```

Two interpreters stacked. The outer one is the real GeOS VM (written in Rust, 131+ opcodes). The inner one is a 9-opcode CPU written entirely in GeOS assembly (`programs/pixel_vm.asm`). Both operate on the same 256x256 pixel grid.

### Pixel-Instruction Encoding

Every pixel-instruction is a single u32 value. The four color channels encode the instruction:

```
Bits 31-24 (R): opcode
Bits 23-16 (G): operand1
Bits 15-8  (B): operand2
Bits  7-0  (A): unused (zero)
```

This is not an abstraction. The u32 stored in screen memory IS the RGBA color on screen. A red pixel (0xFF000000) is a HALT instruction. A blue-green pixel (0x01010300) is LOADI r1, 3.

### The Pixel-ISA (9 opcodes)

```
0x01 LOADI  reg, imm    Set register to immediate value
0x02 ADD    dest, src   Add source register to destination
0x03 SUB    dest, src   Subtract source from destination
0x04 MUL    dest, src   Multiply
0x05 STORE  reg, addr   Write register to data memory
0x06 LOAD   reg, addr   Read from data memory into register
0x07 CMPI   reg, imm    Compare register with immediate (sets flag)
0x08 JNZ    addr        Jump if flag != 0
0xFF HALT                Stop execution
```

Nine opcodes. Arithmetic, memory, conditional branching. That's a Turing-complete computer.

### Screen Memory Layout

The pixel-VM's entire universe lives in a section of the GeOS screen buffer:

```
screen[0x0000..0x00FF]   Pixel program (up to 256 instructions)
screen[0x0100..0x01FF]   Pixel-VM registers (16 registers, visible as pixels)
screen[0x0200..0x02FF]   Pixel-VM data memory (256 words, visible as pixels)
```

Mapped to GeOS addresses via SCREEN_RAM_BASE (0x10000):

```
0x10000..0x100FF         = screen[0..255]    (program)
0x10100..0x101FF         = screen[256..511]  (registers)
0x10200..0x102FF         = screen[512..767]  (data)
```

When the pixel-VM writes a register value to screen[256], it changes a visible pixel. Every state change is visible as a color change. You can watch the computation happen.

### The Host Program (pixel_vm.asm)

The pixel-VM is itself a GeOS assembly program. Its fetch-decode-execute loop:

1. **Fetch**: Read `screen[PV_PROG_BASE + PC]` to get the next u32 pixel-instruction
2. **Decode**: Shift and mask to extract R (opcode), G (operand1), B (operand2)
3. **Dispatch**: Chain of CMPI/JZ comparisons to find the matching opcode
4. **Execute**: Read/write registers and data from screen memory
5. **Loop**: Increment PC and fetch the next instruction

Each pixel-instruction cycle costs roughly 15 GeOS opcodes. The inner CPU runs at ~1/15th the speed of the outer one.

### The PNG Chain

The capstone proof ties everything together:

```
PNG file (4x1 RGBA image)
  -> each pixel is a u32 instruction (R=opcode, G=op1, B=op2, A=0)
  -> decode PNG to recover u32 values
  -> write u32s into screen[0..3]
  -> pixel-VM fetches from screen[], decodes channels, executes
  -> writes register results back to screen[256..]
  -> result is visible as colored pixels
```

A PNG file carries a runnable program for a CPU that lives in pixels. The test `test_pixel_vm_from_pixelpack_png` proves this: encode LOADI/SUB/HALT as RGBA pixels in a PNG, decode, run on the pixel-VM, verify 7 - 3 = 4 in screen memory.

### Tests

- `test_pixel_vm_add_2_plus_3` -- LOADI r0,2 / LOADI r1,3 / ADD r0,r1 / HALT => reg0=5
- `test_pixel_vm_loop_counter` -- Counts 1 to 10 with CMPI/JNZ loop => reg0=10
- `test_pixel_vm_from_pixelpack_png` -- Program delivered via PNG round-trip, SUB opcode => 7-3=4

---

## Summary

The original question was: can pixels drive pixels? Can the pixel grid be a compute substrate, not just a display?

The answer is yes, at three levels:

1. **The screen buffer is programmable** -- GeOS VM programs read and write screen pixels directly via LOAD/STORE to SCREEN_RAM_BASE. No Rust code in the loop.

2. **PNG files are programs** -- The pixelpack encoding scheme packs bytecode or source into PNG images. Decode the image, run the program. The production path (Part 2) is how real GeOS software is distributed and loaded.

3. **The pixel grid is a universal computing surface** -- The pixel VM (Part 3) proves that a CPU can be built entirely from pixels, executing programs that are pixels, writing results that are pixels. The GeOS VM's own RAM (a pixel grid) already has this property natively. The pixel VM makes it visible at a second level of recursion.

The pixel VM is a proof, not an architecture. The native GeOS VM (131+ opcodes, multi-process, VFS, IPC, devices, windowing) is the production engine. The pixel VM exists to demonstrate a recursive point: pixels all the way down.

---

## See Also

- `programs/pixel_vm.asm` -- 230-line GeOS assembly source for the pixel-VM interpreter
- `src/pixel.rs` -- Pixelpack encode/decode, PNG boot path
- `docs/ARCHITECTURE.md` -- Full GeOS VM architecture
