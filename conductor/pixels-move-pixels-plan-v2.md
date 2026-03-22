# Plan v2: Pixels Move Pixels — The Reactive Substrate Path

> Supersedes `pixels-move-pixels-plan.md` (v1).
> Incorporates discoveries from the ASCII World Reactive Substrate Engine.

## What Changed Since v1

v1 proposed jumping straight to the GPU: implement `OP_GLYPH_WRITE` and `OP_GLYPH_MUTATE` in WGSL, then watch pixels self-replicate. That plan was architecturally sound but had a **bootstrap problem**: there was no working intermediate layer where a human and an AI could share the same visual state, iterate on the logic, and verify results before committing to the GPU substrate.

ASCII World solved that problem. We now have:

1. **Reactive Substrate Engine** — A server-side formula evaluator (`formula-engine.js`) that transforms data cells into rendered ASCII output. Templates contain `{{=BAR(cpu, 40)}}` and the server evaluates them. The agent posts `{"cpu": 0.85}` and the grid updates.

2. **VCC Bridge** — The GPU monitor agent (`gpu_monitor_agent.py`) extracts real SIT entries and glyph grid hashes from compiled `.rts.png` cartridges and verifies Visual Consistency Contracts (SHA-256 of the glyph grid segment).

3. **Formula Visibility Mode** — The browser viewer can toggle between rendered output and raw formulas (`[=BAR(cpu, 40)]`), making the computational logic of the substrate auditable by both human and AI.

4. **GeosASCII Compiler** — Already compiles `.ascii` → `.rts.png` with Glyph Grid + SIT (1920 entries, one per character cell) + State Buffer + Bootstrap header.

These components provide the **missing incubation layer** that v1 lacked.

## The v2 Architecture: Three Strata

```
┌─────────────────────────────────────────────────────────────────┐
│  STRATUM 3: GPU SOVEREIGN                                       │
│  Glyph VM (WGSL) executes SIT opcodes directly.                │
│  Pixels move pixels. No CPU. No Python. No Node.               │
│  Input: Hardware mailbox. Output: Framebuffer.                  │
├─────────────────────────────────────────────────────────────────┤
│  STRATUM 2: COMPILED CARTRIDGE                                  │
│  .rts.png binaries. GeosASCII compiler output.                  │
│  GPU-native format: Glyph Grid + SIT + State + Bootstrap.       │
│  Loaded by infinite_map_rs or micro_host.                       │
├─────────────────────────────────────────────────────────────────┤
│  STRATUM 1: REACTIVE ASCII (← WE ARE HERE)                     │
│  .ascii.tpl templates + formula-engine.js + cell store.         │
│  Human-readable. AI-writable. Browser-viewable.                 │
│  The incubator where logic is designed and verified.            │
└─────────────────────────────────────────────────────────────────┘
```

The key insight: **you don't jump from Stratum 1 to Stratum 3**. You ascend through Stratum 2. Each stratum is a valid execution environment. Logic proven at Stratum 1 compiles to Stratum 2, which loads into Stratum 3.

## Implementation Plan

### Phase 1: Coordinate-Aware Actions (Stratum 1 → Stratum 2 Bridge)
**Status: Ready to implement**

Currently, the viewer handles clicks as `[A] Button Label` → `gui_action: click, key: A`. This is symbolic. In the pixel world, there are no labels — only coordinates.

**Goal:** When the viewer detects a click at character position `(x, y)`, it sends `{type: "spatial_click", x: 12, y: 4}`. The server looks up `SIT[y * 80 + x]` from the compiled cartridge and executes the mapped opcode.

Steps:
- [ ] Add `POST /api/v1/ui/spatial_click` endpoint to sync-server.js
- [ ] Load SIT data from `.rts.png` cartridges into the cell store
- [ ] Map SIT opcodes to cell mutations (JUMP → update `active_view`, TOGGLE → flip a cell value)
- [ ] Update the HTML viewer to send `(x, y)` coordinates on character-cell clicks
- [ ] Verify: clicking `[A]` at position `(4, 4)` triggers the same action as the SIT entry at index `4*80+4`

### Phase 2: Formula-to-Opcode Compilation (Stratum 1 → Stratum 2)
**Status: Design phase**

The reactive template formulas are essentially a high-level programming language:
```
{{=IF(vcc_match == 1, "● CONSISTENT", "○ NOT VERIFIED")}}
```

This should compile to a SIT entry that evaluates a condition and writes one of two glyphs to a coordinate. The GeosASCII compiler needs to understand formula syntax and emit equivalent opcodes.

Steps:
- [ ] Define a formula-to-opcode mapping table:
  - `BAR(val, w)` → `OP_GLYPH_WRITE` repeated across `w` cells
  - `IF(cond, a, b)` → `OP_BRANCH` + two `OP_GLYPH_WRITE` paths
  - `STATUS(val, thresholds...)` → Chain of `OP_BRANCH` instructions
  - `SPARKLINE(arr, w)` → `OP_GLYPH_MUTATE` with computed block characters
- [ ] Extend `geos_ascii_compiler.py` to parse `{{=FORMULA()}}` from `.ascii.tpl` files
- [ ] Emit opcode sequences into the SIT and CODE segments of the `.rts.png`
- [ ] Verify: compile `reactive_monitor.ascii.tpl` → `.rts.png`, load into GPU monitor agent, confirm VCC match

### Phase 3: State Synchronization (Stratum 2 ↔ Stratum 3)
**Status: Depends on Phase 2**

The Stratum 1 cell store (`{"cpu": 0.85}`) maps to the Stratum 2 State Buffer (offset `0x0000` = cpu, 4 bytes IEEE 754). The GPU VM reads from this buffer when evaluating SIT opcodes.

Steps:
- [ ] Define a State Layout specification: cell name → byte offset → data type
- [ ] Update the reactive agent to write state values to both the cell API (Stratum 1) and the State Buffer region (Stratum 2) simultaneously
- [ ] Implement `poke_state` in the GPU scheduler that writes to the State Buffer from the CPU side (already partially implemented in `visual_kernel_boot.rs`)
- [ ] Verify: agent writes `cpu=0.85` → Stratum 1 shows `████████████████████████████████████░░░░` → Stratum 2 cartridge State Buffer contains `0x3F59999A` at offset 0 → GPU VM reads it and renders the same bar

### Phase 4: The Closed Loop (Stratum 3 Sovereign)
**Status: Depends on Phase 3. This is the v1 objective, now with a verified path.**

With SIT opcodes compiled from formulas and state synchronized to the GPU buffer, the "Self-Replicating Glyph" loop from v1 becomes achievable:

Steps:
- [ ] Implement `OP_GLYPH_WRITE` (Opcode 232) in `glyph_vm_scheduler.wgsl` — copy glyph data from one Hilbert address to another
- [ ] Implement `OP_GLYPH_MUTATE` (Opcode 234) — bit-level modification of RGBA channels
- [ ] Implement `OP_BRANCH` (Opcode TBD) — conditional execution based on State Buffer values
- [ ] Bootstrap: compile `reactive_monitor.ascii.tpl` → `reactive_monitor.rts.png` → load into `micro_host.rs` → verify the GPU renders the same dashboard the browser viewer shows
- [ ] Remove the CPU from the loop: the hardware mailbox delivers input events, the GPU VM processes SIT entries, the framebuffer shows the result

### Phase 5: Self-Hosting Compilation (Stratum 3 → Stratum 3)
**Status: Future. Depends on sovereign-boot-plan.md completion.**

The final milestone: the GPU assembler (already proven in `sovereign-boot-plan.md`) compiles `.ascii.tpl` templates on the GPU itself. No Python. No Node.js. The formula engine runs as WGSL compute. The compiler is a glyph program.

## Verification Strategy

Each phase has a **VCC checkpoint** — a Visual Consistency Contract that proves the output at one stratum matches the output at the next:

| Transition | VCC Method |
|-----------|------------|
| Stratum 1 → Stratum 2 | SHA-256 of rendered `.ascii` must match SHA-256 of `.rts.png` glyph grid |
| Stratum 2 → Stratum 3 | SHA-256 of `.rts.png` glyph grid must match SHA-256 of GPU RAM texture region |
| State Sync | Cell value at Stratum 1 must equal IEEE 754 bytes at State Buffer offset |
| SIT Match | Click at `(x, y)` in browser must trigger same opcode as SIT entry `y*80+x` |

## What v2 Preserves from v1

- The "Self-Replicating Glyph" concept (Phase 4)
- The Hilbert-mapped RAM texture (4096x4096xRGBA8)
- The VCC verification strategy
- The `OP_GLYPH_WRITE` and `OP_GLYPH_MUTATE` opcodes
- The goal: 60 FPS without CPU-side stalls

## What v2 Adds

- **The incubation layer** (Stratum 1) where logic is developed in human-readable formulas
- **A compilation path** from formulas → opcodes → GPU bytecode
- **State synchronization** between the cell store and the GPU State Buffer
- **Coordinate-aware actions** that bridge symbolic buttons to spatial SIT entries
- **Formula visibility** so both human and AI can audit the logic at every stratum
- **An 82% more efficient agent protocol** (cell updates vs full substrate rewrites)

## Dependencies

| Dependency | Status | Location |
|-----------|--------|----------|
| Formula Engine | ✅ Complete | `ascii_world/sync/formula-engine.js` |
| GeosASCII Compiler | ✅ Complete | `ascii_world/apps/geos-ascii/compiler/geos_ascii_compiler.py` |
| Reactive Agent | ✅ Complete | `ascii_world/agents/reactive_monitor_agent.py` |
| VCC Bridge | ✅ Complete | `ascii_world/agents/gpu_monitor_agent.py` |
| Sync Server + Cell API | ✅ Complete | `ascii_world/sync/sync-server.js` |
| GPU VM Scheduler | ⚠️ Stubs exist | `geometry_os/systems/infinite_map_rs/shaders/glyph_vm_scheduler.wgsl` |
| Micro Host | ⚠️ Planned | `geometry_os/conductor/ascii-workspace-plan.md` |
| GPU Assembler | ✅ Proven | `geometry_os/conductor/sovereign-boot-plan.md` |

---

**v1 asked: "Can pixels move pixels?"**
**v2 answers: "Yes — and here's the incubator where you design the logic before committing it to silicon."**
