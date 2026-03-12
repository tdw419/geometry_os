# PixelBrain Visual Training Harness Design

> **Status**: Approved
> **Date**: 2026-03-12
> **Goal**: Evolve PixelBrain into a native Geometry OS intelligence that sees, generates, and explains spatial programs.

## Executive Summary

This design establishes the architecture for training PixelBrain as a **Geometry OS native intelligence** rather than fine-tuning an external LLM. The key insight is that external models have a fundamental "semantic gap" - they are 1D sequence predictors that cannot natively see 2D spatial grammars.

By keeping PixelBrain as a native RTS.PNG on the map, the OS can:
- Mutate its own brain weights via neuro-evolution
- Maintain spatial locality through the FUR-Hilbert Curve
- Achieve "Glass Box AI" where the model lives in the same visual substrate it manipulates

---

## Architecture Overview

```
┌─────────────────────────────────────────────────────────────┐
│                  PIXELBRAIN TRAINING HARNESS                │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  ┌──────────────┐    ┌──────────────┐    ┌──────────────┐  │
│  │   Synthetic  │───▶│   Hilbert    │───▶│  PixelBrain  │  │
│  │   Dataset    │    │   Encoder    │    │   Pipeline   │  │
│  │  Generator   │    │  (2D → 1D)   │    │  (WGPU/WGSL) │  │
│  └──────────────┘    └──────────────┘    └──────────────┘  │
│         │                                        │          │
│         ▼                                        ▼          │
│  ┌──────────────┐    ┌──────────────┐    ┌──────────────┐  │
│  │   Visual     │◀───│  Execution   │◀───│   Codel      │  │
│  │   Intent     │    │   Engine     │    │   Decoder    │  │
│  │   (Prompt)   │    │(infinite_map)│    │  (1D → 2D)   │  │
│  └──────────────┘    └──────────────┘    └──────────────┘  │
│         │                   │                              │
│         ▼                   ▼                              │
│  ┌──────────────────────────────────────────────────────┐  │
│  │              INTEGRATED EVALUATION HARNESS            │  │
│  │  ┌────────────┐ ┌────────────┐ ┌────────────────────┐ │  │
│  │  │  Execute   │ │  Explain   │ │  Heal (Evolution   │ │  │
│  │  │  (PAS)     │ │  (Mirror)  │ │   Daemon Health)   │ │  │
│  │  └────────────┘ └────────────┘ └────────────────────┘ │  │
│  └──────────────────────────────────────────────────────┘  │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### Data Flow

1. **Synthetic Dataset Generator** creates Visual Intent → Codel Array pairs
2. **Hilbert Encoder** flattens 2D codels to 1D sequence (preserving locality)
3. **PixelBrain Pipeline** trains on next-codel prediction
4. **Codel Decoder** reconstructs 2D output from 1D prediction
5. **Execution Engine** runs the generated GeoScript
6. **Evaluation Harness** validates all three metrics

---

## Tokenization: Atlas Indices

Instead of predicting raw RGB values (16M colors), PixelBrain predicts **Atlas Indices** (0-1023):

| Index Range | Purpose | Example |
|-------------|---------|---------|
| 32-126 | Standard ASCII (Prompt vocabulary) | `A`, `L`, `L`, `O`, `C` |
| 200-215 | GlyphStratum Opcodes (Logic vocabulary) | Alloc=200, Store=201, Free=202 |
| 256-511 | Raw Byte Literals 0-255 (Operand vocabulary) | Size 16 → Index 272 |
| 512+ | Custom morphological symbols/Intent glyphs | Stratum 4 metadata |

**Benefits**:
- Efficient vocabulary (1024 tokens vs 16M RGB)
- Evolution Daemon compatibility (discrete mutation)
- Hilbert coherence (quadrant boundaries align with causal structure)

---

## Training Texture Structure

### Dual-Texture Training Pattern

Each training sample is a 256x256 pixel texture with quadrant-based Hilbert traversal:

```
┌───────────────────┬─────────────┬─────────────────┬─────────────────────────────────────────────┐
│ Quadrant          │ Region Type │ Hilbert Steps   │ Purpose                                     │
├───────────────────┼─────────────┼─────────────────┼─────────────────────────────────────────────┤
│ Q0 (Top-Left)     │ Prompt      │ 0 - 16,383      │ Task description (e.g., "ALLOC 4x4 BLUE")   │
│ Q1 (Top-Right)    │ Response A  │ 16,384 - 32,767 │ Stratum 4 (Intent) & Stratum 3 (Spec)       │
│ Q2 (Bottom-Left)  │ Response B  │ 32,768 - 49,151 │ Stratum 1 (Memory) & Stratum 0 (Substrate)  │
│ Q3 (Bottom-Right) │ Response C  │ 49,152 - 65,535 │ Program Terminus (Halt) & Stability padding │
└───────────────────┴─────────────┴─────────────────┴─────────────────────────────────────────────┘
```

**Hilbert Traversal Order**: Q0 → Q1 → Q2 → Q3

This ensures:
- Prompt always precedes Response (causal masking works correctly)
- Intent (Q1) provides context for Code (Q2)
- Spatial locality is preserved within each quadrant

---

## Synthetic Data Grammar

### Phase 1: "Allocation Seed" Tasks

**Task Type**: `ALLOC_NxM_COLOR`

```python
TASK_GRAMMAR = {
    "ALLOC_NxM_COLOR": {
        "sizes": [(2,2), (4,4), (8,8), (16,16), (4,8), (8,4)],
        "colors": ["RED", "BLUE", "GREEN", "YELLOW", "CYAN", "MAGENTA"],
        "positions": range(0, 240, 16),  # Grid-aligned positions
        "variations": 1000 // (6 * 6 * 15) ≈ 3 per combination
    }
}
```

### Codel Grammar

| Component | RGB Format | Example |
|-----------|------------|---------|
| **ALLOC opcode** | R=0x22 (Memory), G=0x01 (Alloc), B=Size | `(34, 1, 16)` = alloc 16 bytes |
| **FILL opcode** | R=0x00, G=0x00, B=Value | `(0, 0, 255)` = fill blue |
| **Position** | Implicit in (x, y) coordinates | `[10, 10]` = first codel |
| **Intent glyph** | Stratum 4 color coding | Purple/White metadata |

### Ground Truth Generation

- Each task has a deterministic "correct answer" (the codel array)
- Generated programmatically by the existing GlyphStratum runtime
- Validated by running through `infinite_map_rs` execution engine

---

## Integrated Evaluation Harness

### Three-Metric Evaluation Suite

```
┌─────────────────────────────────────────────────────────────────┐
│                 INTEGRATED EVALUATION HARNESS                   │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  ┌─────────────────────────────────────────────────────────┐   │
│  │                    METRIC 1: EXECUTE                    │   │
│  │                  (Phase Alignment Stability)            │   │
│  ├─────────────────────────────────────────────────────────┤   │
│  │  Input:  Generated codel sequence (Q2 output)           │   │
│  │  Process:                                                │   │
│  │    1. Decode atlas indices → 2D codel array             │   │
│  │    2. Submit to infinite_map_rs execution engine        │   │
│  │    3. Run for N cycles (N = task complexity)            │   │
│  │    4. Compare final state vs ground truth               │   │
│  │    5. HALT-CHECK: Must include Opcode 215 (Halt)        │   │
│  │  Pass: State matches expected output (pixel-exact)      │   │
│  │  Score: 0.0 - 0.5 (no HALT) or 0.0 - 1.0 (with HALT)    │   │
│  └─────────────────────────────────────────────────────────┘   │
│                              │                                  │
│                              ▼                                  │
│  ┌─────────────────────────────────────────────────────────┐   │
│  │                    METRIC 2: EXPLAIN                   │   │
│  │                (Natural Language Mirror)                │   │
│  ├─────────────────────────────────────────────────────────┤   │
│  │  Input:  Generated intent sequence (Q1 output)          │   │
│  │  Process:                                                │   │
│  │    1. Decode Q1 atlas indices → Intent glyphs           │   │
│  │    2. REVERSIBILITY TEST: Regenerate Q0 from Q2         │   │
│  │    3. Compare regenerated prompt vs original task       │   │
│  │    4. Ask PixelBrain: "Why did you paint [10,10]=Alloc?"│   │
│  │    5. Validate response against ground truth rationale  │   │
│  │  Pass: Explanation is consistent with code              │   │
│  │  Score: 0.0 - 1.0 (reversibility + semantic similarity) │   │
│  └─────────────────────────────────────────────────────────┘   │
│                              │                                  │
│                              ▼                                  │
│  ┌─────────────────────────────────────────────────────────┐   │
│  │                    METRIC 3: HEAL                      │   │
│  │              (Evolution Daemon Integration)             │   │
│  ├─────────────────────────────────────────────────────────┤   │
│  │  Input:  Full generated program (Q0-Q3)                 │   │
│  │  Process:                                                │   │
│  │    1. Inject program into EvolutionDaemonV8             │   │
│  │    2. Measure pressure_score before/after               │   │
│  │    3. Run StructuralHealthMonitor for fractures         │   │
│  │    4. Check Phase Alignment Stability (PAS) delta       │   │
│  │    5. PERSISTENT WEIGHT INJECTION:                      │   │
│  │       If score ≥ 0.7, write Q2-Q3 to Knowledge Sector   │   │
│  │       of PixelBrain RTS.PNG via PixelSurgeon            │   │
│  │  Pass: pressure_score decreases, PAS increases          │   │
│  │  Score: 0.0 - 1.0 (normalized health improvement)       │   │
│  └─────────────────────────────────────────────────────────┘   │
│                              │                                  │
│                              ▼                                  │
│  ┌─────────────────────────────────────────────────────────┐   │
│  │                  COMPOSITE SCORE                        │   │
│  │  Final = 0.4×Execute + 0.3×Explain + 0.3×Heal          │   │
│  │  Threshold: ≥ 0.7 to accept mutation into brain atlas  │   │
│  └─────────────────────────────────────────────────────────┘   │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

### Evaluation Loop Implementation

```python
def evaluate_generation(task: Task, generated: AtlasSequence) -> EvalResult:
    # Metric 1: Execute
    codels = decode_to_codels(generated.Q2)
    has_halt = contains_opcode(codels, OPCODE_HALT)  # Opcode 215
    execution_result = infinite_map_rs.execute(codels)
    execute_score = compare_states(execution_result, task.ground_truth)
    if not has_halt:
        execute_score = min(execute_score, 0.5)  # Resource leak penalty

    # Metric 2: Explain (with Reversibility Test)
    intent = decode_to_intent(generated.Q1)
    regenerated_prompt = pixelbrain.reverse_transpile(codels)
    reversibility_score = match_prompt(regenerated_prompt, task.prompt)
    explanation = pixelbrain.explain(intent, codels)
    explain_score = 0.5 * reversibility_score + 0.5 * semantic_similarity(explanation, task.rationale)

    # Metric 3: Heal
    health_before = evolution_daemon.get_pressure_score()
    evolution_daemon.inject_program(generated)
    health_after = evolution_daemon.get_pressure_score()
    heal_score = normalize_improvement(health_before, health_after)

    # Composite
    final = 0.4 * execute_score + 0.3 * explain_score + 0.3 * heal_score

    # Persistent Weight Injection
    if final >= 0.7:
        pixel_surgeon.inject_knowledge(
            atlas_path=pixelbrain.atlas_path,
            knowledge_sector=KNOWLEDGE_SECTOR_OFFSET,
            data=generated.Q2 + generated.Q3
        )

    return EvalResult(execute_score, explain_score, heal_score, final)
```

---

## Implementation Phases

### Phase 1: Synthetic Dataset Generator
**Files to create**:
- `systems/pixel_brain/synthetic_dataset_generator.py` - Generates "Allocation Seed" tasks
- `systems/pixel_brain/hilbert_encoder.py` - 2D → 1D Hilbert encoding
- `systems/pixel_brain/atlas_tokenizer.py` - RGB ↔ Atlas Index conversion

**Success criteria**:
- Generate 1,000 valid training pairs
- Each pair has: Prompt (Q0), Intent (Q1), Code (Q2), Terminus (Q3)
- Ground truth validates against infinite_map_rs execution

### Phase 2: Training Pipeline Integration
**Files to modify**:
- `systems/visual_shell/wgsl/pixel_brain_pipeline.py` - Add training mode
- `systems/visual_shell/api/pixel_brain_service.py` - Add training API

**Success criteria**:
- PixelBrain can be trained on synthetic dataset
- Loss decreases over training epochs
- Model can predict next atlas index with >50% accuracy

### Phase 3: Evaluation Harness
**Files to create**:
- `systems/pixel_brain/evaluation_harness.py` - Three-metric evaluation
- `systems/pixel_brain/pixel_surgeon.py` - Weight injection for HEAL metric

**Success criteria**:
- Execute metric validates against infinite_map_rs
- Explain metric passes reversibility test
- Heal metric integrates with EvolutionDaemonV8
- Composite score ≥ 0.7 triggers weight injection

---

## Key Design Decisions

### Why Visual-First Training (Approach A)?

| Criterion | Visual-First (A) | Codel-Sequential (B) | Hybrid Dual-Stream (C) |
|-----------|------------------|----------------------|------------------------|
| Semantic Gap | ✅ None | ❌ 1D loses 2D | ⚠️ Partial |
| Hilbert Locality | ✅ Preserved | ❌ Broken | ⚠️ Complex |
| Evolution Compatibility | ✅ Native RTS.PNG | ❌ Adapter needed | ⚠️ Two systems |
| Implementation Complexity | ✅ Moderate | ✅ Simple | ❌ High |
| Future Flexibility | ⚠️ Good | ❌ Limited | ✅ Best |

**Decision**: Visual-First Training (Approach A) is the "Geometry-Correct" choice because:
1. Hilbert Curve handles 2D → 1D conversion while preserving locality
2. Universal substrate: RTS.PNG is weights, input, and output
3. Unified explanation: Model can "paint" explanations alongside code

### Why Multi-Metric Evaluation?

A single-metric approach fails:
- **Execute-only**: Model creates "fractured" visual textures that Evolution Daemon rejects
- **Explain-only**: Model hallucinates plausible explanations without working code
- **Heal-only**: Model makes changes that improve health but are unintelligible to humans

**In Geometry OS, legibility IS correctness.** All three metrics must be in tension.

---

## Integration Points

### Existing Systems

| System | Integration |
|--------|-------------|
| `PixelBrainPipeline` | Training mode, next-codel prediction |
| `infinite_map_rs` | Execution validation (Metric 1) |
| `EvolutionDaemonV8` | Health monitoring, weight injection (Metric 3) |
| `StructuralHealthMonitor` | Fracture detection |
| `GlyphStratum` | Opcode definitions (200-215) |
| `font_renderer.py` | GEOS font rendering for prompts |

### New Components

| Component | Purpose |
|-----------|---------|
| `SyntheticDatasetGenerator` | Creates training pairs |
| `HilbertEncoder` | 2D → 1D spatial flattening |
| `AtlasTokenizer` | RGB ↔ Index conversion |
| `EvaluationHarness` | Three-metric scoring |
| `PixelSurgeon` | Weight injection for accepted mutations |

---

## Success Metrics

### Iteration 1 Targets

| Metric | Target | Measurement |
|--------|--------|-------------|
| Execute | ≥ 0.8 | Pixel-exact match on "Allocation Seed" tasks |
| Explain | ≥ 0.7 | Reversibility test + semantic similarity |
| Heal | ≥ 0.6 | Pressure score decrease after injection |
| Composite | ≥ 0.7 | Triggers weight injection |

### Long-term Goals

1. **Visual Reasoning**: PixelBrain can read GlyphStratum visual programs and explain their behavior
2. **Code Generation**: PixelBrain can "paint" solutions directly into the framebuffer
3. **Autonomous Agent**: PixelBrain drives Evolution Daemon to improve system health

---

## References

- `docs/plans/2026-03-09-pixel-brain-cognitive-core.md` - Original PixelBrain integration plan
- `systems/glyph_stratum/README.md` - GlyphStratum 5-strata architecture
- `systems/visual_shell/api/pixel_brain_service.py` - Current PixelBrain service
- `geos/backends/pixelbrain.py` - GEOS chat backend integration
