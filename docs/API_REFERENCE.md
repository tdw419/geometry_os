# Geometry OS API Reference

> Complete API documentation for Geometry OS core systems

## Table of Contents

- [Core APIs](#core-apis)
- [Evolution Daemon API](#evolution-daemon-api)
- [Visual Shell API](#visual-shell-api)
- [Pixel Compiler API](#pixel-compiler-api)
- [Pixel Brain API](#pixel-brain-api)
- [Swarm API](#swarm-api)
- [Tectonic API](#tectonic-api)
- [Cognitive API](#cognitive-api)

---

## Core APIs

### GeometryOSCLI

Main command-line interface for Geometry OS operations.

```python
from geometry_os_cli import GeometryOSCLI

cli = GeometryOSCLI()
cli.run_demo(agents=10, rounds=50)
```

#### Methods

| Method | Parameters | Returns | Description |
|--------|------------|---------|-------------|
| `run_demo` | `agents: int`, `rounds: int` | `None` | Run swarm demonstration |
| `start_daemon` | `config: dict` | `DaemonHandle` | Start evolution daemon |
| `build_system` | `name: str` | `BuildResult` | Build specific system |

---

## Evolution Daemon API

### EvolutionDaemon

Self-improving system with brain mutations and fracture detection.

```python
from systems.evolution_daemon import EvolutionDaemon

daemon = EvolutionDaemon(
    brain_path="gpt_neo_125m_brain.rts.png",
    enable_mutations=True,
    pas_threshold=0.5
)

# Start daemon
daemon.start()

# Run evolution cycle
result = daemon.run_cycle()

# Check status
status = daemon.get_status()
```

#### Constructor Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `brain_path` | `str` | Required | Path to RTS brain file |
| `enable_mutations` | `bool` | `True` | Enable brain mutations |
| `pas_threshold` | `float` | `0.5` | Phase Alignment Stability threshold |
| `gravity_strength` | `float` | `0.1` | Gravitational pull strength |
| `repair_enabled` | `bool` | `True` | Enable auto-repair |

#### Methods

| Method | Parameters | Returns | Description |
|--------|------------|---------|-------------|
| `start` | - | `None` | Start the daemon |
| `stop` | - | `None` | Stop the daemon |
| `run_cycle` | - | `EvolutionResult` | Execute one evolution cycle |
| `get_status` | - | `DaemonStatus` | Get current daemon status |
| `trigger_repair` | `cause: str` | `RepairResult` | Manually trigger repair cycle |
| `apply_mutation` | `mutation: Mutation` | `MutationResult` | Apply a specific mutation |

#### EvolutionResult

```python
@dataclass
class EvolutionResult:
    success: bool
    pas_score: float
    mutations_applied: int
    repairs_triggered: int
    fitness_score: float
    errors: List[str]
```

### OuroborosSpine

Fracture detection and repair system.

```python
from systems.evolution_daemon.ouroboros import OuroborosSpine

spine = OuroborosSpine(
    pas_threshold=0.5,
    repair_cooldown=60
)

# Check for fractures
fractures = spine.detect_fractures()

# Trigger repair
spine.repair(fracture_id="fracture_001")
```

---

## Visual Shell API

### VisualShell

Main visual shell interface for desktop rendering.

```python
from systems.visual_shell import VisualShell

shell = VisualShell(
    width=1920,
    height=1080,
    backend="pixijs"  # or "native"
)

# Initialize
shell.initialize()

# Render frame
shell.render()

# Handle input
shell.handle_event(event)
```

#### Constructor Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `width` | `int` | `1920` | Viewport width |
| `height` | `int` | `1080` | Viewport height |
| `backend` | `str` | `"pixijs"` | Rendering backend |
| `foveated` | `bool` | `True` | Enable foveated rendering |
| `foveal_radius` | `int` | `200` | Foveal region radius in pixels |

#### Methods

| Method | Parameters | Returns | Description |
|--------|------------|---------|-------------|
| `initialize` | - | `None` | Initialize rendering context |
| `render` | - | `FrameResult` | Render current frame |
| `handle_event` | `event: Event` | `None` | Process input event |
| `set_focus` | `x: int`, `y: int` | `None` | Set foveal focus point |
| `add_glyph` | `glyph: Glyph` | `str` | Add glyph to scene |
| `remove_glyph` | `id: str` | `None` | Remove glyph from scene |

### TectonicBridge

Bridge between visual shell and tectonic system.

```python
from systems.visual_shell.tectonic_bridge import TectonicBridge

bridge = TectonicBridge(
    port=8772,
    watch_path="/tmp/geometry_os"
)

# Start watching
bridge.start_watch()

# Get current state
state = bridge.get_state()
```

---

## Pixel Compiler API

### PixelCompiler

Convert between binary and RTS PNG formats.

```python
from pixel_compiler.converter import PixelCompiler

compiler = PixelCompiler(
    hilbert_order=8,
    compression="zstd"
)

# Binary to RTS
compiler.binary_to_rts(
    input_path="program",
    output_path="program.rts.png"
)

# RTS to binary
compiler.rts_to_binary(
    input_path="program.rts.png",
    output_path="program"
)
```

#### Constructor Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `hilbert_order` | `int` | `8` | Hilbert curve order (1-12) |
| `compression` | `str` | `"zstd"` | Compression algorithm |
| `chunk_size` | `int` | `4096` | Processing chunk size |

#### Methods

| Method | Parameters | Returns | Description |
|--------|------------|---------|-------------|
| `binary_to_rts` | `input_path`, `output_path` | `ConversionResult` | Convert binary to RTS PNG |
| `rts_to_binary` | `input_path`, `output_path` | `ConversionResult` | Convert RTS PNG to binary |
| `verify_roundtrip` | `path: str` | `bool` | Verify bit-perfect conversion |
| `get_metadata` | `path: str` | `RTSMetadata` | Get RTS file metadata |

### RTSMetadata

```python
@dataclass
class RTSMetadata:
    version: str
    original_size: int
    compressed_size: int
    sha256: str
    hilbert_order: int
    created_at: datetime
```

---

## Pixel Brain API

### PixelBrain

Live LLM inference from RTS-encoded models.

```python
from pixel_brain import PixelBrain

brain = PixelBrain(
    model_path="gpt_neo_125m_brain.rts.png",
    lm_studio_url="http://localhost:1234/v1"
)

# Load model
brain.load()

# Run inference
response = brain.infer(
    prompt="Hello, world!",
    max_tokens=100,
    temperature=0.7
)

# Stream inference
for token in brain.stream_infer("Tell me a story"):
    print(token, end="", flush=True)
```

#### Constructor Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `model_path` | `str` | Required | Path to RTS brain file |
| `lm_studio_url` | `str` | `None` | LM Studio API URL |
| `device` | `str` | `"auto"` | Compute device (auto/cuda/cpu) |
| `precision` | `str` | `"fp16"` | Numerical precision |

#### Methods

| Method | Parameters | Returns | Description |
|--------|------------|---------|-------------|
| `load` | - | `None` | Load model into memory |
| `unload` | - | `None` | Unload model from memory |
| `infer` | `prompt`, `**kwargs` | `InferenceResult` | Run inference |
| `stream_infer` | `prompt`, `**kwargs` | `Iterator[str]` | Stream inference tokens |
| `inject_persona` | `persona: str` | `None` | Inject persona into model |
| `get_attention` | - | `AttentionMap` | Get attention weights |

### InferenceResult

```python
@dataclass
class InferenceResult:
    text: str
    tokens: int
    confidence: float
    latency_ms: float
```

---

## Swarm API

### SwarmNode

Distributed agent node for swarm intelligence.

```python
from systems.swarm import SwarmNode, AgentConfig

config = AgentConfig(
    name="worker-01",
    role="worker",
    capabilities=["compute", "storage"],
    guild="processors"
)

node = SwarmNode(config)
node.start()

# Execute task
result = node.execute(task)

# Get status
status = node.get_status()
```

### AgentConfig

```python
@dataclass
class AgentConfig:
    name: str
    role: str  # worker, coordinator, scanner, etc.
    capabilities: List[str]
    guild: Optional[str] = None
    max_tasks: int = 10
    heartbeat_interval: float = 5.0
```

### CoordinatorAgent

Task orchestration and distribution.

```python
from systems.swarm.coordinator import CoordinatorAgent

coordinator = CoordinatorAgent(
    strategy="round_robin",
    retry_policy={"max_retries": 3}
)

# Submit task
task_id = coordinator.submit(task)

# Get task status
status = coordinator.get_task_status(task_id)
```

### HealthDashboard

Real-time cluster health monitoring.

```python
from systems.swarm.dashboard import HealthDashboard

dashboard = HealthDashboard(port=8080)
dashboard.start()

# Get cluster health
health = dashboard.get_cluster_health()

# Get node metrics
metrics = dashboard.get_node_metrics("worker-01")
```

---

## Tectonic API

### TectonicServer

Spatial negotiation and district management.

```python
from systems.tectonic import TectonicServer

server = TectonicServer(
    port=8772,
    district_port=8773
)

# Start server
server.start()

# Create district
district = server.create_district(
    name="compute-zone",
    bounds=BoundingBox(x=0, y=0, width=100, height=100)
)

# Negotiate space
allocation = server.negotiate(request)
```

### District

Spatial district for resource management.

```python
from systems.tectonic import District

district = District(
    name="storage-zone",
    bounds=BoundingBox(x=100, y=0, width=50, height=50),
    capacity=1000
)

# Allocate space
allocation = district.allocate(size=100)

# Release allocation
district.release(allocation.id)
```

---

## Cognitive API

### UnifiedCognitiveDaemon

LLM-powered cognitive reasoning.

```python
from systems.cognitive import UnifiedCognitiveDaemon

cognitive = UnifiedCognitiveDaemon(
    lm_studio_url="http://localhost:1234/v1"
)

# Analyze intent
intent = cognitive.analyze_intent("Fix the bug in parser.py")

# Get confidence
confidence = cognitive.get_confidence()
```

### IntentAnalysis

```python
@dataclass
class IntentAnalysis:
    category: str  # Debug/Repair, Create, Query, etc.
    confidence: float
    entities: List[str]
    suggested_actions: List[str]
```

### MeshEvent

Cross-agent event broadcasting.

```python
from systems.cognitive.mesh import MeshEvent, MeshEventBus

# Create event
event = MeshEvent(
    type="task_completed",
    source="worker-01",
    payload={"task_id": "task-123", "result": "success"}
)

# Publish
bus = MeshEventBus()
bus.publish(event)

# Subscribe
@bus.subscribe("task_completed")
def handle_task_completed(event):
    print(f"Task {event.payload['task_id']} completed")
```

---

## Error Handling

All APIs use consistent error handling:

```python
from geometry_os.errors import (
    GeometryOSError,
    ConversionError,
    InferenceError,
    DaemonError
)

try:
    result = brain.infer("prompt")
except InferenceError as e:
    print(f"Inference failed: {e.message}")
    print(f"Details: {e.details}")
```

### Error Types

| Error | Description |
|-------|-------------|
| `GeometryOSError` | Base error class |
| `ConversionError` | RTS conversion failures |
| `InferenceError` | Model inference failures |
| `DaemonError` | Daemon operation failures |
| `NetworkError` | Network/cluster failures |
| `ResourceError` | Resource allocation failures |

---

## Configuration

### Environment Variables

```bash
# LM Studio Configuration
LM_STUDIO_URL=http://localhost:1234/v1
LM_STUDIO_API_KEY=optional_key

# Service Ports
DISTRICT_PORT=8773
TECTONIC_PORT=8772
VISUAL_SHELL_PORT=8080
MCP_SERVER_PORT=3000

# Debug Options
GEOMETRY_OS_DEBUG=1
GEOMETRY_OS_LOG_LEVEL=DEBUG

# Performance
GEOMETRY_OS_GPU_ENABLED=1
GEOMETRY_OS_FOVEATED_RENDERING=1
```

### Configuration Files

```yaml
# .geometry/config.yaml
evolution:
  pas_threshold: 0.5
  gravity_strength: 0.1
  repair_enabled: true

visual_shell:
  backend: pixijs
  foveated: true
  foveal_radius: 200

swarm:
  max_nodes: 100
  heartbeat_interval: 5.0
  task_timeout: 300
```

---

## See Also

- [Security API Reference](security/api-reference.md)
- [Advanced Features Guide](../ADVANCED_FEATURES.md)
- [Troubleshooting Guide](../TROUBLESHOOTING.md)
- [OpenSpec Specifications](../openspec/specs/)

---

*Last Updated: 2026-03-11*
*Version: 4.0.1*
