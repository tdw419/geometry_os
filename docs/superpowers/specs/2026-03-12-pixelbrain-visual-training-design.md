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
| 200-214 | GlyphStratum Opcodes (Logic vocabulary) | See opcode table below |
| 256-511 | Raw Byte Literals 0-255 (Operand vocabulary) | Size 16 → Index 272 |
| 512+ | Custom morphological symbols/Intent glyphs | Stratum 4 metadata |

**GlyphStratum Opcode Mapping** (from `systems/infinite_map_rs/src/glyph_stratum/mod.rs`):

| Opcode | Value | Atlas Index (200 + value) |
|--------|-------|---------------------------|
| Nop | 0 | 200 |
| Alloc | 1 | 201 |
| Free | 2 | 202 |
| Load | 3 | 203 |
| Store | 4 | 204 |
| Add | 5 | 205 |
| Sub | 6 | 206 |
| Mul | 7 | 207 |
| Div | 8 | 208 |
| Jump | 9 | 209 |
| Branch | 10 | 210 |
| Call | 11 | 211 |
| Return | 12 | 212 |
| **Halt** | 13 | **213** |
| Data | 14 | 214 |

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
│  │    5. HALT-CHECK: Must include Opcode 213 (Halt)        │   │
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
# Atlas token constants (from glyph_stratum/mod.rs)
OPCODE_BASE = 200  # Unicode offset for GlyphStratum opcodes
OPCODE_NOP = 200    # Nop = 200 + 0
OPCODE_ALLOC = 201  # Alloc = 200 + 1
OPCODE_FREE = 202   # Free = 200 + 2
OPCODE_LOAD = 203   # Load = 200 + 3
OPCODE_STORE = 204  # Store = 200 + 4
OPCODE_HALT = 213   # Halt = 200 + 13
OPCODE_DATA = 214   # Data = 200 + 14

def evaluate_generation(task: Task, generated: AtlasSequence) -> EvalResult:
    # Metric 1: Execute
    codels = decode_to_codels(generated.Q2)
    has_halt = contains_opcode(codels, OPCODE_HALT)  # Opcode 213
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

### Hilbert Encoder Implementation

The `HilbertEncoder` will use the existing Rust implementation via FFI:

**Reference**: `systems/infinite_map_rs/src/cognitive/hilbert_pathfinder.rs`

```python
# Python wrapper for Rust Hilbert implementation
# File: systems/pixel_brain/hilbert_encoder.py

class HilbertEncoder:
    """
    Encodes 2D coordinates to 1D Hilbert indices.

    Uses the same algorithm as infinite_map_rs for consistency.
    Grid size: 256x256 (Order 16 Hilbert curve)
    """

    def __init__(self, grid_size: int = 256):
        self.grid_size = grid_size
        # FFI to Rust implementation for performance
        # Fallback to pure Python if Rust not available

    def xy_to_hilbert(self, x: int, y: int) -> int:
        """Convert (x, y) to Hilbert index."""
        pass

    def hilbert_to_xy(self, index: int) -> tuple[int, int]:
        """Convert Hilbert index to (x, y)."""
        pass

    def encode_quadrant(self, texture: np.ndarray, quadrant: int) -> list[int]:
        """
        Encode a 128x128 quadrant to Hilbert-ordered indices.

        Note: Hilbert curves do NOT map directly to Cartesian quadrants.
        This method visits all pixels within the quadrant region in Hilbert order.
        """
        pass
```

### PixelSurgeon Interface

**File**: `systems/pixel_brain/pixel_surgeon.py`

```python
class PixelSurgeon:
    """
    Safely modifies RTS.PNG brain atlas files for weight injection.

    The Knowledge Sector is a reserved region of the brain atlas where
    successful program patterns are stored for future inference.
    """

    # Reserved sector offsets within 1024x1024 atlas
    KNOWLEDGE_SECTOR_OFFSET = (768, 768)  # Bottom-right 256x256 region
    KNOWLEDGE_SECTOR_SIZE = 256

    def inject_knowledge(
        self,
        atlas_path: str,
        knowledge_sector: tuple[int, int],
        data: list[int]
    ) -> bool:
        """
        Inject validated program patterns into the brain atlas.

        Args:
            atlas_path: Path to RTS.PNG brain atlas
            knowledge_sector: (x, y) offset for knowledge region
            data: Atlas indices to inject

        Returns:
            True if injection successful, False otherwise
        """
        pass

    def validate_injection(self, atlas_path: str) -> bool:
        """Verify atlas integrity after injection."""
        pass
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

### Constant Definitions

```python
# systems/pixel_brain/constants.py

# Atlas token indices
OPCODE_BASE = 200  # Unicode offset for GlyphStratum opcodes
OPCODE_NOP = 200   # Nop = 200 + 0
OPCODE_ALLOC = 201  # Alloc = 200 + 1
OPCODE_FREE = 202   # Free = 200 + 2
OPCODE_LOAD = 203   # Load = 200 + 3
OPCODE_STORE = 204  # Store = 200 + 4
OPCODE_ADD = 205    # Add = 200 + 5
OPCODE_SUB = 206    # Sub = 200 + 6
OPCODE_MUL = 207    # Mul = 200 + 7
OPCODE_DIV = 208    # Div = 200 + 8
OPCODE_JUMP = 209   # Jump = 200 + 9
OPCODE_BRANCH = 210 # Branch = 200 + 10
OPCODE_CALL = 211   # Call = 200 + 11
OPCODE_RETURN = 212 # Return = 200 + 12
OPCODE_HALT = 213   # Halt = 200 + 13
OPCODE_DATA = 214   # Data = 200 + 14

# Token vocabulary boundaries
ASCII_START = 32
ASCII_END = 126
OPCODE_START = 200
OPCODE_END = 214
BYTE_LITERAL_START = 256
BYTE_LITERAL_END = 511
INTENT_GLYPH_START = 512

# Training texture dimensions
TEXTURE_SIZE = 256
QUADRANT_SIZE = 128
QUADRANT_PIXELS = 16384  # 128 * 128
```

### Existing Systems

| System | Integration |
|--------|-------------|
| `PixelBrainPipeline` | Training mode, next-codel prediction |
| `infinite_map_rs` | Execution validation (Metric 1) |
| `EvolutionDaemonV8` | Health monitoring, weight injection (Metric 3) |

**Note**: The current evolution daemon is at `systems/evolution_daemon/evolution_daemon.py` (v11+). The V8 reference refers to the interface version used for training integration.
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

**HilbertEncoder Implementation Strategy**:

Two options exist:
1. **Python wrapper around Rust**: Use existing `HilbertPathfinder` in `systems/infinite_map_rs/src/cognitive/hilbert_pathfinder.rs` via FFI
2. **Pure Python**: Implement matching algorithm in `geos/backends/hilbert.py`

**Recommendation**: Start with pure Python implementation for Phase 1 (faster iteration), migrate to Rust FFI in Phase 2 for production performance.

**Important**: Hilbert curves do NOT map directly to Cartesian quadrants. The quadrant-based layout (Q0-Q3) refers to visual regions, but Hilbert traversal zig-zags within each region. The training data generator must pre-compute the Hilbert-to-quadrant mapping.

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
