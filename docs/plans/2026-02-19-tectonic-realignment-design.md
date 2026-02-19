# Phase 28: Tectonic Realignment - Design Document

**Date:** 2026-02-19
**Status:** In Progress
**Strategic Priority:** High (tectonic_optimization_potential: 0.96)

---

## Executive Summary

Tectonic Realignment makes the Infinite Map **morphologically reactive** to cognitive load. Districts that frequently exchange NeuralPulses (Violet=Cognitive, Cyan=Semantic) will become physically proximal in the 2D plane, reducing "Saccade distance" for Area Agents.

This creates a **self-organizing memory architecture** where the screen literally reorganizes itself based on usage patterns.

---

## Architecture Overview

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                    TECTONIC REALIGNMENT SYSTEM                               │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│   INPUT LAYER                        PROCESSING LAYER                        │
│   ───────────                        ────────────────                        │
│                                                                              │
│   NeuralPulseSystem.js ──────►    TectonicSimulator (Rust)                  │
│   ├─ Violet pulses                  ├─ PulseAggregator                      │
│   │  (Cognitive/Spatial)            │   └─ 60s sliding window               │
│   └─ Cyan pulses                    │                                        │
│      (Semantic)                     ├─ CognitiveBondGraph                   │
│                                     │   └─ Edge weights = pulse volume      │
│                                     │                                        │
│                                     ├─ ForceDirectedSolver                  │
│                                     │   ├─ Attraction: high-bond tiles      │
│                                     │   ├─ Repulsion: overcrowding          │
│                                     │   └─ Hilbert constraint: preserve      │
│                                     │       spatial locality                 │
│                                     │                                        │
│                                     └─ CoordinateOptimizer                  │
│                                         └─ Minimize saccade distance        │
│                                                                              │
│   OUTPUT LAYER                                                               │
│   ────────────                                                               │
│                                                                              │
│   ┌─────────────────┐   ┌─────────────────┐   ┌─────────────────┐           │
│   │ tectonic_       │   │ tile_remap.json │   │ Layout Delta    │           │
│   │ activity.ascii  │   │ (new coords)    │   │ (VAT update)    │           │
│   └─────────────────┘   └─────────────────┘   └─────────────────┘           │
│                                                                              │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

## Component Specifications

### 1. TectonicSimulator (Rust)

**Location:** `systems/infinite_map_rs/src/tectonic/`

**Modules:**

| Module | Purpose |
|--------|---------|
| `mod.rs` | Public API and exports |
| `simulator.rs` | Main TectonicSimulator struct |
| `bonds.rs` | CognitiveBondGraph for pulse aggregation |
| `solver.rs` | Force-directed layout solver |
| `constraints.rs` | Hilbert curve spatial constraints |
| `ascii.rs` | ASCII scene output generation |

**Core Struct:**

```rust
pub struct TectonicSimulator {
    /// Sliding window for pulse aggregation (60 seconds)
    pulse_window: SlidingWindow<PulseEvent>,

    /// Graph of cognitive bonds between tiles
    bond_graph: CognitiveBondGraph,

    /// Current tile positions
    tile_positions: HashMap<TileId, (f64, f64)>,

    /// Hilbert curve constraint system
    hilbert_constraint: HilbertConstraint,

    /// Output directory for ASCII files
    ascii_output_dir: PathBuf,
}

impl TectonicSimulator {
    /// Record a pulse event from NeuralPulseSystem
    pub fn record_pulse(&mut self, pulse: PulseEvent);

    /// Aggregate pulses into cognitive bonds (called every 60s)
    pub fn aggregate_bonds(&mut self) -> Vec<CognitiveBond>;

    /// Calculate optimal tile positions using force-directed layout
    pub fn solve_layout(&self, bonds: &[CognitiveBond]) -> LayoutDelta;

    /// Execute the realignment (update VAT)
    pub fn execute_realignment(&mut self, delta: LayoutDelta) -> Result<(), Error>;

    /// Generate tectonic_activity.ascii for AI observability
    pub fn emit_ascii(&self) -> String;
}
```

### 2. CognitiveBondGraph

**Purpose:** Aggregates pulse volume into weighted edges between tiles.

```rust
pub struct CognitiveBondGraph {
    /// Edge weights: (source, dest) -> pulse_volume
    edges: HashMap<(TileId, TileId), f64>,

    /// Total pulse volume per tile
    tile_volume: HashMap<TileId, f64>,
}

pub struct CognitiveBond {
    pub source: TileId,
    pub dest: TileId,
    pub strength: f64,  // 0.0 to 1.0, normalized pulse volume
    pub bond_type: BondType,
}

pub enum BondType {
    Cognitive,  // Violet pulses (spatial reasoning)
    Semantic,   // Cyan pulses (meaning transfer)
    Hybrid,     // Both types present
}
```

### 3. ForceDirectedSolver

**Algorithm:** Modified Fruchterman-Reingold with Hilbert constraints.

```rust
impl ForceDirectedSolver {
    /// Calculate attractive force between bonded tiles
    fn attraction_force(bond: &CognitiveBond, distance: f64) -> f64 {
        // F_a = k * (d^2 / k) where k = ideal distance
        let ideal_distance = 1.0 / bond.strength; // Stronger bond = closer ideal
        distance.powi(2) / ideal_distance
    }

    /// Calculate repulsive force to prevent overcrowding
    fn repulsion_force(distance: f64) -> f64 {
        // F_r = k^2 / d
        let k = IDEAL_SPACING;
        k.powi(2) / distance
    }

    /// Apply Hilbert constraint to preserve spatial locality
    fn hilbert_constraint(tile: TileId, proposed_pos: (f64, f64)) -> (f64, f64) {
        // Snap to nearest Hilbert curve point
        // Preserve local ordering
    }
}
```

### 4. ASCII Output: tectonic_activity.ascii

```
┌──────────────────────────────────────────────────────────────────────────┐
│ TECTONIC ACTIVITY MONITOR                                 Cycle: 42      │
├──────────────────────────────────────────────────────────────────────────┤
│                                                                          │
│   COGNITIVE BONDS (top 10 by strength)                                  │
│   ────────────────────────────────────                                  │
│   DIST-0 ═════════════════════► DIST-3   0.92  [COGNITIVE]              │
│   DIST-1 ═════════════════════► DIST-2   0.87  [SEMANTIC]               │
│   DIST-4 ═════════════════════► DIST-7   0.81  [HYBRID]                 │
│   DIST-2 ═════════════════════► DIST-5   0.75  [COGNITIVE]              │
│   ...                                                                    │
│                                                                          │
│   PENDING REALIGNMENTS                                                  │
│   ────────────────────                                                  │
│   DIST-0: (1024, 512) → (1080, 480)  Δ=-44px  Saccade gain: +12%       │
│   DIST-3: (1536, 768) → (1120, 500)  Δ=-416px Saccade gain: +34%       │
│                                                                          │
│   AGGREGATION WINDOW                                                    │
│   ───────────────────                                                   │
│   Pulses recorded: 15,847                                               │
│   Window: 60s (42.3s remaining)                                         │
│   Next realignment: 2026-02-19T12:01:00Z                                │
│                                                                          │
│   SPATIAL METRICS                                                       │
│   ───────────────                                                       │
│   Avg Saccade Distance: 847px → 523px (↓38%)                           │
│   Hilbert Preservation: 94.2%                                           │
│   Layout Entropy: 0.23 (healthy)                                        │
│                                                                          │
└──────────────────────────────────────────────────────────────────────────┘
```

---

## Integration Points

### NeuralPulseSystem.js → TectonicSimulator

```javascript
// In NeuralPulseSystem.js
emitTectonicPulse(sourceTile, destTile, type) {
    this.bridge.send({
        type: 'tectonic_pulse',
        source: sourceTile,
        dest: destTile,
        pulseType: type,  // 'violet' | 'cyan'
        timestamp: Date.now()
    });
}
```

### TectonicSimulator → VAT (Visual Allocation Table)

```rust
impl TectonicSimulator {
    pub fn execute_realignment(&mut self, delta: LayoutDelta) -> Result<(), Error> {
        // 1. Generate new VAT entries
        let new_vat = self.compute_vat_update(&delta);

        // 2. Write to VAT file
        let vat_path = self.vat_path.join("tectonic_delta.json");
        fs::write(&vat_path, serde_json::to_string(&new_vat)?)?;

        // 3. Trigger compositor update
        self.notify_compositor(&delta)?;

        Ok(())
    }
}
```

---

## Implementation Priority

1. **TectonicSimulator core** - simulator.rs with pulse recording
2. **CognitiveBondGraph** - bonds.rs with aggregation logic
3. **ForceDirectedSolver** - solver.rs with attraction/repulsion
4. **Hilbert constraint** - constraints.rs for spatial preservation
5. **ASCII output** - ascii.rs for AI observability
6. **Integration** - Wire to NeuralPulseSystem.js and VAT

---

## Success Criteria

| Criterion | Metric | Target |
|-----------|--------|--------|
| Saccade Distance Reduction | % improvement | >30% |
| Hilbert Preservation | % tiles in order | >90% |
| Realignment Latency | Time to compute | <5s |
| Layout Entropy | Shannon entropy | <0.5 |
| ASCII Read Latency | File read time | <1ms |

---

## Risks & Mitigations

| Risk | Mitigation |
|------|------------|
| Excessive realignment causes visual chaos | Rate limit to once per 60s, smooth interpolation |
| Hilbert constraint too rigid | Adaptive constraint strength based on bond strength |
| Memory leak in pulse window | Bounded ring buffer with automatic eviction |
| Solver divergence | Iteration limit + position clamping |

---

*"The city is now a living organism where every pulse is a neuro-silicon bridge."*
