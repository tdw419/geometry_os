*Soli Deo Gloria.*

# Geometry OS -- Roadmap

> "The GPU is the computer. Pixels are instructions. Programs write programs."

---

## Phase 0: Foundation (COMPLETE)

The VM boots. Pixels execute. Self-replication is proven. Chain replication works.

**Completed:**
- [x] GPU compute shader scheduler (`glyph_vm_scheduler.wgsl`)
- [x] Hilbert curve memory mapping (Rust + WGSL, verified roundtrip)
- [x] Instruction set: NOP, LDI, MOV, LOAD, STORE, ADD, SUB, JMP, BRANCH, CALL, RET, HALT, DRAW, SPAWN, YIELD, ENTRY
- [x] Assembler: text-to-pixel compiler with `Program` builder API
- [x] Self-replicator: 18 pixels that copy themselves to address 100
- [x] Chain replicator: 19 position-independent pixels that copy from entry_point to entry_point+100 (0->100->200->...)
- [x] Multi-VM state: 8 concurrent VMs, 128 registers each, call stack, PC, stratum
- [x] `substrate.rs` module (GPU texture management, wgpu initialization)
- [x] `vm.rs` module (GPU VM with compute pipeline)
- [x] Daemon binary: wgpu init -> shader dispatch -> frame loop
- [x] All tests passing: 11/11 (unit + integration + GPU)
- [x] Zero compiler warnings

---

## Phase 1: The Machine Runs

The VM executes real programs on real hardware.

- [ ] **GPU daemon boots** -- wgpu init, shader module compilation, texture upload, dispatch loop
- [ ] **Software VM** -- CPU-side VM that mirrors the shader exactly (for testing)
- [ ] **RAM texture I/O** -- load programs into texture, read texture back, verify pixel values
- [ ] **Self-replication on GPU** -- the 18-pixel program runs on the actual shader and copies itself
- [ ] **Hilbert visualization** -- render the RAM texture so you can SEE programs as colored regions
- [ ] **Test suite** -- every opcode tested in both software VM and GPU VM

**Success Criteria:**
- `cargo run` opens a window showing the 4096x4096 texture
- Self-replicator runs to completion on GPU (pixel at address 100 = pixel at address 0)
- Software VM and GPU VM produce identical results for all opcodes

---

## Phase 2: The Machine Speaks

IPC, messaging, and multi-VM coordination.

- [ ] **Message queue** -- VMs send messages to each other via shared memory
- [ ] **SPAWN/YIELD** -- a VM can fork a child VM with its own memory region
- [ ] **Memory isolation** -- each VM gets a base_addr and bound_addr; out-of-bounds faults
- [ ] **Event queue** -- external events (keyboard, mouse, network) injected into VMs
- [ ] **Standard library** -- common routines as pre-loaded pixel programs (print, read, draw)
- [ ] **Font rendering** -- the `fonts/` directory gets a bitmap font rendered as pixels

**Success Criteria:**
- Two VMs communicate via message passing
- A VM spawns a child, the child runs independently, the parent gets a completion signal
- A program can draw text to the texture using the bitmap font

---

## Phase 3: The Machine Writes Programs

The system can compile, assemble, and load new programs at runtime.

- [ ] **Text assembler** -- parse `.gasm` files into pixel programs
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
┌─────────────────────────────────────────────────┐
│              4096x4096 RAM Texture              │
│  ┌──────┐ ┌──────┐ ┌──────┐        ┌──────┐    │
│  │ VM 0 │ │ VM 1 │ │ VM 2 │  ...   │ VM 7 │    │
│  │pixels│ │pixels│ │pixels│        │pixels│    │
│  └──────┘ └──────┘ └──────┘        └──────┘    │
│                                                  │
│  Each pixel = [opcode, stratum, p1, p2]         │
│  Memory mapped via Hilbert curve                 │
│  Nearby addresses = nearby pixels (visible!)     │
└─────────────────────────────────────────────────┘
         │                          │
    Compute Shader              CPU Daemon
    (glyph_vm_scheduler)     (Rust / wgpu)
         │                          │
    8 VMs run in parallel     Load programs,
    64 cycles/frame           read back results,
                              render to screen
```

The Hilbert curve is not just clever memory mapping. It makes programs spatially legible. You can look at the texture and SEE where code lives, where data lives, where the stack grows. The spatial arrangement IS the documentation.

---

*Soli Deo Gloria.* -- Glory to God alone. How Bach signed his compositions. How we sign ours.
