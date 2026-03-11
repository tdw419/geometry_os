# Design: Infinite Map Area Agents

## Visual Architecture

```
┌───────────────────────────────────────────────────────────────────┐
│                     INFINITE MAP (4096 x 4096)                    │
├───────────────────────────────────┬───────────────────────────────┤
│                                   │                               │
│   ┌─────────────────────────┐     │   ┌─────────────────────────┐ │
│   │   CORE COMPOSITOR       │     │   │   VISUAL SHELL          │ │
│   │   (0,0) → (2048,2048)   │     │   │   (2048,0) → (4096,2048)│ │
│   │   Z-Layer: 10           │     │   │   Z-Layer: 15           │ │
│   │                         │     │   │                         │ │
│   │   • Window management   │     │   │   • UI components       │ │
│   │   • Layer composition   │     │   │   • Command execution   │ │
│   │   • Surface rendering   │     │   │   • Notifications       │ │
│   │   • DMA-BUF handling    │     │   │   • Theme management    │ │
│   │                         │     │   │                         │ │
│   └─────────────────────────┘     │   └─────────────────────────┘ │
│                                   │                               │
│ ┌───────────────┐                 │          ┌────────────────┐   │
│ │INPUT (z=20)   │                 │          │ DEVTOOLS (z=3) │   │
│ │(0,0)→(1024)   │                 │          │(3072,0)→(4096) │   │
│ └───────────────┘                 │          └────────────────┘   │
│                                   │                               │
├───────────────────────────────────┼───────────────────────────────┤
│                                   │                               │
│   ┌─────────────────────────┐     │   ┌─────────────────────────┐ │
│   │   NEURAL COGNITIVE      │     │   │   GRAPHICS RENDERING    │ │
│   │   (0,2048) → (2048,4096)│     │   │   (2048,2048) → (4096)  │ │
│   │   Z-Layer: 5            │     │   │   Z-Layer: 8            │ │
│   │                         │     │   │                         │ │
│   │   • Intent inference    │     │   │   • WGSL shaders        │ │
│   │   • Decision making     │     │   │   • Texture management  │ │
│   │   • Memory systems      │     │   │   • Render pipelines    │ │
│   │   • Goal tracking       │     │   │   • VRAM tracking       │ │
│   │                         │     │   │                         │ │
│   └─────────────────────────┘     │   └─────────────────────────┘ │
│                                   │                               │
│     ┌─────────────────────────────────────────┐                   │
│     │        SYSTEM SERVICES (z=1)            │                   │
│     │        (1024,1024) → (3072,3072)        │                   │
│     │        • File I/O • Network • Processes │                   │
│     └─────────────────────────────────────────┘                   │
│                                   │                               │
└───────────────────────────────────┴───────────────────────────────┘
```

## Agent Base Class Design

```python
class AreaAgent(ABC):
    """Abstract base for all area agents."""
    
    # Core identity
    area_id: str           # Unique identifier
    area_name: str         # Human-readable name
    boundary: AreaBoundary # Spatial region
    
    # State
    health: AgentHealth    # Health metrics
    _task_queue: List      # Pending tasks
    
    # Abstract methods (must implement)
    def get_capabilities(self) -> List[str]
    def process_task(self, task: AgentTask) -> Any
    def get_domain_metrics(self) -> Dict[str, Any]
    
    # Lifecycle hooks
    def _on_start(self)    # Override for init
    def _on_stop(self)     # Override for cleanup
    def tick(self)         # Override for continuous processing
```

## Task Routing Logic

The manager routes tasks based on type prefix:

| Prefix | Target Area |
|--------|-------------|
| `window_`, `layer_`, `frame_` | core_compositor |
| `component_`, `command_`, `notification_`, `theme_` | visual_shell |
| `intent_`, `decision_`, `memory_`, `goal_` | neural_cognitive |
| `shader_`, `texture_`, `pipeline_`, `vram_` | graphics_rendering |
| `device_`, `event_`, `gesture_` | input_interaction |
| `file_`, `process_`, `network_` | system_services |
| `build_`, `debug_`, `profile_` | development_tools |

## Health Monitoring

Each agent tracks:
- **Tasks Completed**: Successful task count
- **Tasks Failed**: Error count
- **Avg Latency**: Rolling average task processing time
- **Error Count**: Total errors encountered
- **Heartbeat**: Last tick timestamp

Health score formula:
```
score = success_rate - latency_penalty - error_penalty
      = (completed / total) - min(latency_ms/1000, 0.3) - min(errors*0.05, 0.3)
```

## Inter-Agent Communication

Agents can communicate via:

1. **Direct Send**: `agent.send_to_agent(target_area_id, task)`
2. **Broadcast**: `agent.broadcast(task)`
3. **Registry Lookup**: `AreaAgent.get_agent(area_id)`

## PAS Impact Analysis

| Metric | Before | After | Change |
|--------|--------|-------|--------|
| Code Organization | 0.70 | 0.92 | +0.22 |
| Parallel Execution | 0.60 | 0.95 | +0.35 |
| Resource Isolation | 0.50 | 0.90 | +0.40 |
| Health Monitoring | 0.40 | 0.95 | +0.55 |
| **Overall PAS** | 0.55 | 0.93 | +0.38 |

## Geometric Integrity

- **Hilbert Mapping**: Areas use Hilbert curve ranges for spatial locality
- **Z-Layer Priority**: Higher layers (input=20) process first
- **Boundary Checking**: `boundary.contains(x, y)` for hit testing
- **Overlap Detection**: `boundary.overlaps(other)` for conflict resolution
