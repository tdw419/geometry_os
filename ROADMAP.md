# Geometry OS Roadmap

## Direction

See `docs/NORTH_STAR.md` -- an OS for AIs by AIs, eventually for humans.
Programs first, Rust features only when programs need them.

## The Long Arc

```
Where we are          Where we're going
─────────────         ─────────────────
.gasm programs        Full applications
Micro-assembler       Self-hosting compiler
Single process        Multi-tasking OS
Keyboard input        Mouse, audio, network
32x32 canvas          Full windowed desktop
AI-written demos      AI-written OS that humans use
```

## Current State

- 510+ tests passing
- 44 opcodes, self-hosting micro-assembler
- Interactive GUI with pixel editor, hex mode, disassembly
- Window manager, shell, agent substrate
- lib/math.gasm, lib/string.gasm, lib/screen.gasm
- Debug registers (cycle count, stack depth, breakpoints)

## Phase 1: Language Completeness

### 1.1 Assembler (DONE)
- [x] `.data` / `.text` section directives
- [x] String constants (`.asciz "hello"`)
- [x] Expression evaluation in immediates
- [x] `.include` directive
- [x] Macro support (`.macro ADD3 ... .endm`)

### 1.2 Standard Library
- [x] `lib/math.gasm`
- [x] `lib/string.gasm`
- [x] `lib/screen.gasm`
- [x] `lib/input.gasm` -- read_key, wait_key, key_to_hex (uses keyboard port 0xFFF)

### 1.3 VM Enhancements (only when programs need them)
- [x] Stack overflow protection
- [x] Memory protection
- [x] Interrupt vector table
- [x] Timer interrupt
- [x] Debug registers

## Phase 2: Self-Hosting Toolchain

- [x] Mini-editor: text editing inside the VM
- [x] Micro-asm v2 (forward references, error reporting with line numbers)
- [ ] Mini-debugger: full register/memory inspection (basic version done: bar-graph display using debug registers)
- [ ] Full bootstrap: micro-asm.asm compiles itself

## Phase 3: Interactive Programs (proving the OS works)

- [ ] Snake game (arrow keys, collision, score)
- [ ] Paint program (PSET, color picker, keyboard driven)
- [ ] Text adventure (room descriptions, parser)
- [ ] Screensaver (animation loop)

## Phase 4: I/O Expansion (the device driver layer)

- [ ] Mouse input (memory-mapped x, y, buttons)
- [ ] Audio output (square wave, memory-mapped)
- [ ] Sprite system (SPAWN entities, auto-update)
- [ ] Scrollable text buffer (terminal output)

## Phase 5: The OS Layer

- [ ] Process scheduler (round-robin, context switching)
- [ ] Filesystem (save/load named programs, directories)
- [ ] Memory management (alloc/free within VM)
- [ ] Inter-process communication
- [ ] User sessions / permissions

## Phase 6: Agent Integration

- [ ] REST API for program submission
- [ ] Screenshot endpoint (canvas to PNG)
- [ ] Input injection (key/mouse from API)
- [ ] State snapshot (registers, RAM, screen as JSON)
- [ ] Multi-agent sandboxed execution

## Priority Order for Automated Development

**Batch 1-2 (DONE):** Libraries, assembler improvements, demos

**Batch 3 -- Input and Interaction:**
- [x] `lib/input.gasm` -- read_key, wait_key, key_to_hex (uses keyboard port 0xFFF)
- [x] Interactive echo program -- type on keyboard, see characters on VM screen (echo-interactive.asm)
- [x] Screensaver demo -- animated patterns with lib/screen.gasm
- [x] Simple calculator -- reads numbers from keyboard, displays result

**Batch 4 -- Self-Hosting Toolchain:**
- [x] Mini-editor written in .gasm (uses keyboard port for input)
- [x] Micro-asm v2 (forward references, error reporting with line numbers)
- [ ] Full bootstrap (micro-asm.asm compiles itself)

**Batch 5 -- Games (proof the system works end-to-end):**
- [ ] Snake game
- [ ] Paint program
- [ ] Text adventure

**Batch 6 -- The OS Layer (when games prove the foundation):**
- [ ] Process scheduler (needed when snake + editor run together)
- [ ] Filesystem (needed when you want to save your snake high score)
- [ ] Memory management (needed when programs compete for RAM)

**Batch 7 -- VM Hardening (only when programs hit walls):**
- [x] Stack overflow protection (if recursion hits limit)
- [x] Memory protection (if programs corrupt each other)
- [x] Interrupt vector table (needed for event-driven programs)
- [x] Timer interrupt (if frame timing is needed)
- [x] Debug registers (if complex programs can't be debugged)

**Batch 8 -- The World Outside:**
- [ ] REST API bridge
- [ ] Mouse/audio support
- [ ] Multi-agent execution
