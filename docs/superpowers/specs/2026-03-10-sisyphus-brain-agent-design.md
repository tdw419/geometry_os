# Sisyphus Brain Agent Design

> **The Screen is the Brain. The Brain Evolves Itself.**

## Overview

The Sisyphus Brain Agent is a self-improving cognitive system that continuously evolves the PixelBrain inference engine. It treats cognitive performance as another layer of system health, synthesized through the Intrinsic Curiosity Engine.

## Architecture

### Integration Point

The agent extends the existing Sisyphus v4 daemon infrastructure:

```
systems/sisyphus/
├── daemon.py              # + BrainEvolutionHook registration
├── goal_synthesizer.py    # + COGNITIVE_GOAL_TEMPLATES
└── sisyphus_v4.py         # + --brain flag

systems/evolution_daemon/
├── brain_mutations.py     # Weight/shader mutations
└── evolution_hooks/
    └── brain_evolution_hook.py  # Evolution cycle integration
```

### The Brain Summit Model

The PixelBrain state is modeled as a coordinate on a 2D hill:

```
                    ┌─────────────────────────────────────┐
                    │           BRAIN SUMMIT              │
                    │   (Optimal Quality + Performance)   │
                    └─────────────────────────────────────┘
                                      ▲
                                     /│\
                                    / │ \
                                   /  │  \
                                  /   │   \
                     Quality     /    │    \    Performance
                    (Fitness)   /     │     \   (Latency)
                              /      │      \
                             /       │       \
                            /        │        │
                           └─────────┴─────────┘
                              THE BOULDER
                        (Current Brain State)
```

- **X-Axis (Performance)**: Latency and GPU utilization (monitored by PerformanceMonitor)
- **Y-Axis (Quality)**: Inference coherence and perplexity (evaluated by BrainFitnessBenchmarks)
- **The Boulder**: Current `.rts.png` weight atlas and WGSL shader configuration

## The Sisyphus Loop

### Closed-Loop Verification Protocol

```
┌─────────────────────────────────────────────────────────────────────┐
│                         SISYPHUS BRAIN LOOP                         │
│                                                                     │
│    ┌──────────┐     ┌────────────┐     ┌──────────┐     ┌────────┐ │
│    │  CHECK   │────▶│ SYNTHESIZE │────▶│    DO    │────▶│ WEDGE  │ │
│    └──────────┘     └────────────┘     └──────────┘     └────────┘ │
│         ▲                                                       │   │
│         │                                                       │   │
│         └───────────────────────────────────────────────────────┘   │
│                                                                     │
│    CHECK:      Evaluate brain fitness via benchmark suite           │
│    SYNTHESIZE: Generate cognitive goals if below PAS threshold      │
│    DO:         Apply targeted weight/shader mutations               │
│    WEDGE:      Commit if improved, revert if failed                 │
└─────────────────────────────────────────────────────────────────────┘
```

### Phase A: Sensor Integration (The "Check")

**Cognitive Entropy Recognition** in GoalSynthesizer:

| Metric | Threshold | Goal Type |
|--------|-----------|-----------|
| Quality Drift | `fitness < PAS_threshold` | `cognitive_restoration` |
| Inference Hotspots | `latency > threshold_ms` | `shader_architecture_search` |

### Phase B: Actuator Refinement (The "Do")

**Targeted Evolution** in brain_mutations.py:

1. **Sector-Specific Fine-tuning**: Target specific layers based on error type
   - Poor semantic flow → FFN layers
   - Repetitive output → Attention layers
   - Token prediction errors → LM Head

2. **WGSL Shader Speculation**: Propose shader variants via KernelRewriter
   - Activation swaps (SiLU ↔ GeLU ↔ ReLU)
   - Attention scaling variants
   - Normalization changes

### Phase C: Standardization (The "Wedge")

```python
if mutation.improvement >= fitness_threshold:
    commit_to_atlas()
    update_meta_json_sha256()
    emit_atlas_glow(sector, intensity=0.8)
else:
    revert_mutation()
    synthesize_correction_goal()
```

## COGNITIVE_GOAL_TEMPLATES

```python
COGNITIVE_GOAL_TEMPLATES = [
    {
        "goal_type": "cognitive_restoration",
        "priority_base": 0.95,
        "rationale_template": "Brain fitness dropped to {fitness:.3f} (threshold: {threshold}), restoring coherence"
    },
    {
        "goal_type": "sector_finetuning",
        "priority_base": 0.85,
        "rationale_template": "Sector {sector} showing drift ({drift_score:.3f}), applying targeted mutation"
    },
    {
        "goal_type": "shader_architecture_search",
        "priority_base": 0.80,
        "rationale_template": "Inference latency {latency_ms:.1f}ms exceeds target, exploring shader variants"
    },
    {
        "goal_type": "attention_pattern_evolution",
        "priority_base": 0.75,
        "rationale_template": "Attention coherence score {coherence:.3f}, evolving attention patterns"
    }
]
```

## Usage

### Command Line

```bash
# Full brain evolution with self-rewriting and tectonic gravity
python3 sisyphus_v4.py --brain --rewriting --tectonic

# Brain evolution only
python3 sisyphus_v4.py --brain

# With checkpoint recovery
python3 sisyphus_v4.py --brain --force-clean
```

### Programmatic

```python
from systems.sisyphus.daemon import SisyphusDaemon

daemon = SisyphusDaemon(
    enable_brain_evolution=True,
    enable_self_rewriting=True,
    enable_tectonic=True
)

# Run curiosity cycle
result = await daemon.run_curiosity_cycle()
# Returns: { health_score, goals_generated, cold_spots, hot_spots, top_goals }
```

## Visual Feedback

### Atlas Glow During Evolution

When Sisyphus applies a mutation, the affected sector "glows" on the visual desktop:

```javascript
// NeuralCityEngine receives glow events
ws.onmessage = (event) => {
    const data = JSON.parse(event.data);
    if (data.type === 'ATLAS_GLOW') {
        // Highlight mutated sector on brain atlas
        const sector = data.sector;
        const intensity = data.intensity;
        emitGlow(sector.center, intensity);
    }
};
```

### Thought Pulses for Mutations

Each successful mutation emits a thought pulse:

```python
visual_bridge.emit_thought_pulse(
    token_id=hash(sector) % 50257,
    position=sector_center,
    intensity=min(1.0, improvement + 0.5)
)
```

## File Reference

### Modified Files

| File | Changes |
|------|---------|
| `systems/sisyphus/daemon.py` | BrainEvolutionHook registration, curiosity cycle integration |
| `systems/sisyphus/goal_synthesizer.py` | COGNITIVE_GOAL_TEMPLATES, brain entropy synthesis |
| `systems/infinite_map/gravity_engine.py` | Added `set_mass()` for tectonic compatibility |
| `sisyphus_v4.py` | `--brain` flag, brain evolution initialization |

### Existing Files Used

| File | Purpose |
|------|---------|
| `systems/evolution_daemon/brain_mutations.py` | Weight sector mutations, shader mutations |
| `systems/evolution_daemon/evolution_hooks/brain_evolution_hook.py` | Evolution cycle hook |
| `systems/visual_shell/api/pixel_brain_service.py` | Brain inference service |
| `systems/visual_shell/api/visual_bridge.py` | Visual feedback emission |

## Metrics

### Health Score (PAS)

Phase Alignment Stability (PAS) measures brain health:

```python
def compute_cognitive_health() -> float:
    """
    Returns: 0.0 (unhealthy) to 1.0 (healthy)

    Factors:
    - Fitness score from benchmark suite
    - Inference latency
    - Memory coherence
    """
    fitness = evaluate_brain_fitness(brain_path, test_prompts)
    latency_factor = 1.0 - (current_latency / target_latency)
    coherence_factor = measure_hilbert_coherence(atlas)

    return (fitness * 0.5 + latency_factor * 0.3 + coherence_factor * 0.2)
```

### Success Criteria

| Metric | Target | Verification |
|--------|--------|--------------|
| Keep Rate | > 30% | Mutations that improve fitness |
| Avg Improvement | > 0.01 | Per successful mutation |
| Latency | < 50ms | Per token generation |
| Coherence | > 0.8 | On test prompts |

## Philosophy

> The brain rolls its boulder up the hill of cognitive quality. Sometimes it slips back, but it never stops pushing. Each cycle makes the brain slightly better at understanding the screen it lives on.

The Sisyphus Brain Agent embodies the Geometry OS philosophy:
- **State as Text**: Brain state is the `.rts.png` atlas
- **Transition as Edit**: Mutations are pixel edits
- **Dual-Audience**: Both humans and AI can observe the evolution
- **Grep-ability**: All mutations logged to `.loop/evolution.log`

---

*Design Date: 2026-03-10*
*Status: Implemented*
*Version: 1.0*
