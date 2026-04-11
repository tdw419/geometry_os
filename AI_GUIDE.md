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

### Memory Layout
- RAM[0..N]: program + data (configurable, typically 4096 or 64K words)
- Screen: 32-bit pixels, memory-mapped or separate buffer
- Keyboard: memory-mapped register at fixed address

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
