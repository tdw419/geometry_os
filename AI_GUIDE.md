# AI Guide: Geometry OS Development

## Project Overview

Geometry OS is a pixel-computer VM where **keystrokes produce colors, colors compose into patterns, and patterns are opcodes**. Programs are paintings first and code second.

The system is written in Rust (~12K LOC, 285 tests). It has an interactive GUI (pixels) and a headless agent mode for automation.

## Quick Start

```bash
cd ~/zion/projects/geometry_os/geometry_os

# Run all tests
cargo test 2>&1 | grep "test result"

# Run just lib tests (fastest feedback)
cargo test --lib 2>&1 | tail -5

# Build
cargo build 2>&1 | tail -3

# Run interactively (needs display)
cargo run
```

## Architecture

```
src/
  main.rs          (1690 lines) -- GUI, input handling, panels, event loop
  vm.rs            (2563 lines) -- Virtual machine core: 42 opcodes, execute loop
  agent.rs         (1555 lines) -- GasmAgent: headless execution, forge bridge
  assembler.rs      (598 lines) -- .gasm text → pixel bytecode
  opcodes.rs        (256 lines) -- Opcode definitions, widths, arg types
  parser.rs         (530 lines) -- .gasm source parser
  window_manager.rs (601 lines) -- Window manager (drag, focus, z-order)
  editor.rs         (334 lines) -- Inline code editor (F9)
  shell.rs          (422 lines) -- Command-line shell parser
  forge.rs          (147 lines) -- ISSUE_CREATE queue
  font.rs           (301 lines) -- Bitmap font rendering
  pixel.rs          (216 lines) -- Pixel color types
  color_map.rs      (188 lines) -- Palette management
  error.rs           (13 lines) -- Error types
  lib.rs             (11 lines) -- Crate root

tests/
  micro_asm.rs              (479 lines) -- Micro-assembler tests
  command_parser.rs         (358 lines) -- Shell/parser tests
  gasm_boundary_tests.rs    (445 lines) -- VM boundary conditions
  gasm_call_ret_test.rs     (201 lines) -- CALL/RET behavior
  integration.rs            (169 lines) -- End-to-end tests
  text_opcode_rendering.rs  (372 lines) -- Text I/O tests

programs/
  micro-asm.asm      -- Self-hosting assembler (runs inside the VM at 0x800)
  boot.asm           -- Boot program
  echo-s.asm         -- Echo demo
  fill-bounded-s.asm -- Fill demo
  *.rts, *.gasm      -- Various test programs
```

## Key Design Patterns

### Address Flag Convention (CRITICAL)
Bit 31 (`0x80000000`) distinguishes absolute vs relative addresses:
- **Bit 31 SET**: absolute address. `resolve_addr(addr)` returns `addr & 0x7FFFFFFF`
- **Bit 31 UNSET**: relative backward offset. `resolve_addr(addr)` returns `pc - addr`

The Rust assembler always sets this flag on JMP/CALL/BRANCH targets.
The micro-assembler (micro-asm.asm) ORs `0x80000000` on @label resolution.

### Opcode = ASCII Key
Opcodes ARE their ASCII values: ADD = 0x41 ('A'), HALT = 0x48 ('H'), etc.
This is not a lookup -- the keypress IS the instruction byte.

### Instruction Width
Each opcode has a fixed width (1-5 pixels/words):
- Width 1: NOP, HALT, RET, YIELD, IRET
- Width 2: JMP, CALL, LDI, INT, PUSH, POP
- Width 3: ADD, SUB, MOV, LOAD, STORE, BRANCH, STI, ...
- Width 4: PSET, SPAWN, TEXT, BLIT, ...
- Width 5: RECTF, LINE

### VM Registers
- r0-r15: general purpose (u32)
- pc: program counter
- sp: stack pointer (grows down from top of RAM)
- halted: execution flag

### Interrupt Vector Table (IVT)
- 16 entries (vectors 0-15), stored in VM state (not program RAM)
- `STI vector, handler_addr` -- register a handler address for a vector
- `INT vector` -- push return address, jump to IVT[vector]; NOP if handler is 0
- `IRET` -- pop return address from stack, return from interrupt handler
- Nested interrupts supported (handler can call INT)
- Example: `STI 0, my_handler` then `INT 0` calls `my_handler`

### Debug Registers (0xFFE0–0xFFEF)
Memory-mapped I/O registers for VM introspection and debugging.
Programs read/write these via LOAD/STORE.

| Address  | Name             | R/W | Description |
|----------|------------------|-----|-------------|
| `0xFFE0` | DBG_CYCLE_COUNT  | R   | Total instruction cycles executed (wrapping u32) |
| `0xFFE1` | DBG_STACK_DEPTH  | R   | Current stack depth (number of values on stack) |
| `0xFFE2` | DBG_BREAKPOINT   | R/W | Breakpoint address; 0 = disabled. Fires when PC reaches this address |
| `0xFFE3` | DBG_BREAKPT_HIT  | R   | 1 if breakpoint was hit since last read, auto-clears on read |

Children do NOT inherit parent's debug state (cycle count, breakpoint).

Example:
```
; Set a breakpoint at address 20
LDI r5, 0xFFE2          ; breakpoint register
LDI r6, 20              ; target address
STORE r5, r6            ; enable breakpoint

; ... run code ...

; Check if breakpoint fired
LDI r5, 0xFFE3          ; breakpoint-hit register
LOAD r0, r5             ; read (auto-clears)
; r0 = 1 if hit, 0 if not

; Read cycle count for profiling
LDI r5, 0xFFE0          ; cycle count register
LOAD r1, r5             ; r1 = total cycles so far

; Read stack depth
LDI r5, 0xFFE1          ; stack depth register
LOAD r2, r5             ; r2 = current stack depth
```

### Hardware Timer Interrupt
- **Vector 0** is reserved for the hardware timer interrupt
- Memory-mapped registers (high addresses to avoid RAM collision):
  - `0xFFF0` (TIMER_PERIOD_ADDR): write a non-zero value to enable timer with that period (in instruction cycles); write 0 to disable
  - `0xFFF1` (TIMER_COUNTER_ADDR): read-only, returns current countdown value
- Timer decrements once per instruction cycle in `run()` / `run_checked()`
- When counter reaches 0: fires IVT[0], pushes return PC, resets counter to period
- Handler returns via `IRET`
- Disabled by default (timer_period = 0)
- Children do NOT inherit the parent's timer
- Example:
  ```
  STI 0, tick_handler     ; Register timer handler
  LDI r5, 0xFFF0          ; Timer period register address
  LDI r6, 100             ; Period = 100 cycles
  STORE r5, r6            ; Enable timer
  ; ... main loop ...
  tick_handler:
      ADD r0, r1           ; Increment counter
      IRET
  ```

### Process Scheduler (Round-Robin Multi-Tasking)
The `ProcessTable` manages multiple VM processes with cooperative and preemptive scheduling.

**Opcodes:**
| Opcode | Byte | Width | Description |
|--------|------|-------|-------------|
| `FORK` | `0x6F` (o) | 1 | Clone current process. Parent r0=child_pid, child r0=0 |
| `YIELD` | `0x59` (Y) | 1 | Cooperative context switch to next process |
| `EXIT` | `0x75` (u) | 1 | Terminate current process (like HALT but semantic) |
| `GETPID` | `0x76` (v) | 1 | r0 = current process ID |

**Key behavior:**
- FORK is resolved by the scheduler AFTER `run_with_limit` returns. The parent's r0 is set to child_pid in the snapshot, NOT during execution.
- Always follow FORK with YIELD to let the scheduler resolve the fork before checking r0.
- `ProcessTable::new(vm)` creates a scheduler with one process (PID 1).
- `ProcessTable::with_time_slice(vm, n)` sets cycles per process before preemption.
- `tick()` runs one process for up to `time_slice` cycles, returns `(pid, cycles, TickReason)`.
- `run_all()` runs all processes until none are runnable.
- Processes have independent RAM snapshots (fork clones memory).

**Correct FORK pattern:**
```
FORK
YIELD               ; CRITICAL: let scheduler resolve fork
; Now r0 = child_pid (parent) or 0 (child)
LDI r10, 0
BEQ r0, r10, child_code
; ... parent code ...
EXIT
child_code:
; ... child code ...
EXIT
```

**Demo:** `programs/multitask.gasm` -- two processes drawing on left/right halves of the screen.

### Memory Layout
- RAM[0..N]: program + data (configurable, typically 4096 or 64K words)
- Screen: 32-bit pixels, memory-mapped or separate buffer
- Keyboard: memory-mapped register at fixed address (0xFFF)

### Mouse Registers (0xFFA0–0xFFA2)
Memory-mapped I/O for mouse input. Read-only. Updated by the host GUI each frame.
Programs read these via LOAD from the following addresses:

| Address  | Name             | R/W | Description |
|----------|------------------|-----|-------------|
| `0xFFA0` | MOUSE_X          | R   | Mouse X coordinate (0–255) |
| `0xFFA1` | MOUSE_Y          | R   | Mouse Y coordinate (0–255) |
| `0xFFA2` | MOUSE_BUTTONS    | R   | Button bitmask (bit 0=left, bit 1=right, bit 2=middle) |

Example:
```
LDI r5, 0xFFA0          ; mouse X register
LOAD r0, r5             ; r0 = mouse_x (0-255)
LDI r5, 0xFFA1          ; mouse Y register
LOAD r1, r5             ; r1 = mouse_y
LDI r5, 0xFFA2          ; mouse buttons
LOAD r2, r5             ; r2 = button bitmask
LDI r3, 1
AND r3, r2              ; r3 = 1 if left button down
```

Library: `lib/mouse.gasm` provides `read_mouse`, `mouse_left`, `mouse_right`,
`mouse_middle`, `wait_click` routines.

### Audio Registers (0xFFC0–0xFFC3)
Memory-mapped I/O for square-wave audio output. Programs read/write these via LOAD/STORE.

| Address  | Name             | R/W | Description |
|----------|------------------|-----|-------------|
| `0xFFC0` | AUDIO_FREQ       | R/W | Frequency in Hz (e.g. 440 = A4). Write 0 to stop. |
| `0xFFC1` | AUDIO_VOLUME     | R/W | Volume 0–255. 0 = mute, 255 = max. |
| `0xFFC2` | AUDIO_DURATION   | R/W | Duration in ms. 0 = play indefinitely. |
| `0xFFC3` | AUDIO_STATUS     | R   | 1 = playing, 0 = idle. Read-only (writes ignored). |

Playing a tone: set volume first, then set freq to non-zero. Status auto-set to 1.
Stopping: set freq to 0 or volume to 0. Status auto-set to 0.
Children do NOT inherit parent's audio state.

Example:
```
; Play A4 at mid volume
LDI r5, 0xFFC1          ; volume register
LDI r6, 128             ; mid volume
STORE r5, r6
LDI r5, 0xFFC0          ; freq register
LDI r6, 440             ; A4
STORE r5, r6            ; starts playing (status → 1)

; Check if playing
LDI r5, 0xFFC3
LOAD r0, r5             ; r0 = 1

; Stop
LDI r5, 0xFFC0
LDI r6, 0
STORE r5, r6            ; stops (status → 0)
```

Library: `lib/audio.gasm` provides `play_note`, `stop_audio`, `set_volume`,
`audio_playing`, `set_duration`, and convenience routines `play_c4`–`play_c5`.
Demo: `programs/audio-demo.gasm` plays a C major scale using timer interrupts.

## Development Rules

### Testing
- **ALWAYS run `cargo test` before committing**
- Tests live in `tests/` (integration) and `#[cfg(test)]` inside source files
- When adding opcodes: add to `opcodes.rs` first, then `vm.rs`, then tests
- When adding assembler features: test both assembler output and VM execution

### Editing Rust Files
- `patch` tool works but auto-formats (cosmetic only, doesn't break logic)
- NEVER do read_file → write_file (corrupts with line numbers)
- Commit before risky edits
- Run `cargo test` after every change

### Adding a New Opcode
1. Add `pub const NAME: u8 = 0xNN;` in `src/opcodes.rs` (op module)
2. Add to `width()`, `name()`, `arg_types()`, and `is_valid()` match arms
3. Add implementation in `src/vm.rs` `execute_checked()` match
4. Add to assembler in `src/assembler.rs` if it has a text form
5. Write tests in appropriate test file
6. Run `cargo test`

### Adding a New Program
1. Create `.asm` file in `programs/`
2. Use labels: `#label` for definition, `@label` for reference
3. Test via `GasmAgent` in integration tests or via micro-assembler tests

## File Locations

- Project root: `~/zion/projects/geometry_os/geometry_os/`
- Carry Forward: `~/zion/projects/carry_forward/carry_forward/`
- Hermes state DB: `~/.hermes/state.db`
- Carry Forward DB: `~/.hermes/carry_forward.db`

## Common Gotchas

1. **Bit 31 flag** -- forgetting this on addresses causes mysterious relative jumps
2. **Instruction width** -- every opcode must have correct width or VM misaligns
3. **Micro-assembler** -- runs INSIDE the VM, has limited register space (r0-r14)
4. **Stack grows downward** -- SP starts at top of RAM
5. **BRANCH condition** -- cond field encodes comparison type, not a register value
