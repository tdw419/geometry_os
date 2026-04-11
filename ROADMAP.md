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

- 1068 tests — build passing, all tests green
- 49 opcodes, self-hosting micro-assembler
- Interactive GUI with pixel editor, hex mode, disassembly
- Window manager, shell, agent substrate
- lib/math.gasm, lib/string.gasm, lib/screen.gasm, lib/audio.gasm, lib/sprite.gasm, lib/alloc.gasm, lib/input.gasm, lib/mouse.gasm, lib/fs.gasm, lib/terminal.gasm
- Debug registers (cycle count, stack depth, breakpoints)
- Audio output (square wave, memory-mapped registers 0xFFC0-0xFFC3)
- Heap allocator (first-fit, coalescing, memory-mapped registers 0xFFD0-0xFFD5)
- Mouse input (memory-mapped x/y/buttons at 0xFFA0-0xFFA2)
- Filesystem (memory-mapped save/load at 0xFFB0-0xFFB5, lib/fs.gasm)
- Scrollable terminal (memory-mapped at 0xFFD8-0xFFDF, lib/terminal.gasm)
- Process scheduler with FORK/YIELD/EXIT/GETPID
- Multi-agent sandbox (VmPool, isolated VMs, resource caps, 13 sandbox API endpoints)
- IPC registers (mailbox send/recv/peek via MMIO at 0xFE00-0xFEFF, 7 tests)

## Phase 1: Language Completeness

### 1.1 Assembler (DONE)
- [x] `.data` / `.text` section directives
- [x] String constants (`.asciz "hello"`) — programs/hello_asciz.gasm
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
- [x] Interrupt demo (STI/INT/IRET) -- programs/int-demo.gasm

## Phase 2: Self-Hosting Toolchain

- [x] Mini-editor: text editing inside the VM
- [x] Micro-asm v2 (forward references, error reporting with line numbers)
- [x] Mini-debugger: full register/memory inspection (hex display, memory dump, breakpoint control)
- [x] Full bootstrap: micro-asm.asm compiles itself

## Phase 3: Interactive Programs (proving the OS works)

- [x] Snake game (arrow keys, collision, score) -- programs/snake.gasm
- [x] Paint program (PSET, color picker, keyboard driven) -- programs/paint.gasm
- [x] Mouse-driven paint program -- programs/mousepaint.gasm
- [x] Text adventure (room descriptions, parser) -- programs/adventure.gasm
- [x] Screensaver (animation loop) -- programs/screensaver.gasm
- [x] Click target game (mouse reflex game) -- programs/clicktargets.gasm
- [x] Bouncing pixel animation -- programs/bouncing_pixel.gasm
- [x] Calculator (keyboard input, +, -, *) -- programs/calculator.gasm
- [x] Counter demo (decimal display) -- programs/counter_demo.gasm
- [x] Boot screen (GEOS startup screen) -- programs/boot_screen.gasm

## Phase 4: I/O Expansion (the device driver layer)

- [x] Mouse input (memory-mapped x, y, buttons)
- [x] Audio output (square wave, memory-mapped) — programs/audio-demo.gasm
- [x] Sprite system (SPAWN entities, auto-update) — ChildVm with x/y/w/h, positional compositing, frame-limited execution, lib/sprite.gasm, programs/sprites-demo.gasm
- [x] Scrollable text buffer (terminal output) — TextBuffer struct with memory-mapped I/O registers (0xFFD8–0xFFDF), auto-wrap at 51 cols, auto-scroll past 36 rows, lib/terminal.gasm, programs/terminal-demo.gasm, 19 tests
- [x] Timer demo (interrupt-driven timer) — programs/timer-demo.gasm
- [x] Multitask demo (two processes on split screen) — programs/multitask.gasm

## Phase 5: The OS Layer

- [x] Process scheduler (round-robin, context switching)
- [x] Filesystem (save/load named programs, directories) — programs/save_score_demo.gasm
- [x] Memory management (alloc/free within VM, heap registers 0xFFD0-0xFFD5, lib/alloc.gasm)
- [x] Inter-process communication — mailbox struct in VM, SEND/RECV/PEEK via memory-mapped registers at 0xFE00-0xFEFF (see Phase 7 for process-to-process demos)
- [x] User sessions / permissions (see Phase 12 for full implementation)

## Phase 6: Agent Integration (The Bridge Outward)

### 6.1 REST API Core
- [x] Add `tiny_http` HTTP server to the Rust binary (behind `rest-api` feature flag)
- [x] `POST /run` -- accept `.gasm` source, assemble, execute, return full result
- [x] `POST /load` + `POST /step` + `POST /resume` -- step-debugging workflow
- [x] `GET /state` -- running/halted/yielded, registers, PC, SP, cycle count
- [x] `POST /reset` -- halt and reset VM to clean state

### 6.2 Visual & State Endpoints
- [x] `GET /screen` -- screen buffer as JSON array of pixel values
- [x] `GET /screen/ppm` -- screen as PPM image (binary)
- [x] `GET /memory` -- hex dump of memory range (?start=0&count=256)
- [x] `GET /stack` -- stack contents with depth info
- [x] `GET /disasm` -- disassemble RAM range (?start=0&count=32)
- [x] `GET /ram` / `POST /ram` -- read/write raw RAM words

### 6.3 Input Injection
- [x] `POST /input/key` -- inject key press/release event into VM keyboard port (0xFFF)
- [x] `POST /input/mouse` -- set mouse x, y, button state via memory-mapped registers
- [x] WebSocket endpoint `/ws/input` for streaming key/mouse events (low-latency interaction)

### 6.4 Multi-Agent Sandbox
- [x] Refactor VM to support multiple independent instances (VM pool) — `src/vm_pool.rs`, VmPool struct with HashMap of isolated sandboxes, 12 tests
- [x] Each agent gets isolated memory space, own registers, own screen region — each Sandbox wraps independent GasmAgent/VM
- [x] `POST /api/sandbox/create` -- allocate a new sandboxed VM
- [x] `DELETE /api/sandbox/:id` -- tear down a sandbox
- [x] Rate limiting and resource caps per sandbox (max cycles, max memory) — SandboxCaps struct

## Phase 7: Inter-Process Communication

*Bridge to Sovereignty Ladder Milestone 5 (Shared-Memory IPC)*

- [x] Define IPC memory region in VM address space (e.g., 0xFE00-0xFEFF)
- [x] Implement SEND opcode: write message to target process's mailbox region — memory-mapped write to 0xFE03 triggers mailbox send
- [x] Implement RECV opcode: check own mailbox, block if empty (scheduler puts VM in Waiting state) — memory-mapped write to 0xFE06 dequeues (non-blocking, returns status=4 if empty)
- [x] Implement PEEK opcode: non-blocking mailbox check (returns 0 if empty, msg if available) — memory-mapped read at 0xFE08 peeks without consuming
- [ ] Add process-to-process message queue tests (producer/consumer pattern)
- [ ] Add IPC demo: two programs exchanging pixel coordinates via mailbox
- [ ] Add PING/PONG demo: process A sends, process B echoes back

## Phase 8: The Glyph Compiler (CPU-side)

*Bridge to Sovereignty Ladder Milestones 6-8 (Parsing & Assembly)*

### 8.1 Mnemonic Matching
- [x] Build opcode lookup table (mnemonic string -> opcode byte) as Rust struct — `name()` in `opcodes.rs`, parser in `assembler.rs`
- [x] Implement tokenizer: split `.gasm` lines into [label, mnemonic, args] — `parser.rs`
- [x] Implement mnemonic resolver: match mnemonics against opcode table — `assembler.rs` two-pass pipeline
- [x] Tests: mnemonic resolution covered by `tests/micro_asm.rs` (31 tests)

### 8.2 Operand Parsing
- [x] Parse register references: "r0"-"r15" -> register index — `parser.rs`
- [x] Parse decimal immediates: "42" -> 42 — `parser.rs`
- [x] Parse hex immediates: "0xFF" -> 255 — `parser.rs`
- [x] Parse label references: resolve to address after first pass — two-pass in `assembler.rs`
- [x] Handle indirect addressing: "[r3]" -> memory dereference flag — `parser.rs`

### 8.3 Full Assembler Pipeline
- [x] Two-pass assembler: pass 1 collects labels, pass 2 emits bytes — `assembler.rs`
- [x] Support `.data` and `.text` sections — `assembler.rs`
- [x] Support `.asciz` string literals — `assembler.rs`
- [x] Support `.include` file inclusion — `assembler.rs`
- [x] Support `.macro` definition and expansion — `assembler.rs`
- [x] Error reporting with line numbers and context — `assembler.rs`
- [x] Self-hosting test: assembler can assemble its own source — `tests/micro_asm.rs`, `programs/micro-asm.asm`

## Phase 9: The Text Editor VM

*Bridge to Sovereignty Ladder Milestones 10a-10c (Editor Substrate)*

- [x] Design text buffer layout in VM memory (cursor pos, line count, char array) — programs/mini-editor.gasm (0x1000 buffer)
- [x] Implement INSERT opcode or routine: add character at cursor, shift buffer — mini-editor insert logic
- [x] Implement DELETE opcode or routine: remove character at cursor, shift buffer — backspace handler
- [x] Implement cursor movement: left, right, up, down (with line wrapping) — left/right arrows in mini-editor
- [x] Connect keyboard port to editor: scancodes -> editor actions — reads from 0xFFF
- [x] Render text buffer to screen region using existing DRAW/blit primitives — TEXT opcode rendering
- [ ] Add scrolling for buffers longer than visible rows — scroll offset field exists but not fully implemented
- [x] Test: type "Hello, World!" and see it on screen — tests/mini_editor.rs (14 tests)

## Phase 10: Edit-Compile-Execute Loop

*Bridge to Sovereignty Ladder Milestones 10d-10e (Sovereignty Event Horizon)*

- [ ] Editor VM writes buffer to a known memory region as "source file"
- [ ] Assembler VM reads from that region, emits bytecode to another region
- [ ] Parent VM spawns child from assembled bytecode using process spawn
- [ ] Shared flag region: editor sets "dirty" flag, assembler polls it
- [ ] Compile-on-save: editor signals assembler after each buffer change
- [ ] Full loop test: edit source -> compile -> run -> see output on screen
- [ ] Error display: assembler errors routed back to editor screen region

## Phase 11: Window Manager 2.0

*Bridge to Sovereignty Ladder Milestone 9 (Spatial Router)*

- [ ] Define Window Table struct: array of (vm_id, x, y, w, h, z_order, visible)
- [ ] VM 0 acts as compositor: reads Window Table, blits each VM's screen region to correct position
- [ ] Mouse hit testing: compositor reads mouse x/y, determines which window was clicked
- [ ] Route mouse/key events to the VM that owns the hit window (via IPC mailbox)
- [ ] Window focus tracking: only forward keyboard events to focused window
- [ ] Window dragging: click title bar region, update x/y in Window Table on mouse move
- [ ] Overlapping windows: z-order determines blit sequence (painter's algorithm)
- [ ] Demo: editor in window 1, assembler output in window 2, shell in window 3

## Phase 12: User Sessions & Permissions

- [ ] Session struct: user_id, permission_mask, owned_vm_ids
- [ ] Permission levels: READ (view screen), WRITE (send input), EXECUTE (run programs), ADMIN (all)
- [ ] Login syscall: authenticate, create session, set permission mask
- [ ] Permission checks on syscall entry: IPC, file I/O, process spawn
- [ ] Session timeout and cleanup
- [ ] Multi-user demo: two agents in separate sessions, isolated windows

## Phase 13: GPU-Native Foundations

*The Sovereignty Ladder -- from CPU emulation to GPU residency*

### 13.1 WGSL Compute Shader Prototype
- [ ] Port the core VM execute loop to a WGSL compute shader
- [ ] Memory as storage buffer (read/write/atomic)
- [ ] Single instruction dispatch: host sends opcode + args, shader executes
- [ ] Test: LDI r3, 42 via shader, read back r3 from storage buffer

### 13.2 Persistent Kernel Loop
- [ ] Implement host-driven dispatch loop: GPU executes N instructions, signals host, repeat
- [ ] VM state entirely in storage buffer (registers, PC, SP, memory)
- [ ] Context switch between VMs by swapping register set in buffer
- [ ] Benchmark: instructions/second on GPU vs CPU

### 13.3 Spatial Memory Layout
- [ ] Define Hilbert-curve address mapping for VRAM regions (kernel, apps, atlas, screen)
- [ ] Implement Hilbert index -> linear address conversion
- [ ] Implement linear address -> Hilbert index conversion
- [ ] Test: write to spatial coordinate, read back via linear address, verify match

### 13.4 Self-Replication on GPU
- [ ] Implement GLYPH_WRITE opcode in shader: write 32-bit value to arbitrary VRAM address
- [ ] Test: copy a program from one VRAM region to another using only shader ops
- [ ] Test: modify an immediate value in a copied program (self-modification)
- [ ] Implement SPATIAL_SPAWN opcode: allocate new VM region, set entry point, register with scheduler

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
- [x] Full bootstrap (micro-asm.asm compiles itself)

**Batch 5 -- Games (proof the system works end-to-end):**
- [x] Snake game
- [x] Paint program
- [x] Text adventure

**Batch 6 -- The OS Layer (when games prove the foundation):**
- [x] Process scheduler (needed when snake + editor run together)
- [x] Filesystem (needed when you want to save your snake high score)
- [x] Memory management (alloc/free within VM, heap registers 0xFFD0-0xFFD5, lib/alloc.gasm, alloc-demo, alloc-stress)

**Batch 7 -- VM Hardening (only when programs hit walls):**
- [x] Stack overflow protection (if recursion hits limit)
- [x] Memory protection (if programs corrupt each other)
- [x] Interrupt vector table (needed for event-driven programs)
- [x] Timer interrupt (if frame timing is needed)
- [x] Debug registers (if complex programs can't be debugged)

**Batch 8 -- The World Outside (see Phase 6 for detailed decomposition):**
- [x] REST API bridge (tiny_http, 31 endpoints: 18 core + 13 sandbox, sandbox integration tests)
- [x] Audio support
- [x] Multi-agent execution (VmPool, sandbox API with create/destroy/run/state/screen/reset/load/step/resume/input)
