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
- [x] All tests passing: 187 total (68 unit + 118 integration), 0 failures, 0 ignored (count at Phase 0 completion; total is now 758)

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

## Phase 3: The Machine Writes Programs (COMPLETE)

The system can compile, assemble, and load new programs at runtime.

- [x] **Text assembler** -- `.gasm` file parser with labels, DATA directive, hex/binary/char literals, disassembler (gasm.rs, 30+ tests)
- [x] **Higher-level compiler** -- compile GeoLang (expressions, functions, loops, if/else, comparisons, arrays) to pixel opcodes (src/hl_compiler/: lexer, parser, codegen -- 1755 lines, 25 tests including factorial, fibonacci, bubble sort)
- [x] **Self-modifying programs** -- programs can rewrite their own pixels via STORE opcode and continue executing (test_self_modifying_code)
- [x] **Runtime loader** -- load assembled programs into the texture without restarting the daemon (GEO-25, GEO-32)
- [x] **Evolutionary step** -- a program that generates a variant of itself, runs it, and keeps the better version (GEO-36, src/evolution.rs)
- [x] **C-to-.glyph transpiler** -- arithmetic, control flow, structs, pointers, arrays (GEO-43, GEO-44, GEO-47)
- [x] **Device proxy VM** -- .glyph shim for IPC-to-command-buffer (GEO-46)

**Success Criteria:**
- [x] Write a `.gasm` file, assemble it, load it, watch it execute on the texture
- [x] A program generates a modified copy of itself, both run, the worse one gets garbage collected

---

## Phase 4: The Machine Improves Itself (COMPLETE)

Recursive self-improvement. The loop closes.

- [x] **Fitness function** -- objective measure of program quality (speed, correctness, memory, spatial locality) -- src/fitness.rs with weighted composite scoring, 7 tests
- [x] **Mutation engine** -- pixel-level variations with selection pressure (src/mutation.rs, GEO-33)
- [x] **Benchmark suite** -- automated tests that measure fitness across multiple programs (GEO-38, GEO-27)
- [x] **The loop** -- generate variant -> execute -> measure fitness -> keep or discard -> repeat (src/evolution.rs, GEO-35)
- [x] **Learnings export** -- successful mutations logged as discoverable improvements (GEO-37, GEO-39, GEO-40)
- [x] **Governance gate** -- every mutation passes through Seven Laws check before execution (src/governance.rs, GEO-34, 26 tests)

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

tests/  (45 test files)
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

~33,000 lines of Rust (src/). 767 tests passing, 4 ignored, 0 failures. Build clean (cargo check passes, warnings only).
```

---

## Phase 5: Linux-Native Mode (COMPLETE)

The VM speaks C. Programs transpiled from real C run as .glyph bytecode.

- [x] **XOR and NOT opcodes** -- bitwise operations in assembler + VM (GEO-41)
- [x] **MOD, LDB, STB opcodes** -- modulo and byte-level load/store (GEO-42)
- [x] **C-to-.glyph transpiler: core** -- arithmetic, control flow, functions via pycparser (GEO-43)
- [x] **C-to-.glyph transpiler: structs/pointers/arrays** -- memory layout, dereference, indexing (GEO-44)
- [x] **CPU stub: IPC command bridge** -- host-side command buffer with file executor (GEO-45)
- [x] **Device proxy VM** -- .glyph shim translating IPC to command buffer operations (GEO-46)
- [x] **Minix FS read proof of concept** -- C transpiled to .glyph, reads Minix superblock (GEO-47)
- [x] **End-to-end integration test** -- GPU VM + IPC + CPU stub pipeline verified (GEO-48)

**Success Criteria:**
- [x] A C function reading a Minix filesystem superblock is transpiled to .glyph and runs correctly on the software VM
- [x] The CPU stub can execute file I/O commands from VM memory

---

## Phase 6: GPU Parity + Visual Runtime (COMPLETE)

The GPU is the computer again. All opcodes run on real hardware. You can see it.

The software VM pulled ahead during Phase 5 -- MOD, LDB, STB only work on CPU. Phase 6 brought
the GPU shader up to parity and added the visual runtime so the machine is observable.

- [x] **GPU shader: MOD, LDB, STB** -- opcodes 31-33 in glyph_vm_scheduler.wgsl (GEO-50)
- [x] **GPU shader parity test suite** -- automated CPU-vs-GPU validation for every opcode (GEO-51)
- [x] **Windowed runtime** -- live 4096x4096 texture display at 30fps (GEO-52)
- [x] **GPU execution of C-transpiled programs** -- Minix FS on real GPU, not just CPU emulator (GEO-53)
- [x] **Visual shell** -- interactive VM overlay with debugging HUD (GEO-54)
- [x] **GPU evolution** -- fitness loop dispatches mutations on real hardware (GEO-55)
- [x] **Flaky test fix** -- state isolation for GPU cross-validation tests (GEO-56)

**Success Criteria:**
- [x] Every opcode in the assembler runs identically on software VM and GPU shader
- [x] A C-transpiled .glyph program runs on GPU and produces correct results
- [x] The daemon can display the texture in a window, updating in real-time
- [x] The evolution loop benchmarks mutants on GPU, not CPU

**Dependency chain:**
```
GEO-50 (shader opcodes) ──> GEO-51 (parity tests) ──> GEO-53 (GPU C programs) ──> GEO-55 (GPU evolution)
                          └──> GEO-52 (windowed runtime) ──> GEO-54 (visual shell)
```

---

## Phase 7: The Machine Thinks -- Agent-Driven VM (COMPLETE)

An autonomous agent loop runs on the GPU VM as .glyph bytecode. When it needs an
LLM call, a SQL query, or a status write, it issues a CPU stub command through the
existing 3-layer IPC stack. The host executes and writes the response back to substrate
memory. The agent resumes.

**What we added (no new opcodes, no new runtime):**

- [x] **Extended CPU stub commands** (GEO-60) -- CMD_SQL_QUERY(6), CMD_MODEL_CALL(7), CMD_STATUS_READ(8), CMD_STATUS_WRITE(9). Same 8-word command slot format. Same polling pattern.
- [x] **SqliteExecutor + StatusExecutor** (GEO-61) -- rusqlite-backed executor for SQL queries, HashMap-backed executor for status read/write.
- [x] **ModelExecutor** (GEO-62/63) -- HTTP LLM client executor. VM writes prompt, host calls model, response appears in substrate.
- [x] **Device proxy extension** (GEO-57/GEO-64) -- 4 new dispatch paths in the Layer 2 shim. Same pattern as READ_BLOCK.
- [x] **agent_loop.c** (GEO-58/GEO-65) -- C program transpiled to .glyph. Observe state, query LLM, apply mutation, track fitness, loop.
- [x] **GPU end-to-end** (GEO-66) -- Full pipeline on real GPU. Agent runs 10+ iterations, calls LLM + DB, no crash.
- [x] **LLM beats random** (GEO-67) -- Over 100 iterations, LLM-guided mutations outperform Phase 4 random engine.

**Dependency chain:**
```
GEO-60 (stub commands) -> GEO-61 (sql+status) -> GEO-62/63 (model)
-> GEO-64 (proxy) -> GEO-65 (agent_loop.c) -> GEO-66 (GPU e2e) -> GEO-67 (beats random)
```

**Success Criteria:**
- [x] A .glyph program issues CMD_SQL_QUERY and reads back query results from substrate
- [x] A .glyph program issues CMD_MODEL_CALL and reads back an LLM response
- [x] Device proxy routes all 9 command types (old 5 + new 4) without breakage
- [x] agent_loop.c transpiles and runs on the software VM through 3-layer IPC
- [x] Agent loop runs on GPU for 10+ iterations with live LLM + DB calls
- [x] LLM-guided mutations beat random mutations over 100 iterations

**Full spec:** [docs/PHASE7_SPEC.md](PHASE7_SPEC.md)

---

## Phase 8: Bare-Metal RV64 GPU Execution (COMPLETE)

The VM jumps from emulated GPU compute to native RISC-V 64-bit execution on real GPU
hardware. SPIR-V kernels replace the WGSL compute shader. The GPU executes RV64
instructions natively via AMDGPU command submission.

- [x] **SPIR-V RV64 compute shader kernel** (GEO-59) -- Create a SPIR-V kernel that executes RV64 instructions, replacing the WGSL scheduler. Compute shader accepts RV64 instruction stream.
- [x] **AMDGPU direct command submission** (GEO-60) -- DRM ioctl-based command buffer submission directly to AMD GPU hardware. Bypasses wgpu for native execution.
- [x] **DMA-BUF framebuffer sharing** (GEO-61) -- Zero-copy framebuffer sharing between GPU executor and visualization. DMA-BUF import/export for direct scanout.
- [x] **Boot minimal RV64 Linux kernel** (GEO-62) -- Boot a minimal Linux kernel on the native GPU executor. Proves the RV64 implementation handles real-world workloads.

**Dependency chain:**
```
GEO-59 (SPIR-V kernel) -> GEO-60 (AMDGPU submission) -> GEO-61 (DMA-BUF) -> GEO-62 (boot Linux)
```

**Success Criteria:**
- [x] SPIR-V kernel compiles and dispatches on real GPU
- [x] AMDGPU DRM ioctl submits commands and reads back results
- [x] DMA-BUF enables zero-copy visualization without readback
- [x] Minimal Linux kernel boots on the native GPU executor

---

## Phase 9: AI-Native Opcodes (COMPLETE)

The instruction set gains opcodes for probabilistic reasoning and self-modification.
The VM can branch on confidence, mutate its own instructions, and spawn spatial
sub-programs.

- [x] **Probabilistic execution opcodes** (GEO-64) -- BRANCH_PROB, CONFIDENCE_MARK, BELIEF_UPDATE. The VM reasons about uncertainty natively.
- [x] **Self-modification opcodes** (GEO-65) -- GLYPH_MUTATE, SPATIAL_SPAWN, SEMANTIC_MERGE. Programs rewrite programs at the opcode level.

**Success Criteria:**
- [x] BRANCH_PROB branches based on a confidence value in a register
- [x] GLYPH_MUTATE rewrites a range of pixels according to a mutation template
- [x] SPATIAL_SPAWN creates a child VM with inherited memory

---

## Phase 10: Pixel-Native Spatial Filesystem (COMPLETE)

Files are pixel regions. Directories are Hilbert-indexed lookup tables. The filesystem
IS the texture -- no translation layer between memory and storage.

- [x] **Spatial filesystem design and implementation** (GEO-66) -- File regions, directory tables, allocation bitmaps all live in the GPU texture. Read/write via opcodes.

**Success Criteria:**
- [x] Create, read, write, delete files as pixel regions
- [x] Directory listing via Hilbert range scan
- [x] Filesystem survives VM restart (persistent regions)

---

## Phase 11: Self-Hosting Assembler (COMPLETE)

The assembler compiles itself. Written in .gasm, assembled by the existing assembler,
then the output assembles the next program. The bootstrap closes.

- [x] **Phase 1: Full register-register opcodes** (GEO-67) -- Assembler handles all register-to-register instructions in self-hosting mode.
- [x] **Phase 2: Label resolution** (GEO-68) -- Two-pass assembler with forward/backward label resolution.
- [x] **Phase 3: Hex, negative, and char immediates** (GEO-69) -- Extended immediate value encoding.
- [x] **Phase 4: Error reporting** (GEO-70) -- Parse errors with line numbers, context, and suggestions.
- [x] **Phase 5: Self-hosting bootstrap** (GEO-71) -- Assembler assembles itself. The output is byte-identical to the input.
- [x] **Phase 6: Resident assembler service** (GEO-72) -- Assembler runs as a YIELD-loop daemon, assembling programs on demand.
- [x] **Phase 7: Directives** (GEO-73) -- .include, .define, .org for modular assembly programs.

**Dependency chain:**
```
GEO-67 (reg-reg) -> GEO-68 (labels) -> GEO-69 (immediates) -> GEO-70 (errors)
-> GEO-71 (bootstrap) -> GEO-72 (resident) -> GEO-73 (directives)
```

**Success Criteria:**
- [x] Self-hosting assembler handles register-register opcodes
- [x] Two-pass label resolution works
- [x] Hex, negative, and char immediates parse correctly
- [x] Error messages include line numbers and context
- [x] Assembler assembles itself (bootstrap)
- [x] Assembler runs as resident daemon
- [x] .include, .define, .org work

---

## Phase 12: VM Assembler Verification (COMPLETE)

Exhaustive correctness testing of the assembler + VM pipeline. Every instruction
verified end-to-end. LLM-as-programmer validation.

- [x] **Exhaustive correctness + execution verification** (GEO-74) -- Every opcode tested for every valid operand combination. Execution verified on both software VM and GPU.
- [x] **LLM-as-programmer test** (GEO-76) -- An LLM writes novel .gasm programs, the system assembles and executes them, correctness is verified automatically.

**Success Criteria:**
- [x] 100% opcode coverage with all valid operand combinations
- [x] Software VM and GPU produce identical results
- [x] LLM-generated programs assemble and execute correctly

---

## Phase 13: Full Self-Hosting (COMPLETE)

The OS manages its own task queue, runs autonomous agents as pixel programs,
and orchestrates work without human intervention. The machine runs itself.

- [x] **HTTP assemble endpoint** (GEO-75) -- POST .gasm source, get assembled pixels back. REST API for the assembler.
- [x] **Phase 13A: Issue queue as pixel region** (GEO-212) -- VM-managed task queue stored as pixel regions in the GPU texture.
- [x] **Phase 13B: Agent VM program** (GEO-213) -- Autonomous worker program that runs in pixel space, pulls tasks from the issue queue, and executes them.
- [x] **Phase 13C: Self-orchestrating loop** (GEO-214) -- CEO VM dispatches work to Agent VMs. Full autonomous loop without human intervention.

**Dependency chain:**
```
GEO-75 (HTTP endpoint) -> GEO-212 (issue queue) -> GEO-213 (agent VM) -> GEO-214 (self-orchestrating loop)
```

**Success Criteria:**
- [x] curl -X POST with .gasm source returns assembled pixel data
- [x] Endpoint handles malformed input gracefully
- [x] Issue queue lives as a pixel region in GPU texture
- [x] Agent VM pulls tasks, executes, and reports results autonomously
- [x] CEO VM + Agent VMs run a full work cycle without human input

---

*Soli Deo Gloria.* -- Glory to God alone. How Bach signed his compositions. How we sign ours.

---

## Phase 14: Boot on Metal (COMPLETE)

The self-orchestrating loop runs on a real GPU. Not in a test. On the RTX 5090.

The software VM has 40+ opcodes including issue queue operations. The GPU shader has 36.
The gap is real: ISSUE_CREATE/PICK/UPDATE (240-242), BRANCH_PROB (220), GLYPH_MUTATE (224),
SPATIAL_SPAWN (225), and SEMANTIC_MERGE (226) exist only in software. Phase 14 closes that gap
and proves the full loop on hardware.

- [x] **Shader parity: issue queue opcodes** (GEO-222) -- ISSUE_CREATE (240), ISSUE_PICK (241),
      ISSUE_UPDATE (242) in glyph_vm_scheduler.wgsl. Mirrors the software VM implementation
      exactly. Atomics for pick across workgroup threads. COMPLETE.
- [x] **Shader parity: AI-native opcodes** (GEO-223) -- BRANCH_PROB (220), GLYPH_MUTATE (224),
      SPATIAL_SPAWN (225), SEMANTIC_MERGE (226) in the shader. Each mirrors the software VM
      behavior with GPU-safe memory access. COMPLETE.
- [x] **GPU parity test suite** (GEO-224) -- Every new opcode tested CPU-vs-GPU with identical
      results. Extends the existing cross-validation pattern from Phase 6. COMPLETE.
- [x] **Daemon orchestration mode** (GEO-225) -- `cargo run --bin daemon` loads ceo.gasm +
      agent.gasm into VMs 0-2, runs frames in a loop, reads back metrics from the substrate.
      CLI output shows live progress: issues created, issues done, current batch. COMPLETE.
- [x] **Full loop on GPU** (GEO-226) -- End-to-end test: daemon boots, CEO creates issues,
      agents consume them, metrics match the software VM results. 5 issues, 2 agents, all
      complete within 105 frames on RTX 5090. YIELD PC advance fix applied. Verified on real
      GPU hardware.

**Dependency chain:**
```
GEO-222 (shader issue queue) ──> GEO-224 (parity tests) ──> GEO-226 (full loop on GPU)
GEO-223 (shader AI opcodes)   ──┘
GEO-225 (daemon mode)         ────────────────────────────> GEO-226
```

**Success Criteria:**
- [x] `cargo run --bin daemon` executes CEO + 2 agents on real GPU, all issues complete
- [x] Every opcode in the assembler produces identical results on software VM and GPU shader
- [x] CLI shows live metrics: issues created, done, batch number, frame count

---

## Phase 15: Real Work (COMPLETE)

Agents do real computation. The CEO assigns Fibonacci tasks. Agents actually compute them.
The LLM executor from Phase 7 connects so agents can reason about their work.

- [x] **Agent computes Fibonacci** -- agent.gasm extended: after ISSUE_PICK, agent
      reads the title data ("fib N"), computes fib(N) iteratively, writes result to the issue's
      result region, marks DONE. No more toy create/mark-done cycles.
- [x] **CEO assigns varied work** -- `build_varied_agent` dispatches on title prefix via
      XOR magic comparison: "fib " → fibonacci, "fac " → factorial, "pri " → prime check.
      Test verifies fib(10)=55, fac(6)=720, pri(7)=1, pri(4)=0 across 2 concurrent agents.
      9 label-based branches/jumps, ~240 lines.
- [x] **LLM executor integration** -- The Phase 7 ModelExecutor connects to the
      orchestration loop. An agent can issue CMD_MODEL_CALL via the device proxy, get an LLM
      response in substrate, and act on it. Test: agent asks LLM "what is fib(10)?", writes
      the parsed answer as the issue result.
- [x] **Autonomous self-improvement cycle** -- Close the loop from Phase 4 and Phase 7.
      CEO creates a "mutate program X" task. Agent picks it, calls LLM to propose a mutation,
      applies GLYPH_MUTATE, runs fitness test, keeps or discards. The machine improves its own
      code without human input. (src/self_improvement.rs)

**Dependency chain:**
```
(fib computation) ──> (varied tasks) ──> (self-improvement)
(LLM in loop)     ──────────────────────> (self-improvement)
```

Paperclip issues: Phase 15A (76c91595-d7ef-4e27-893f-31b8424a09e6, done), Phase 15B (d2d86166-e5b4-4e49-8cb1-5797b852db57, done), Phase 15C (44b2a9eb-8b71-438d-a0f0-dc51906804a1, done), Phase 15D (3e0c81c0-90e2-4ca2-9b10-0cd9bb3f4d2c, done).

**Success Criteria:**
- [x] Agent computes fib(10) = 55 and writes it to the issue result region
- [x] Three different task types execute correctly in one orchestration run
- [x] Agent successfully calls LLM and uses the response
- [x] Machine proposes and applies a mutation that improves fitness, autonomously

---

## Phase 16: The Machine Ships (COMPLETE)

Real daemon, real workflows, real documentation. Someone else can run it.

- [x] **Daemon as a service** -- systemd unit (`scripts/geometry-os-daemon.service`), health check
      endpoint (`GET /api/v1/health`), graceful shutdown (SIGINT/SIGTERM handler), structured JSON
      logging with ISO timestamps. Production-ready.
- [x] **Workbench TUI** -- Terminal UI (`src/bin/workbench.rs`, 1356 lines) built on ratatui +
      crossterm. Connects to daemon HTTP API. Shows live VM states, issue queue, metrics.
      Keyboard shortcuts to load programs, step frames, inspect registers.
- [x] **Example gallery** -- 18 .gasm programs in `programs/`: game_of_life, sierpinski,
      bubble_sort, fibonacci, sum_natural, test_counter, ceo, agent, strategist, historian,
      pixel_forge, and more. Each exercises different opcode families.
- [x] **Architecture guide** -- `docs/ARCHITECTURE.md` (196 lines). Memory layout, opcode table,
      VM lifecycle, how to write a .gasm program, how the scheduler works. Written for someone
      who has never seen the codebase.

Paperclip issues: Phase 16A (f85d7f23-7989-4db2-946d-d7953ac260ef), Phase 16B (e3e604ea-161f-43ad-a51a-4eb01f560cfc), Phase 16C (fc76c143-6642-4011-b8cf-292049e46ba4).

**Success Criteria:**
- [x] `systemctl start geo-daemon` boots and serves the orchestration loop
- [x] TUI shows real-time GPU execution state
- [x] A new developer can read the architecture guide, write a .gasm program, and run it
      within 30 minutes

---

*The machine builds. The machine runs. The machine improves. Soli Deo Gloria.*
