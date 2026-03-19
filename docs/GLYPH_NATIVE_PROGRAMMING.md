# Glyph-Native Programming

> **The ASCII file IS the program.** No Rust logic needed.

## The Problem

Every time we need new functionality in Geometry OS, we instinctively write Rust code:

```
User: "I need to handle mouse events"
Us:    "Let me create mailbox_bridge.rs with event parsing logic..."
```

This violates the core principle: **Pixels move pixels.**

The goal is GPU sovereignty - the program should run entirely on the GPU, with Rust only as a thin data pump.

## The Solution

Write logic in Glyph/ASCII, not in Rust.

```
BEFORE:                          AFTER:
┌─────────────────┐              ┌─────────────────┐
│  Rust Code      │              │  ASCII File     │
│  - Event parsing│              │  - Event parsing│
│  - State logic  │              │  - State logic  │
│  - UI handling  │              │  - UI handling  │
└────────┬────────┘              └────────┬────────┘
         │                                │
         ▼                                ▼
┌─────────────────┐              ┌─────────────────┐
│  GPU            │              │  GPU            │
│  (just renders) │              │  (executes!)    │
└─────────────────┘              └─────────────────┘
```

## Architecture

```
┌─────────────────────────────────────────────────────────────────────┐
│                        GEOMETRY OS RUNTIME                          │
├─────────────────────────────────────────────────────────────────────┤
│                                                                     │
│  ┌─────────────┐     ┌─────────────┐     ┌─────────────────────┐  │
│  │  Host (Rust)│     │   Mailbox   │     │   Glyph VM (GPU)    │  │
│  │             │     │   0x0200    │     │                     │  │
│  │  winit      │────▶│  EVENT_TYPE │────▶│  LOAD r2, mem[r1]  │  │
│  │  wgpu       │     │  EVENT_X    │     │  BEQ r2, r3, :done │  │
│  │             │     │  EVENT_Y    │     │  STORE mem[r4], r2 │  │
│  │  (minimal!) │     │  ...        │     │  JMP :main_loop    │  │
│  └─────────────┘     └─────────────┘     └─────────────────────┘  │
│         │                                          │               │
│         │                                          ▼               │
│         │                              ┌─────────────────────┐    │
│         │                              │   State Buffer      │    │
│         │                              │   0x1000 = frame    │    │
│         │                              │   0x1004 = mouse_x  │    │
│         │                              │   0x1008 = mouse_y  │    │
│         │                              └─────────────────────┘    │
│         │                                          │               │
│         └──────────────────────────────────────────┘               │
│                           (Host reads state for display)            │
│                                                                     │
└─────────────────────────────────────────────────────────────────────┘
```

### Three Layers

1. **Host Layer (Rust)** - Minimal, just data pumping
   - Opens window (winit)
   - Initializes GPU (wgpu)
   - Forwards events to mailbox
   - Blits RAM texture to screen

2. **Mailbox Layer (Shared Memory)** - Communication channel
   - Host writes events to 0x0200
   - VM reads events from 0x0200
   - VM writes state to 0x1000
   - Host reads state for display

3. **Glyph Layer (GPU)** - All the logic
   - Event handling
   - State management
   - UI rendering
   - Program execution

## Workflow

### Step 1: Write ASCII Program

Create a `.ascii` or `.glyph` file with Glyph assembly:

```glyph
; My Event Handler
; Host writes events to 0x0200

:entry
LDI r0, 0
LDI r1, 0x1000
STORE mem[r1], r0    ; Initialize state
JMP :main_loop

:main_loop
LDI r1, 0x0200
LOAD r2, mem[r1]     ; Read EVENT_TYPE
LDI r3, 0
BEQ r2, r3, :skip    ; No event?

; Handle event here...
LDI r3, 1
SUB r4, r2, r3
LDI r5, 0
BEQ r4, r5, :on_click

:skip
LDI r1, 0x1000
LOAD r2, mem[r1]
LDI r3, 1
ADD r2, r2, r3       ; frame++
STORE mem[r1], r2
JMP :main_loop

:on_click
; Handle click...
JMP :main_loop
```

### Step 2: Compile to Cartridge

```bash
cargo run -p infinite_map_rs --bin geos-compile \
    my_program.ascii -o my_program.rts.png
```

Output: A PNG file with 5 segments (80x1576 pixels)

### Step 3: Run on GPU

```bash
cargo run -p infinite_map_rs --bin micro_host
```

The host loads the cartridge and runs the Glyph VM.

## Memory Layout

### Mailbox Region (0x0200 - 0x0218)

Host writes events here:

| Address | Name | Description |
|---------|------|-------------|
| 0x0200 | EVENT_TYPE | 0=none, 1=move, 2=click, 4=scroll |
| 0x0204 | EVENT_X | Mouse X coordinate |
| 0x0208 | EVENT_Y | Mouse Y coordinate |
| 0x020C | EVENT_BTN | Button number (1=left, 2=right) |
| 0x0210 | EVENT_DX | Delta X (for drag/scroll) |
| 0x0214 | EVENT_DY | Delta Y (for scroll) |

### State Buffer (0x1000 - 0x1100)

VM writes outputs here:

| Address | Name | Description |
|---------|------|-------------|
| 0x1000 | frame_count | Incremented each loop |
| 0x1004 | mouse_x | Current mouse X |
| 0x1008 | mouse_y | Current mouse Y |
| 0x100C | zoom | Zoom level (100 = 1x) |
| 0x1010 | click_count | Total clicks |

### Program Segment (0x8000+)

Compiled bytecode lives here.

## Opcode Reference

### Data Movement

```glyph
LDI r0, 42           ; Load immediate
LDI r0, :label       ; Load address of label
LOAD r2, mem[r1]     ; Load from memory
STORE mem[r1], r0    ; Store to memory
MOV r0, r1           ; Copy register
```

### Arithmetic

```glyph
ADD r2, r0, r1       ; r2 = r0 + r1
SUB r2, r0, r1       ; r2 = r0 - r1
MUL r2, r0, r1       ; r2 = r0 * r1
DIV r2, r0, r1       ; r2 = r0 / r1
```

### Control Flow

```glyph
JMP :label           ; Unconditional jump
BEQ r0, r1, :label   ; Branch if equal
BNE r0, r1, :label   ; Branch if not equal
BLT r0, r1, :label   ; Branch if less than
BGE r0, r1, :label   ; Branch if greater or equal
CALL :label          ; Call subroutine
RET                  ; Return from call
HALT                 ; Stop execution
```

### Special

```glyph
YIELD                ; Cooperative multitasking yield
SPAWN r8             ; Spawn child VM at address in r8
```

## Example: Event Handler

The complete `mailbox.ascii` from the codebase:

```glyph
; GEOS MAILBOX PROTOCOL v1.0
; Host writes events to 0x0200

:entry
LDI r0, 0
LDI r1, 0x1000
STORE mem[r1], r0       ; frame = 0
LDI r1, 0x1004
STORE mem[r1], r0       ; mouse_x = 0
LDI r1, 0x1008
STORE mem[r1], r0       ; mouse_y = 0
LDI r0, 100
LDI r1, 0x100C
STORE mem[r1], r0       ; zoom = 100
LDI r0, 0
LDI r1, 0x1010
STORE mem[r1], r0       ; clicks = 0
JMP :main_loop

:main_loop
LDI r1, 0x0200
LOAD r2, mem[r1]        ; Read EVENT_TYPE
LDI r3, 0
BEQ r2, r3, :event_done ; No event, skip

; Check event type
LDI r3, 1
SUB r4, r2, r3
LDI r5, 0
BEQ r4, r5, :on_mouse_move

LDI r3, 2
SUB r4, r2, r3
BEQ r4, r5, :on_click

LDI r3, 4
SUB r4, r2, r3
BEQ r4, r5, :on_scroll
JMP :clear_event

:on_mouse_move
LDI r1, 0x0204
LOAD r2, mem[r1]        ; X
LDI r1, 0x0208
LOAD r3, mem[r1]        ; Y
LDI r1, 0x1004
STORE mem[r1], r2       ; Update mouse_x
LDI r1, 0x1008
STORE mem[r1], r3       ; Update mouse_y
JMP :clear_event

:on_click
LDI r1, 0x1010
LOAD r2, mem[r1]        ; click_count
LDI r3, 1
ADD r2, r2, r3          ; increment
LDI r1, 0x1010
STORE mem[r1], r2
JMP :clear_event

:on_scroll
LDI r1, 0x0214
LOAD r2, mem[r1]        ; DY
LDI r1, 0x100C
LOAD r3, mem[r1]        ; zoom
ADD r3, r3, r2          ; zoom += dy
LDI r1, 0x100C
STORE mem[r1], r3
JMP :clear_event

:clear_event
LDI r0, 0
LDI r1, 0x0200
STORE mem[r1], r0       ; Clear EVENT_TYPE

:event_done
LDI r1, 0x1000
LOAD r2, mem[r1]        ; frame_count
LDI r3, 1
ADD r2, r2, r3          ; frame++
LDI r1, 0x1000
STORE mem[r1], r2
JMP :main_loop
```

## Rust Side (Minimal)

The host only needs to:

```rust
// 1. Forward events to mailbox
fn on_mouse_move(x: u32, y: u32, dx: i32, dy: i32) {
    write_to_vm(0x0200, 1);      // EVENT_TYPE = MOUSE_MOVE
    write_to_vm(0x0204, x);
    write_to_vm(0x0208, y);
    write_to_vm(0x0210, dx as u32);
    write_to_vm(0x0214, dy as u32);
}

// 2. Dispatch VM
fn frame() {
    scheduler.dispatch(&queue);
}

// 3. Read state for display
fn get_mouse_pos() -> (u32, u32) {
    (read_from_vm(0x1004), read_from_vm(0x1008))
}
```

**No logic in Rust!** The Glyph program handles everything.

## Anti-Patterns to Avoid

| ❌ Bad | ✅ Good |
|--------|---------|
| Writing event parsing in Rust | Writing event parsing in Glyph |
| Creating `*_bridge.rs` modules | Using mailbox addresses directly |
| Adding UI logic to host | UI logic runs on GPU |
| "Let me add a Rust function for..." | "Let me add a Glyph routine for..." |

## Files to Study

| File | Purpose |
|------|---------|
| `apps/ascii-world/.../examples/loop_demo.ascii` | Loop counter example (canonical) |
| `apps/ascii-world/.../examples/mailbox.ascii` | Event handler example |
| `systems/glyph_stratum/programs/*.glyph` | More Glyph programs |
| `systems/infinite_map_rs/src/glyph_assembler.rs` | Assembler implementation |
| `systems/infinite_map_rs/src/bin/geos-compile.rs` | Compiler CLI |

## Philosophy

> **The ASCII file IS the program.**

When you want to add functionality:

1. ❌ Don't create a new Rust module
2. ❌ Don't add logic to the host
3. ✅ Create a `.ascii` or `.glyph` file
4. ✅ Write Glyph code that handles it
5. ✅ Compile with `geos-compile`
6. ✅ Run on GPU

This is the path to GPU sovereignty.

---

*Document created: 2026-03-19*
