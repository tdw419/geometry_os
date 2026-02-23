---
spec: wordpress-truth-daemon
phase: research
created: 2026-02-22T12:00:00Z
generated: auto
---

# Research: WordPress Truth Daemon

## Executive Summary
Build daemon to extract factual claims from WordPress content, score using CTRM hybrid scoring (LLM + author + source + corroboration), sync to CTRM database with hourly verification. High feasibility - all dependencies exist.

## Codebase Analysis

### Existing Patterns

| Pattern | File | Notes |
|---------|------|-------|
| CTRMDatabase | `src/ctrm_core/database.py` | SQLite with WAL mode, truth storage |
| CTRMTruthManager | `src/ctrm_core/truth_manager.py` | create_truth(), verify_foundational_truths() |
| LMStudioIntegration | `src/lm_studio/integration.py` | generate(), generate_embedding(), get_loaded_model() |
| Triad evidence frames | `ctrm/schemas.py` | ConfidenceBlock, DecisionConflictBlock patterns |
| Async daemon pattern | `systems/evolution_daemon/` | asyncio loops with signal handling |

### Dependencies (All Available)

| Dep | Location | Usage |
|-----|----------|-------|
| `CTRMDatabase` | `src/ctrm_core/database.py` | SQLite storage for truths |
| `CTRMTruthManager` | `src/ctrm_core/truth_manager.py` | Truth lifecycle management |
| `LMStudioIntegration` | `src/lm_studio/integration.py` | LLM inference for claim extraction |
| `asyncio` | stdlib | Async daemon loops |
| `requests` | pypi | WordPress HTTP calls |
| `aiohttp` | pypi (already used) | Async HTTP |

### Constraints

1. WordPress must run with ai-publisher.php endpoint
2. LM Studio must have loaded model
3. Token budget management (CTRMTruthManager has 100k daily)
4. Content length limit 4000 chars per extraction

## Feasibility Assessment

| Aspect | Assessment | Notes |
|--------|------------|-------|
| Technical Viability | High | All components exist, clear integration path |
| Effort Estimate | M | 9 tasks, ~4-6 hours implementation |
| Risk Level | Low | Well-defined interfaces, existing patterns |

## Component Integration

### CTRMDatabase
```python
# Existing API (src/ctrm_core/database.py)
db = CTRMDatabase("ctrm_llm_os.db")
db.initialize()
db.store_truth(truth_dict)
db.query_similar_truths(embedding, limit)
db.get_all_truths()
```

### CTRMTruthManager
```python
# Existing API (src/ctrm_core/truth_manager.py)
manager = CTRMTruthManager(db, embedder)
await manager.create_truth(statement, context, confidence, importance_score, category, metadata)
await manager.verify_foundational_truths(max_tokens=5000)
```

### LMStudioIntegration
```python
# Existing API (src/lm_studio/integration.py)
lm = LMStudioIntegration()
result = await lm.generate(model, prompt, max_tokens, temperature)
model = await lm.get_loaded_model()  # Returns "microsoft/phi-4" or similar
```

## Scoring Formula

```
initial_confidence = (llm_confidence * 0.4) +
                     (author_reliability * 0.3) +
                     (source_type_weight * 0.2) +
                     (corroboration_boost * 0.1)

distance_from_center = 50 + (1 - initial_confidence) * 40
```

Author weights: admin=0.9, editor=0.8, author=0.7, contributor=0.6
Source weights: research_document=0.9, page=0.85, post=0.8, comment=0.5

## Recommendations

1. Use existing CTRMTruthManager.create_truth() with externally-computed confidence
2. Reuse verify_foundational_truths() for hourly cycles
3. Add `wordpress_extracted` category for filtering
4. Store WordPress metadata (post_id, url, triad_components) in truth.metadata
