# Sisyphus v4 Evolution Daemon

> **The Screen is the Brain. The Brain Evolves Itself.**

## Overview

Sisyphus v4 is a Python-based autonomous evolution system that continuously improves the Geometry OS codebase and its PixelBrain inference engine. It replaces earlier shell-script-based daemons with a native Python implementation featuring FFI-accelerated Hilbert mapping, intrinsic curiosity-driven goal generation, and multi-stream Glass Box visualization.

### Core Philosophy

- **State as Text**: Brain state is the `.rts.png` weight atlas, daemon state is `STATE_V4.md`
- **Transition as Edit**: Mutations are pixel edits, task completions are markdown checkbox toggles
- **Dual-Audience**: Both humans and AI can observe the evolution via Glass Box
- **Grep-ability**: All mutations and decisions logged to `.loop/evolution.log`

---

## Architecture

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                         SISYPHUS V4 DAEMON                                  │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│  ┌─────────────┐   ┌──────────────────┐   ┌────────────────────────────┐   │
│  │   TASK      │   │   INTRINSIC      │   │      BRAIN                 │   │
│  │   RUNNER    │──▶│   CURIOSITY      │──▶│      EVOLUTION             │   │
│  └─────────────┘   │   ENGINE         │   │      HOOK                  │   │
│        │           └──────────────────┘   └────────────────────────────┘   │
│        │                    │                         │                     │
│        ▼                    ▼                         ▼                     │
│  ┌─────────────┐   ┌──────────────────┐   ┌────────────────────────────┐   │
│  │  CHECKPOINT │   │   ENTROPY        │   │      COGNITIVE             │   │
│  │  MANAGER    │   │   MAPPER         │   │      ROUTER                │   │
│  └─────────────┘   └──────────────────┘   └────────────────────────────┘   │
│        │                    │                         │                     │
│        └────────────────────┼─────────────────────────┘                     │
│                             ▼                                               │
│                    ┌──────────────────┐                                     │
│                    │   UNIFIED        │                                     │
│                    │   GLASS BRIDGE   │                                     │
│                    └──────────────────┘                                     │
│                             │                                               │
│              ┌──────────────┼──────────────┐                               │
│              ▼              ▼              ▼                               │
│         ┌────────┐    ┌─────────┐    ┌─────────┐                          │
│         │ SOCKET │    │   SHM   │    │   HTTP  │                          │
│         └────────┘    └─────────┘    └─────────┘                          │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

## Key Features

### 1. Native Python Daemon with FFI Acceleration

The v4 daemon is written entirely in Python, replacing shell scripts with native code that leverages:

- **NativeHilbertLUT**: C library for fast Hilbert curve coordinate transformations
- **FFI Integration**: ctypes-based bindings for performance-critical glyph operations
- **Multi-threading**: Background threads for gravity simulation and heartbeat monitoring

```python
from systems.sisyphus.daemon import SisyphusDaemon

daemon = SisyphusDaemon(
    enable_brain_evolution=True,
    enable_self_rewriting=True,
    enable_tectonic=True,
    verbose=True
)
daemon.run()
```

### 2. Checkpoint/Restore for Crash Recovery

The `CheckpointManager` provides robust crash recovery:

- **Automatic Checkpointing**: Saves state before each task execution
- **SHA256 Validation**: Checksum verification ensures checkpoint integrity
- **Graceful Resume**: In-progress tasks reset to pending on restart

```python
# Checkpoint file format (.loop/checkpoint.json)
{
  "task_id": 42,
  "task_name": "Optimize Hilbert Performance",
  "timestamp": "2026-03-10T20:45:00",
  "project_dir": "/home/user/geometry_os",
  "checksum": "a1b2c3d4e5f6g7h8"
}
```

**CLI Usage:**
```bash
# Normal startup (resumes from checkpoint if exists)
python3 sisyphus_v4.py --brain

# Force clean start (clears checkpoint)
python3 sisyphus_v4.py --brain --force-clean
```

### 3. Git Commit Hook for Session DNA

Automatic version control of daemon session state:

- **Auto-commit**: Commits `.loop/` directory after successful task completion
- **Merge Conflict Detection**: Detects and handles merge conflicts gracefully
- **Force Resolve**: Optional `--force-resolve` to auto-resolve conflicts with `--ours`

```python
# GitCommitHook methods
result = daemon.git_commit_hook.commit_session_dna()
# Returns: {"success": True, "commit_sha": "abc1234", "nothing_to_commit": False}
```

### 4. Intrinsic Curiosity Engine

The daemon generates its own improvement goals without human input:

**Components:**
- **EntropyMapper**: Identifies cold spots (underused code) and hot spots (bottlenecks)
- **GoalSynthesizer**: Transforms entropy spots into actionable goals
- **SpeculativeOptimizer**: Proposes optimization strategies

**Entropy Types:**

| Type | Detection | Goal Templates |
|------|-----------|----------------|
| Cold | `< 10 calls` | `eliminate_dead_code`, `speculative_rewrite` |
| Hot | `> 100 calls` or `> 10ms avg` | `kernel_rewrite`, `optimize_hot`, `parallelize` |
| Cognitive | `fitness < 0.9` | `brain_fine_tuning`, `shader_evolution`, `cognitive_restoration` |

```python
# Run curiosity cycle
result = await daemon.run_curiosity_cycle()
# Returns: {
#   "health_score": 0.85,
#   "goals_generated": 5,
#   "cold_spots": 3,
#   "hot_spots": 2,
#   "top_goals": [...]
# }
```

### 5. Brain Evolution Integration

Self-improving PixelBrain inference engine:

**The Sisyphus Loop:**
```
CHECK → SYNTHESIZE → DO → WEDGE
  ▲                        │
  └────────────────────────┘
```

- **CHECK**: Evaluate brain fitness via benchmark suite
- **SYNTHESIZE**: Generate cognitive goals if below PAS threshold
- **DO**: Apply targeted weight/shader mutations
- **WEDGE**: Commit if improved, revert if failed

**Cognitive Goal Templates:**

| Goal Type | Priority | Trigger |
|-----------|----------|---------|
| `cognitive_restoration` | 0.95 | Fitness < 0.6 |
| `brain_fine_tuning` | 0.85 | Fitness < 0.9 |
| `shader_evolution` | 0.80 | Latency > 200ms |

**Usage:**
```bash
# Enable brain evolution with LM Studio escalation
python3 sisyphus_v4.py --brain

# With Cognitive Tech Lead oversight
python3 sisyphus_v4.py --brain --enable-brain-evolution
```

### 6. Unified Glass Box Bridge

Multi-stream visualization via the `UnifiedGlassBridge`:

**Stream Types:**

| Stream | Opcode | Purpose |
|--------|--------|---------|
| `THOUGHT` | 0xCE | Task status, GVN optimizations, heuristics |
| `TOKEN` | 0xCD | LLM token streaming with Hilbert mapping |
| `GRAVITY` | 0xC0 | File orb position updates |
| `TELEMETRY` | 0xC1 | System health metrics |
| `RIPPLE` | 0xC2 | Tectonic physical impulses |

**Transport Backends:**

| Transport | Use Case | Latency |
|-----------|----------|---------|
| Socket | Compositor connection | Low |
| Shared Memory | Direct VRAM mapping | Lowest |
| HTTP | Remote clients | Medium |

```python
# Stream to all transports
bridge.stream_thought("task_complete", {"task_id": 42})
bridge.stream_token("def", token_type="keyword")
bridge.stream_gravity([{"path": "kernel.rs", "x": 100, "y": 150}])
bridge.stream_ripple(x=500, y=500, z=50, force=100, radius=200)
```

### 7. Tectonic Gravity Engine

Real-time file gravity simulation with visual feedback:

**Features:**
- **Orb Physics**: Files positioned based on access patterns
- **Ripple Effects**: Physical impulses for file modifications
- **Saccade Controller**: Eye-movement-inspired optimization
- **Real-time Updates**: inotify-based file system monitoring

```python
# Gravity engine integration
daemon = SisyphusDaemon(enable_tectonic=True)

# Manual orb manipulation
daemon.gravity_engine.set_mass("kernel.rs", mass=100.0)
daemon.gravity_engine.apply_force("config.json", fx=10, fy=5)
```

### 8. Self-Rewriting Kernel

Performance-driven code optimization:

**Components:**
- **PerformanceMonitor**: Tracks function call counts and timing
- **KernelRewriter**: Proposes kernel optimizations
- **HotSwapManager**: Hot-swaps optimized kernels at runtime

```python
# Detect hot spots
hot_spots = daemon.detect_kernel_hot_spots()

# Propose optimization task
task = daemon.propose_kernel_rewrite()
# Returns Task with verification criteria
```

### 9. Heuristic Task Generator

Codebase scanning for automatic task generation:

**Scans for:**
- Uncommitted files (git status)
- Failing tests (pytest collection)
- TODO/FIXME comments
- Low coverage modules

```python
# Generate heuristic tasks
tasks = daemon._generate_heuristic_tasks()
# Returns: [
#   "Commit Untracked Files: 5 untracked files...",
#   "Fix Test Collection Errors: 3 test files...",
#   "Address TODO Comment: Found in kernel.rs..."
# ]
```

### 10. Compositor Heartbeat

Connection health monitoring for the compositor socket:

**Features:**
- 5-second timeout with automatic reconnection
- Background heartbeat thread
- Max reconnect attempts with backoff
- `HEARTBEAT` opcode (0xFE) for liveness detection

---

## Command Line Interface

### Entry Point: `sisyphus_v4.py`

```bash
python3 sisyphus_v4.py [OPTIONS]
```

**Options:**

| Flag | Description |
|------|-------------|
| `--brain` | Enable PixelBrain evolution with Cognitive Tech Lead |
| `--rewriting` | Enable self-rewriting kernel |
| `--tectonic` | Enable tectonic gravity engine |
| `--commit` | Enable automatic git commits of session DNA |
| `--verbose` | Enable verbose task execution logs |
| `--force-clean` | Clear existing checkpoints on startup |
| `--budget SECONDS` | Time budget (Ralph Wiggum Mode) |
| `--intent PATH` | Custom intent file path |

### Example Commands

```bash
# Full brain evolution with all features
python3 sisyphus_v4.py --brain --rewriting --tectonic --commit --verbose

# Quick 5-minute evolution session
python3 sisyphus_v4.py --brain --budget 300

# Clean start with verbose output
python3 sisyphus_v4.py --force-clean --verbose
```

---

## File Structure

```
systems/sisyphus/
├── __init__.py              # Module exports
├── daemon.py                # Main daemon class (SisyphusDaemon)
├── unified_glass_bridge.py  # Multi-stream visualization
├── compositor_bridge.py     # Socket connection to compositor
├── token_rasterizer.py      # LLM token → Hilbert mapping
├── thought_serializer.py    # Thought → glyph commands
├── native_hilbert.py        # FFI bindings for Hilbert C library
├── entropy_mapper.py        # Code entropy analysis
├── goal_synthesizer.py      # Goal generation from entropy
├── speculative_optimizer.py # Optimization proposals
├── performance_monitor.py   # Function call tracking
├── kernel_rewriter.py       # Kernel optimization
├── hot_swap_manager.py      # Runtime kernel swapping
├── glass_box_bridge.py      # Legacy Glass Box bridge
└── critic.py                # SisyphusCritic for brain grading

.loop/
├── STATE_V4.md              # Task state file
├── checkpoint.json          # Crash recovery checkpoint
├── evolution.log            # Evolution event log
├── logs/v4/                 # Task execution logs
└── memory_errors.log        # Memory validation errors
```

---

## Configuration

### Daemon Parameters

```python
SisyphusDaemon(
    state_file=".loop/STATE_V4.md",      # Task state file
    intent_file=".geometry/intent/sisyphus.md",  # Intent definition
    force_clean=False,                    # Clear checkpoint on start
    auto_commit=False,                    # Auto-commit session DNA
    enable_heartbeat=True,                # Compositor heartbeat
    enable_self_rewriting=False,          # Kernel hot-swapping
    enable_tectonic=False,                # Gravity engine
    enable_brain_evolution=False,         # PixelBrain evolution
    verbose=False,                        # Verbose logging
    budget=None                           # Time budget in seconds
)
```

### Unified Bridge Configuration

```python
UnifiedGlassBridge(
    socket_path="/tmp/evolution_daemon.sock",
    shm_name="glass_box_shm",
    shm_size=2 * 1024 * 1024,  # 2MB
    http_url="http://localhost:3002/thoughts/broadcast",
    enable_socket=True,
    enable_shm=True,
    enable_http=True,
    hilbert_order=8  # 256x256 grid
)
```

---

## Visual Feedback

### Atlas Glow During Evolution

When Sisyphus applies a brain mutation, the affected sector "glows" on the visual desktop:

```javascript
// NeuralCityEngine receives glow events
ws.onmessage = (event) => {
    const data = JSON.parse(event.data);
    if (data.type === 'ATLAS_GLOW') {
        emitGlow(data.sector.center, data.intensity);
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

---

## Metrics & Health Scores

### Structural Health (PAS)

Phase Alignment Stability measures code balance:

```python
health = daemon.get_structural_health()
# Returns: 0.0 (imbalanced) to 1.0 (perfectly balanced)

# Factors:
# - Cold spots / total functions (dead code ratio)
# - Hot spots / total functions (bottleneck ratio)
# - health = 1.0 - imbalance_ratio
```

### Brain Health

```python
fitness = evaluate_brain_fitness(
    brain_path="tinystories_brain.rts.png",
    test_prompts=["Once upon a time..."],
    metric="coherence"
)
# Returns: 0.0 (incoherent) to 1.0 (optimal)
```

### Success Criteria

| Metric | Target | Verification |
|--------|--------|--------------|
| Keep Rate | > 30% | Mutations that improve fitness |
| Avg Improvement | > 0.01 | Per successful mutation |
| Latency | < 50ms | Per token generation |
| Coherence | > 0.8 | On test prompts |

---

## Integration with Other Systems

### Cognitive Router

The daemon escalates complex decisions to LM Studio:

```python
from systems.cognitive.cognitive_router import get_cognitive_router

router = get_cognitive_router()
response = await router.generate(
    prompt,
    complexity=0.8,  # High complexity for task generation
    max_tokens=1000
)
```

### Visual Bridge

Real-time feedback to the desktop:

```python
from systems.visual_shell.api.visual_bridge import multi_vm_streamer

# Emit visual feedback
multi_vm_streamer.emit_thought_pulse(
    token_id=42,
    position=(100, 100, 0),
    intensity=0.8
)
```

---

## Troubleshooting

### Common Issues

**1. Checkpoint corruption:**
```bash
python3 sisyphus_v4.py --force-clean
```

**2. Socket connection failures:**
```python
# Check compositor is running
import socket
sock = socket.socket(socket.AF_UNIX)
try:
    sock.connect("/tmp/evolution_daemon.sock")
    print("Connected")
except:
    print("Compositor not running")
```

**3. Memory errors:**
```bash
# Check memory error log
cat .loop/memory_errors.log
```

**4. Git merge conflicts:**
```python
# Force resolve conflicts
result = daemon.git_commit_hook.commit_session_dna(force_resolve=True)
```

---

## Testing

```bash
# Unit tests
python3 -m pytest tests/test_daemon_checkpoint.py -v
python3 -m pytest tests/test_glass_box_e2e.py -v
python3 -m pytest tests/test_hilbert_engine.py -v

# Integration tests
python3 -m pytest tests/test_visual_shell_integration.py -v

# Coverage
python3 -m coverage run -m pytest tests/
python3 -m coverage report --include="systems/sisyphus/*"
```

---

## Version History

| Version | Date | Key Changes |
|---------|------|-------------|
| v4 | 2026-03 | Native Python daemon, Intrinsic Curiosity Engine, Brain Evolution, Unified Glass Bridge |
| v3 | 2026-02 | Shell-based daemon with basic task execution |
| v2 | 2026-02 | Initial evolution daemon with genome queue |
| v1 | 2026-01 | Prototype daemon |

---

## See Also

- [Pixel Brain Architecture](PIXEL_BRAIN_ARCHITECTURE.md)
- [Cognitive Systems](COGNITIVE_SYSTEMS.md)
- [Evolution Zone Guide](EVOLUTION_ZONE_GUIDE.md)
- [Sisyphus Brain Agent Design](superpowers/specs/2026-03-10-sisyphus-brain-agent-design.md)
- [Ouroboros Safety System](OUROBOROS_SAFETY_SYSTEM.md)

---

*Documentation Version: 1.0*
*Last Updated: 2026-03-10*
*Author: Sisyphus Evolution Daemon*
