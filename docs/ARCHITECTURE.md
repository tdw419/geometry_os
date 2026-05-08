# Geometry OS — Architecture Reference

> **Last updated:** 2026-05-08
> **Stats:** 218 opcodes, 3237 tests, 218 programs, 125K LOC (src), 26K LOC (tests)

## One-Line Summary

Type text on a 32×128 pixel grid, press F8 to assemble, press F5 to run — the letter IS the colored pixels.

## The Pipeline

```
keystroke → ASCII byte → vm.canvas_buffer[row*32+col] as u32
                                │
                    ┌───────────┼───────────┐
                    │           │           │
               rendering   preprocessor   assembly (F8)
                    │        (macro exp)       │
          font::GLYPHS[byte]  VAR/SET/GET   assembler::assemble()
          palette_color(val)                → bytecode at 0x1000
                    │           │           │
              pixel glyph   expanded      F5 runs from 0x1000
              colored by    source →       → VM.step() loop
              HSV palette   assembler
```

Three representations of each cell, all from the same byte:

1. **Glyph** — character shape from `font::GLYPHS[byte]` (8×8 at 2× scale)
2. **Color** — `palette_color(val)` solid block, HSV spread across printable ASCII
3. **Byte** — raw hex value (for cursor inspector)

## Source Tree

```
src/
├── main.rs              # Window (minifb), rendering, input, terminal/editor modes
├── lib.rs               # Public API (pub mod vm, assembler)
├── cli.rs               # Headless CLI REPL (--cli mode)
├── canvas.rs            # GUI terminal handler
├── hermes.rs            # Built-in LLM agent (hermes/build commands)
├── episode_log.rs       # Episodic memory for LLM context
├── preprocessor.rs      # Macro expansion (VAR/SET/GET/INC/DEC)
├── font.rs              # 8×8 VGA/CP437 bitmaps (128 glyphs)
├── glyph_backend.rs     # Glyph rendering backend
├── vfs.rs               # Virtual filesystem
├── inode_fs.rs          # Inode-based in-memory filesystem
├── audio.rs             # Audio subsystem (WAV via aplay)
├── save.rs              # Save/load VM state to disk
├── scrollback.rs        # Terminal scrollback buffer
├── keys.rs              # Key mapping (physical → ASCII)
├── pixel.rs             # Pixel-level operations
├── render.rs            # Rendering pipeline
├── camera.rs            # Camera/viewport management
├── viewport.rs          # Viewport abstraction
├── vision.rs            # Vision-gate pixel inspection
├── mcp_server.rs        # MCP bridge (Hermes → VM socket)
├── fuzzer.rs            # Bytecode VM fuzzer with oracle checking
├── riscv_fuzzer.rs      # RISC-V interpreter fuzzer (17 C-ext ops)
└── assembler/
    ├── mod.rs               # Two-pass assembler with labels
    ├── core_ops.rs          # ALU, branches, load/store, stack
    ├── graphics_ops.rs      # PSET, RECTF, LINE, CIRCLE, SPRITE, TILEMAP, etc.
    ├── immediate_ops.rs     # PSETI, TEXTI, MEMSET, BYTEPACK, etc.
    ├── system_ops.rs        # Syscalls, process, IPC, device, networking
    ├── formula_ops.rs       # FORMULA/FORMULACLEAR/FORMULAREM
    ├── instructions.rs      # Instruction metadata
    └── includes.rs          # .include directive handling
src/vm/
├── mod.rs               # Core VM: 64K RAM, 32 regs, 256×256 screen
├── types.rs             # Process, SpawnedProcess, VmState types
├── memory.rs            # Page directory, COW, physical page allocator
├── scheduler.rs         # Round-robin process scheduler
├── boot.rs              # Boot sequence (init process, shell spawn)
├── ops_memory.rs        # LOAD/STORE/LOADS/STORES/MEMCPY/MEMSET handlers
├── ops_graphics.rs      # PSET/RECTF/LINE/CIRCLE/SPRITE/TEXT/CLIP/etc handlers
├── ops_extended.rs      # CMP/MOV/NEG/BFE/BFI/CMOV/CSEL/etc handlers
├── ops_syscall.rs       # OPEN/READ/WRITE/CLOSE/SEEK/LS/FMKDIR/etc handlers
├── ops_host_fs.rs       # Host filesystem bridge opcodes
├── ops_pty.rs           # PTY open/write/read/close/size handlers
├── net.rs               # UDP networking (SOCKSEND/SOCKRECV/CONNECT)
├── formula.rs           # Reactive canvas formula engine
├── disasm.rs            # Disassembler (instruction boundary scanning)
├── trace.rs             # Execution trace buffer
├── icache.rs            # Instruction cache
├── io.rs                # Save/load state serialization
├── gpu_lexer.rs         # GPU shader lexer
├── gpu_patcher.rs       # GPU binary patching
└── tests.rs             # VM unit/integration tests (core)
tests/
├── program_tests.rs     # Integration tests: assemble + run + verify screen
└── ...                  # Additional test files
programs/                # 218 assembly programs (.asm files)
docs/
├── CANVAS_TEXT_SURFACE.md   # Founding spec (THE authoritative document)
├── ARCHITECTURE.md          # This file
└── RISCV_HYPERVISOR.md      # RISC-V Linux boot design
```

## Memory Map

```
Address Range        Size      Purpose
────────────────────────────────────────────────────────────────
0x0000–0x0FFF        4K        Source text (32×128 canvas grid)
0x1000–0x1FFF        4K        Assembled bytecode (F8 writes here)
0x2000–0x7FFF        24K       General-purpose RAM
0x8000–0x8FFF        4K        Canvas buffer mirror (LOAD/STORE intercepted)
0x9000–0xFBFF        28K       General-purpose RAM
0xFC00–0xFC03        4W        Window Bounds Protocol (shared RAM IPC)
0xFC04–0xFC04        1W        Audio volume (0–100, via /dev/audio IOCTL)
0xFC05–0xFC05        1W        Keyboard echo mode (via /dev/keyboard IOCTL)
0xFC07–0xFC07        1W        Key bitmask (bits 0–5: U/D/L/R/space/enter)
0xFC08–0xFC08        1W        Network data port (UDP)
0xFC09–0xFC09        1W        ASM result (word count or 0xFFFFFFFF on error)
0xFC0A–0xFC0A        1W        TICKS (frame counter, read-only, per FRAME)
0xFC00–0xFFFF        1K        Hardware registers / stack (r30=SP grows from 0xFC00)
────────────────────────────────────────────────────────────────
Page 3 Debug Mailbox (shared COW page, identity-mapped in all SPAWNC children):
0x0C00  DEBUG_MAGIC      (0xDB9900 = debug stub active)
0x0C01  DEBUG_PARENT_PID
0x0C02  DEBUG_CHILD_PID
0x0C03  DEBUG_COMMAND    (1=regs, 2=ram_read, 3=ping, 0=none)
0x0C04  DEBUG_STATUS     (0=idle, 1=cmd_pending, 2=response_ready)
0x0C05–0x0C24 DEBUG_RESPONSE (32 words)
0x0C25  DEBUG_ADDR
0x0C26  DEBUG_VALUE
0x0C27  DEBUG_HEARTBEAT
0x0C28  DEBUG_CHECKPOINT
────────────────────────────────────────────────────────────────
FD namespace:
  0–99           Regular file fds (VFS fopen)
  0x8000–0xBFFF  Pipe read fds (0x8000 + pipe_idx)
  0xC000–0xDFFF  Pipe write fds (0xC000 + pipe_idx)
  0xE000–0xE003  Device fds (screen/keyboard/audio/net)
```

Total: 65536 (64K) u32 cells.

## Special Registers

| Register | Purpose |
|----------|---------|
| r0 | CMP result (−1/0/1). **Never use as general register.** |
| r30 (SP) | Stack pointer. Initialize to 0xFC00 before PUSH/POP. Grows downward. |
| r31 (LR) | Link register. CALL saves return address here, RET jumps to it. |

## VM Structure

- **64K RAM** (`ram: [u32; 65536]`)
- **32 registers** (`regs: [u32; 32]`)
- **256×256 screen buffer** (`screen: [u32; 65536]`)
- **128×32 canvas buffer** (`canvas_buffer: Vec<u32>`) — mapped at 0x8000–0x8FFF
- **Process table** — multi-process with isolated address spaces
- **Page directory** — COW fork, per-process virtual memory
- **VFS** — inode-based in-memory filesystem
- **Scheduler** — round-robin with priority and time slices
- **IPC** — pipes (PIPE), messages (MSGSND/MSGRCV)

## Multi-Process

### SPAWN / KILL

SPAWN creates a child process with its own registers, PC, and page directory (isolated address space). Only shared pages are identity-mapped:

- **Page 3** (0x0C00–0x0FFF): Debug mailbox, window bounds, hardware ports
- **Page 63** (0xFC00–0xFFFF): Hardware registers, stack area

```
; Primary spawns child at label
LDI r6, child
SPAWN r6            ; child starts at 'child', r6 = child PID

; ... primary loop ...
KILL r6             ; kill by PID
```

**Entry point alignment**: SPAWN uses COW fork. Child virtual page 0 maps to the physical page containing `start_addr`. For JMP/CALL to work correctly in the child, use page-aligned addresses (multiples of 1024: `.org 0x000`, `.org 0x400`, `.org 0x800`).

### SPAWNC (COW Fork)

SPAWNC (0xA7) creates COW children. Only Page 3 is shared between parent and child. Parent cannot write to child's non-shared RAM.

### Window Bounds Protocol (Shared RAM IPC)

Zero-opcode spatial coordination via shared RAM:

```
RAM[0xFC00] = win_x   (left edge)
RAM[0xFC01] = win_y   (top edge)
RAM[0xFC02] = win_w   (width)
RAM[0xFC03] = win_h   (height)
```

Children read these each frame and clamp rendering to their window. Moving the window automatically moves children — no messages, no interrupts.

## Virtual Filesystem

### Inode-Based In-Memory FS

- Files stored as inode → block chains
- Max files and blocks configurable
- Standard operations: OPEN, READ, WRITE, CLOSE, SEEK, LS
- Extended: FMKDIR, FUNLINK, FSTAT, FCOPY

### Device Drivers (`/dev/*`)

Accessed via OPEN + IOCTL:

| Device | FD Range | Operations |
|--------|----------|------------|
| `/dev/screen` | 0xE000 | READ (pixels), WRITE (pixels), IOCTL (dimensions) |
| `/dev/keyboard` | 0xE001 | READ (key), IOCTL (echo mode) |
| `/dev/audio` | 0xE002 | WRITE (WAV data), IOCTL (volume) |
| `/dev/net` | 0xE003 | READ/WRITE (UDP packets) |

## Modes

### Terminal Mode (default on boot)

Prompt: `geo> `. Commands: help, list/ls, load, run, edit, regs, peek, poke, step, bp, bpc, disasm, reset, clear/cls, files, shell, readfile, hermes, build, quit/exit.

### Editor Mode (entered via `edit`)

Type text directly on the canvas grid. F8 assembles, F5 runs, F6 steps, F7 saves state, Escape returns to terminal.

### CLI Mode (`--cli` flag)

Headless REPL on stdin/stdout. No window. Loads at address 0 (not 0x1000). Supports `screen` command for pixel dump.

## Assembler

Two-pass with labels. Standard mnemonics, comma-separated args, semicolon comments, colon labels.

```asm
LDI r1, 10          ; load immediate
LDI r2, 20
ADD r1, r2           ; r1 = r1 + r2

loop:
  JNZ r1, loop       ; jump if r1 != 0
HALT
```

### Preprocessor Macros

Before assembly: `VAR name addr`, `SET var val`, `GET reg var`, `INC var`, `DEC var`.

### Directives

`.org addr`, `.ascii "text"`, `.asciz "text"`, `.byte val`, `.db val`, `.include "file"`.

**Pitfall**: `label: .ascii "text"` on one line fails. Put label on its own line.

## ISA — Complete Opcode Table

218 opcodes across 12 functional categories. Each row: hex byte, name, word count, register args, description.

### System (0x00–0x04)

| Hex | Name | Words | Args | Description |
|-----|------|-------|------|-------------|
| 0x00 | HALT | 1 | 0 | Stop execution |
| 0x01 | NOP | 1 | 0 | No operation |
| 0x02 | FRAME | 1 | 0 | Yield to renderer (animation tick) |
| 0x03 | BEEP | 3 | 2 | Play tone: BEEP freq_reg, dur_reg |
| 0x04 | MEMCPY | 4 | 3 | Copy memory: MEMCPY dst, src, len |

### Load / Store (0x10–0x17)

| Hex | Name | Words | Args | Description |
|-----|------|-------|------|-------------|
| 0x10 | LDI | 3 | 2 | Load immediate: LDI reg, imm |
| 0x11 | LOAD | 3 | 2 | Load from RAM: LOAD reg, addr_reg |
| 0x12 | STORE | 3 | 2 | Store to RAM: STORE addr_reg, reg |
| 0x13 | TEXTI | 5 | 2 | Render inline text at cursor position |
| 0x14 | STRO | 4 | 1 | Write string literal to RAM at register address |
| 0x15 | CMPI | 3 | 2 | Compare immediate: CMPI reg, imm |
| 0x16 | LOADS | 3 | 2 | Load signed byte from RAM |
| 0x17 | STORES | 3 | 2 | Store signed byte to RAM |

### Arithmetic / Logic (0x20–0x2B)

| Hex | Name | Words | Args | Description |
|-----|------|-------|------|-------------|
| 0x20 | ADD | 3 | 2 | rd = rd + rs |
| 0x21 | SUB | 3 | 2 | rd = rd − rs |
| 0x22 | MUL | 3 | 2 | rd = rd × rs |
| 0x23 | DIV | 3 | 2 | rd = rd / rs (truncating) |
| 0x24 | AND | 3 | 2 | rd = rd & rs |
| 0x25 | OR | 3 | 2 | rd = rd \| rs |
| 0x26 | XOR | 3 | 2 | rd = rd ^ rs |
| 0x27 | SHL | 3 | 2 | rd = rd << rs (mod 32) |
| 0x28 | SHR | 3 | 2 | rd = rd >> rs (logical, mod 32) |
| 0x29 | MOD | 3 | 2 | rd = rd % rs |
| 0x2A | NEG | 2 | 1 | rd = two's complement negate |
| 0x2B | SAR | 3 | 2 | rd = rd >> rs (arithmetic, sign-preserving) |

### Control Flow (0x30–0x36)

| Hex | Name | Words | Args | Description |
|-----|------|-------|------|-------------|
| 0x30 | JMP | 2 | 1 | Jump to address (label or immediate) |
| 0x31 | JZ | 3 | 2 | Jump if reg == 0 |
| 0x32 | JNZ | 3 | 2 | Jump if reg != 0 |
| 0x33 | CALL | 2 | 1 | Call subroutine (return addr → r31) |
| 0x34 | RET | 1 | 0 | Return (jump to r31) |
| 0x35 | BLT | 3 | 2 | Branch if last CMP was less-than (checks r0) |
| 0x36 | BGE | 3 | 2 | Branch if last CMP was greater-or-equal (checks r0) |

> **No BNE/BEQ/BLE** — use JNZ/JZ and CMP+BLT/BGE instead.
> **BLT/BGE take 2 args** (register, label), not 3. CMP first, then branch on r0.

### Comparison / Move (0x50–0x51, 0x86–0x8B)

| Hex | Name | Words | Args | Description |
|-----|------|-------|------|-------------|
| 0x50 | CMP | 3 | 2 | Compare: r0 = −1 (a<b), 0 (a==b), 1 (a>b) |
| 0x51 | MOV | 3 | 2 | Register copy: rd = rs |
| 0x86 | STRCMP | 3 | 2 | String compare (null-terminated RAM strings) |
| 0x87 | ABS | 2 | 1 | Absolute value: reg = \|reg\| |
| 0x89 | MIN | 3 | 2 | rd = min(rd, rs) |
| 0x8A | MAX | 3 | 2 | rd = max(rd, rs) |
| 0x8B | CLAMP | 4 | 3 | Clamp value to [lo, hi] range |

### Stack (0x60–0x61)

| Hex | Name | Words | Args | Description |
|-----|------|-------|------|-------------|
| 0x60 | PUSH | 2 | 1 | Push reg onto stack (r30=SP, grows down) |
| 0x61 | POP | 2 | 1 | Pop from stack into reg |

### Graphics — Primitives (0x40–0x4A)

| Hex | Name | Words | Args | Description |
|-----|------|-------|------|-------------|
| 0x40 | PSET | 4 | 3 | Set pixel: PSET x_reg, y_reg, color_reg |
| 0x41 | PSETI | 4 | 3 | Set pixel immediate: PSETI x, y, color |
| 0x42 | FILL | 2 | 1 | Fill screen with color |
| 0x43 | RECTF | 6 | 5 | Filled rectangle: RECTF x, y, w, h, color |
| 0x44 | TEXT | 4 | 3 | Render text from RAM: TEXT x, y, addr |
| 0x45 | LINE | 6 | 5 | Bresenham line: LINE x0, y0, x1, y1, color |
| 0x46 | CIRCLE | 5 | 4 | Midpoint circle: CIRCLE x, y, r, color |
| 0x47 | SCROLL | 2 | 1 | Scroll screen up by N pixels |
| 0x48 | IKEY | 2 | 1 | Read keyboard (returns ASCII or 0) |
| 0x49 | RAND | 2 | 1 | Pseudo-random u32 (LCG) |
| 0x4A | SPRITE | 6 | 5 | Blit NxM sprite from RAM (color 0 = transparent) |
| 0x4C | TILEMAP | 9 | 8 | Grid blit from tile index array |

### Graphics — Extended (0x88, 0x8C, 0xC4–0xC5, 0xCE, 0xF2–0xF5)

| Hex | Name | Words | Args | Description |
|-----|------|-------|------|-------------|
| 0x37 | HITSET | 6 | 5 | Define hit-test region |
| 0x38 | HITQ | 2 | 1 | Query which region was hit |
| 0x88 | RECT | 6 | 5 | Unfilled rectangle outline |
| 0x8C | DRAWTEXT | 6 | 5 | Draw text with foreground/background |
| 0x91 | INV | 1 | 0 | Invert all screen pixels |
| 0x9E | HITCLR | 1 | 0 | Clear all hit regions |
| 0xC4 | CLIPSET | 5 | 4 | Set clip rectangle (constrain rendering) |
| 0xC5 | CLIPCLR | 1 | 0 | Clear clip rectangle |
| 0xCE | FLOOD | 5 | 4 | Scanline flood fill |
| 0xF2 | BLEND | 5 | 4 | Alpha blend onto screen |
| 0xF3 | BLENDR | 4 | 3 | Register-based alpha blend |
| 0xF4 | ROTATE | 6 | 5 | Rotate screen region by angle |
| 0xF5 | SCALE | 9 | 8 | Scale screen region (nearest-neighbor) |

### Text Rendering (0x13, 0xD0–0xD1, 0xDB–0xDD)

| Hex | Name | Words | Args | Description |
|-----|------|-------|------|-------------|
| 0x13 | TEXTI | 5 | 2 | Render inline text at cursor |
| 0xD0 | SMALLTEXT | 6 | 5 | Render text in small font (5×7) |
| 0xD1 | MEDTEXT | 6 | 5 | Render text in medium font |
| 0xDB | VWTXT | 6 | 5 | Viewport text |
| 0xDC | FONT_SELECT | 2 | 1 | Select active font |
| 0xDD | CLIP_TEXT | 4 | 3 | Render text within clip region |

### Screen I/O (0x4F, 0x6D, 0x95–0x98, 0xAF, 0xB0, 0xB2, 0xD7–0xD8)

| Hex | Name | Words | Args | Description |
|-----|------|-------|------|-------------|
| 0x4F | PEEK | 4 | 3 | Read screen pixel: PEEK x, y, dest |
| 0x6D | SCREENP | 4 | 3 | Read screen pixel: SCREENP dest, x, y (reversed args!) |
| 0x95 | WPIXEL | 5 | 4 | Write pixel to window |
| 0x96 | WREAD | 5 | 4 | Read pixel from window |
| 0x97 | SPRBLT | 5 | 4 | Sprite blit with flags |
| 0x98 | SCRSHOT | 2 | 1 | Screenshot screen to RAM buffer |
| 0xAF | SAVEPNG | 2 | 1 | Save screen as PNG file |
| 0xB0 | SCREENA | 3 | 1 | Screen animation mode |
| 0xB2 | LOADSRCIMG | 2 | 1 | Load source image |
| 0xD7 | CLIP_COPY | 5 | 4 | Copy screen region to buffer |
| 0xD8 | CLIP_PASTE | 3 | 2 | Paste buffer to screen region |

> **PEEK vs SCREENP**: 0x4F uses `PEEK x, y, dest` (matches PSET convention). 0x6D uses `SCREENP dest, x, y` (dest first). Prefer PEEK for consistency.

### Sprite System (0xD9–0xDA, 0xE5–0xE7, 0xEC)

| Hex | Name | Words | Args | Description |
|-----|------|-------|------|-------------|
| 0xD9 | SPRITE_LOAD | 4 | 3 | Load sprite from RAM |
| 0xDA | SPRITE_FRAME | 6 | 5 | Set sprite frame dimensions |
| 0xE5 | SPRLOAD | 6 | 4 | Load sprite data |
| 0xE6 | SPRFRAME | 3 | 1 | Set current sprite frame |
| 0xE7 | SPRANIM | 4 | 2 | Animate sprite sequence |
| 0xEC | SPRITEANIM | 4 | 2 | Sprite animation (alt) |

### Input (0x48, 0x85, 0xC7–0xCB)

| Hex | Name | Words | Args | Description |
|-----|------|-------|------|-------------|
| 0x48 | IKEY | 2 | 1 | Read keyboard port (returns ASCII or 0) |
| 0x85 | MOUSEQ | 2 | 1 | Query mouse state |
| 0xC7 | IMOUSE | 2 | 1 | Read mouse (mode parameter) |
| 0xC8 | MOUSEX | 2 | 1 | Mouse X coordinate → reg |
| 0xC9 | MOUSEY | 2 | 1 | Mouse Y coordinate → reg |
| 0xCA | MOUSEB | 2 | 1 | Mouse button state → reg |
| 0xCB | MOUSECLICK | 2 | 1 | Inject mouse click event |

### Bitfield / Bit Operations (0x8D–0x8F, 0x90, 0xC2–0xC3, 0xCF, 0xE0–0xE1, 0xF0–0xF1)

| Hex | Name | Words | Args | Description |
|-----|------|-------|------|-------------|
| 0x8D | BITSET | 3 | 2 | Set bit N in register |
| 0x8E | BITCLR | 3 | 2 | Clear bit N in register |
| 0x8F | BITTEST | 3 | 2 | Test bit N (result in reg) |
| 0x90 | NOT | 2 | 1 | Bitwise NOT: reg = !reg |
| 0xC2 | BFE | 5 | 4 | Bitfield extract: BFE dest, src, pos, width |
| 0xC3 | BFI | 5 | 4 | Bitfield insert: BFI dest, src, pos, width |
| 0xCF | BNOT | 2 | 1 | Bitwise NOT (alt encoding) |
| 0xE0 | CMOV | 4 | 3 | Conditional move (branchless) |
| 0xE1 | BSET | 3 | 2 | Bit set (alt) |
| 0xF0 | BCLR | 3 | 2 | Bit clear (alt) |
| 0xF1 | BTST | 3 | 2 | Bit test (alt) |

### Process Management (0x4D–0x4E, 0x5A–0x5C, 0x65, 0x6F–0x71, 0x7D, 0x9B, 0xA7, 0xBE–0xC0)

| Hex | Name | Words | Args | Description |
|-----|------|-------|------|-------------|
| 0x4D | SPAWN | 2 | 1 | Spawn process at address |
| 0x4E | KILL | 2 | 1 | Kill process by PID |
| 0x5A | YIELD | 1 | 0 | Yield scheduler slot |
| 0x5B | SLEEP | 2 | 1 | Sleep for N ticks |
| 0x5C | SETPRIORITY | 2 | 1 | Set process priority |
| 0x65 | GETPID | 1 | 0 | Get current process ID → r0 |
| 0x6F | EXIT | 2 | 1 | Exit with code |
| 0x70 | SIGNAL | 3 | 2 | Send signal to process |
| 0x71 | SIGSET | 3 | 2 | Set signal handler |
| 0x7D | FORK | 2 | 1 | Fork current process |
| 0x9B | PROCLS | 2 | 1 | Close/terminate process |
| 0xA7 | SPAWNC | 3 | 2 | Spawn COW child (shared page 3) |
| 0xBE | NPROC | 1 | 0 | Get process count → r0 |
| 0xBF | PROCINFO | 3 | 2 | Get process info by PID |
| 0xC0 | SETCAPS | 2 | 1 | Set process capabilities |

### IPC (0x5D–0x5F)

| Hex | Name | Words | Args | Description |
|-----|------|-------|------|-------------|
| 0x5D | PIPE | 3 | 2 | Create pipe (returns read/write fds) |
| 0x5E | MSGSND | 2 | 1 | Send message to message queue |
| 0x5F | MSGRCV | 1 | 0 | Receive message (blocking) |

### VFS / File I/O (0x54–0x59, 0x62, 0x67–0x69, 0x78–0x7A, 0xB7–0xBD)

| Hex | Name | Words | Args | Description |
|-----|------|-------|------|-------------|
| 0x54 | OPEN | 3 | 2 | Open file: OPEN path_reg, mode_reg |
| 0x55 | READ | 4 | 3 | Read: READ fd, buf_addr, count |
| 0x56 | WRITE | 4 | 3 | Write: WRITE fd, buf_addr, count |
| 0x57 | CLOSE | 2 | 1 | Close file descriptor |
| 0x58 | SEEK | 4 | 3 | Seek: SEEK fd, offset, whence |
| 0x59 | LS | 2 | 1 | List directory contents |
| 0x62 | IOCTL | 4 | 3 | Device I/O control |
| 0x67 | WRITESTR | 3 | 2 | Write null-terminated string to fd |
| 0x68 | READLN | 4 | 3 | Read line from fd |
| 0x69 | WAITPID | 2 | 1 | Wait for child process |
| 0x78 | FMKDIR | 2 | 1 | Create directory |
| 0x79 | FSTAT | 3 | 2 | Get file status info |
| 0x7A | FUNLINK | 2 | 1 | Delete file |
| 0xB7 | UNLINK | 2 | 1 | Unlink file (alt) |
| 0xB8 | FCOPY | 3 | 2 | Copy file |
| 0xB9 | FSOPEN | 3 | 2 | Open file (extended) |
| 0xBA | FSCLOSE | 2 | 1 | Close file (extended) |
| 0xBB | FSREAD | 4 | 3 | Read file (extended) |
| 0xBC | FSWRITE | 4 | 3 | Write file (extended) |
| 0xBD | FSLS | 4 | 3 | List directory (extended) |

### Program Execution (0x52–0x53, 0x66, 0x6A–0x6C, 0x63–0x64)

| Hex | Name | Words | Args | Description |
|-----|------|-------|------|-------------|
| 0x52 | SYSCALL | 2 | 1 | System call (number in reg) |
| 0x53 | RETK | 1 | 0 | Return from syscall |
| 0x63 | GETENV | 3 | 2 | Get environment variable |
| 0x64 | SETENV | 3 | 2 | Set environment variable |
| 0x66 | EXEC | 2 | 1 | Execute program |
| 0x6A | EXECP | 4 | 3 | Execute with argv/envp |
| 0x6B | CHDIR | 2 | 1 | Change working directory |
| 0x6C | GETCWD | 2 | 1 | Get current working directory |

### Self-Assembly / Reactive Canvas (0x73–0x77)

| Hex | Name | Words | Args | Description |
|-----|------|-------|------|-------------|
| 0x73 | ASMSELF | 1 | 0 | Assemble canvas text → bytecode at 0x1000 |
| 0x74 | RUNNEXT | 1 | 0 | Jump PC to 0x1000 |
| 0x75 | FORMULA | 5 | 2 | Register reactive formula on cell |
| 0x76 | FORMULACLEAR | 1 | 0 | Clear all formulas |
| 0x77 | FORMULAREM | 2 | 1 | Remove formula from specific cell |

### Hypervisor / VM Management (0x72, 0x9F–0xA5, 0xB4–0xB6)

| Hex | Name | Words | Args | Description |
|-----|------|-------|------|-------------|
| 0x72 | HYPERVISOR | 4 | 2 | Hypervisor command |
| 0x9F | VM_SPAWN | 3 | 2 | Spawn guest VM |
| 0xA0 | VM_KILL | 2 | 1 | Kill guest VM |
| 0xA1 | VM_STATUS | 2 | 1 | Query guest VM status |
| 0xA2 | VM_PAUSE | 2 | 1 | Pause guest VM |
| 0xA3 | VM_RESUME | 2 | 1 | Resume guest VM |
| 0xA4 | VM_SET_BUDGET | 3 | 2 | Set step budget for guest |
| 0xA5 | VM_LIST | 2 | 1 | List running guest VMs |
| 0xB4 | VM_LIVE_SPAWN | 3 | 2 | Spawn live VM tile |
| 0xB5 | VM_LIVE_STEP | 1 | 0 | Step all live VM tiles |
| 0xB6 | VM_LIVE_KILL | 1 | 0 | Kill all live VM tiles |

### AI / LLM (0x9C, 0xA6, 0xA8)

| Hex | Name | Words | Args | Description |
|-----|------|-------|------|-------------|
| 0x9C | LLM | 4 | 3 | LLM inference: prompt, response buffer, max len |
| 0xA6 | AI_INJECT | 2 | 1 | Inject input into AI agent |
| 0xA8 | HERMES | 4 | 3 | Hermes agent command |

### PTY / Terminal (0xA9–0xAD)

| Hex | Name | Words | Args | Description |
|-----|------|-------|------|-------------|
| 0xA9 | PTYOPEN | 3 | 2 | Open pseudo-terminal |
| 0xAA | PTYWRITE | 4 | 3 | Write to PTY |
| 0xAB | PTYREAD | 4 | 3 | Read from PTY |
| 0xAC | PTYCLOSE | 2 | 1 | Close PTY |
| 0xAD | PTYSIZE | 4 | 3 | Get PTY dimensions |

### Networking (0x7F–0x82, 0x99–0x9A, 0xCC)

| Hex | Name | Words | Args | Description |
|-----|------|-------|------|-------------|
| 0x7F | CONNECT | 4 | 3 | TCP connect |
| 0x80 | SOCKSEND | 5 | 4 | Socket send |
| 0x81 | SOCKRECV | 5 | 4 | Socket receive |
| 0x82 | DISCONNECT | 2 | 1 | Disconnect socket |
| 0x99 | NET_SEND | 4 | 3 | UDP send |
| 0x9A | NET_RECV | 3 | 2 | UDP receive |
| 0xCC | HTTPGET | 6 | 5 | HTTP GET request |

### Audio (0x03, 0xD4–0xD6)

| Hex | Name | Words | Args | Description |
|-----|------|-------|------|-------------|
| 0x03 | BEEP | 3 | 2 | Play sine-wave tone |
| 0xD4 | AUDIO_PLAY | 4 | 3 | Play audio sample |
| 0xD5 | AUDIO_STOP | 1 | 0 | Stop audio playback |
| 0xD6 | AUDIO_STATUS | 2 | 1 | Query audio status |

### Memory Operations (0x04, 0xB3, 0xD2–0xD3, 0xF6)

| Hex | Name | Words | Args | Description |
|-----|------|-------|------|-------------|
| 0x04 | MEMCPY | 4 | 3 | Copy memory region |
| 0xB3 | ASM_RAM | 2 | 1 | Assemble from RAM |
| 0xD2 | PATCH | 4 | 3 | Patch bytecode in RAM |
| 0xD3 | PATCHW | 3 | 2 | Patch single word in RAM |
| 0xF6 | MEMSET | 4 | 3 | Fill memory region with value |

### String Operations (0x14, 0x86, 0xED–0xEE, 0xFA)

| Hex | Name | Words | Args | Description |
|-----|------|-------|------|-------------|
| 0x14 | STRO | 4 | 1 | Write string literal to RAM |
| 0x86 | STRCMP | 3 | 2 | Compare two null-terminated strings |
| 0xED | STRLEN | 2 | 1 | String length → reg |
| 0xEE | STRCPY | 3 | 2 | Copy string |
| 0xFA | STRCAT | 3 | 2 | Concatenate strings |

### Neural Network (0x92–0x93, 0xDE)

| Hex | Name | Words | Args | Description |
|-----|------|-------|------|-------------|
| 0x92 | MATVEC | 6 | 5 | Matrix-vector multiply |
| 0x93 | RELU | 2 | 1 | ReLU activation |
| 0xDE | MATMUL | 7 | 6 | Matrix-matrix multiply |

### Hash Table (0xE2–0xE4)

| Hex | Name | Words | Args | Description |
|-----|------|-------|------|-------------|
| 0xE2 | HASHINIT | 3 | 2 | Initialize hash table |
| 0xE3 | HASHSET | 4 | 3 | Set key-value in hash table |
| 0xE4 | HASHGET | 4 | 3 | Get value from hash table |

### Timers / Alarms (0xE8–0xEB)

| Hex | Name | Words | Args | Description |
|-----|------|-------|------|-------------|
| 0xE8 | TMR_GET | 2 | 1 | Get timer value |
| 0xE9 | TMR_WAIT | 2 | 1 | Wait for timer |
| 0xEA | ALARM_SET | 4 | 3 | Set alarm |
| 0xEB | ALARM_CLR | 2 | 1 | Clear alarm |

### Debug / Trace / Profile (0x7B–0x7C, 0x83–0x84, 0xC1, 0xC6, 0xCD)

| Hex | Name | Words | Args | Description |
|-----|------|-------|------|-------------|
| 0x7B | SNAP_TRACE | 2 | 1 | Snapshot trace buffer |
| 0x7C | REPLAY | 2 | 1 | Replay trace |
| 0x7E | NOTE | 4 | 3 | Attach debug note |
| 0x83 | TRACE_READ | 2 | 1 | Read trace buffer |
| 0x84 | PIXEL_HISTORY | 2 | 1 | Pixel write history |
| 0xC1 | VSTAT | 2 | 1 | VM statistics |
| 0xC6 | PROFILE | 3 | 2 | Performance profiling |
| 0xCD | BREAKPOINT | 1 | 0 | Debug breakpoint |

### Image / Pixel (0xAE, 0xAF, 0xB1, 0xDF)

| Hex | Name | Words | Args | Description |
|-----|------|-------|------|-------------|
| 0xAE | BYTEPACK | 4 | 3 | Pack bytes into pixel |
| 0xAF | SAVEPNG | 2 | 1 | Save screen as PNG |
| 0xB1 | LOADPNG | 3 | 2 | Load PNG from path |
| 0xDF | CLIP_HISTORY | 3 | 2 | Clip history buffer |

### Conditional (0xE0, 0xEF)

| Hex | Name | Words | Args | Description |
|-----|------|-------|------|-------------|
| 0xE0 | CMOV | 4 | 3 | Conditional move (branchless) |
| 0xEF | CSEL | 5 | 4 | Conditional select (branchless) |

### Window System (0x94)

| Hex | Name | Words | Args | Description |
|-----|------|-------|------|-------------|
| 0x94 | WINSYS | 2 | 1 | Window system command |

## Key Patterns

### Animation Loop

```asm
loop:
  FILL r_black        ; clear screen
  ; ... draw scene ...
  FRAME               ; yield to renderer
  JMP loop
```

### Interactive Input

```asm
loop:
  FILL r_black
  IKEY r10            ; r10 = ASCII key or 0
  ; ... handle input ...
  FRAME
  JMP loop
```

### Throttle with TICKS

```asm
LDI r4, 0xFC0A
LOAD r8, r4           ; r8 = TICKS
LDI r9, 7
AND r8, r9            ; mask with divisor-1
JZ r8, do_move        ; only on every 8th frame
```

### PUSH/POP Around CALLs

```asm
; Always save r31 before inner CALLs in a called function
render:
  PUSH r31
  CALL compute_camera
  POP r31
  RET
```

### Sine Table (Plasma, Waves)

No sine opcode. Build a 256-entry lookup table at boot using parabolic approximation:
```
val = 255 − 127 × (i − 128)² / 16384
```

### Table Lookup Optimization

Replace cascading CMP/BLT chains with RAM tables. Initialize at boot, then single LOAD per lookup. Reduces per-lookup cost from ~30 instructions to ~3.

## Build & Test

```bash
cd ~/zion/projects/geometry_os/geometry_os
cargo build                    # Build binary + library
cargo test                     # Full test suite (~20 min in debug)
cargo test --lib               # Library tests only
cargo test --bin geo_mcp_server  # MCP server tests
cargo run                      # GUI mode (minifb window)
cargo run -- --cli             # Headless CLI mode
cargo run -- programs/hello.asm  # Load file at startup
```

## RISC-V Subsystem

A RISC-V (RV32IMAC) interpreter lives at `src/riscv/`. It boots Linux kernels via a hypervisor bridge. Key components:

- **CPU**: Full RV32IMAC with C extension (compressed instructions)
- **MMU**: SV32 page tables with COW fork support
- **Bus**: CLINT, PLIC, UART 16550, VirtIO block device
- **SBI**: Minimal v0.2 (console putchar)
- **Fuzzer**: `src/riscv_fuzzer.rs` — oracle-checked fuzzing of 17 C-ext ops

See `docs/RISCV_HYPERVISOR.md` for full design details.

## MCP Server

A separate binary (`geo_mcp_server`) bridges Hermes agent tools to the VM via a Unix socket. Allows external AI agents to load programs, read/write memory, and inspect screen state programmatically.

See `src/mcp_server.rs` and `references/mcp-server.md`.

## Known Constraints

- **No 3-argument ALU**: `ADD rd, rs` means `rd = rd + rs`. No `ADD rd, rs1, rs2`.
- **r0 reserved for CMP**: Never use as loop counter or accumulator.
- **LDI takes immediates only**: Use `MOV rd, rs` to copy registers, not `LDI rd, rs`.
- **LOAD/STORE take register addresses**: `LOAD r1, 0x7000` is invalid. Use `LDI r4, 0x7000; LOAD r1, r4`.
- **No character literals**: Use numeric ASCII values (65 for 'A'), not `'A'`.
- **IKEY reads one key per frame**: Rapid typing drops keys.
- **Bytecode limit**: 4096 words (0x1000–0x1FFF) — silently truncates on overflow.
- **GUI loads at 0x1000**: CLI and tests load at 0x000. Programs with backward jumps may break in GUI mode.
