---
spec: ascii-exposed-computing-manifesto
phase: research
created: 2026-02-23T16:00:00Z
generated: auto
---

# Research: ascii-exposed-computing-manifesto

## Executive Summary

ASCII Exposed Computing is a design philosophy where every meaningful system state is exposed as readable text for dual human/AI access. The manifesto synthesizes lessons from Plan 9, UNIX /proc, and the existing Geometry OS ASCII Scene Graph implementation. Feasibility is HIGH - this is a documentation task with clear scope.

## Historical Context

### Plan 9: Everything is a File

Bell Labs' Plan 9 (1992) pioneered the "everything is a file" metaphor:
- Network connections as files in `/net/tcp`
- Window system as files in `/dev/wsys`
- Process state in `/proc`
- 9P protocol for uniform file access

**Key insight**: Uniform representation enables uniform tooling.

### UNIX /proc Filesystem

Linux `/proc` exposes kernel state as text files:
- `/proc/[pid]/status` - Process metadata
- `/proc/[pid]/cmdline` - Command line
- `/proc/loadavg` - System load

**Limitation**: Read-only for most files, inconsistent formatting.

### Twelve-Factor App: Logs as Streams

Heroku's 12-factor methodology treats logs as event streams:
- Time-ordered sequences of events
- Stdout/stderr as universal sink
- External routing to destinations

**Relevance**: Text streams are the universal API.

## Existing Implementation: Geometry OS ASCII Scene Graph

Located at `systems/visual_shell/ascii_scene/`. Already implements core concepts.

### Architecture Pattern

```
.ascii files in .geometry/ascii_scene/
  |
  +-- Renderers (NeuralCityAsciiRenderer, VisualShellAsciiRenderer, EvolutionAsciiRenderer)
        |
        +-- Hook interfaces (NeuralCityHook, VisualShellHook)
              |
              +-- Atomic writes (temp file + rename)
```

### Key Implementation Details

| Component | File | Pattern |
|-----------|------|---------|
| Atomic writes | `renderers/neural_city.py:126-156` | `tempfile.mkstemp` + `os.rename` |
| Hook broadcaster | `hooks.py:95-189` | Async dispatch to registered hooks |
| Fragment structure | `__init__.py:21-29` | 80x24 viewport, YAML-like format |
| Namespaces | `__init__.py` | shell/, agents/, tasks/, system/ |

### Output Files (Current)

| File | Content | Audience |
|------|---------|----------|
| `neural_city_map.ascii` | 80x24 camera viewport | Human |
| `district_focus.ascii` | Active district details | Human |
| `city_health.ascii` | PAS/entropy metrics | Dual |
| `shell_fragments.ascii` | Window tree | AI |
| `shell_focus.ascii` | Input state | AI |
| `shell_state.ascii` | Global metrics | Dual |

## Feasibility Assessment

| Aspect | Assessment | Notes |
|--------|------------|-------|
| Technical Viability | High | Documentation task, no code required |
| Effort Estimate | S | 7 sections, ~300 lines of markdown |
| Risk Level | Low | Well-defined scope from existing plan |

## Design Decisions from Existing Code

### 1. Dual-Format Approach

```python
# From __init__.py docstring:
tasks/board.ascii        # Human: visual kanban with ASCII boxes
tasks/board.json.ascii   # AI: structured data with full schema
```

Decision: Manifesto should formalize this pattern.

### 2. Atomic Writes for Consistency

```python
# From neural_city.py:126-156
def _atomic_write(self, filename: str, content: str) -> None:
    fd, temp_path = tempfile.mkstemp(dir=self.output_dir, prefix=f".{filename}.tmp")
    with os.fdopen(fd, 'w') as f:
        f.write(content)
    os.rename(temp_path, target_path)  # Atomic on POSIX
```

Decision: Document this as a required pattern.

### 3. Hook-Based Reactivity

```python
# From hooks.py
class VisualShellHook(ABC):
    async def on_window_create(self, id, title, pos, size): ...
    async def on_window_focus(self, id): ...
    async def on_window_close(self, id): ...
```

Decision: Hooks are the event layer, fragments are the state layer.

## Recommendations

1. **Structure manifesto as reference document** - Sections map to design decisions
2. **Include code examples from Geometry OS** - Real implementations ground the philosophy
3. **Define glossary early** - "fragment", "hook", "namespace" need precise definitions
4. **Cross-reference Plan 9 and /proc** - Establish philosophical lineage
5. **Add "When NOT to use" section** - Prevent over-application
