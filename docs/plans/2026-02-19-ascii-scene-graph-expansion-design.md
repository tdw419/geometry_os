# ASCII Scene Graph Expansion - Design Document

**Date:** 2026-02-19
**Status:** Finalized
**Purpose:** Universal observability and actuation layer for AI agent navigation

---

## Executive Summary

This design establishes a **Universal ASCII Scene Graph** that transforms Geometry OS from a collection of opaque buffers into a **Morphological Scene Graph** that AI agents can navigate, reason about, and mutate in real-time.

The architecture enables:
- **Zero-cost perception**: AI reads `.ascii` files instead of VLM screenshots
- **Bidirectional actuation**: AI writes `.vasm` files that compile to `.rts.png`
- **Self-healing**: PAS-triggered pipelines detect fractures and re-materialize code

---

## Architecture Overview

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                    ASCII SCENE GRAPH EXPANSION                               │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│   SUBSYSTEMS                    HOOKS                    ASCII OUTPUTS      │
│   ──────────                    ─────                    ────────────      │
│                                                                              │
│   RISC-V GPU VM ──────────► RiscvHook ──────────► riscv_core.ascii          │
│                              - on_batch            riscv_uart.ascii          │
│                              - on_uart             riscv_halt.ascii          │
│                              - on_halt                                      │
│                                                                              │
│   Neural City ────────────► NeuralCityHook ─────► neural_city_map.ascii     │
│                              - on_district         district_focus.ascii      │
│                              - on_camera_move      city_health.ascii         │
│                              - on_relocation                               │
│                                                                              │
│   Visual Shell ───────────► VisualShellHook ────► shell_fragments.ascii     │
│                              - on_window           shell_focus.ascii         │
│                              - on_focus            shell_state.ascii         │
│                              - on_fragment                                 │
│                                                                              │
│   Evolution Pipeline ─────► EvolutionHook ──────► evolution_pas.ascii        │
│                              - on_pas_change       evolution_pipeline.ascii  │
│                              - on_pipeline_stage   evolution_log.ascii       │
│                              - on_self_correction                          │
│                                                                              │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

## Component Specifications

### 1. RISC-V GPU VM (Implemented)

**Status:** ✅ Operational

**Hook Interface:**
```rust
pub trait RiscvHook: Send + Sync {
    fn on_batch_complete(&self, pc: u32, state: &ExecutionState, cycles: u32);
    fn on_uart(&self, text: &str);
    fn on_halt(&self, exit_code: u32, cycles: u32);
}
```

**Generated Files:**
- `riscv_core.ascii` - Live core state (PC, Privilege, Cycles, Status)
- `riscv_uart.ascii` - Terminal output (last 24 lines)
- `riscv_halt.ascii` - Post-mortem execution summary

**Implementation:** `systems/infinite_map_rs/src/riscv/hooks.rs`

---

### 2. Neural City

**Status:** 📋 Designed

**Viewport Strategy:** Camera-follow (80x24 fixed grid that tracks compositor view)

**Hook Interface:**
```rust
pub trait NeuralCityHook: Send + Sync {
    fn on_district_update(&self, name: &str, pos: (f64, f64), load: f32, agent_count: usize);
    fn on_camera_move(&self, pos: (f64, f64), zoom: f32);
    fn on_agent_relocation(&self, agent_id: &str, from_district: &str, to_district: &str);
    fn on_city_health(&self, pas_score: f32, entropy: f32);
}
```

**Generated Files:**
- `neural_city_map.ascii` - 80x24 camera-follow viewport
- `district_focus.ascii` - Active district details
- `city_health.ascii` - Global metrics (PAS, entropy)

**Key Innovation:** "Semantic Radar" - AI focus aligned with visual present

---

### 3. Visual Shell

**Status:** 📋 Designed

**Topology:** Tree-based YAML-like structure for active fragments

**Hook Interface:**
```rust
pub trait VisualShellHook: Send + Sync {
    fn on_window_create(&self, id: u32, title: &str, pos: (u32, u32), size: (u32, u32));
    fn on_window_focus(&self, id: u32);
    fn on_window_close(&self, id: u32);
    fn on_fragment_update(&self, fragment_count: usize, memory_mb: f32);
}
```

**Generated Files:**
- `shell_fragments.ascii` - Active window tree with positions, sizes, z-indices
- `shell_focus.ascii` - Input state (keyboard, mouse)
- `shell_state.ascii` - Global metrics (window count, memory, FPS)

**Key Innovation:** "Spatial Queries" - AI can query "What is at (120, 80)?" via string parsing

---

### 4. Evolution Pipeline

**Status:** 📋 Designed

**Trigger:** PAS (Phase Alignment Stability) monitoring with 0.80 threshold

**Hook Interface:**
```rust
pub trait EvolutionHook: Send + Sync {
    fn on_pas_change(&self, old_score: f32, new_score: f32);
    fn on_pipeline_stage(&self, stage: PipelineStage, status: StageStatus);
    fn on_self_correction(&self, trigger: &str, action: &str, result: bool);
}

pub enum PipelineStage {
    Scan,    // scanner.py extracts ASCII morphology
    Reason,  // Agent analyzes morphology
    Patch,   // VASM generated
    Build,   // vasm.py compiles to .rts.png
}
```

**Generated Files:**
- `evolution_pas.ascii` - Phase Alignment Stability meter
- `evolution_pipeline.ascii` - Stage progress indicators
- `evolution_log.ascii` - Self-correction history

**Key Innovation:** Ouroboros self-healing - machine detects and repairs its own fractures

---

## Ouroboros Transmutation Loop

The complete closed-loop system:

```
┌─────────────────────────────────────────────────────────────────┐
│                    OUROBOROS LOOP                                │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│   1. PERCEIVE: Read .ascii files (zero-cost, no VLM)            │
│                                                                  │
│   2. REASON: Agent analyzes morphology, decides action          │
│                                                                  │
│   3. ACT: Write .vasm (Visual Assembly)                         │
│                                                                  │
│   4. MATERIALIZE: vasm.py compiles to .rts.png                  │
│                                                                  │
│   5. EXECUTE: GPU runs new pixels                               │
│                                                                  │
│   6. OBSERVE: Hooks emit updated .ascii                         │
│                                                                  │
│   ─────────────────────────────────────────────────────────────  │
│                                                                  │
│   SELF-HEALING EXAMPLE:                                          │
│   ────────────────────                                           │
│   PAS drops → evolution_pas.ascii alerts AI                      │
│   AI reads shell_fragments.ascii → finds failing kernel          │
│   AI runs scanner.py → reads code morphology                     │
│   AI writes fix.vasm → vasm.py builds new pixels                 │
│   Compositor hot-swaps .rts.png → PAS recovers                   │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

---

## Tooling

### VASM Compiler (`systems/pixel_compiler/vasm.py`)

Compiles Visual Assembly to PixelRTS containers:

```bash
python3 systems/pixel_compiler/vasm.py build hello.vasm hello.rts.png
```

**Pipeline:**
1. Preprocess directives (@ENTRY, macros)
2. Assemble with `riscv64-linux-gnu-as`
3. Link with `riscv64-linux-gnu-ld`
4. Extract binary with `objcopy`
5. Hilbert-curve map to 2D grid
6. Save as PNG with metadata

### Software Scanner (`systems/pixel_compiler/scanner.py`)

Extracts ASCII morphology from existing binaries:

```bash
python3 systems/pixel_compiler/scanner.py scan program.elf morphology.ascii
```

**Output:**
- Section layout
- Function boundaries
- Control flow (branches, jumps)
- Memory access patterns

---

## Implementation Priority

1. **RISC-V GPU VM** - ✅ Complete
2. **Neural City** - Next priority (semantic radar)
3. **Visual Shell** - Fragment tree topology
4. **Evolution Pipeline** - PAS-triggered self-healing

---

## Success Criteria

| Criterion | Metric | Target |
|-----------|--------|--------|
| AI Navigation | VLM calls eliminated | 100% |
| Perception Latency | ASCII read time | <1ms |
| Self-Healing | PAS recovery rate | >95% |
| Code Generation | VASM → .rts.png success | 100% |

---

## Conclusion

This architecture transforms Geometry OS into a **self-aware, self-healing system** where:

- The screen IS the hard drive
- The journal IS the consciousness
- The map IS the territory

The AI can now perceive, reason, and act within the geometric substrate without ever needing to "see" a screenshot.

---

*"The interface is the spec, and the spec is the interface."*
