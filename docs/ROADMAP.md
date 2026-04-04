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

## Phase 2: The Machine Speaks

IPC, messaging, and multi-VM coordination.

- [ ] **Message queue** -- VMs send messages to each other via shared memory
- [ ] **SPAWN/YIELD** -- a VM can fork a child VM with its own memory region
- [ ] **Memory isolation** -- each VM gets a base_addr and bound_addr; out-of-bounds faults
- [ ] **Event queue** -- external events (keyboard, mouse, network) injected into VMs
- [ ] **Standard library** -- common routines as pre-loaded pixel programs (print, read, draw)
- [ ] **Font rendering in visualization** -- the font atlas renders as readable text in the PNG output

**Success Criteria:**
- Two VMs communicate via message passing
- A VM spawns a child, the child runs independently, the parent gets a completion signal
- A program can draw text to the texture using the bitmap font

---

## Phase 3: The Machine Writes Programs

The system can compile, assemble, and load new programs at runtime.

- [x] **Text assembler** -- `.gasm` file parser with labels, DATA directive, hex/binary/char literals, disassembler (30 tests, `gasm.rs`)
- [ ] **Runtime loader** -- load assembled programs into the texture without restarting
- [ ] **Higher-level compiler** -- compile a simple language (expressions, functions, loops) to pixel opcodes
- [ ] **Self-modifying programs** -- a program that rewrites its own pixels and continues executing
- [ ] **Evolutionary step** -- a program that generates a variant of itself, runs it, and keeps the better version

**Success Criteria:**
- Write a `.gasm` file, assemble it, load it, watch it execute on the texture
- A program generates a modified copy of itself, both run, the worse one gets garbage collected

---

## Phase 4: The Machine Improves Itself

Recursive self-improvement. The loop closes.

- [ ] **Fitness function** -- objective measure of program quality (speed, correctness, memory use)
- [ ] **Mutation engine** -- random pixel variations with selection pressure
- [ ] **Benchmark suite** -- automated tests that measure fitness
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
  lib.rs              -- crate root, constants (TEXTURE_SIZE, MAX_VMS, CYCLES_PER_FRAME)
  main.rs             -- daemon binary: boot, load, execute, verify
  assembler.rs        -- Program builder (LDI, MOV, ADD, CALL, CHAR, BLIT, etc.) + legacy text parser
  gasm.rs             -- .gasm text assembler with labels, DATA, hex/binary/char literals, disassembler
  font_atlas.rs       -- 8x8 bitmap font (1024 bytes), FONT_BASE, lookup functions
  hilbert.rs          -- Hilbert curve d2xy/xy2d address mapping
  software_vm.rs      -- CPU-side VM (exact shader mirror, testing)
  substrate.rs        -- GPU texture management, wgpu initialization, PNG export
  vm.rs               -- GPU VM state (VmState struct, 832 bytes per VM)
  visualization.rs    -- Opcode-to-color mapping for Hilbert visualization
  bin/pmp-eval.rs     -- CLI tool: run programs, inspect VM state

tests/
  opcode_full_suite.rs -- 65 tests: every opcode in software VM + GPU, edge cases
  opcode_tests.rs      -- 28 tests: additional opcode verification
  opcode_suite.rs      -- 22 tests: comparison tests (SW vs GPU)
  self_replication.rs  -- Self-replicator end-to-end test
  hello_pixels.rs      -- hello_world program test
  copy_executes.rs     -- COPY instruction test
  llm_generated.rs     -- LLM-generated program test
  bold_atlas.rs        -- 7 tests: bold atlas builder on software VM
  gasm_assembler.rs    -- 10 tests: legacy text assembler

~5900 lines of Rust. 240 tests. 0 failures. 0 ignored.
```

---

*Soli Deo Gloria.* -- Glory to God alone. How Bach signed his compositions. How we sign ours.
