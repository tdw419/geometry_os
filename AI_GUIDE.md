# Geometry OS -- AI Agent Guide

## What This Is

Geometry OS is a pixel-based virtual machine where programs are sequences of colored pixels. The ASCII byte value of each keystroke IS the opcode. You type "I042" and that's the instruction `LDI r0, 42` -- four keystrokes, four pixels, one instruction. Programs are paintings first and code second.

The system has a 256x256 pixel screen, 32 registers, a 256-entry stack, a forge (issue queue for VM-to-host communication), child VM spawning, self-authoring opcodes (programs that rewrite themselves), and a 5x7 bitmap font covering all printable ASCII.

## Quick Reference

```
Project:    ~/zion/projects/geometry_os/geometry_os
Build:      cargo build --release
Run GUI:    cargo run --release
Test:       cargo test            (214 pass; 3 known failures in gasm_boundary_tests)
Language:   Rust (edition 2024)
GUI:        minifb (X11/Wayland)
```

Test breakdown:
- 156 unit tests in src/lib.rs (vm, opcodes, assembler, forge, editor, agent, shell, font, pixel, color_map, window_manager)
- 5 unit tests in src/main.rs
- 19 boundary tests in tests/gasm_boundary_tests.rs (3 known failures)
- 6 integration tests in tests/gasm_call_ret_test.rs
- 6 integration tests in tests/text_opcode_rendering.rs
- 8 integration tests in tests/integration.rs
- 5 tests in tests/command_parser.rs

## Architecture

```
src/lib.rs             11 lines   Module declarations
src/main.rs           395 lines   GUI host (minifb window, keyboard, rendering)
src/vm.rs            1994 lines   VM core: fetch/decode/execute, graphics, editor ops
src/opcodes.rs        171 lines   Opcode constants, widths, names, validation
src/assembler.rs      480 lines   Two-pass .gasm assembler
src/agent.rs         1520 lines   GasmAgent: programmatic assemble+run for AI use
src/window_manager.rs 601 lines   Click-to-focus window manager with drag
src/editor.rs         334 lines   EditorBuffer: self-authoring pixel editing
src/shell.rs          422 lines   GEOS shell command parser (CLS, PRINT, RUN, HELP, VER)
src/font.rs           301 lines   5x7 bitmap font, 95 printable ASCII glyphs
src/forge.rs          147 lines   ForgeQueue: issue queue for VM-to-host messages
src/pixel.rs          216 lines   Pixel RGBA type + blend modes (Over, Add, Multiply, Screen)
src/color_map.rs      188 lines   ASCII-to-pixel color mapping and palette system
src/framebuffer.rs    188 lines   Generic framebuffer abstraction (Color struct)
src/error.rs           13 lines   Error type placeholder (VmError lives in vm.rs)
programs/                        .rts binaries, .gasm sources, .py assembly scripts
docs/                             Design specs and opcode documentation
tests/                            Integration tests (gasm_call_ret_test.rs, integration.rs)
```

## How to Run the GUI

```bash
cd ~/zion/projects/geometry_os/geometry_os
cargo run --release
```

A 1024x768 window opens with three panels:
- **Left**: 32x32 pixel RAM grid (your program memory, colored cells)
- **Top-right**: 256x256 VM screen (typed characters + VM graphics output)
- **Bottom-right**: Register display + opcode reference

### Controls

| Key | Action |
|-----|--------|
| A-Z, 0-9, symbols | Write ASCII value to RAM at cursor, render font glyph on VM screen |
| Arrow keys | Move cursor in the 32x32 pixel grid |
| Backspace | Delete character, move cursor back |
| F5 | Toggle VM execution on/off |
| F6 | Load programs/boot.rts into RAM |
| F7 | Save RAM to programs/save.rts |
| Escape | Quit |

Typing always works regardless of VM state. Every keystroke writes to RAM (pixel grid) AND renders a 2x scaled font glyph (10x14 px) on the VM screen. The VM runs when F5 is toggled on.

## The VM

### Memory Model

- **RAM**: 1024 x u32 pixels (32x32 grid). Address 0-1023. Last address (1023) is the keyboard port.
- **Screen**: 256x256 x u32 pixels. Separate framebuffer. Color format: 0x00RRGGBB.
- **Registers**: 32 x u32 (r0-r31). All arithmetic is wrapping u32 unless noted.
- **Stack**: 256 entries of u32 (addresses for CALL/RET).
- **Forge**: ForgeQueue holding Issue structs created by ISSUE_CREATE opcode.
- **Children**: Vec of ChildVm spawn requests, drained each frame by the host.
- **Keyboard Port**: RAM[1023]. Host writes ASCII here on keystroke. VM polls and ACKs by writing 0.

### Instruction Format

Each instruction is a horizontal run of N pixels starting at PC:

```
[opcode pixel] [arg1 pixel] [arg2 pixel] ... [argN pixel]
```

The opcode pixel's value determines the operation. Argument pixels' values are the actual arguments (register indices, immediate values, addresses). PC advances by the instruction's width after execution.

Example: `ADD r0, r1`
```
ram[pc+0] = 0x41 ('A')  -> opcode ADD (width 3)
ram[pc+1] = 0x30 ('0')  -> arg dst = r0
ram[pc+2] = 0x31 ('1')  -> arg src = r1
pc += 3
```

### Execution

`vm.run()` executes up to MAX_CYCLES (4096) instructions, stopping on HALT, YIELD, or unknown opcode. Returns the number of cycles executed. The host calls this once per frame when F5 is toggled on.

`vm.run_checked()` does the same but returns `Result<u32, VmError>` with detailed error context.

### Complete Opcode Table

**Primary operations (uppercase ASCII):**

| Op  | Byte | Key | Width | Format | Description |
|-----|------|-----|-------|--------|-------------|
| ADD | 0x41 | A | 3 | dst, src | Add (wrapping u32) |
| BRANCH | 0x42 | B | 3 | cond, addr | Conditional branch |
| CALL | 0x43 | C | 2 | addr | Push return addr, jump |
| DIV | 0x44 | D | 3 | dst, src | Divide (checked -- HALT on div-by-zero) |
| EXEC | 0x45 | E | 3 | addr, arg | Jump to address in register |
| RECTF | 0x46 | F | 5 | x, y, w, h | Filled rectangle (color from r0) |
| CIRCLEF | 0x47 | G | 4 | cx, cy, r | Filled circle (color from r0) |
| HALT | 0x48 | H | 1 | | Stop execution |
| LDI | 0x49 | I | 3 | dst, imm | Load immediate into register |
| JMP | 0x4A | J | 2 | addr | Unconditional jump |
| SHL | 0x4B | K | 3 | dst, amt | Shift left |
| LOAD | 0x4C | L | 3 | dst, addr | Load from RAM[reg[addr]] |
| MOV | 0x4D | M | 3 | dst, src | Copy register |
| NOP | 0x4E | N | 1 | | No operation |
| OR | 0x4F | O | 3 | dst, src | Bitwise OR |
| PSET | 0x50 | P | 4 | x, y, color | Set single pixel on screen |
| SPAWN | 0x51 | Q | 3 | addr, arg | Create child VM |
| RET | 0x52 | R | 1 | | Pop address, jump back |
| STORE | 0x53 | S | 3 | addr, src | Store to RAM[reg[addr]] |
| TEXT | 0x54 | T | 4 | x, y, str_addr | Render null-terminated string from RAM |
| SUB | 0x55 | U | 3 | dst, src | Subtract (wrapping u32) |
| LINE | 0x56 | V | 5 | x1, y1, x2, y2 | Bresenham line (color from r0) |
| BLIT | 0x57 | W | 4 | dst, src, count | Copy pixel range in RAM |
| XOR | 0x58 | X | 3 | dst, src | Bitwise XOR |
| YIELD | 0x59 | Y | 1 | | Pause, return control to host |
| SPATIAL_SPAWN | 0x5A | Z | 4 | x, y, addr | Create child VM at screen position |

**Secondary operations (lowercase ASCII):**

| Op  | Byte | Key | Width | Format | Description |
|-----|------|-----|-------|--------|-------------|
| AND | 0x61 | a | 3 | dst, src | Bitwise AND |
| MOD | 0x62 | b | 3 | dst, src | Modulo |
| ISSUE_CREATE | 0x63 | c | 1 | | Create forge issue from r0(tag), r1(payload), r2(priority) |
| LDB | 0x64 | d | 3 | dst, addr | Load byte from pixel |
| EDIT_OVERWRITE | 0x65 | e | 3 | addr_reg, src_reg | Write pixel at RAM[reg[addr_reg]] |
| EDIT_INSERT | 0x66 | f | 3 | addr_reg, src_reg | Insert pixel, shift RAM right |
| PGET | 0x67 | g | 3 | x, y | Read screen pixel into r0 |
| INT | 0x69 | i | 2 | vector | Interrupt (stub) |
| EDIT_DELETE | 0x6A | j | 2 | addr_reg | Remove pixel, shift RAM left |
| SHR | 0x6B | k | 3 | dst, amt | Shift right |
| EDIT_BLIT | 0x6C | l | 4 | dst_reg, src_reg, count_reg | Copy pixel range |
| MUL | 0x6D | m | 3 | dst, src | Multiply (wrapping u32) |
| NOT | 0x6E | n | 2 | dst | Bitwise NOT |
| PUSH | 0x70 | p | 2 | val | Push register onto stack |
| POP | 0x72 | r | 2 | dst | Pop from stack into register |
| STB | 0x73 | s | 3 | addr, src | Store byte into pixel |

### BRANCH Condition Encoding

The condition pixel packs three fields into one u32:

```
bits 0-3:   condition code
              0 = BEQ  (equal)
              1 = BNE  (not equal)
              2 = BLT  (less than, signed)
              3 = BGE  (greater or equal, signed)
              4 = BLTU (less than, unsigned)
              5 = BGEU (greater or equal, unsigned)
bits 8-15:  register r1 index
bits 16-23: register r2 index
```

Example: `BRANCH (1 | (1<<8) | (4<<16)), target` = branch if r1 != r4

In gasm: `BRANCH NE, r1, r4, target`

### Byte-Level Access (LDB / STB)

Each RAM pixel is a u32 (4 bytes). LDB/STB address individual bytes:

```
Address format: (pixel_index << 2) | byte_offset
byte_offset: 0-3 (which byte within the u32 pixel)
LDB: reads that byte into a register
STB: writes a byte from a register into the pixel
```

### Graphics Operations

All graphics opcodes write to the 256x256 screen buffer. Color format is 0x00RRGGBB (the top byte is ignored).

- **PSET x, y, color**: Sets screen[x + y*256] = color. Arguments are register values.
- **RECTF x, y, w, h**: Fills a rectangle. Color comes from r0.
- **CIRCLEF cx, cy, r**: Fills a circle. Color from r0.
- **LINE x1, y1, x2, y2**: Bresenham line. Color from r0.
- **TEXT x, y, str_addr**: Renders a null-terminated string from RAM starting at str_addr. Uses the 5x7 font at 1x scale, transparent background, white foreground.
- **PGET x, y**: Reads screen pixel into r0.

All coordinates are clamped to screen bounds. No crashes on out-of-bounds.

### Self-Authoring

Programs can write new instructions into their own RAM using editor opcodes:

- **EDIT_OVERWRITE addr, src**: Writes reg[src] to RAM[reg[addr]]. In-place modification.
- **EDIT_INSERT addr, src**: Inserts reg[src] at RAM[reg[addr]], shifting everything right.
- **EDIT_DELETE addr**: Removes the pixel at reg[addr], shifting everything left.
- **EDIT_BLIT dst, src, count**: Copies count pixels from reg[src].. to reg[dst].. in RAM.

Then JMP to the newly written code. This is the core bootstrap loop.

Example: Write HALT at address 50, then jump there:
```
LDI r0, 50           ; target address
LDI r1, 0x48         ; HALT opcode byte
EDIT_OVERWRITE r0, r1 ; ram[50] = 0x48
JMP 50               ; execute self-authored code
```

### Child VMs (Spawn)

- **SPAWN addr, arg**: Creates a ChildVm request with start_addr=reg[addr], arg=reg[arg]. The host drains these after each run() call and creates real child VMs.
- **SPATIAL_SPAWN x, y, addr**: Same but with screen position (x, y) for compositing.

Child VMs get a clone of parent RAM, their own registers/stack/screen, PC set to start_addr, and r0 set to arg. The host runs child VMs each frame and composites their screens onto the parent.

### Forge Issue Queue

Programs communicate with the host via ISSUE_CREATE:

```
LDI r0, <tag>        ; tag: identifies the issue type
LDI r1, <payload>    ; payload: data
LDI r2, <priority>   ; priority: 0=Low, 1=Medium, 2=High, 3=Critical
ISSUE_CREATE          ; pushes to forge queue, r0 = assigned issue ID
```

Host drains with `vm.forge.drain()` each frame. Issues have: id, origin_pc, tag, payload, priority.

Currently forge issues print to stdout. This is the VM-to-host communication channel.

## The Assembler (GASM)

Two-pass assembler: pass 1 collects labels and computes addresses, pass 2 emits pixel values resolving label references.

### Syntax

```gasm
; This is a comment
LABEL:
.ORG 0x10             ; set origin address
LDI r0, 42            ; load immediate
ADD r0, r1            ; register-register
JMP loop              ; jump to label
HALT
```

### Argument Formats

| Format | Example | Description |
|--------|---------|-------------|
| Register | `r0` through `r31` | Emits the index (0-31) |
| Decimal | `42` | Literal number |
| Hex | `0x2A` | Hex literal |
| ASCII char | `'*'` | Emits the ASCII byte value |
| Label | `loop` | Resolves to pixel address |

### Mnemonic Aliases

| Alias | Expands to |
|-------|------------|
| `STORE` or `ST` | `STORE` (opcode 0x53) |
| `SPAWNAT` | `SPATIAL_SPAWN` |
| `ISSUE` | `ISSUE_CREATE` |
| `EDITOVW` | `EDIT_OVERWRITE` |
| `EDITINS` | `EDIT_INSERT` |
| `EDITDEL` | `EDIT_DELETE` |
| `EDITBLT` | `EDIT_BLIT` |

### Assembler API

```rust
use geometry_os::assembler;

// Assemble source text into pixels
let result: Result<Assembled, AsmError> = assembler::assemble(source);
// Assembled { pixels: Vec<u32>, end_addr: usize, labels: HashMap<String, usize> }

// Error structure
// AsmError { line: usize, message: String }
```

### Assembly via Python (manual pixel packing)

The programs/forge_*.py scripts assemble programs by hand:

```python
import struct

OP_LDI  = 0x49  # 'I'
OP_ADD  = 0x41  # 'A'
OP_HALT = 0x48  # 'H'

pixels = []
pixels += [OP_LDI, 0, 42]   # LDI r0, 42
pixels += [OP_ADD, 0, 1]    # ADD r0, r1
pixels += [OP_HALT]         # HALT

with open("programs/out.rts", "wb") as f:
    for p in pixels:
        f.write(struct.pack("<I", p))   # little-endian u32
```

Load with F6 (looks for programs/boot.rts).

## The Font

5x7 bitmap font covering all printable ASCII (0x20-0x7E). Stored as `GLYPHS: [[u8; 7]; 128]` -- 7 rows per glyph, 5 bits per row (bit 4 = leftmost pixel).

```rust
// Constants
font::GLYPH_W  // 5
font::GLYPH_H  // 7

// Render a single character
font::render_char(screen, width, height, ch, x, y, scale, fg_color, bg_option)

// Render a string
font::render_str(screen, width, height, "text", x, y, scale, fg_color, bg_option)
```

- `screen`: `&mut [u32]` framebuffer (0x00RRGGBB format)
- `scale`: pixels per glyph pixel (1=native 5x7, 2=10x14, etc.)
- `bg`: `Some(color)` for opaque background per cell, `None` for transparent

The VM's TEXT opcode uses 1x scale, transparent background. The GUI host types at 2x scale with opaque dark blue background.

## The Agent (GasmAgent)

The primary API for AI agents to interact with the VM programmatically.

```rust
use geometry_os::agent::{GasmAgent, Agent, AgentResult, AgentError};

let mut agent = GasmAgent::default();  // 4096 pixel RAM

// Run raw pixel bytecode
let result: AgentResult = agent.execute(&[
    op::LDI as u32, 0, 42,
    op::HALT as u32,
]);
assert!(result.is_success());   // halted cleanly
assert_eq!(result.reg(0), 42);  // check register

// Assemble and run .gasm source
let result: Result<AgentResult, AgentError> = agent.run_gasm("
    LDI r0, 10
    LDI r1, 20
    ADD r0, r1
    HALT
");
assert_eq!(result.unwrap().reg(0), 30);

// Assemble without running
let asm: Result<Assembled, AgentError> = agent.assemble_only("LDI r0, 5\nHALT");

// Run multiple programs
let results: Result<Vec<AgentResult>, AgentError> = agent.run_batch(&[
    "LDI r0, 1\nHALT",
    "LDI r0, 2\nHALT",
]);

// Reset state
agent.reset();
```

### AgentResult Fields

```rust
pub struct AgentResult {
    pub issues: Vec<Issue>,                          // forge issues created
    pub regs: [u32; 32],                             // final register state
    pub cycles: u32,                                  // cycles executed
    pub halted: bool,                                 // clean halt
    pub yielded: bool,                                // yielded to host
    pub children_spawned: usize,                      // child VMs created
    pub labels: HashMap<String, usize>,               // assembly labels
}

impl AgentResult {
    pub fn is_success(&self) -> bool;   // true if halted
    pub fn reg(&self, idx: usize) -> u32;  // get register, returns 0 for out of range
}
```

### AgentError Variants

- `AssemblyFailed { line, message }` -- gasm syntax error
- `CycleLimitExceeded { cycles }` -- infinite loop protection (4096 cycle limit)

### Agent Trait

```rust
pub trait Agent {
    // ── Execution ────────────────────────────────────────
    fn run_pixels(&mut self, pixels: &[u32]) -> AgentResult;
    fn run_gasm(&mut self, source: &str) -> Result<AgentResult, AgentError>;
    fn reset(&mut self);

    // ── Step-by-step debugging ───────────────────────────
    fn load_gasm(&mut self, source: &str) -> Result<HashMap<String, usize>, AgentError>;
    fn step_once(&mut self) -> VmState;
    fn run_loaded(&mut self) -> AgentResult;
    fn resume(&mut self) -> AgentResult;
    fn vm_state(&self) -> VmState;

    // ── Screen inspection ────────────────────────────────
    fn read_screen(&self) -> Vec<u32>;
    fn read_screen_pixel(&self, x: u32, y: u32) -> u32;

    // ── RAM read/write (Phase 5: self-authoring) ─────────
    fn read_ram(&self, start: usize, count: usize) -> Vec<u32>;
    fn peek_ram(&self, addr: usize) -> u32;
    fn write_ram(&mut self, addr: usize, data: &[u32]);
    fn poke_ram(&mut self, addr: usize, value: u32);
    fn execute_from(&mut self, addr: usize) -> AgentResult;

    // ── Disassembler (Phase 6: inspect RAM as text) ──────
    fn disassemble(&self, start: usize, count: usize) -> Vec<(usize, String)>;

    // ── Forge queue ──────────────────────────────────────
    fn forge(&self) -> &ForgeQueue;
    fn forge_mut(&mut self) -> &mut ForgeQueue;
}
```

### Phase 5: Self-Authoring API (write_ram / poke_ram / execute_from)

The agent can write bytecode directly into RAM and execute it without
re-assembling. This is the core of the self-authoring loop:

```rust
let mut agent = GasmAgent::new(4096);

// WRITE: plant a program at address 500
agent.write_ram(500, &[
    op::LDI as u32, 0, 20,        // LDI r0, 20
    op::LDI as u32, 1, 20,        // LDI r1, 20
    op::LDI as u32, 2, 8,         // LDI r2, 8
    op::PSET as u32, 0, 1, 2,     // PSET r0, r1, r2
    op::HALT as u32,
]);

// EXECUTE: run from addr 500
let result = agent.execute_from(500);
assert!(result.halted);
assert_ne!(result.screen_pixel(20, 20), 0);
```

### Phase 6: Disassembler (read RAM as instructions)

The disassembler walks RAM using opcode widths and produces human-readable
instruction listing. It's the "read" in the read/write/execute trifecta:

```rust
// INSPECT: what's at address 500?
let listing = agent.disassemble(500, 14);  // 14 pixels to scan
for (addr, text) in &listing {
    println!("{:>4}: {}", addr, text);
}
// Output:
//  500: LDI r0, 20
//  503: LDI r1, 20
//  506: LDI r2, 8
//  509: PSET r0, r1, r2
//  513: HALT
```

Important: `count` is PIXELS to scan, not instructions. Unknown bytes (e.g.
zeros in uninitialized RAM) decode as `DB 0x00000000`. Use exact pixel counts
matching your program size to avoid trailing DB lines.

The complete self-authoring loop is now: write_ram -> disassemble -> execute_from -> verify

## EditorBuffer

Self-authoring primitives for programs that modify their own RAM:

```rust
use geometry_os::editor::EditorBuffer;

let mut buf = EditorBuffer::new(vec![0; 1024], 4096);

buf.overwrite(10, 0x48);                    // write HALT at position 10
buf.insert(5, 0x49);                        // insert pixel, shift right
buf.delete(7);                              // remove pixel, shift left
buf.write_instruction(20, &[0x41, 0, 1]);   // write ADD r0, r1 at pos 20
buf.delete_range(10, 3);                    // delete 3 pixels starting at 10
buf.insert_slice(15, &[0x48, 0x49, 0x0]);   // insert multiple pixels

let (opcode, args) = buf.read_instruction(0);  // read instruction at position
let disasm = buf.disassemble();                 // full disassembly
```

## WindowManager

Click-to-focus window manager with drag support. Not wired into the GUI yet but fully tested:

```rust
use geometry_os::window_manager::WindowManager;

let mut wm = WindowManager::new();
let id = wm.create_window("Title", 100, 100, 300, 200);
wm.on_mouse_down(150, 105);   // click on title bar -> start drag
wm.on_mouse_move(200, 120);   // drag
wm.on_mouse_up();             // end drag
wm.destroy_window(id);
```

## Shell

Command-line shell parser. Not wired into the GUI:

```
> HELP
Available commands:
  CLS           Clear screen
  PRINT <text>  Print text to screen
  RUN <prog>    Load and run a .gasm program
  HELP          Show this help message
  VER           Show version info
```

Actions returned for the host to execute: `ClearScreen`, `Print { text }`, `Run { filename }`.

## Pixel and ColorMap

- `pixel.rs`: RGBA Pixel struct with blend modes (Source, Dest, Clear, Over, Add, Multiply, Screen). Used by color_map.rs.
- `color_map.rs`: Maps ASCII bytes to Pixel colors. Identity palette (byte value in blue channel), spread palette (RGB distribution), greyscale palette, and custom palette builder.

Neither is currently used by main.rs. The GUI uses inline `palette_color()` with HSV mapping instead.

## Programs

| File | Description |
|------|-------------|
| `programs/boot.rts` | Binary program loaded by F6 |
| `programs/boot.glyph` | Glyph data for boot screen |
| `programs/boot_screen.gasm` | Boot screen in gasm source |
| `programs/font_atlas.rts` | 3x5 font atlas binary |
| `programs/shell.rts` | Keyboard polling shell (polls port 1023, draws white pixels) |
| `programs/paint_geos.rts` | Paint program binary |
| `programs/forge_shell.py` | Generate shell.rts |
| `programs/forge_font.py` | Generate font_atlas.rts |
| `programs/forge_boot_v2.py` | Generate v2 bootloader (navy bg, taskbar, "GEOS" text) |
| `programs/forge_request_demo.py` | Demo: posts a forge issue |
| `programs/forge_boot.py` | Generate original bootloader |
| `programs/forge_paint_geos.py` | Generate paint program |
| `programs/forge_moving_pixel.py` | Animated moving pixel demo |
| `programs/moving_pixel.py` | Moving pixel assembler script |
| `programs/spawn_demo.py` | Child VM spawn demo |

Run any `forge_*.py` with `python3 programs/forge_*.py` to regenerate its `.rts` binary.

## GUI Layout Constants

```
Window:          1024 x 768 pixels
Pixel Grid:      32x32 cells, 16px each cell, origin (16, 64)
VM Screen:       256x256 at 1:1 scale, origin (640, 64)
Registers:       2 columns x 16 rows, origin (640, 340)
Opcode Ref:      4 columns x 4 rows, origin (640, 580)
Typing:          2x scale = 10x14 per char, ~25 cols x 16 rows on VM screen
```

## VM Struct (Public Fields)

```rust
pub struct Vm {
    pub ram: Vec<u32>,              // program memory (default 1024 pixels)
    pub regs: [u32; 32],           // general purpose registers
    pub pc: u32,                    // program counter
    pub stack: Vec<u32>,           // call stack (max 256 entries)
    pub halted: bool,               // execution stopped
    pub yielded: bool,              // yielded to host
    pub children: Vec<ChildVm>,    // spawn requests from last run
    pub screen: Vec<u32>,          // 256x256 framebuffer
    pub forge: ForgeQueue,         // issue queue
}
```

## Known State of the System

What works (tested, verified):
- VM executes all 37 opcodes correctly (131 tests)
- Assembler handles labels, .ORG, comments, all argument formats
- Font renders all 95 printable ASCII glyphs
- Forge queue collects issues with tag/payload/priority
- GasmAgent runs programs, collects results, handles errors
- EditorBuffer supports self-authoring (overwrite, insert, delete, blit)
- Agent supports self-authoring via write_ram/poke_ram/execute_from (Phase 5)
- Agent supports RAM inspection via disassemble() (Phase 6: 21 tests)
- WindowManager handles click-to-focus and drag
- Shell parses CLS, PRINT, RUN, HELP, VER
- Child VM spawning and screen compositing (library-level)
- GUI shows pixel grid, VM screen, registers, opcode reference

What's incomplete:
- main.rs has two separate input paths (idle vs running) that should be unified
- No lowercase key mapping in key_to_ascii()
- No Enter key handling (newline on VM screen)
- Shell is a library, not wired into the GUI
- WindowManager is a library, not wired into the GUI
- pixel.rs and color_map.rs are tested libraries but unused by main.rs
- framebuffer.rs is a separate Color-based framebuffer unused by the VM (which uses raw Vec<u32>)

## How to Add a New Feature

### Add a new opcode
1. Define in `src/opcodes.rs`: add `pub const NAME: u8 = 0xNN;` to the `op` module
2. Add width to `width()` function
3. Add name to `name()` function
4. Add to `is_valid()` match
5. Add execution logic in `src/vm.rs` step() and step_checked()
6. Add mnemonic to `mnemonic_to_opcode()` in `src/assembler.rs`
7. Write tests in `src/vm.rs`

### Add a new shell command
1. Add variant to `ShellAction` enum in `src/shell.rs`
2. Add match arm in `parse_and_execute()`
3. Add to HELP output text
4. Handle the action in main.rs rendering loop

### Add a new font glyph
1. Edit the `GLYPHS` array in `src/font.rs` at the appropriate ASCII index
2. Each glyph is `[row0, row1, row2, row3, row4, row5, row6]`
3. 5 bits per row: bit 4 = leftmost pixel, bit 0 = rightmost
4. Add test asserting the glyph has pixels

### Modify the GUI layout
1. Edit constants at top of `src/main.rs` (CANVAS_X/Y/SCALE, VM_SCREEN_X/Y, etc.)
2. The pixel grid is always 32x32 matching RAM size
3. The VM screen is always 256x256
