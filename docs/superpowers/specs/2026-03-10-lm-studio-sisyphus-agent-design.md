# LM Studio Sisyphus Agent Design

> **The Tech Lead for Cognitive Evolution**

## Overview

The LM Studio Sisyphus Agent extends the Sisyphus Brain Agent with a "Tech Lead" pattern. While PixelBrain handles high-speed native inference, LM Studio (running larger models like Qwen 2.5 Coder or Llama 3) provides deep architectural reasoning and quality grading.

## Architecture

### The Tech Lead Pattern

```
┌─────────────────────────────────────────────────────────────────────────┐
│                      COGNITIVE ROUTER (Tech Lead)                        │
│  ┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐     │
│  │  ROUTING LOGIC  │───▶│  DRIFT DETECTOR │───▶│  TASK CLASSIFIER │     │
│  │                 │    │                 │    │                 │     │
│  │ simple → PB     │    │ PAS < 0.8?     │    │ complexity: 0-1 │     │
│  │ complex → LMS   │    │ → escalate     │    │                 │     │
│  └─────────────────┘    └─────────────────┘    └─────────────────┘     │
│                              │                      │                    │
│                              ▼                      ▼                    │
│  ┌─────────────────────────────────────────────────────────────────┐  │
│  │                     SISYPHUS CRITIC                              │  │
│  │   Grades PixelBrain output → decides COMMIT/REVERT              │  │
│  └─────────────────────────────────────────────────────────────────┘  │
└─────────────────────────────────────────────────────────────────────────┘
```

### Dual-Brain Architecture

| Brain | Role | Strengths |
|-------|------|-----------|
| **PixelBrain** | Fast Execution | WGPU shaders, Hilbert atlas, GPU-native |
| **LM Studio** | Tech Lead | Deep reasoning, architectural analysis, quality grading |

## Escalation Policies

The CognitiveRouter escalates to LM Studio when:

1. **Task Complexity > 0.8** - Complex refactoring, design decisions
2. **PAS Score < 0.8** - Phase Alignment Stability drops, indicating drift
3. **Architectural Keywords** - "refactor", "design pattern", "architecture", "optimize"

```python
ROUTING_POLICIES = {
    "complexity_threshold": 0.8,
    "pas_escalation_threshold": 0.8,
    "escalation_keywords": ["refactor", "design pattern", "architecture", "optimize"],
    "default_engine": "pixelbrain",
    "tech_lead_engine": "lmstudio"
}
```

## Sisyphus Critic Loop

The Critic grades PixelBrain mutations during each curiosity cycle:

```
┌──────────────────────────────────────────────────────────────────────────┐
│                       SISYPHUS CRITIC LOOP                               │
│                                                                          │
│   1. SAMPLE     2. GRADE        3. FEEDBACK       4. SYNTHESIZE         │
│   ┌─────────┐   ┌─────────┐     ┌─────────┐       ┌─────────┐          │
│   │PixelBrain│──▶│Cognitive│────▶│Tech Lead │──────▶│  Goal   │          │
│   │ output  │   │ Router  │     │ Decision │       │Synthesizer│         │
│   └─────────┘   └─────────┘     └─────────┘       └─────────┘          │
│                                                                      │    │
│                                                                      ▼    │
│   ┌────────────────────────────────────────────────────────────────┐  │
│   │  Grade Structure:                                               │  │
│   │  {                                                              │  │
│   │    "grade": 0.85,                                               │  │
│   │    "rationale": "Mutation improves attention coherence...",     │  │
│   │    "decision": "COMMIT" | "REVERT"                              │  │
│   │  }                                                              │  │
│   └────────────────────────────────────────────────────────────────┘  │
└──────────────────────────────────────────────────────────────────────────┘
```

### Critic Workflow

1. **Sampling**: Sisyphus generates sample output from current PixelBrain state
2. **Grading**: Sample sent to CognitiveRouter; critical mutations escalated to LM Studio
3. **Feedback**: Tech Lead provides structured JSON grade with rationale
4. **Goal Synthesis**: Low grades trigger Cognitive Restoration tasks

## Components

### Modified Files

| File | Changes |
|------|---------|
| `systems/cognitive/cognitive_router.py` | `_route_task()` policy, `LLMNarrativeClient` backend |
| `systems/sisyphus/daemon.py` | Critic integration in curiosity cycle |
| `systems/sisyphus/goal_synthesizer.py` | Cognitive Restoration goal templates |

### New Files

| File | Purpose |
|------|---------|
| `systems/sisyphus/critic.py` | SisyphusCritic class for structured grading |

## Usage

### Command Line

```bash
# Full Sisyphus with Tech Lead enabled
python3 sisyphus_v4.py --brain --rewriting --tectonic

# The system will log [Cognitive Audit] events:
# [2026-03-10 07:30:15] [Cognitive Audit] Grade: 0.85, Decision: COMMIT
# [2026-03-10 07:30:15] [Cognitive Audit] Rationale: Mutation improves...
```

### Programmatic

```python
from systems.cognitive.cognitive_router import get_cognitive_router
from systems.sisyphus.critic import SisyphusCritic

# Get router with Tech Lead pattern
router = get_cognitive_router()

# Route a task (auto-escalates based on complexity)
result = await router.generate(
    prompt="Refactor the attention mechanism for better coherence",
    complexity=0.9  # High complexity → LM Studio
)

# Use critic for grading
critic = SisyphusCritic(router)
grade = await critic.grade_mutation(
    mutation_type="attention_pattern",
    before="Previous attention weights",
    after="New attention weights"
)
# Returns: {"grade": 0.85, "decision": "COMMIT", "rationale": "..."}
```

## Integration with Brain Evolution

The LM Studio Sisyphus Agent integrates with the existing BrainEvolutionHook:

```
┌───────────────────────────────────────────────────────────────────────────┐
│                    ENHANCED EVOLUTION FLOW                                 │
│                                                                            │
│   BrainEvolutionHook               SisyphusCritic                         │
│   ─────────────────                ──────────────                         │
│                                                                            │
│   1. Detect Entropy  ────────────▶ 2. Sample Output                       │
│                                                                            │
│   3. Propose Mutation  ──────────▶ 4. Grade Mutation                      │
│                                      │                                     │
│                                      ▼                                     │
│   5. Apply Mutation  ◀────────────  5a. COMMIT                            │
│        or                                                               │
│   6. Revert  ◀────────────────────  5b. REVERT                           │
│                                                                            │
│   7. Update PAS Score  ───────────▶ 8. Log to evolution.log               │
└───────────────────────────────────────────────────────────────────────────┘
```

## Metrics

### Cognitive Audit Logs

Each critic evaluation logs:

```json
{
  "timestamp": "2026-03-10T07:30:15Z",
  "mutation_type": "attention_pattern",
  "sector": "attention_layer_1",
  "grade": 0.85,
  "decision": "COMMIT",
  "rationale": "Mutation improves attention coherence without breaking locality",
  "engine_used": "lmstudio",
  "latency_ms": 450
}
```

### Success Criteria

| Metric | Target | Description |
|--------|--------|-------------|
| Commit Rate | > 40% | Mutations passing Tech Lead review |
| Avg Grade | > 0.75 | Average critic grade |
| PAS Score | > 0.8 | Phase Alignment Stability |
| Escalation Rate | 10-20% | Tasks routed to LM Studio |

## Philosophy

> The Tech Lead doesn't do the heavy lifting—it reviews the work and ensures quality. PixelBrain pushes the boulder; LM Studio decides if it stays at the summit.

This dual-brain architecture embodies Geometry OS's philosophy:
- **Native First**: Use local GPU inference when possible
- **Quality Gates**: Escalate to deeper reasoning for critical decisions
- **Observable Evolution**: Every mutation is graded and logged
- **Self-Improving**: The critic improves as the brain improves

---

*Design Date: 2026-03-10*
*Status: Implemented*
*Version: 1.0*
*Related: [Sisyphus Brain Agent](./2026-03-10-sisyphus-brain-agent-design.md)*
