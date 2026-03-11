# Debug Logging Framework

## Overview

The Geometry OS debug logging framework provides granular tracing for critical operations with:

- **Operation Tracing**: Track operations with timing, hierarchy, and metadata
- **Log Correlation**: Cross-service correlation with trace IDs
- **Structured Output**: JSON and text log formats for analysis
- **Configurable Verbosity**: Per-category and per-subsystem log levels
- **Performance Metrics**: Automatic slow operation detection
- **Error Tracking**: Capture and analyze errors with stack traces

## Quick Start

```python
from core.debug_logger import (
    configure_debug_logging,
    trace,
    traced,
    DebugLevel,
    OperationCategory,
)

# Configure logging
configure_debug_logging(
    global_level=DebugLevel.DEBUG,
    output_to_console=True,
    output_to_file=True,
    output_file="logs/my_app.log",
)

# Trace an operation
with trace("my_operation", OperationCategory.NEURAL_INFERENCE) as t:
    # Do work
    t.metadata["result"] = "success"

# Trace a function
@traced("my_function", OperationCategory.GPU_RENDER)
def my_function(x, y):
    return x + y
```

## Subsystem Loggers

Use pre-configured subsystem loggers for consistent logging across the codebase:

```python
from core.unified_logging import (
    get_neural_cortex_logger,
    get_visual_shell_logger,
    get_evolution_logger,
    get_agent_swarm_logger,
)

# Get a subsystem logger
logger = get_neural_cortex_logger()

# Trace operations
with logger.trace("inference", OperationCategory.NEURAL_INFERENCE):
    # Run inference
    pass

# Log messages
logger.info("Processing started")
logger.debug("Model loaded", category=OperationCategory.NEURAL_INFERENCE)
logger.error("Inference failed", exception=e)
```

## Critical Operation Tracing

Use the pre-built tracing helpers for common operations:

```python
from core.unified_logging import (
    trace_neural_inference,
    trace_shader_compile,
    trace_evolution_cycle,
    trace_file_operation,
    trace_agent_spawn,
)

# Neural inference
with trace_neural_inference("gpt-neo-125m", input_shape=(1, 512)):
    # Run inference
    pass

# Shader compilation
with trace_shader_compile("main_fragment", "fragment"):
    # Compile shader
    pass

# Evolution cycle
with trace_evolution_cycle(generation=5, population_size=100):
    # Run evolution
    pass
```

## Operation Categories

All operations are categorized for filtering and analysis:

| Category | Description |
|----------|-------------|
| `NEURAL_INFERENCE` | Neural network inference |
| `NEURAL_TRAINING` | Neural network training |
| `NEURAL_COMPILE` | Neural network compilation |
| `GPU_RENDER` | GPU rendering operations |
| `GPU_SHADER` | Shader compilation |
| `GPU_MEMORY` | GPU memory operations |
| `VISUAL_PROCESS` | Visual processing |
| `EVOLUTION_CYCLE` | Evolution cycles |
| `EVOLUTION_MUTATE` | Mutation operations |
| `EVOLUTION_SELECT` | Selection operations |
| `FILE_READ` | File read operations |
| `FILE_WRITE` | File write operations |
| `FILE_PARSE` | File parsing |
| `NETWORK_SEND` | Network send operations |
| `NETWORK_RECV` | Network receive operations |
| `IPC_CALL` | IPC operations |
| `MEMORY_ALLOC` | Memory allocation |
| `MEMORY_FREE` | Memory deallocation |
| `CACHE_HIT` | Cache hits |
| `CACHE_MISS` | Cache misses |
| `AGENT_SPAWN` | Agent spawning |
| `AGENT_MESSAGE` | Agent messaging |
| `SWARM_COORD` | Swarm coordination |
| `USER_INPUT` | User input handling |
| `USER_OUTPUT` | User output generation |
| `STATE_CHANGE` | State changes |
| `STATE_QUERY` | State queries |
| `INIT` | Initialization |
| `SHUTDOWN` | Shutdown |

## Debug Levels

| Level | Value | Description |
|-------|-------|-------------|
| `OFF` | 0 | No logging |
| `ERROR` | 1 | Errors only |
| `WARNING` | 2 | Warnings and errors |
| `INFO` | 3 | Informational, warnings, errors |
| `DEBUG` | 4 | Debug, info, warnings, errors |
| `TRACE` | 5 | All messages (most verbose) |

## Configuration

### Environment Variables

Configure logging via environment variables:

```bash
export GEOM_LOG_LEVEL=DEBUG
export GEOM_LOG_DIR=logs
export GEOM_LOG_CONSOLE=true
export GEOM_SERVICE_NAME=my-service
```

### Programmatic Configuration

```python
from core.debug_logger import DebugConfig, DebugLevel, DebugLogger
from core.unified_logging import UnifiedLogger

config = DebugConfig(
    global_level=DebugLevel.INFO,
    output_to_console=True,
    output_to_file=True,
    output_file="logs/debug.log",
    output_json=True,
    json_output_file="logs/debug.json",
    slow_operation_threshold_ms=50.0,
    very_slow_threshold_ms=500.0,
    capture_stack_traces=False,
    capture_stack_on_error=True,
    # Category-specific levels
    category_levels={
        OperationCategory.NEURAL_INFERENCE: DebugLevel.DEBUG,
    },
    # Subsystem-specific levels
    subsystem_levels={
        "visual_shell": DebugLevel.TRACE,
    },
)

logger = DebugLogger(config)
```

## Output Formats

### Text Log Format

```
[2026-03-11 05:45:42.423745] [TRACE] [neural_inference] [log] START: inference_gpt-neo-125m
[2026-03-11 05:45:42.481160] [TRACE] [neural_inference] [log] END: inference_gpt-neo-125m ✓ (57.42ms)
[2026-03-11 05:45:42.481176] [WARNING] [neural_inference] [log] SLOW OPERATION: inference_gpt-neo-125m took 57.42ms
```

### JSON Log Format

```json
{
  "operation_id": "op_2_1773225942423736",
  "category": "neural_inference",
  "name": "inference_gpt-neo-125m",
  "start_time": 1773225942.423737,
  "end_time": 1773225942.4811528,
  "duration_ms": 57.41572380065918,
  "parent_id": null,
  "thread_id": 125233722171520,
  "status": "success",
  "metadata": {
    "model": "gpt-neo-125m",
    "input_shape": "[1, 512]",
    "output_tokens": 64
  },
  "children": ["op_5_1773225942441231", "op_8_1773225942446462"],
  "error": null,
  "stack_trace": null
}
```

## Session Reports

Generate comprehensive session reports:

```python
from core.unified_logging import start_session, end_session

# Start session
session_id = start_session("my_session")

# Do work...

# End session and generate report
end_session()
```

Reports include:
- Operation statistics by category
- Error summaries
- Slow operation analysis
- Hierarchical operation trees

## Statistics and Analysis

```python
from core.debug_logger import get_debug_logger

logger = get_debug_logger()

# Get statistics
stats = logger.get_statistics()
print(f"Total operations: {stats['total_operations']}")
print(f"By status: {stats['by_status']}")

# Get slow operations
slow = logger.get_slow_operations(threshold_ms=100.0)
for op in slow:
    print(f"{op.name}: {op.duration_ms:.2f}ms")

# Get errors
errors = logger.get_errors()
for err in errors:
    print(f"{err.name}: {err.error}")

# Get trace tree
tree = logger.get_trace_tree(operation_id)
```

## Integration with Log Correlation

The debug logger integrates with the existing log correlation system:

```python
from core.unified_logging import UnifiedLogger

unified = UnifiedLogger.get_instance()

# Set trace context for correlation
unified.set_trace_context("trace-123", "span-456")

# Get combined statistics
stats = unified.get_statistics()
```

## Files

| File | Description |
|------|-------------|
| `core/debug_logger.py` | Core debug logging implementation |
| `core/unified_logging.py` | Integration with log correlation |
| `tests/test_debug_logger.py` | Test suite |
| `scripts/demo_debug_logging.py` | Verification demo script |
| `systems/visual_shell/log_correlation.py` | Log correlation system |

## Verification

Run the verification script to see the logging in action:

```bash
python scripts/demo_debug_logging.py
```

This simulates a typical user session with:
- Neural inference operations
- GPU rendering operations
- Evolution cycles
- Agent swarm coordination
- File I/O
- Error recovery

Output includes:
- Real-time console logging
- JSON trace files
- Session report with statistics
