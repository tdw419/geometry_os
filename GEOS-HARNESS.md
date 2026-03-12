# GEOS Harness: Agent-Native OS Development

## Purpose

This harness provides a standard operating procedure (SOP) for AI agents to build
Geometry OS components. The goal: construct an autonomous entity that lives on screen,
where the screen IS the hard drive.

## Philosophy

### Core Principles (from CLI-Anything, adapted)

| CLI-Anything | Geometry OS Adaptation |
|--------------|----------------------|
| Use the real software | Use real GPU, real files, real inference - no mocks |
| Output verification | Verify pixels, not assumptions - check magic bytes, FPS, memory |
| Agent-native design | Every component speaks JSON + CLI + ASCII state |
| Stateful REPL | Persistent state via .geometry/ directory |
| Self-describing | --help on every command, state as human-readable text |

### Geometry OS Specifics

1. **State as Text** — All system state is human-readable ASCII in .geometry/
2. **Transition as Edit** — State changes are text edits (like this file)
3. **Dual-Audience** — Comprehensible to humans AND parseable by AI
4. **Grep-ability** — Queryable with standard text tools
5. **60 FPS or Bust** — Visual shell must maintain frame rate
6. **Safety First** — Brain mutations stay sandboxed in evolution_daemon

---

## General SOP: Building an OS Component

### Phase 1: Requirement Analysis

1. **Define the capability gap** — What can't the OS do yet?
2. **Identify dependencies** — What must exist first? (check bootstrap layers)
3. **Map to layers**:
   - Layer 0: Substrate (PixelRTS encoding)
   - Layer 1: Visual Shell (PixiJS compositor)
   - Layer 2: Neural Bridge (NEB, Swarm, Senses)
   - Layer 3: Bootstrap UI (Fonts, Terminal, GEOS commands)
   - Layer 4: Self-Hosting (Evolution, Sisyphus)
4. **Define success metric** — How do we know it works? (FPS, latency, test count)

### Phase 2: Architecture Design

1. **Define the interface**:
   - CLI commands (e.g., `geos font render "Hello"`)
   - JSON API (e.g., `{"action": "render", "text": "Hello"}`)
   - ASCII state file (e.g., `.geometry/font_state.txt`)

2. **Define the state model**:
   - What persists? (in .geometry/)
   - What's ephemeral? (in memory)
   - How does state serialize? (JSON, plain text, binary)

3. **Define the command groups**:
   ```
   <component>
   ├── status      # Current state
   ├── configure   # Settings
   ├── <action>    # Primary operations
   └── debug       # Introspection
   ```

4. **Plan output formats**:
   - Human: tables, colors, progress
   - Agent: `--json` flag everywhere

### Phase 3: Implementation

1. **Start with state file** — Define .geometry/<component>_state.json
2. **Add status command** — Let agents inspect before they modify
3. **Add probe commands** — Read-only operations first
4. **Add mutation commands** — One command per logical operation
5. **Add backend integration** — Wrap real libraries (wgpu, pixi.js, etc.)
6. **Add rendering/export** — Real output, verified
7. **Add session management** — Undo/redo via state snapshots

### Phase 4: Test Planning (TEST.md)

**BEFORE writing code**, create a TEST.md:

1. **Test Inventory Plan**:
   - `test_<component>.py`: XX unit tests
   - `test_<component>_e2e.py`: XX E2E tests

2. **Unit Test Plan** — For each module:
   - Functions to test
   - Edge cases (invalid inputs, boundary conditions)
   - Expected test count

3. **E2E Test Plan**:
   - Real workflows (not mocked)
   - Real files generated
   - Output verification (magic bytes, structure, content)

4. **Realistic Workflow Scenarios**:
   - **Workflow**: "Font rendering pipeline"
   - **Simulates**: Terminal displaying shell output
   - **Operations**: load font → render text → display in compositor
   - **Verified**: Correct pixels, 60 FPS maintained

### Phase 5: Test Implementation

1. **Unit tests** — Pure logic, no GPU, no files
2. **E2E tests — intermediate** — Verify file formats, state structure
3. **E2E tests — real backend** — Invoke actual GPU/rendering:
   ```python
   def test_font_renders_to_texture():
       result = font_renderer.render("Hello")
       assert result.texture is not None
       assert result.texture.size > 0
       # Verify actual pixels, not stub
       pixels = result.texture.read_pixels()
       assert any(p > 0 for p in pixels)  # Not all black
   ```
4. **FPS tests** — Assert frame rate maintained:
   ```python
   def test_compositor_60fps():
       fps = measure_fps_over_100_frames()
       assert fps >= 60, f"FPS dropped to {fps}"
   ```

### Phase 6: Documentation

1. **Update MEMORY.md** — Add component to active systems table
2. **Create COMPONENT.md** — Architecture and API docs
3. **Update CLAUDE.md** — Add to success criteria if critical
4. **Ensure --help works** — Self-documenting commands

### Phase 7: Integration

1. **Wire to Neural Event Bus** — If agent-controllable
2. **Wire to Visual Shell** — If visual
3. **Wire to Evolution Daemon** — If self-improving
4. **Run full test suite** — `make test` must pass
5. **Update bootstrap_check.py** — Add layer verification if applicable

---

## Output Verification Standards

**Never trust success codes. Verify actual output:**

| Component | Verification |
|-----------|-------------|
| Texture/PNG | Check PNG magic bytes `\x89PNG` |
| FPS | Measure actual frame times, not estimates |
| Memory | Read `/proc/self/rss`, not allocation calls |
| Neural inference | Verify output tensor has expected shape |
| File operations | Check file exists AND has correct content |
| IPC messages | Verify message received, not just sent |

---

## The Bootstrap Layers (Dependency Order)

```
Layer 0: Substrate
├── PixelRTS encoding (binary ↔ .rts.png)
├── Status: ✅ Complete
└── Tests: 28

Layer 1: Visual Shell
├── PixiJS infinite map compositor
├── Status: Active
└── Target: 60 FPS

Layer 2: Neural Bridge
├── NEB (Neural Event Bus)
├── Swarm agents (Engineer, Reviewer, Architect)
├── Senses (FilesystemSense, WebSense)
├── Status: ✅ Complete
└── Tests: 180+

Layer 3: Bootstrap UI
├── Fonts (rendering, atlas)
├── Terminal (VT100/ANSI)
├── GEOS commands (ls, cat, etc.)
├── Status: Partial
└── Need: Font rendering pipeline

Layer 4: Self-Hosting
├── Evolution daemon (self-improvement)
├── Sisyphus brain (curiosity-driven learning)
├── Status: ✅ Complete
└── Tests: 196
```

---

## Command Template

Every component should expose:

```python
# cli.py
import click
import json

@click.group()
@click.option('--json', 'output_json', is_flag=True, help='JSON output for agents')
@click.pass_context
def cli(ctx, output_json):
    """Component name - brief description."""
    ctx.ensure_object(dict)
    ctx.obj['json'] = output_json

@cli.command()
@click.pass_context
def status(ctx):
    """Show current component state."""
    state = load_state()
    if ctx.obj['json']:
        click.echo(json.dumps(state, indent=2))
    else:
        # Human-readable table
        for key, value in state.items():
            click.echo(f"{key:20} {value}")

@cli.command()
@click.argument('param')
@click.pass_context
def action(ctx, param):
    """Perform primary operation."""
    result = do_action(param)
    if ctx.obj['json']:
        click.echo(json.dumps(result))
    else:
        click.echo(f"✓ Action completed: {result}")
```

---

## State File Template

Every component maintains `.geometry/<component>_state.json`:

```json
{
  "component": "font_renderer",
  "version": "1.0.0",
  "status": "operational",
  "last_update": "2026-03-11T12:00:00Z",
  "metrics": {
    "fonts_loaded": 3,
    "cache_hits": 1523,
    "render_time_ms": 0.42
  },
  "config": {
    "default_font": "monospace",
    "size": 14
  }
}
```

---

## Anti-Patterns (What NOT to Do)

1. **Mocking the GPU** — Use real wgpu/rendering
2. **Stubbing file operations** — Use temp directories with real files
3. **Assuming success** — Verify output bytes/pixels
4. **Skipping FPS tests** — Performance is a feature
5. **Complex state formats** — Prefer JSON/text over binary
6. **Undocumented commands** — Every command needs --help
7. **Agent-unfriendly output** — Every command needs --json

---

## Quick Reference

```bash
# Check bootstrap status
python3 systems/health/bootstrap_check.py

# Run all tests
make test

# Check infinite_map_rs compilation
cargo check --manifest-path systems/infinite_map_rs/Cargo.toml

# Measure compositor FPS
# (requires running visual_shell)
```

---

*Adapted from CLI-Anything HARNESS.md for Geometry OS*
*Last updated: 2026-03-11*
