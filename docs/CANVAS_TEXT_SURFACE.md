# Canvas Text Surface

The founding document for Geometry OS v2. Defines the core pipeline:
**type text on a pixel grid, assemble it, run it.**

---

## One Pipeline

```
keystroke -> ASCII byte -> canvas_buffer u32
                                |
                      +---------+---------+---------+
                      |                   |         |
                 rendering       preprocessor   assembly (F8)
                      |           (macro exp)       |
            parse_syntax_line()  VAR/SET/GET   assembler::assemble()
            font::GLYPHS[byte]   INC/DEC vars  -> bytecode at 0x1000
```

There is one mode: type text on the grid. Every character you type appears as a
colored pixel-font glyph in its own cell. Press F8 to assemble the grid text
into bytecode. Press F5 to run it.

---

## Memory Map

```
Address         Size     Purpose
──────────────────────────────────────────────────────────────
0x000-0x3FF     1024     Source text (legacy; TEXT mode uses separate buffer)
0x1000-0x1FFF   4096     Canvas bytecode output (F8 assembles here)
0x2000-0x7FFF   ~24K     General purpose RAM
0x8000-0x8FFF   4096     Canvas buffer mirror (RAM-mapped, 128x32 grid)
                         LOAD/STORE intercepted to vm.canvas_buffer
0x9000-0xF02F   ~25K     General purpose RAM
0xF00-0xF03     4        Window Bounds Protocol (shared RAM IPC)
0xC00-0xC2F     48       Debug Mailbox Protocol (debugger)
0xF010-0xF01F   16       System Clipboard (shared RAM convention)
0xFF7           1        Audio volume (0-100)
0xFFB           1        Key bitmask port (bits 0-5, read-only)
0xFFC           1        Network data port (UDP)
0xFFD           1        ASM result port (word count or 0xFFFFFFFF on error)
0xFFE           1        TICKS port (frame counter, incremented each FRAME)
0xFF00-0xFFFF   256      Hardware registers / stack (r30=SP grows down from 0xFF00)
──────────────────────────────────────────────────────────────
Total: 65536 (64K) u32 cells
```

**Note on canvas storage:** The canvas text editor uses a separate backing
buffer (`canvas_buffer` in main.rs) with 128 rows × 32 columns = 4096 cells.
This buffer is NOT in VM RAM. It's a `Vec<u32>` that allows programs larger
than 32 rows without overlapping the bytecode region at 0x1000.

Source text and assembled bytecode live in different memory regions.
Source stays visible on the grid after assembly.

---

## How F8 Assembles

1. Reads the canvas buffer (128 rows × 32 cols)
2. Extracts text: each cell's low byte is an ASCII character, nulls become newlines
3. Passes through the preprocessor (VAR/SET/GET/INC/DEC macro expansion)
4. Feeds expanded text to `assembler::assemble()`
5. Writes bytecode to VM RAM starting at 0x1000
6. Sets `canvas_assembled = true` for the next F5 run

The assembler is a two-pass system:
- **Pass 1**: Collect label positions, compute addresses
- **Pass 2**: Generate bytecode with resolved labels

Supported directives: `.org <addr>`, `.include <file>`, `.define <name> <val>`,
`.ascii "text"`, `.asciz "text"` (null-terminated), `.byte val1, val2, ...`

---

## How F5 Runs (After Canvas Assembly)

When `canvas_assembled == true`:
- F5 starts execution at `vm.pc = 0x1000`
- The VM fetches and executes bytecode from that address
- The canvas grid continues showing your source text

When `canvas_assembled == false`:
- F5 starts execution at `vm.pc = 0`

---

## The Abstraction Layer (preprocessor.rs)

The preprocessor sits between the canvas text and the assembler. It uses the
**same tokenizer** (`parse_syntax_line`) that the renderer uses to color
the grid. This means the font colors and the macro expansion share a single
source of truth.

### Supported Macros

| Macro | Syntax | Expansion | Temp Registers |
|-------|--------|-----------|----------------|
| VAR | `VAR name addr` | Defines variable (no output) | none |
| SET | `SET var, val` | `LDI r28, val` / `LDI r29, addr` / `STORE r29, r28` | r28, r29 |
| GET | `GET reg, var` | `LDI r29, addr` / `LOAD reg, r29` | r29 |
| INC | `INC var` | `LDI r29, addr` / `LOAD r28, r29` / `LDI r27, 1` / `ADD r28, r27` / `STORE r29, r28` | r27, r28, r29 |
| DEC | `DEC var` | `LDI r29, addr` / `LOAD r28, r29` / `LDI r27, 1` / `SUB r28, r27` / `STORE r29, r28` | r27, r28, r29 |

### Immediate Aliases

The preprocessor recognizes shorthand immediate forms that expand to LDI + opcode:

| Alias | Expands To | Example |
|-------|-----------|---------|
| ADDI rd, imm | `LDI rT, imm` / `ADD rd, rT` | `ADDI r1, 5` |
| SUBI rd, imm | `LDI rT, imm` / `SUB rd, rT` | `SUBI r1, 3` |
| MULI rd, imm | `LDI rT, imm` / `MUL rd, rT` | `MULI r1, 10` |
| ANDI, ORI, XORI | Same pattern | `ANDI r1, 0xFF` |
| SHLI, SHRI, SARI | Same pattern | `SHLI r1, 4` |
| CMPI rd, imm | `LDI rT, imm` / `CMP rd, rT` | `CMPI r5, 100` |
| COPY rd, rs | `MOV rd, rs` | `COPY r1, r2` |

Temp register `r29` is used for all immediate aliases. Avoid relying on
r29 persisting across these instructions.

### Register Safety

The preprocessor uses **r27, r28, r29** as temporary registers. Your program
should avoid relying on these registers persisting across macro/alias expansion.

---

## How Pixel Font Rendering Works

In TEXT mode, each non-empty cell with a printable ASCII value (0x20-0x7F) is
rendered using the pixel font method:

```
For cell at (row, col):
  1. val = canvas_buffer[row * 32 + col]
  2. ascii_byte = val & 0xFF
  3. fg = syntax_highlight_color(canvas_buffer, row, col)
  4. glyph = font::GLYPHS[ascii_byte]  (8x8 bitmap from font.rs)
  5. For each pixel (dx, dy) in the 16x16 cell:
       a. Map to glyph coordinates at 2x scale
       b. If glyph bit is ON:  pixel = fg
       c. If glyph bit is OFF: pixel = GRID_BG
       d. Cell border: GRID_LINE color
       e. Cursor/PC highlight: CYAN/MAGENTA border override
```

### Syntax Highlighting Colors

| Token Type | Color | Examples |
|-----------|-------|---------|
| Opcode | 0x00CCFF (cyan) | LDI, ADD, HALT, etc. |
| Register | 0x44FF88 (green) | r0-r31 |
| Number | 0xFFAA33 (orange) | 10, 0xFF, 0b1010 |
| Label | 0xFFDD44 (yellow) | loop:, JMP target |
| Comment | 0x555566 (gray) | ; this is a comment |
| Default | 0xAAAA88 (muted) | everything else |

The highlighter recognizes all opcodes from the shared list in
`preprocessor.rs`, registers (r0-r31), decimal/hex/binary numbers, label
definitions (word followed by ':'), label references, and inline comments.

**Important:** Comments with colons (e.g., `; step: use r0`) are parsed as
labels. Use dashes or parens instead (e.g., `; step -- use r0`).

---

## Step-by-Step: Writing and Running a Program

1. Launch Geometry OS (TEXT mode is the default)
2. Type your assembly program on the grid:
   ```
   LDI r1, 10
   LDI r2, 20
   ADD r1, r2
   HALT
   ```
   Press Enter after each line to advance to the next row.

3. Press F8 to assemble
   - Status bar shows: `[OK: N bytes at 0x1000]`
   - If there's a syntax error, the error message appears instead

4. Press F5 to run
   - VM starts executing from 0x1000
   - The grid still shows your source text
   - The VM screen (256x256 panel) shows program output

5. Press F5 again to pause
6. Modify the source and press F8 to reassemble

### Loading an Existing Program

- Press Ctrl+F8 to enter file input mode
- Type a path or press Tab to cycle through `programs/*.asm` files
- Press Enter to load it onto the grid
- Then F8 to assemble, F5 to run

---

## ISA Overview

Geometry OS has **228 opcodes** organized into categories. The full reference
is in **docs/ARCHITECTURE.md**. Here are the core categories:

| Category | Count | Examples |
|----------|-------|---------|
| Control flow | ~10 | HALT, NOP, FRAME, JMP, CALL, RET, JZ, JNZ, BLT, BGE |
| Data movement | ~10 | LDI, LOAD, STORE, MOV, PUSH, POP, STRO, TEXTI |
| Arithmetic | ~15 | ADD, SUB, MUL, DIV, MOD, NEG, SAR, ABS, MIN, MAX, CLAMP |
| Logic/Bitwise | ~15 | AND, OR, XOR, SHL, SHR, NOT, BFE, BFI, BITSET, BITCLR |
| Compare/Branch | ~5 | CMP, CMPI, CMOV, CSEL |
| Graphics | ~25 | PSET, PSETI, FILL, RECTF, LINE, CIRCLE, TEXT, SPRITE, TILEMAP |
| Screen ops | ~10 | SCROLL, PEEK, SCREENP, BLEND, ROTATE, SCALE, FLOOD |
| Filesystem | ~15 | OPEN, READ, WRITE, CLOSE, SEEK, LS, FMKDIR, FUNLINK |
| Process mgmt | ~15 | SPAWN, KILL, YIELD, SLEEP, GETPID, EXIT, SIGNAL |
| IPC | ~5 | PIPE, MSGSND, MSGRCV, WAITPID |
| Device I/O | ~10 | IOCTL, IKEY, RAND, MOUSEX, MOUSEY, MOUSEB |
| Self-modifying | ~5 | ASM, ASMSELF, RUNNEXT, FORMULA |
| Network | ~10 | CONNECT, SOCKSEND, SOCKRECV, NET_SEND |
| Window system | ~10 | WINSYS, WPIXEL, WREAD, SPRBLT, PROCLS |
| VM management | ~15 | VM_SPAWN, VM_KILL, VM_PAUSE, VM_RESUME |
| AI/Agent | ~5 | HERMES, LLM, AI_AGENT, AI_INJECT |
| Audio | ~5 | BEEP, NOTE, AUDIO_PLAY, AUDIO_STOP |
| String ops | ~10 | STRLEN, STRCMP, STRCPY, STRCAT, DRAWTEXT |
| Misc | ~15 | MEMCPY, MEMSET, HASHINIT, SAVEPNG, LOADPNG |

### Special Registers

- **r0**: CMP result register (set to 0xFFFFFFFF/0/1 for lt/eq/gt). Never use as a general register.
- **r30**: Stack Pointer (SP) -- set to 0xFF00 before using PUSH/POP. Grows downward.
- **r31**: Link Register (LR) -- CALL saves return address here, RET jumps to it.

### Key Patterns

**There is NO 3-argument form for ANY instruction.** `ADD rd, rs` means `rd = rd + rs`.
To add an immediate: `LDI rT, imm; ADD rd, rT` (or use the `ADDI` alias).

**LOAD/STORE take register addresses only:**
```
LDI r4, 0x4000    ; load address into register
LOAD r1, r4        ; read from RAM[0x4000]
STORE r4, r1       ; write to RAM[0x4000]
```

**Nested CALLs clobber r31** -- always PUSH/POP r31 around inner CALLs.

---

## Animation Pattern

Any program can animate by replacing HALT with a FRAME loop:

```asm
loop:
  FILL r_black       ; clear screen
  ; ... draw scene ...
  FRAME              ; yield to renderer, display this frame
  JMP loop
```

Use the TICKS port (RAM[0xFFE]) to throttle animations:
```asm
LDI r4, 0xFFE
LOAD r8, r4           ; r8 = TICKS
LDI r9, 7
AND r8, r9            ; r8 = TICKS & 7
JZ r8, do_move        ; only move every 8th frame
JMP skip
do_move:
  ; ... throttled logic ...
skip:
  FRAME
  JMP loop
```

---

## Multi-Process Quick Reference

```
SPAWN r0             ; create child at address in r0, returns PID in r0
KILL r0              ; terminate process by PID
GETPID               ; get own PID in r0
YIELD                ; voluntary context switch
SLEEP r0             ; sleep for r0 frames
EXIT r0              ; exit with status code
SIGNAL r0, r1        ; send signal r1 to PID r0
```

Use `.org <addr>` to place child code (must be page-aligned: 0x000, 0x400, 0x800).
Window Bounds Protocol at RAM[0xF00..0xF03] for spatial coordination.

---

## What AI Agents Need to Know

1. Use standard assembly mnemonics (LDI, ADD, HALT, etc.)
2. Preprocessor macros (VAR, SET, GET, INC, DEC) reduce boilerplate
3. The canvas has 32 columns per row, 128 logical rows (scrollable)
4. Enter newlines explicitly (press Enter / write 0x0A)
5. Source text is in a separate buffer, bytecode never overlaps
6. r0 is reserved for CMP -- never use as loop counter or accumulator
7. PUSH/POP r31 around nested CALLs
8. LABEL on same line as directive fails: put label on its own line
9. LDI takes immediates only, MOV for register copies (`LDI r4, r20` is WRONG)
10. Full ISA reference: `docs/ARCHITECTURE.md`

---

## Key Constants

```rust
const CANVAS_COLS: usize = 32;
const CANVAS_ROWS: usize = 32;        // visible rows
const CANVAS_MAX_ROWS: usize = 128;   // logical rows (scrollable)
const CANVAS_SCALE: usize = 16;       // pixels per cell
const CANVAS_BYTECODE_ADDR: usize = 0x1000;
```

---

## Design Rationale

Why "keystroke -> pixel" and not "keystroke -> framebuffer":

The framebuffer (buffer[1024x768]) is the final host-side pixel buffer that
minifb renders to the OS window. It's a rendering concern, not a semantic one.
The meaningful unit is the RAM cell -- it holds the character value that is
simultaneously the display color, the glyph shape, and (after assembly) the
program instruction.

Why TEXT mode is the default:

TEXT mode is self-documenting: `LDI r0, 10` on the grid reads as `LDI r0, 10`.
Anyone who can read assembly can read the grid.

Why source and bytecode are separate:

Keeping source text in a separate buffer and bytecode at 0x1000 means you
always see what you wrote. You can reassemble after editing without losing
your source.

---

## See Also

- **docs/ARCHITECTURE.md** -- Full opcode reference (228 opcodes), multi-process, VFS, hypervisor, and system architecture
- **docs/SIGNED_ARITHMETIC.md** -- Two's-complement arithmetic semantics (SAR, CMP, signed division)
