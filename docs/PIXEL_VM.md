# The Pixel VM

A CPU that lives in pixels, runs programs that are pixels, and writes its results back to pixels. Built as a self-contained proof that the pixel grid is not just a display -- it is a compute substrate.

## The Idea

Geometry OS already proved that a program can be a PNG file: encode bytecode into RGBA pixels, load the image, decode, run on the native VM. The pixels carry the program.

The pixel VM asks the next question: what if the CPU itself is also made of pixels?

```
Native GeOS:  PNG file -> decode -> load into RAM -> native VM executes
Pixel VM:     PNG file -> decode -> load into screen[] -> pixel-VM (itself a GeOS program) executes
```

Two interpreters stacked. The outer one is the real GeOS VM (131+ opcodes, written in Rust). The inner one is a 9-opcode CPU written entirely in GeOS assembly, living in `programs/pixel_vm.asm`. Both operate on the same 256x256 pixel grid.

## How It Works

### The Pixel-Instruction Encoding

Every pixel-instruction is a single u32 value. The four color channels encode the instruction parts:

```
Bits 31-24 (R): opcode
Bits 23-16 (G): operand1
Bits 15-8  (B): operand2
Bits  7-0  (A): unused (zero)
```

This is not an abstraction. The u32 value stored in screen memory IS the RGBA color you see on screen. A red pixel (0xFF000000) is a HALT instruction. A blue-green pixel (0x01010300) is LOADI r1, 3. You can see the program by looking at the screen.

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

Nine opcodes is enough to be Turing-complete. You have arithmetic, memory, and conditional branching. That's a computer.

### Screen Memory Layout

The pixel-VM's entire universe lives in a section of the GeOS screen buffer:

```
screen[0x0000..0x00FF]   Pixel program (up to 256 instructions)
screen[0x0100..0x01FF]   Pixel-VM registers (16 registers, visible as pixels)
screen[0x0200..0x02FF]   Pixel-VM data memory (256 words, visible as pixels)
```

Mapped to GeOS addresses:

```
0x10000..0x100FF         = screen[0..255]    (program)
0x10100..0x101FF         = screen[256..511]  (registers)
0x10200..0x102FF         = screen[512..767]  (data)
```

The GeOS VM maps screen[] into its address space via LOAD/STORE to SCREEN_RAM_BASE (0x10000). When the pixel-VM reads `LOAD r2, 0x10000`, it gets the first pixel-instruction. When it writes `STORE 0x10100, r5`, it changes a register -- and that change is visible on screen.

### The Host Program (pixel_vm.asm)

The pixel-VM is itself a GeOS assembly program. Its fetch-decode-execute loop works like any real CPU:

1. **Fetch**: Read `screen[PV_PROG_BASE + PC]` to get the next u32 pixel-instruction
2. **Decode**: Shift and mask to extract R (opcode), G (operand1), B (operand2)
3. **Dispatch**: Chain of CMPI/JZ comparisons to find the matching opcode
4. **Execute**: Read/write registers and data from screen memory
5. **Loop**: Increment PC and fetch the next instruction

Each pixel-instruction cycle costs roughly 15 GeOS opcodes (fetch + decode + dispatch overhead + execute + branch back). The inner CPU runs at ~1/15th the speed of the outer one. That's the cost of recursion.

### Register Mapping

The pixel-VM borrows GeOS registers for its own state:

```
r1  = pixel-VM program counter
r2  = currently fetched pixel-instruction (raw u32)
r3  = decoded opcode (R channel)
r4  = decoded operand1 (G channel)
r5  = decoded operand2 (B channel)
r6  = screen base address of pixel program (0x10000)
r7  = screen base address of pixel registers (0x10100)
r8  = screen base address of pixel data memory (0x10200)
r9  = pixel-VM flag register (0=equal, 1=not-equal)
```

## The PNG Chain

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

A PNG file is a runnable program for a CPU that lives in pixels. The test `test_pixel_vm_from_pixelpack_png` proves this end-to-end: encode LOADI/SUB/HALT as RGBA pixels in a PNG, decode, run on the pixel-VM, verify 7 - 3 = 4 in screen memory.

## Tests

Three tests prove the system:

1. `test_pixel_vm_add_2_plus_3` -- LOADI r0,2 / LOADI r1,3 / ADD r0,r1 / HALT => reg0=5
2. `test_pixel_vm_loop_counter` -- Counts 1 to 10 with CMPI/JNZ loop => reg0=10
3. `test_pixel_vm_from_pixelpack_png` -- Same program delivered via PNG round-trip, uses SUB => 7-3=4

## What This Proves

The "pixel-driving-pixels" problem (described in PIXEL_DRIVING_PIXELS.md) was about whether the pixel grid could be a compute substrate, not just a display. The pixel-VM settles it:

- Pixels can be instructions (the RGBA channels encode opcode + operands)
- Pixels can be data (registers and memory live in the screen buffer)
- Pixels can be the execution trace (every state change is visible as a color change)
- A PNG file can carry a runnable program (the image IS the binary)

The pixel-VM is not meant to be extended or built upon. It's a proof. Nine opcodes, 230 lines of assembly, three tests. It demonstrates that the pixel grid is not just a framebuffer -- it is a universal computing surface.

## Relationship to the Native GeOS VM

The pixel-VM is a demo, not an architecture. The native GeOS VM (131+ opcodes, multi-process, VFS, IPC, devices, windowing) is the real engine. The native VM already boots programs from PNG files through the pixelpack loader -- that path (`decode_pixelpack_png -> load_bytecode_to_ram -> vm.run`) is the production code path.

The pixel-VM exists to prove a recursive point: a CPU can be built entirely from pixels, executing programs that are pixels, writing results that are pixels. Once you see that, you understand that the GeOS VM's own RAM (also a pixel grid) already has this property natively. The pixel-VM just makes it visible at a second level of recursion.

## See Also

- `programs/pixel_vm.asm` -- The 230-line GeOS assembly source for the pixel-VM interpreter
- `docs/PIXEL_DRIVING_PIXELS.md` -- The original problem statement (pixels as compute substrate)
- `docs/CODE_PIXEL_EXECUTION.md` -- How GeOS boots programs from PNG files (the native path)
- `docs/ARCHITECTURE.md` -- Full GeOS VM architecture
