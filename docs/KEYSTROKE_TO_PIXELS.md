# Keystroke-to-Pixels: How Geometry OS Turns Typing Into Programs

This document explains the complete chain from pressing a key on the keyboard
to seeing a pixel on screen to executing an instruction in the VM. It is
written for AI agents who need to understand, modify, or extend the system
without prior context.

---

## The Core Identity

```
The ASCII byte value of the key you press IS the pixel value in RAM.
The pixel value in RAM IS the opcode the VM executes.
There is no compilation step for single instructions.
```

Press `A` -> byte 0x41 goes into RAM -> VM reads 0x41 -> executes ADD.
Press `I` then `0` then `!` -> bytes 0x49, 0x30, 0x21 go into RAM ->
VM executes `LDI r0, 33`.

Three keystrokes. Three pixels. One instruction. Programs are paintings first
and code second.

**You see it as you type.** The Live Decode panel below the canvas shows the
instruction being composed in real time. After typing `I`, you see:

```
000: LDI ???   need: reg val
```

After `I 0`:

```
000: LDI r0 ???   need: val
```

After `I 0 !`:

```
000: LDI r0 33   complete
```

Each cell in the instruction gets a colored marker at its bottom edge:
white = opcode, green = filled argument, red = pending argument. The panel
turns green when the instruction is complete. This makes canvas painting
feel like programming, not like guessing.

---

## Architecture Overview

```
┌─────────────────────────────────────────────────────────┐
│                    HOST (Rust / main.rs)                 │
│                                                         │
│  Keyboard ──► key_to_pixel() ──► vm.ram[offset]         │
│                                     │                   │
│                              ┌──────┴──────┐            │
│                              │  VM (vm.rs)  │            │
│                              │  fetch/decode│            │
│                              │  /execute    │            │
│                              └──────┬──────┘            │
│                                     │                   │
│              ┌──────────────────────┼──────────────┐    │
│              │                      │              │    │
│         vm.ram[0..1023]      vm.screen[0..65535]  regs │
│         (32x32 canvas)       (256x256 screen)     r0-31│
│              │                      │                   │
│         spreadsheet           VM screen panel          │
│         rendering             rendering                │
│              │                      │                   │
│              └──────────┬───────────┘                   │
│                         │                               │
│                    framebuffer                         │
│                    buffer[1024x768]                     │
│                         │                               │
│                    minifb window                        │
└─────────────────────────────────────────────────────────┘
```

### Memory Map

```
Address       Size     Purpose
──────────────────────────────────────────────────────
0x000-0x3FF  1024     Canvas / program bytecode (visible on 32x32 grid)
0x400-0x7FF  1024     Text input buffer (micro-asm reads source from here)
0x800-0xBFF  1024     VM-resident micro-assembler code (loaded at startup)
0xC00-0xBFF  1024     Label table (used by micro-assembler)
0xFFF         1        Keyboard port (host writes keycode, program reads/acks)
──────────────────────────────────────────────────────
Total: 4096 u32 cells
```

The 32x32 spreadsheet grid renders addresses 0x000-0x3FF only. High memory
(0x400+) is invisible on canvas but fully readable/writable by VM programs.

---

## Path 1: Canvas Painting (Pixel-by-Pixel Programming)

**When:** VM is stopped, not in editor/REPL/ASM mode.
**Where it lives:** main.rs painting block + hex compose logic.

```
Keypress
  │
  ├── Normal mode: key_to_ascii(key)
  │     'A' -> 0x41, '0' -> 0x30, '!' -> 0x21
  │     One keystroke = one cell. ASCII byte value goes directly to RAM.
  │
  └── Hex mode (Tab toggled): two-keystroke hex compose
        Type two hex digits -> one byte -> one cell.
        '4' then '1' -> 0x41 (ADD opcode)
        '0' then 'A' -> 0x0A (register r10)
        'F' then 'F' -> 0xFF (max immediate)
        First digit: cursor turns orange, shows pending nibble.
        Second digit: byte committed to RAM, cursor advances.
        Esc cancels a partial nibble.
  │
  ▼
vm.ram[cursor_row * 32 + cursor_col] = value as u32
  │
  ▼
cursor_col += 1 (wraps to next row at col 32)
  │
  ▼
Rendering: palette_color(value) -> HSV hue -> RGB cell color
           + font glyph overlay if printable ASCII
           + orange tint + pending digit if hex nibble is pending
```

### How to Write a Program by Typing

**Method A: Normal mode (printable bytes only)**

To type `LDI r0, 33` directly into RAM:

1. Ensure VM is stopped (F5 toggles)
2. Navigate to starting cell with arrow keys
3. Type `I` -> cell gets 0x49 (LDI opcode)
4. Type `0` -> cell gets 0x30 (register index for r0)
5. Type `!` -> cell gets 0x21 (decimal 33, the immediate value)
6. Continue typing next instruction...
7. Press F5 to run

This works because opcodes A-Z map to ASCII 0x41-0x5A and registers
r0-r9 map to ASCII '0'-'9'. But r10-r31 and values > 0x7E are not
typeable in normal mode.

**Method B: Hex mode (any byte 0x00-0xFF)**

Press Tab to enter hex mode. Each cell now takes two keystrokes:

1. Type `4` `1` -> writes 0x41 = ADD opcode
2. Type `0` `A` -> writes 0x0A = register r10
3. Type `F` `F` -> writes 0xFF = value 255

After the first digit, the cursor cell turns orange and shows the
pending hex digit. Press Esc to cancel without writing.

This covers the full instruction set: every register (r0-r31 = bytes
0x00-0x1F), every small immediate, and every opcode.

**Method C: Mixed mode**

Normal and hex modes can be freely mixed. Type opcodes and low registers
in normal mode (faster — one key per cell), then Tab into hex mode for
r10+ or non-printable values, then Tab back.

Example: `LDI r10, 200` (opcode 0x49, register 0x0A, value 0xC8):
- Normal: `I` `0`  (LDI, then... wait, r10 is 0x0A not 0x30)
- Actually: Tab, `0` `A` (r10), Tab, `I`, Tab, `C` `8`
- Or just: Tab, `4` `9`, `0` `A`, `C` `8` — four keystrokes, three cells

### Why This Works

The VM's opcode bytes ARE ASCII characters:

```
Opcode    Byte    ASCII
ADD       0x41    A
BRANCH    0x42    B
CALL      0x43    C
DIV       0x44    D
EXEC      0x45    E
RECTF     0x46    F
CIRCLEF   0x47    G
HALT      0x48    H
LDI       0x49    I
JMP       0x4A    J
...
```

Register arguments follow the same pattern: registers r0-r9 use bytes
0x30-0x39, which are the ASCII digits '0'-'9'. So `A 0 1` (three
keystrokes) is `ADD r0, r1`. The typing IS the bytecode.

ALL 32 registers are typeable in normal mode (no hex needed):

```
r0-r9:   '0'-'9'      (0x30-0x39)
r10-r15: ':' ';' '<' '=' '>' '?'  (0x3A-0x3F)
r16-r31: '@' 'A'-'O'  (0x40-0x4F)
```

The same byte value means different things depending on position:
pixel 0 = opcode, pixels 1+ = arguments. So `A : 1` = ADD r10, r1.
`A` as opcode means ADD, `A` as argument means r17.

Hex mode (Tab) is only needed for:
- Immediate values > 0x7E (above printable ASCII range)
- Raw values 0x00-0x1F (control characters, not on keyboard)
- Precise byte-level control when the mnemonic mapping isn't obvious

---

## Path 2: Inline ASM Mode

**When:** Press backtick (`) from canvas mode.
**Where it lives:** main.rs lines ~459-547.

```
Backtick key
  │
  ▼
asm_mode = true
asm_input = String::new()
  │
  ▼
Type assembly text (single line) into asm_input string
  │
  ▼
Enter key
  │
  ▼
assembler::assemble(&asm_input)
  │
  ├── Ok(pixels) -> write pixels to vm.ram starting at cursor position
  │                  advance cursor past written bytes
  └── Err -> show error in status bar, don't modify RAM
```

This lets you type one line of assembler mnemonics (e.g., `LDI r0, 42`)
and have it compiled into bytecode placed at the cursor. Supports full
.gasm syntax: labels, hex literals, character literals.

Ctrl+V pastes from clipboard. Multi-line paste assembles the whole block
and places it at cursor.

---

## Path 3: Editor Mode (F9)

**When:** Press F9 from canvas mode.
**Where it lives:** main.rs lines ~164-377.

```
F9 key
  │
  ▼
editor_mode = true
editor_lines: Vec<String> (text buffer, not pixel buffer)
  │
  ▼
Full text editing:
  - Arrow keys, Home/End for cursor movement
  - Shift+letter for lowercase (editor uses key_to_ascii_shifted)
  - Enter splits line, Backspace joins/deletes
  - Ctrl+V pastes from clipboard
  - Ctrl+L loads programs/boot.asm into editor
  │
  ▼
F5 or F8 key
  │
  ├── F5 (if micro-asm loaded): copies editor text to RAM[0x400],
  │   runs VM-resident micro-assembler at RAM[0x800],
  │   which reads source from 0x400, writes bytecode to 0x000.
  │   Clears RAM first. Then starts VM execution.
  │
  └── F8: calls Rust assembler::assemble(&text),
      writes resulting pixels to vm.ram[0..N].
      Clears RAM first. Does NOT start execution.
  │
  ▼
Escape -> close editor, return to canvas
```

The editor is a TEXT editor. It stores `Vec<String>`, not pixels. The
assembler converts text to pixels. This is the most ergonomic way to write
programs but it goes through a compilation step.

**Editor header bar shows:**
```
EDITOR  F8:asm+load  F5:VM-asm+run  Ctrl+V:paste  Ctrl+L:load  Esc:cancel
```

---

## Path 4: REPL Mode (F6)

**When:** Press F6 from canvas mode.
**Where it lives:** main.rs lines ~378-438, rendering at ~849-903.

```
F6 key
  │
  ▼
repl_mode = true
Clear vm.ram[0..0x800] (preserve micro-assembler)
vm.pc = 0, vm.halted = false
  │
  ▼
Type one instruction (e.g., "I 0 42" or "LDI r0, 42")
  │
  ▼
Enter key
  │
  ▼
assembler::assemble(&repl_input)
  │
  ├── Ok(pixels):
  │     1. Write pixels to vm.ram[repl_write_addr..]
  │     2. Set vm.pc = repl_write_addr
  │     3. vm.step() -- execute exactly ONE instruction
  │     4. repl_write_addr += instruction length
  │     5. Snapshot register state into repl_history
  │
  └── Err: record error message in repl_history
  │
  ▼
Type next instruction... (accumulates in RAM)
  │
  ▼
Escape (empty input) or F6 -> exit REPL mode
```

The REPL gives immediate feedback: type an instruction, see which registers
changed. It uses the Rust assembler (not the VM-resident one). Each entered
instruction executes in the context of all previous ones -- registers persist.

**REPL screen layout:**
```
┌──────────────────────────────────────┐
│  RAM (bytecode)  <- mini grid        │
│  showing cells with repl_write_addr  │
│  highlighted in orange               │
├──────────────────────────────────────┤
│  History (last 17 entries):          │
│  > I 0 42       <- previous input    │
│  > A 0 1 -> r0=43  <- shows changes │
│  > H                               │
├──────────────────────────────────────┤
│  > I 0 42_      <- current input     │
│  (prompt at bottom)                  │
└──────────────────────────────────────┘
```

---

## Path 5: Runtime Keyboard Input

**When:** VM is running (F5 toggled on).
**Where it lives:** main.rs lines ~588-625.

```
VM is running
  │
  ▼
Keypress
  │
  ▼
key_to_ascii(key) -> u8
  │
  ▼
vm.ram[0xFFF] = ch as u32    (write to keyboard port)
  │
  ▼
Also: font::render_char on vm.screen at (text_x, text_y)
  │     text cursor advances, scrolls at edge
  ▼
vm.run() executes up to 4096 cycles
  │
  ▼
Program polls RAM[0xFFF]:
  LOAD r4, r0          ; r0 points to 0xFFF
  BEQ r4, r15, @poll   ; if keycode == 0, keep polling
  ; ... process key ...
  STORE r0, r15         ; write 0 to acknowledge
```

The echo-s.asm demo program demonstrates this: it reads keycodes from
0xFFF and writes the corresponding character to consecutive canvas cells.

---

## Complete Key Binding Reference

### Global (any mode)

| Key        | Action                                    |
|------------|-------------------------------------------|
| Escape     | Exit current mode / quit if at top level  |

### Canvas Mode (default)

| Key        | Action                                    |
|------------|-------------------------------------------|
| A-Z, 0-9   | Write ASCII value to RAM at cursor        |
| symbols    | Write ASCII value to RAM at cursor        |
| Arrow keys | Move cursor on 32x32 grid                 |
| Tab        | Toggle hex mode (two-keystroke hex compose)|
| Esc        | Cancel pending hex nibble                 |
| Backtick   | Enter inline ASM mode                     |
| F2         | Toggle panel view (disassembly/spreadsheet)|
| F5         | Toggle VM execution on/off                |
| F6         | Enter REPL mode                           |
| F7         | Save RAM to programs/save.rts             |
| F8         | Assemble programs/boot.asm, load to RAM   |
| F9         | Open editor                               |
| Space      | Single-step (when paused, not halted)     |

**Hex mode (Tab):** 0-9 and A-F become hex digits. Two keystrokes compose
one byte (0x00-0xFF). Pending nibble shown as orange cursor. Esc cancels.

### Editor Mode (F9)

| Key        | Action                                    |
|------------|-------------------------------------------|
| Letters    | Insert character (shift for uppercase)    |
| Enter      | Split line at cursor                      |
| Backspace  | Delete char / join with previous line     |
| Arrow keys | Move cursor in text                       |
| Home/End   | Jump to start/end of line                 |
| Ctrl+V     | Paste from clipboard                      |
| Ctrl+L     | Load programs/boot.asm into editor        |
| F5         | Assemble via VM micro-asm + run           |
| F8         | Assemble via Rust assembler + load        |
| Escape     | Close editor                              |

### REPL Mode (F6)

| Key        | Action                                    |
|------------|-------------------------------------------|
| Letters    | Type assembly instruction                 |
| Enter      | Assemble + execute one instruction        |
| Backspace  | Delete last char from input               |
| ? r5       | Inspect register value                    |
| ? 0x1A     | Inspect RAM at address                    |
| ??         | Hex dump near write address               |
| @name      | Bookmark current write address            |
| ! N        | Run N cycles (default 256)                |
| Ctrl+R     | Zero all registers                        |
| Ctrl+N     | New session (wipe RAM + registers)        |
| F6         | Exit REPL mode                            |
| Escape     | Clear input / exit if already empty       |

### Inline ASM Mode (backtick)

| Key        | Action                                    |
|------------|-------------------------------------------|
| Letters    | Type assembly text                        |
| Enter      | Assemble + place at cursor                |
| Backspace  | Delete last char                          |
| Ctrl+V     | Paste from clipboard                      |
| Escape     | Cancel                                    |

---

## Rendering Pipeline

### Live Decode Panel (below canvas)

```
When VM is idle and cursor is within a partially-composed instruction:
  1. live_decode_at(ram, cursor_addr) scans forward from 0 to find
     the instruction boundary containing the cursor
  2. Decodes the opcode and as many arguments as have been written
  3. Renders at CANVAS_Y + CANVAS_ROWS * CANVAS_SCALE + 4:
     - Address label: "000:" in gray
     - Decoded text: "LDI r0 33" in green (complete) or orange (partial)
     - Hint: "complete" in green or "need: reg val" in gold
  4. Colored markers on canvas cells:
     white bar = opcode cell
     green bar = filled argument cell
     red bar = pending (unwritten) argument cell
```

### Spreadsheet Grid (RAM view)

```
For each cell (row, col) in 0..32 x 0..32:
  1. Read vm.ram[row * 32 + col]
  2. If value != 0:
     a. palette_color(value) -> HSV color
        - Maps ASCII value 0x21-0x7E to hue 0-360 degrees
        - Saturation 0.8, Value 1.0
        - So each opcode has a distinct color
     b. If printable ASCII (< 128): render 5x7 font glyph on top
  3. If value == 0: dark background (0x0A0A14)
  4. Draw cell as CANVAS_SCALE x CANVAS_SCALE pixels (16x16)
  5. Grid lines between cells (1px, color 0x141420)
  6. Highlight current cursor cell (cyan border 0x00FFFF)
  7. Highlight PC cell (magenta border 0xFF00FF)
```

### VM Screen (program output)

```
For each pixel (x, y) in 0..256 x 0..256:
  1. Read vm.screen[y * 256 + x]
  2. Write directly to framebuffer at (VM_SCREEN_X + x, VM_SCREEN_Y + y)
  3. 1:1 pixel mapping, no scaling
```

### Register Display

```
For each register r0-r31:
  1. Read vm.regs[i]
  2. Render as hex: "r00=00000000" ... "r31=FFFFFFFF"
  3. Position in right panel below VM screen
```

---

## The Key-to-Value Functions

### key_to_ascii(key) -> Option<u8>
Returns the ASCII byte for a keypress. Used for:
- Canvas painting (normal mode)
- Runtime keyboard input
- ASM mode text entry

All letters return UPPERCASE ASCII. Shift is not checked.

### key_to_ascii_shifted(key, shift) -> Option<u8>
Returns ASCII with shift awareness. Used for:
- Editor mode text entry
- REPL mode text entry

Letters: shift=uppercase, no shift=lowercase.
Numbers: shift=symbol (!@#$%^&*()), no shift=digit.
Symbols: shift=alternate (:>"?+{}|_~), no shift=default.

### key_to_pixel(key, hex_mode) -> Option<u8>
Used for canvas painting. In hex mode, number keys produce raw values
(0x00-0x09) instead of ASCII digits (0x30-0x39). This lets you write
small immediate values directly. Letters and symbols always use ASCII.

---

## How Programs Get Into RAM: Four Methods

### Method 1: Direct Pixel Painting
Type on canvas. Each keystroke writes one u32 cell.
In normal mode: one key = one ASCII byte (opcodes A-Z, registers r0-r9).
In hex mode (Tab): two hex digits = any byte 0x00-0xFF.
Covers the full instruction set. No assembler, no labels, no comments.
For jump addresses > 0xFF, use the assembler or compose multi-byte values.

### Method 2: Inline ASM (backtick)
Type a line of assembler syntax, press Enter, bytecode appears at cursor.
Supports full .gasm syntax. Good for one-liners.

### Method 3: Editor (F9) -> Assemble (F5/F8)
Write a full program in the text editor, then assemble. Supports all
features. F5 uses the VM-resident micro-assembler (single-char syntax).
F8 uses the Rust assembler (full mnemonic syntax).

### Method 4: Programmatic (Python/Rust/Agent)
Use the GasmAgent API or write .rts files directly with Python.
See AI_GUIDE.md for the agent API.

---

## The Self-Hosting Assembler (micro-asm.asm)

At startup, `programs/micro-asm.asm` is assembled by the Rust assembler
and loaded into RAM[0x800..]. This is a VM program that:

1. Reads ASCII text from RAM[0x400] (the text input buffer)
2. Emits bytecode to RAM[0x000] (the program area)
3. Supports labels (#name/@name), hex escapes ($XX, $XXXXXXXX)
4. Two-pass: pass 1 collects labels, pass 2 emits with resolved addresses

When you press F5 in the editor, the host:
1. Copies editor text to RAM[0x400]
2. Sets VM PC to 0x800
3. Runs the VM (which executes the micro-assembler)
4. The micro-assembler writes bytecode to 0x000

This is the self-hosting loop: the VM assembles its own programs using
a program that runs on the VM.

### Single-Char Syntax (micro-asm input format)

```
I 0 42       LDI r0, 42       (opcode, register, value)
S 1 0        STORE r1, r0     (opcode, addr_reg, src_reg)
A 0 1        ADD r0, r1       (opcode, dst_reg, src_reg)
B $00 @loop  BRANCH always to label 'loop'
H            HALT
#loop        Define label at current position
@loop        Reference to label (resolved by assembler)
$FF          Hex byte 0xFF
$02010000    Full 32-bit hex value
; comment    Rest of line ignored
```

Whitespace and commas are ignored. Every printable character except
;, $, #, @ is written verbatim as a pixel.

---

## The Keyboard Port (RAM[0xFFF])

VM programs read keyboard input by polling address 4095 (0xFFF).

**Write protocol (host -> VM):**
```
On each keypress while VM is running:
  vm.ram[0xFFF] = ascii_keycode as u32
```

**Read protocol (VM program):**
```
; r0 = 0xFFF (keyboard port address)
; r4 = keycode (read from port)
; r15 = 0 (constant for comparison and ACK)

#poll
L 4 0           ; LOAD r4, [r0] — read keycode
B $31340000 @poll  ; BEQ r4, r15 -> poll (if zero, no key)
; ... process key in r4 ...
S 0 1           ; STORE [r0], r15 — write 0 to ACK
B $0F @poll     ; BAL -> poll again
```

The host also renders the typed character on vm.screen (the 256x256
output buffer) so you can see what you're typing in real time.

---

## File Formats

### .rts (Raw Tile Set)
Binary format: sequence of little-endian u32 values.
Each u32 is one RAM cell. Loaded directly into vm.ram starting at 0.

```python
# Write a .rts file from Python
import struct
pixels = [0x49, 0x30, 0x2A, 0x48]  # LDI r0, 42; HALT
with open("program.rts", "wb") as f:
    for p in pixels:
        f.write(struct.pack("<I", p))
```

### .asm (Assembly Source)
Text format. Two syntaxes:

**Full mnemonic syntax** (Rust assembler, F8):
```
LDI r0, 42
ADD r0, r1
HALT
```

**Single-char syntax** (VM micro-assembler, F5):
```
I 0 $2A
A 0 1
H
```

---

## Quick Start: Writing Your First Program

### Method A: Paint it directly (normal mode)
```
1. cargo run --release
2. Type: I 0 ! S 0 0 H
   (that's LDI r0, 33 / STORE [r0], r0 / HALT)
3. Press F5 to run
4. Watch the canvas — cell 33 should get value 33
```

### Method A2: Paint it in hex mode (any byte)
```
1. cargo run --release
2. Press Tab (enter hex mode)
3. Type: 4 9  → 0x49 = LDI opcode
4. Type: 0 0  → 0x00 = r0
5. Type: 2 1  → 0x21 = value 33
6. Type: 5 3  → 0x53 = STORE opcode
7. Type: 0 0  → 0x00 = r0 (address register)
8. Type: 0 0  → 0x00 = r0 (source register)
9. Type: 4 8  → 0x48 = HALT
10. Press Tab (exit hex mode)
11. Press F5 to run
```

### Method B: Use the editor
```
1. cargo run --release
2. Press F9 (open editor)
3. Type:
   LDI r0, 42
   LDI r1, 8
   ADD r0, r1
   HALT
4. Press F8 (assemble + load)
5. Press Escape (close editor)
6. Press F5 (run)
7. Look at register display — r0 should show 50
```

### Method C: Use the REPL
```
1. cargo run --release
2. Press F6 (enter REPL)
3. Type: LDI r0, 10    -> Enter
   (see: r0=A showing register changed)
4. Type: LDI r1, 20    -> Enter
   (see: r1=14)
5. Type: ADD r0, r1    -> Enter
   (see: r0=2E which is 46 = 10+20+6... check your math!)
6. Type: ? r0          -> Enter
   (inspect: r0 = 0000002E)
7. Type: ??            -> Enter
   (hex dump of RAM near write address)
```

### Method D: Programmatic
```python
from hermes_tools import terminal

# Use the test framework
terminal("cd ~/zion/projects/geometry_os/geometry_os && cargo test vm_echo -- --nocapture")
```
