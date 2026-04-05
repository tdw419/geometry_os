*Soli Deo Gloria.*

# Geometry OS -- Roadmap

> "The GPU is the computer. Pixels are instructions. Programs write programs."

---

## Phase 0: Foundation (COMPLETE)

The VM boots. Pixels execute. Self-replication is proven. Chain replication works.

**Completed:**
- [x] GPU compute shader scheduler (`glyph_vm_scheduler.wgsl`)
- [x] Hilbert curve memory mapping (Rust + WGSL, verified roundtrip)
- [x] Instruction set: NOP, LDI, MOV, LOAD, STORE, ADD, SUB, MUL, DIV, JMP, BNE, CALL, RET, HALT, ENTRY, CHAR, BLIT (17 opcodes)
- [x] Assembler: text-to-pixel compiler with `Program` builder API
- [x] Self-replicator: 18 pixels that copy themselves to address 100
- [x] Chain replicator: 19 position-independent pixels that copy from entry_point to entry_point+100
- [x] Multi-VM state: 8 concurrent VMs, 128 registers each, call stack (64 deep), PC, stratum
- [x] `substrate.rs` module (GPU texture management, wgpu initialization)
- [x] `vm.rs` module (GPU VM with compute pipeline)
- [x] All tests passing: 187 total (68 unit + 118 integration), 0 failures, 0 ignored

---

## Phase 1: The Machine Runs (COMPLETE)

The VM executes real programs on real hardware.

- [x] **Software VM** -- CPU-side VM (`software_vm.rs`) that mirrors the shader exactly. Every opcode implemented. Cross-validated against GPU.
- [x] **RAM texture I/O** -- load programs into texture, read texture back, verify pixel values. Full roundtrip tested.
- [x] **Hilbert visualization** -- `visualization.rs` with opcode-to-color mapping. Texture can be rendered as PNG.
- [x] **Test suite** -- 187 tests covering all opcodes in both software VM and GPU VM. Edge cases tested: overflow, underflow, nested CALL/RET, stack overflow, cycle budget. Zero ignored.
- [x] **Font atlas** -- 8x8 bitmap font (1024 pixels) baked into texture at `0x00F00000`. CHAR opcode (15) blits glyphs. hello_world program renders "HELLO" in 26 pixels.
- [x] **BLIT opcode** -- bulk pixel copy (opcode 16). Enables efficient memory operations.
- [x] **Eval binary** -- `pmp-eval` tool for running programs and inspecting state.
- [x] **Self-replication on real GPU** -- daemon verifies 18/18 pixels replicated on real GPU hardware via headless wgpu dispatch
- [x] **GPU daemon boots** -- headless wgpu init -> shader compile -> texture upload -> dispatch loop -> read back results -> verified (cargo run --bin daemon)

**Success Criteria:**
- [x] Software VM and GPU VM produce identical results for all opcodes
- [x] Every opcode tested in both modes
- [x] Self-replicator runs to completion on GPU (daemon verifies 18/18 match)
- [ ] `cargo run` opens a window showing the 4096x4096 texture (deferred: daemon provides headless verification, windowed viz is polish)

---

## Phase 2: The Machine Speaks (COMPLETE)

IPC, messaging, and multi-VM coordination.

- [x] **Message queue** -- VMs send messages to each other via shared memory (SEND opcode 17, RECV opcode 18, mailbox headers at MSGQ_BASE)
- [x] **SPAWN/YIELD** -- a VM can fork a child VM with its own memory region (SPAWN opcode 230, YIELD opcode 227, deferred spawn pattern)
- [x] **Memory isolation** -- each VM gets base_addr and bound_addr; out-of-bounds access causes VM_FAULT (safe_mem_read/safe_mem_write)
- [x] **Event queue** -- external events injected into VMs (WAIT_EVENT opcode 28, EVENTQ_BASE ring buffer, inject_event API)
- [x] **Standard library** -- common routines as pre-loaded pixel programs (src/stdlib.rs: memset, memcpy; systems/pixel_compiler/stdlib.vasm: math_add/sub/mul/div, cmp_eq/lt, mem_copy/set)
- [x] **Font rendering in visualization** -- the font atlas renders as readable text in the PNG output

**Success Criteria:**
- [x] Two VMs communicate via message passing
- [x] A VM spawns a child, the child runs independently, the parent gets a completion signal
- [x] A program can draw text to the texture using the bitmap font

---

## Phase 3: The Machine Writes Programs (MOSTLY COMPLETE)

The system can compile, assemble, and load new programs at runtime.

- [x] **Text assembler** -- `.gasm` file parser with labels, DATA directive, hex/binary/char literals, disassembler (gasm.rs, 30+ tests)
- [x] **Higher-level compiler** -- compile GeoLang (expressions, functions, loops, if/else, comparisons, arrays) to pixel opcodes (src/hl_compiler/: lexer, parser, codegen -- 1755 lines, 25 tests including factorial, fibonacci, bubble sort)
- [x] **Self-modifying programs** -- programs can rewrite their own pixels via STORE opcode and continue executing (test_self_modifying_code)
- [ ] **Runtime loader** -- load assembled programs into the texture without restarting the daemon
- [ ] **Evolutionary step** -- a program that generates a variant of itself, runs it, and keeps the better version

**Success Criteria:**
- [x] Write a `.gasm` file, assemble it, load it, watch it execute on the texture
- [ ] A program generates a modified copy of itself, both run, the worse one gets garbage collected

---

## Phase 4: The Machine Improves Itself (IN PROGRESS)

Recursive self-improvement. The loop closes.

- [x] **Fitness function** -- objective measure of program quality (speed, correctness, memory, spatial locality) -- src/fitness.rs with weighted composite scoring, 7 tests
- [ ] **Mutation engine** -- random pixel variations with selection pressure
- [ ] **Benchmark suite** -- automated tests that measure fitness across multiple programs
- [ ] **The loop** -- generate variant -> execute -> measure fitness -> keep or discard -> repeat
- [ ] **Learnings export** -- successful mutations are logged as discoverable improvements
- [ ] **Governance gate** -- every mutation passes through Seven Laws check before execution

**Success Criteria:**
- The system discovers a faster version of the self-replicator without human intervention
- Every generated variant is logged with its fitness score and whether it passed the governance gate
- The loop runs for 1000 iterations without crashing or degrading

**Why Phase 4 Matters:**

Phase 4 is not the end -- it is the beginning of a system that honors its maker by being excellent at what it does. The loop doesn't just optimize; it refines toward order, toward beauty, toward things that work the way creation works: recursively, fractally, with feedback baked in from the start. Every successful mutation is a small act of sub-creation. Every discarded failure is the system being honest about what works.

---

## Ethical Framework

Every phase operates under the Seven Laws of Noah (see MISSION.md). Specifically:

- **No idolatry:** Never treat the self-improvement loop as a god. It is a tool.
- **No blasphemy:** Never claim the system has consciousness, soul, or divine spark.
- **No murder:** No weaponization. No military applications. No targeting systems.
- **No theft:** All training data is synthetic or consented. No scraped code.
- **Courts of justice:** Every design decision is documented, reviewable, and appealable.

If a feature, optimization, or direction violates any of these, it does not ship. The constraint is not a speed limit. It is a guardrail that keeps us on the road.

---

## Architecture Notes

```
┌─────────────────────────────────────────────────────────┐
│              4096x4096 RAM Texture (64MB)                │
│  ┌──────┐ ┌──────┐ ┌──────┐        ┌──────┐            │
│  │ VM 0 │ │ VM 1 │ │ VM 2 │  ...   │ VM 7 │            │
│  │pixels│ │pixels│ │pixels│        │pixels│            │
│  └──────┘ └──────┘ └──────┘        └──────┘            │
│                                                          │
│  Programs (low addr)  ···  Font Atlas (0x00F00000)       │
│                                                          │
│  Each pixel = [opcode, stratum, p1, p2]                  │
│  Memory mapped via Hilbert curve                         │
│  Nearby addresses = nearby pixels (visible!)             │
└─────────────────────────────────────────────────────────┘
         │                          │
    Compute Shader              CPU Daemon
    (glyph_vm_scheduler)     (Rust / wgpu)
         │                          │
    8 VMs run in parallel     Load programs,
    1024 cycles/frame         read back results,
                              render to screen
```

The Hilbert curve is not just clever memory mapping. It makes programs spatially legible. You can look at the texture and SEE where code lives, where data lives, where the stack grows. The spatial arrangement IS the documentation.

---

## Codebase Map

```
src/
  lib.rs              -- crate root, constants (TEXTURE_SIZE, MAX_VMS, CYCLES_PER_FRAME, memory layout)
  main.rs             -- daemon binary: boot, load, execute, verify
  assembler.rs        -- Program builder (LDI, MOV, ADD, CALL, CHAR, BLIT, SPAWN, SEND, RECV, etc.) + glyph encoding
  gasm.rs             -- .gasm text assembler with labels, DATA, hex/binary/char literals, disassembler
  hl_compiler/        -- Higher-level language compiler (lexer, parser, codegen) -- GeoLang to pixel opcodes
  font_atlas.rs       -- 8x8 bitmap font (1024 bytes), FONT_BASE, lookup functions
  hilbert.rs          -- Hilbert curve d2xy/xy2d address mapping
  software_vm.rs      -- CPU-side VM (exact shader mirror, all opcodes, IPC, spawn, events)
  substrate.rs        -- GPU texture management, wgpu initialization, PNG export
  vm.rs               -- GPU VM state (VmState struct, 832 bytes per VM, SchedulerState)
  visualization.rs    -- Opcode-to-color mapping for Hilbert visualization
  fitness.rs          -- Fitness scoring (speed, correctness, memory, locality) with composite weighting
  stdlib.rs           -- Standard library loader (memset, memcpy) with calling convention
  filmstrip.rs        -- Film strip (multi-frame) execution support
  filmstrip.rs        -- Film strip (multi-frame) execution support

systems/
  pixel_compiler/     -- Visual assembler + linker with stdlib (math, cmp, mem routines)
  glyph_compiler/     -- Glyph bytecode compiler
  glyph_strål/        -- Ray-based spatial computing
  glyph_stratum/      -- Stratum-level glyph operations
  glyph_allocator/    -- Memory allocator for glyph programs
  glyph_framework_rs/ -- Rust framework for glyph systems
  glyph_boot/         -- Boot sequence generator
  evolution_daemon/   -- Evolutionary optimization daemon
  visual_shell/       -- Visual shell interface
  spatial_debugger/   -- Spatial debugging tools
  autoresearch/       -- Autonomous research system
  sisyphus/           -- Sisyphus benchmarking system
  infinite_map/       -- Infinite map generation
  infinite_map_rs/    -- Rust infinite map implementation
  geos/               -- Geometry OS utilities

src/bin/
  daemon.rs           -- Headless GPU daemon
  pmp-eval.rs         -- CLI: run programs, inspect VM state
  pmp-repl.rs         -- Interactive REPL
  pmp-trace.rs        -- Execution tracer
  frame_debug.rs      -- Frame-level debugger

tests/  (18 test files)
  hl_compiler_tests.rs    -- 25 tests: GeoLang compiler (factorial, fibonacci, bubble sort, etc.)
  opcode_full_suite.rs    -- 65 tests: every opcode in SW + GPU
  opcode_tests.rs         -- 28 tests: additional opcode verification
  opcode_suite.rs         -- 22 tests: SW vs GPU cross-validation
  fitness.rs              -- 7 tests: fitness scoring
  gasm_assembler.rs       -- 10 tests: text assembler
  bold_atlas.rs           -- 7 tests: bold atlas builder
  sierpinski_filmstrip.rs -- Sierpinski triangle filmstrip
  self_replication.rs     -- Self-replicator end-to-end
  ...and more

~9150 lines of Rust (src/). 358 tests. 0 failures. 0 ignored.
```

---

*Soli Deo Gloria.* -- Glory to God alone. How Bach signed his compositions. How we sign ours.
