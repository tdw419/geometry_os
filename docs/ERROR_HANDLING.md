# Error Handling System

This document describes the comprehensive error handling system implemented across Geometry OS.

## Overview

The error handling system provides:
- **Unified Exception Hierarchy**: Domain-specific exceptions with rich context
- **Circuit Breaker Pattern**: Prevents cascading failures in external services
- **Retry with Backoff**: Resilient retry logic with exponential backoff
- **Global Error Handler**: Centralized error aggregation and recovery
- **Graceful Degradation**: Fallback mechanisms for non-critical failures

## Quick Start

```python
from core.exceptions import (
    GeometryOSError, 
    NeuralInferenceError,
    handle_errors,
    error_context,
)
from core.error_handler import (
    setup_global_error_handler,
    CircuitBreaker,
    retry_with_backoff,
)

# Setup at application startup
setup_global_error_handler()

# Use decorator for function-level handling
@handle_errors(recoverable=True, default_return=None)
def risky_operation():
    return perform_operation()

# Use context manager for block-level handling
with error_context("neural_cortex", "inference"):
    result = model.infer(data)

# Use circuit breaker for external services
cb = CircuitBreaker("lm_studio", failure_threshold=3)
with cb:
    response = lm_studio_client.infer(prompt)
```

## Exception Hierarchy

### Base Classes

```python
GeometryOSError              # Base for all Geometry OS errors
├── SystemError              # System-level errors
├── ConfigurationError       # Configuration problems
├── ResourceError            # Resource exhaustion
│   └── MemoryError          # Memory allocation failures
├── DependencyError          # Missing dependencies
```

### Neural/AI Errors

```python
NeuralError                  # Base for neural errors
├── NeuralInferenceError     # Inference failures
│   ├── ModelNotFoundError   # Model not available
│   ├── ModelLoadError       # Failed to load model
│   └── InferenceTimeoutError # Operation timed out
├── NeuralTrainingError      # Training failures
└── NeuralMemoryError        # Memory system errors
```

### GPU/Visual Errors

```python
GPUGeometryError             # Base for GPU errors
├── GPUInitError             # Initialization failed
├── ShaderCompileError       # Shader compilation failed
├── RenderError              # Rendering failures
└── GPUOutOfMemoryError      # GPU memory exhausted
```

### IO Errors

```python
IOError                      # Base for IO errors
├── FileOperationError       # File operations failed
├── NetworkError             # Network failures
├── ParseError               # Parsing failures
│   └── RTSParseError        # RTS file parsing
└── ExternalServiceError     # External service failures
    ├── LMStudioError        # LM Studio API errors
    └── WordPressError       # WordPress integration errors
```

### Evolution/Agent Errors

```python
EvolutionError               # Base for evolution errors
├── MutationError            # Mutation failures
├── EvolutionCycleError      # Evolution cycle failures
└── FitnessEvaluationError   # Fitness evaluation failures

AgentError                   # Base for agent errors
├── AgentSpawnError          # Failed to spawn agent
└── AgentCommunicationError  # Communication failures

SwarmError                   # Base for swarm errors
└── SwarmCoordinationError   # Coordination failures
```

## Error Context

Every exception includes rich context for debugging:

```python
from core.exceptions import ErrorContext, NeuralInferenceError

error = NeuralInferenceError(
    "Model inference failed",
    model="gpt-neo-125m",
    input_tokens=512,
    context=ErrorContext(
        operation="batch_inference",
        component="neural_cortex",
        details={"batch_size": 32},
    ),
)

# Access context
print(error.context.operation)  # "batch_inference"
print(error.context.stack_trace)  # Full stack trace
print(error.to_dict())  # Serialization for logging
```

## Circuit Breaker

Prevents cascading failures in external services:

```python
from core.error_handler import CircuitBreaker

# Create circuit breaker
cb = CircuitBreaker(
    name="lm_studio",
    failure_threshold=3,     # Open after 3 failures
    recovery_timeout=30.0,   # Try recovery after 30s
    half_open_max_calls=1,   # Test with 1 call in half-open
)

# Use with context manager
try:
    with cb:
        result = lm_studio.infer(prompt)
except GeometryOSError as e:
    if "circuit breaker" in str(e).lower():
        # Circuit is open, use fallback
        result = fallback_inference(prompt)

# Check state
if cb.is_open:
    print("Service unavailable")
elif cb.is_closed:
    print("Service healthy")

# Get statistics
stats = cb.get_stats()
print(f"Failures: {stats.failure_count}")
print(f"State: {stats.state.value}")
```

## Retry with Backoff

Resilient retry logic with exponential backoff:

```python
from core.error_handler import retry_with_backoff, RetryPolicy

# Simple retry
result = retry_with_backoff(
    lm_studio.infer,
    prompt,
    max_retries=3,
    initial_delay=0.1,
    retryable_exceptions=(NetworkError, InferenceTimeoutError),
)

# With callback
def on_retry(attempt, exception):
    logging.warning(f"Retry {attempt}: {exception}")

result = retry_with_backoff(
    risky_operation,
    max_retries=5,
    on_retry=on_retry,
)

# Using RetryPolicy directly
policy = RetryPolicy(
    max_retries=3,
    initial_delay=0.1,
    max_delay=10.0,
    exponential_base=2.0,
    jitter=0.1,
)

for attempt in policy:
    try:
        result = operation()
        break
    except Exception as e:
        if not policy.should_retry(e):
            raise
        policy.wait()
```

## Global Error Handler

Centralized error management:

```python
from core.error_handler import (
    GlobalErrorHandler, 
    setup_global_error_handler,
    error_boundary,
)

# Setup at startup
handler = setup_global_error_handler(
    enable_reporting=True,
    reporting_interval=60.0,
)

# Register recovery actions
def recover_from_oom(error):
    clear_gpu_cache()
    return True

handler.register_recovery_action("GPUOutOfMemoryError", recover_from_oom)

# Register fallbacks
handler.register_fallback("neural_cortex", default_inference)

# Handle errors manually
try:
    operation()
except Exception as e:
    recovered = handler.handle(e, component="my_component")
    if not recovered:
        raise

# Get statistics
stats = handler.get_error_statistics()
print(f"Total errors: {stats['total_errors']}")
print(f"Recovery rate: {stats['recovery_rate']:.2%}")
print(f"By component: {stats['by_component']}")
```

## Decorators and Utilities

### @handle_errors

```python
from core.exceptions import handle_errors

@handle_errors(
    recoverable=True,
    default_return=None,
    log_traceback=True,
    on_error=lambda e: notify_monitoring(e),
)
def risky_operation():
    return perform_operation()
```

### @graceful_fallback

```python
from core.error_handler import graceful_fallback

@graceful_fallback("neural_cortex", fallback_value=[])
def get_suggestions(query):
    return model.infer(query)
```

### error_boundary

```python
from core.error_handler import error_boundary

with error_boundary("component", "operation", reraise=False):
    risky_code()
```

### safe_call

```python
from core.exceptions import safe_call

result = safe_call(risky_function, arg1, arg2, default=None)
```

## Best Practices

### 1. Use Domain-Specific Exceptions

```python
# Bad
raise Exception("Model not found")

# Good
raise ModelNotFoundError(
    "Model gpt-neo-125m not found",
    model="gpt-neo-125m",
    recovery_hint="Ensure LM Studio is running with the model loaded.",
)
```

### 2. Provide Recovery Hints

```python
# Bad
raise GPUOutOfMemoryError("Out of memory")

# Good
raise GPUOutOfMemoryError(
    "GPU memory exhausted during inference",
    severity=ErrorSeverity.HIGH,
    recovery_hint="Reduce batch size or clear GPU cache.",
)
```

### 3. Use Circuit Breakers for External Services

```python
# Bad
response = requests.get("http://external-service/api")

# Good
cb = CircuitBreaker.get("external_service") or CircuitBreaker("external_service")
with cb:
    response = requests.get("http://external-service/api", timeout=5)
```

### 4. Implement Graceful Degradation

```python
@graceful_fallback("neural_cortex", fallback_value=[])
def get_recommendations(user_id):
    # Try primary service
    with circuit_breaker:
        return primary_service.get_recs(user_id)
    # Fallback is automatically returned on error
```

### 5. Log with Context

```python
with error_context("neural_cortex", "inference", model=model_name):
    logger.info(f"Starting inference for {model_name}")
    result = model.infer(data)
    logger.debug(f"Inference complete: {len(result)} results")
```

## Error Severity Levels

| Severity | Description | Action |
|----------|-------------|--------|
| LOW | Minor issues | Log and continue |
| MEDIUM | Problems affecting features | Log, attempt recovery |
| HIGH | Core functionality affected | Log, recover, alert |
| CRITICAL | System-breaking errors | Log, recover, escalate |
| FATAL | Unrecoverable | Log, graceful shutdown |

## Monitoring

The global error handler provides statistics for monitoring:

```python
stats = GlobalErrorHandler.get_instance().get_error_statistics()

# Key metrics
total_errors = stats['total_errors']
recovery_rate = stats['recovery_rate']
top_error_types = sorted(stats['by_type'].items(), key=lambda x: -x[1])[:5]
problematic_components = sorted(stats['by_component'].items(), key=lambda x: -x[1])[:5]
```

## Integration with Unified Logging

The error handling system integrates with the unified logging system:

```python
from core.unified_logging import UnifiedLogger

# Errors are automatically logged
logger = UnifiedLogger.get_instance()

# Custom error logging
logger.error(
    "Operation failed",
    exception=error,
    subsystem="neural_cortex",
)
```

## Testing Error Handling

See `tests/test_error_handling.py` for comprehensive test coverage including:
- Exception hierarchy tests
- Circuit breaker tests
- Retry policy tests
- Global handler tests
- Integration tests
- Error simulation tests
