# Stage-Manager-Actor Integration with OpenSpec

## Overview
This document describes how Geometry OS's OpenSpec system implements the Stage-Manager-Actor pattern for persistent domain memory.

## Architecture Mapping

### Stage Manager (Initializer) → OpenSpec Proposal System
- **Prompt Expansion**: `proposal.md` expands user intent into structured requirements
- **State Initialization**: `tasks.md` provides granular task breakdown
- **Governance Design**: `design.md` defines architectural constraints
- **Verification Setup**: `specs/*/spec.md` contains acceptance criteria (Scenarios)

### Actor (Worker) → Evolution Daemon V8 + Proactive Assistant
- **Context Loading**: Reads `tasks.md` and `PHASE_*_PROGRESS.md`
- **Atomic Implementation**: Executes one task at a time
- **Self-Verification**: Runs `openspec validate` after changes
- **State Update**: Updates progress files and commits to Git

### Shared State → Git + Structured Files
- **tests.json equivalent**: `tasks.md` (human-readable) + `spec.md` (machine-readable)
- **Progress log**: `PHASE_*_PROGRESS.md` + `claude-progress.txt`
- **Memory persistence**: `.claude/memory/` directory
- **Version control**: Git commits as state checkpoints

## Enhancements Needed

### 1. Add `tests.json` Generation
Create a tool to convert OpenSpec proposals into structured JSON:

```bash
openspec export add-contextual-memory-system --format=tests-json > tests.json
```

### 2. Automated Verification Harness
Integrate with the Actor to run validation loops:

```python
# In memory_orchestrator.py
async def verify_openspec_task(self, change_id: str, task_id: str) -> bool:
    """Verify task completion using OpenSpec validation."""
    result = subprocess.run(
        ["openspec", "validate", change_id, "--strict"],
        capture_output=True
    )
    return result.returncode == 0
```

### 3. Memory Graph Visualization
Create a UI panel in the Visual Shell to inspect domain memory:

```
┌─ Domain Memory Inspector ─────────────────┐
│ Working Context: 2.3 MB (4,521 tokens)    │
│ Episodic Events: 847 interactions         │
│ Semantic Facts: 1,203 entities            │
│ Procedural Skills: 23 workflows           │
│                                            │
│ Active Tasks: 3 / 12                      │
│ System Health: 94.2% (PAS Score)          │
└────────────────────────────────────────────┘
```

## Implementation Roadmap

### Week 1: Foundation
- [x] Create `memory_orchestrator.py` with Stage-Manager-Actor classes
- [ ] Add `tests.json` export to OpenSpec CLI
- [ ] Integrate with existing `contextual_memory.py`

### Week 2: Automation
- [ ] Implement automated verification loops in Actor
- [ ] Add self-correction based on test failures
- [ ] Create memory compaction policies (context rot prevention)

### Week 3: Visualization
- [ ] Build Memory Graph Inspector UI component
- [ ] Add real-time memory metrics to System Monitor
- [ ] Create memory lineage visualization (what facts came from where)

### Week 4: Integration
- [ ] Connect Memory Orchestrator to Evolution Daemon V8
- [ ] Enable Proactive Assistant to suggest tasks from tests.json
- [ ] Implement "memory decay" for unimportant episodic events

## Success Criteria

1. **Persistence**: Agent maintains context across 60+ sessions (already achieved via OpenSpec)
2. **Self-Verification**: 95%+ of tasks auto-validate before human review
3. **Context Stability**: Zero context drift incidents over 30-day period
4. **Performance**: <100ms memory retrieval latency for working context
5. **Transparency**: Full audit trail of all memory writes/reads

## References
- Nate B. Jones: "Orchestrating Persistence" (2026)
- Geometry OS Phase 25: Contextual Memory System
- OpenSpec Specification Framework
