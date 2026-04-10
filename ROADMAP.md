# Geometry OS Roadmap

## Current State (as of ebbf080)

- **11,449 LOC** across 16 source files + 6 test files + programs
- **285 tests passing** (186 lib, 5 boundary, 34 call/ret, 19 micro-asm, 6 text, 8 geo, 21 integration, 6 wasm)
- **42 opcodes** all implemented in the VM
- **Self-hosting micro-assembler** (micro-asm.asm runs inside the VM)
- **Interactive GUI** with pixel editor, ASM input mode, hex mode, disassembly panel
- **Window manager** with click-to-focus, drag, z-ordering
- **Agent substrate** (GasmAgent) for headless program execution
- **Forge queue** for ISSUE_CREATE opcode
- **Shell** with CLS, PRINT, RUN, HELP, VER commands
- **Text I/O** via memory-mapped keyboard register

## Phase 1: Language Completeness (current → self-hosting)

### 1.1 Assembler Improvements
- [ ] Support `.data` / `.text` section directives
- [x] String constants (`.asciz "hello"`) for TEXT opcode
- [x] Expression evaluation in immediates (`LDI r0, 2+3`)
- [ ] Include directive (`.include "lib.gasm"`)
- [ ] Macro support (`.macro ADD3 ... .endm`)

### 1.2 VM Enhancements
- [ ] Stack overflow protection (configurable stack limit)
- [ ] Memory protection (read/write/execute regions)
- [ ] Interrupt vector table (INT opcode dispatch)
- [ ] Timer interrupt (configurable tick rate)
- [ ] Debug registers (breakpoint, watchpoint support)

### 1.3 Standard Library
- [x] `lib/math.gasm` -- multiply, divide, modulo (if not native)
- [x] `lib/string.gasm` -- strlen, strcpy, strcmp, print_string
- [x] `lib/screen.gasm` -- clear_screen, draw_line (Bresenham), draw_rect_border
- [ ] `lib/input.gasm` -- read_key, wait_key, key_to_hex

## Phase 2: Self-Hosting Toolchain

### 2.1 Micro-Assembler v2
- [ ] Handle forward references (multi-pass)
- [ ] Error reporting with line numbers
- [ ] Support all opcodes (not just subset)
- [ ] Compile micro-asm.asm with itself (full bootstrap)

### 2.2 Mini-Editor
- [ ] Text editing inside the VM (cursor movement, insert/delete)
- [ ] Load/save programs to VM memory
- [ ] Syntax highlighting via color

### 2.3 Mini-Debugger
- [ ] Breakpoints (set/clear/continue)
- [ ] Register inspection panel
- [ ] Memory dump viewer
- [ ] Step-over, step-out

## Phase 3: Interactive Programs

### 3.1 Demo Programs
- [ ] Snake game (arrow key input, grid collision)
- [ ] Paint program (PSET-based, color picker)
- [ ] Text adventure (room descriptions, parser)
- [ ] Screensaver (moving patterns, animation loop)

### 3.2 I/O Expansion
- [ ] Mouse input (memory-mapped registers for x, y, buttons)
- [ ] Audio output (square wave generator, memory-mapped)
- [ ] Sprite system (SPAWN-based entities with auto-update)
- [ ] Scrollable text buffer (terminal-style output)

## Phase 4: Agent Integration

### 4.1 Harness Bridge
- [ ] REST API for agent-driven program submission
- [ ] Screenshot endpoint (render canvas to PNG)
- [ ] Input injection (simulate key/mouse from API)
- [ ] State snapshot (registers, RAM, screen as JSON)

### 4.2 Multi-Agent
- [ ] Agent-to-agent messaging via shared memory
- [ ] Sandboxed execution (per-agent VM instances)
- [ ] Resource limits (cycles, memory, screen regions)

## Priority Order for Automated Development

**Batch 1 -- Quick Wins (test the chain, high value, low risk):**
- [x] `lib/math.gasm` -- multiply via repeated add, divide via subtraction, modulo
- [x] `lib/string.gasm` -- strlen, strcpy, strcmp, print_string
- [x] `lib/screen.gasm` -- clear_screen, draw_line (Bresenham), draw_rect_border
- [x] Demo: counter that increments and displays on screen
- [x] Demo: simple animation (bouncing pixel)

**Batch 2 -- Assembler Improvements:**
- [x] Expression evaluation in immediates (`LDI r0, 2+3`)
- [x] String constants (`.asciz "hello"`) for TEXT opcode
- [ ] `.data` / `.text` section directives
- [ ] `.include "lib.gasm"` directive
- [ ] Macro support (`.macro ADD3 ... .endm`)

**Batch 3 -- VM Hardening:**
- [ ] Stack overflow protection (configurable stack limit)
- [ ] Memory protection (read/write/execute regions)
- [ ] Timer interrupt (configurable tick rate)
- [ ] Debug registers (breakpoint, watchpoint)

**Batch 4 -- Demo Programs:**
- [ ] Snake game
- [ ] Paint program
- [ ] Text adventure
- [ ] Screensaver

**Batch 5 -- Advanced:**
- [ ] REST API bridge
- [ ] Self-hosting full bootstrap
- [ ] Mouse/audio support
