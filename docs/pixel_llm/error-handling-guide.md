# Pixel LLM Error Handling Guide

This guide provides comprehensive documentation for error handling, monitoring, and resilience patterns in Pixel LLM operations.

## Overview

Pixel LLM includes a robust error handling system that provides:

- **Structured Logging**: JSON-based logging with async, non-blocking writes
- **Error Metrics**: Comprehensive tracking of errors, retries, circuit breakers, and fallbacks
- **Resilience Patterns**: Automatic retry, circuit breaking, and fallback strategies
- **Input Validation**: Pre-flight validation to prevent invalid operations

## Table of Contents

1. [Error Types and Codes](#error-types-and-codes)
2. [Monitoring and Logging](#monitoring-and-logging)
3. [Error Metrics](#error-metrics)
4. [Troubleshooting Guide](#troubleshooting-guide)
5. [Configuration Examples](#configuration-examples)

## Error Types and Codes

### Error Categories

Pixel LLM errors are organized into the following categories:

#### Connection Errors

Errors related to network connectivity and LM Studio API availability.

| Error Code | Message | Severity | Retryable |
|------------|---------|----------|-----------|
| `ERR_CONN_UNAVAILABLE` | LM Studio connection unavailable | HIGH | Yes |
| `ERR_CONN_REFUSED` | Connection refused by LM Studio | MEDIUM | Yes |
| `ERR_CONN_TIMEOUT` | Connection timeout occurred | MEDIUM | Yes |

#### Timeout Errors

Errors related to operation timeouts.

| Error Code | Message | Severity | Retryable |
|------------|---------|----------|-----------|
| `ERR_TIMEOUT_REQUEST` | Request timeout | MEDIUM | Yes |
| `ERR_TIMEOUT_RESPONSE` | Response timeout | MEDIUM | Yes |
| `ERR_TIMEOUT_IDLE` | Idle timeout | LOW | Yes |

#### Validation Errors

Errors related to input validation failures.

| Error Code | Message | Severity | Retryable |
|------------|---------|----------|-----------|
| `ERR_VAL_INVALID_TENSOR` | Invalid tensor shape or dtype | LOW | No |
| `ERR_VAL_MISSING_FIELD` | Required field missing | LOW | No |
| `ERR_VAL_INVALID_RANGE` | Value out of valid range | LOW | No |
| `ERR_VAL_EMPTY_INPUT` | Empty input provided | LOW | No |

#### API Errors

Errors returned by the LM Studio API.

| Error Code | Message | Severity | Retryable |
|------------|---------|----------|-----------|
| `ERR_API_RATE_LIMIT` | Rate limit exceeded | MEDIUM | Yes |
| `ERR_API_OVERLOAD` | API service overloaded | HIGH | Yes |
| `ERR_API_INVALID_RESPONSE` | Invalid API response | MEDIUM | Yes |
| `ERR_API_UNAUTHORIZED` | Unauthorized access | HIGH | No |

#### Encoder Errors

Errors related to vision encoder operations.

| Error Code | Message | Severity | Retryable |
|------------|---------|----------|-----------|
| `ERR_ENC_LOAD_FAILED` | Failed to load encoder checkpoint | CRITICAL | No |
| `ERR_ENC_FORWARD_FAILED` | Encoder forward pass failed | HIGH | Yes |
| `ERR_ENC_INVALID_INPUT` | Invalid encoder input | LOW | No |

#### Circuit Breaker Errors

Errors related to circuit breaker state.

| Error Code | Message | Severity | Retryable |
|------------|---------|----------|-----------|
| `ERR_CB_OPEN` | Circuit breaker is open | MEDIUM | No |
| `ERR_CB_HALF_OPEN` | Circuit breaker is half-open | MEDIUM | No |

#### Retry Errors

Errors related to retry exhaustion.

| Error Code | Message | Severity | Retryable |
|------------|---------|----------|-----------|
| `ERR_RETRY_EXHAUSTED` | Maximum retry attempts exhausted | HIGH | No |

### Exception Hierarchy

```python
PixelLMError (base exception)
├── ConnectionError
├── TimeoutError
├── ValidationError
├── APIError
├── EncoderError
├── CircuitBreakerOpen
└── RetryExhausted
```

## Monitoring and Logging

### Structured Logger

Pixel LLM uses `StructuredLogger` for JSON-based logging with async, non-blocking writes.

#### Features

- **JSON Format**: Easy parsing and log analysis
- **Async Writes**: Non-blocking logging operations
- **Multiple Levels**: DEBUG, INFO, WARNING, ERROR, CRITICAL
- **Context Tracking**: Per-component context with request/session IDs
- **Error Code Tracking**: Automatic error code association
- **Stack Traces**: Full exception capture

#### Basic Usage

```python
from geometry_os.systems.pixel_llm.monitoring import (
    StructuredLogger,
    LogContext,
    LogLevel,
    set_context,
)

# Create a logger
logger = StructuredLogger(
    name="pixel_llm",
    level=LogLevel.INFO,
    enable_console=True,
    enable_async=True,
)

# Set logging context
set_context(
    component="HybridPixelLLM",
    operation="generate",
    request_id="req-123",
)

# Log messages
logger.info("Starting generation")
logger.error("Generation failed", error_code="ERR_API_RATE_LIMIT")
logger.log_exception("Encoder error", exception, error_code="ERR_ENC_FORWARD_FAILED")
```

#### Advanced Usage

```python
from pathlib import Path

# Logger with file output
logger = StructuredLogger(
    name="pixel_llm",
    level=LogLevel.DEBUG,
    output_file=Path("logs/pixel_llm.log"),
    enable_console=True,
    enable_async=True,
)

# Dynamic log level changes
logger.change_level(LogLevel.DEBUG)

# Flush pending logs
logger.flush()

# Log with extra context
logger.info(
    "Processing batch",
    extra={"batch_size": 32, "model": "qwen2.5-coder-7b"}
)
```

#### Global Logger Registry

```python
from geometry_os.systems.pixel_llm.monitoring import get_logger, get_default_logger

# Get or create a named logger
logger = get_logger(
    name="my_component",
    level=LogLevel.DEBUG,
    output_file=Path("logs/my_component.log"),
)

# Get the default logger
default_logger = get_default_logger()
```

### Log Entry Format

Each log entry is a JSON object with the following structure:

```json
{
  "timestamp": "2024-02-08T12:34:56.789Z",
  "level": "ERROR",
  "message": "Generation failed",
  "context": {
    "component": "HybridPixelLLM",
    "operation": "generate",
    "request_id": "req-123"
  },
  "error_code": "ERR_API_RATE_LIMIT",
  "exception_type": "APIError",
  "stack_trace": "Traceback (most recent call last)...",
  "extra": {
    "batch_size": 32,
    "model": "qwen2.5-coder-7b"
  }
}
```

## Error Metrics

Pixel LLM provides comprehensive metrics collection through `ErrorMetrics`.

### Metric Types

The following metric types are tracked:

| Metric Type | Description |
|-------------|-------------|
| `ERROR_COUNT` | Count of errors by type and code |
| `RETRY_COUNT` | Number of retry attempts |
| `CIRCUIT_STATE_CHANGE` | Circuit breaker state transitions |
| `FALLBACK_ACTIVATION` | Fallback strategy activations |
| `LATENCY` | Operation latencies in milliseconds |
| `SUCCESS_COUNT` | Count of successful operations |

### Basic Usage

```python
from geometry_os.systems.pixel_llm.monitoring import get_metrics

# Get the global metrics instance
metrics = get_metrics()

# Record events
metrics.record_error("ConnectionError", "ERR_CONN_UNAVAILABLE", "generate")
metrics.record_success("generate")
metrics.record_retry("generate", attempts=3, success=True, delay=5.2)
metrics.record_latency("generate", 1234.5)
```

### Querying Metrics

```python
# Get error summary
error_summary = metrics.get_error_summary()
print(f"Total errors: {error_summary.total_errors}")
print(f"Errors by type: {error_summary.errors_by_type}")
print(f"Errors by code: {error_summary.errors_by_code}")

# Get retry statistics
retry_summary = metrics.get_retry_summary()
print(f"Total retries: {retry_summary.total_retries}")
print(f"Successful retries: {retry_summary.successful_retries}")
print(f"Average attempts: {retry_summary.avg_attempts_before_success}")

# Get circuit breaker status
cb_summary = metrics.get_circuit_breaker_summary("lm_studio_api")
print(f"Current state: {cb_summary.current_state}")
print(f"State transitions: {cb_summary.state_transitions}")
print(f"Total open time: {cb_summary.total_open_time}s")

# Get fallback statistics
fb_summary = metrics.get_fallback_summary("generate")
print(f"Total activations: {fb_summary.total_activations}")
print(f"Cache hit rate: {fb_summary.cache_hit_rate:.2%}")

# Get latency stats
latency_stats = metrics.get_latency_stats("generate")
print(f"Average latency: {latency_stats['avg_ms']:.2f}ms")
print(f"P95 latency: {latency_stats['p95_ms']:.2f}ms")
print(f"P99 latency: {latency_stats['p99_ms']:.2f}ms")
```

### Full Summary

```python
# Get comprehensive summary
summary = metrics.get_full_summary()
print(json.dumps(summary, indent=2))
```

Output:
```json
{
  "errors": {
    "total_errors": 15,
    "errors_by_type": {
      "ConnectionError": 8,
      "TimeoutError": 5,
      "ValidationError": 2
    },
    "errors_by_code": {
      "ERR_CONN_UNAVAILABLE": 8,
      "ERR_TIMEOUT_REQUEST": 5,
      "ERR_VAL_INVALID_TENSOR": 2
    }
  },
  "retries": {
    "total_retries": 25,
    "successful_retries": 20,
    "failed_retries": 5,
    "total_retry_delay_seconds": 45.5,
    "max_attempts": 5,
    "avg_attempts_before_success": 2.5
  },
  "circuit_breaker": {
    "current_state": "CLOSED",
    "state_transitions": 3,
    "total_open_time": 120.5,
    "opens_count": 2,
    "closes_count": 1,
    "half_opens_count": 0
  },
  "fallbacks": {
    "total_activations": 10,
    "cache_hits": 7,
    "cache_misses": 3,
    "default_value_used": 0,
    "custom_function_used": 0,
    "no_fallback_available": 0,
    "cache_hit_rate": 0.7
  },
  "error_rate_per_second": 0.25,
  "success_rate_per_second": 4.5,
  "latencies": {
    "generate": {
      "min_ms": 450.2,
      "max_ms": 2340.1,
      "avg_ms": 890.5,
      "p50_ms": 820.3,
      "p95_ms": 1450.7,
      "p99_ms": 2100.4,
      "count": 100
    }
  }
}
```

### Error and Success Rates

```python
# Get current error rate (errors per second)
error_rate = metrics.get_error_rate(window_seconds=60.0)
print(f"Error rate: {error_rate:.2f}/sec")

# Get current success rate
success_rate = metrics.get_success_rate(window_seconds=60.0)
print(f"Success rate: {success_rate:.2f}/sec")
```

### Metric History

```python
# Get metric history
from geometry_os.systems.pixel_llm.monitoring import MetricType

# Get last 100 error count metrics
error_history = metrics.get_history(
    metric_type=MetricType.ERROR_COUNT,
    limit=100
)

for point in error_history:
    print(f"{point.timestamp}: {point.value} - {point.tags}")
```

### Custom Callbacks

```python
# Register a callback for metric events
def on_metric(metric_point):
    if metric_point.metric_type == "error_count":
        if metric_point.value > 10:
            alert_team(f"High error rate: {metric_point.value}")

metrics.register_callback(on_metric)
```

### Reset Metrics

```python
# Clear all metrics
metrics.reset()
```

## Troubleshooting Guide

This section provides troubleshooting guidance for common error scenarios.

### Connection Errors

#### ERR_CONN_UNAVAILABLE

**Symptoms:**
- Unable to connect to LM Studio
- Connection refused or timeout

**Diagnosis:**
```python
from geometry_os.systems.pixel_llm.monitoring import get_metrics

metrics = get_metrics()
error_summary = metrics.get_error_summary("ConnectionError")
print(f"Connection errors: {error_summary.total_errors}")
```

**Solutions:**

1. **Check LM Studio availability:**
   ```bash
   curl http://localhost:1234/v1/models
   ```

2. **Verify connection configuration:**
   ```python
   model = HybridPixelLLM(
       checkpoint_path="checkpoints/vision_encoder.pt",
       lm_studio_host="localhost",  # Verify host
       lm_studio_port=1234,         # Verify port
   )
   ```

3. **Check network connectivity:**
   ```bash
   ping localhost
   telnet localhost 1234
   ```

4. **Enable debug logging:**
   ```python
   logger.change_level(LogLevel.DEBUG)
   ```

#### ERR_CONN_REFUSED

**Symptoms:**
- Connection actively refused by LM Studio

**Solutions:**

1. **Start LM Studio:**
   - Launch LM Studio application
   - Start the API server
   - Verify the server is running on the expected port

2. **Check port conflicts:**
   ```bash
   lsof -i :1234
   netstat -tulpn | grep 1234
   ```

3. **Update port configuration:**
   ```python
   model = HybridPixelLLM(
       lm_studio_port=1234,  # Match LM Studio port
   )
   ```

#### ERR_CONN_TIMEOUT

**Symptoms:**
- Connection attempts time out

**Solutions:**

1. **Increase timeout:**
   ```python
   model = HybridPixelLLM(
       timeout_seconds=30,  # Increase from default
   )
   ```

2. **Check firewall rules:**
   ```bash
   sudo ufw status
   sudo iptables -L
   ```

3. **Verify network latency:**
   ```bash
   ping -c 10 localhost
   ```

### Timeout Errors

#### ERR_TIMEOUT_REQUEST

**Symptoms:**
- Requests to LM Studio timeout

**Solutions:**

1. **Increase request timeout:**
   ```python
   model = HybridPixelLLM(
       timeout_seconds=60,  # Increase timeout
   )
   ```

2. **Check LM Studio load:**
   - Monitor CPU/GPU usage
   - Check if other processes are consuming resources

3. **Reduce batch size:**
   ```python
   caption = model.generate(image, batch_size=1)  # Process one at a time
   ```

#### ERR_TIMEOUT_RESPONSE

**Symptoms:**
- Waiting for response times out

**Solutions:**

1. **Use faster model:**
   ```python
   model = HybridPixelLLM(
       lm_studio_model="qwen2.5-3b-instruct",  # Faster than 7b
   )
   ```

2. **Reduce max tokens:**
   ```python
   caption = model.generate(
       image,
       max_tokens=50,  # Reduce from default
   )
   ```

3. **Check generation parameters:**
   ```python
   caption = model.generate(
       image,
       temperature=0.7,
       top_p=0.9,
       # Avoid sampling=True for faster generation
   )
   ```

### Validation Errors

#### ERR_VAL_INVALID_TENSOR

**Symptoms:**
- Tensor shape or dtype validation fails

**Diagnosis:**
```python
import torch

# Check tensor properties
print(f"Shape: {image.shape}")
print(f"Dtype: {image.dtype}")
print(f"Range: [{image.min()}, {image.max()}]")
```

**Solutions:**

1. **Ensure correct shape:**
   ```python
   # Expected: [batch, channels, height, width]
   image = image.unsqueeze(0) if image.dim() == 3 else image
   ```

2. **Normalize tensor:**
   ```python
   image = image.float() / 255.0  # [0, 255] -> [0, 1]
   ```

3. **Resize to expected size:**
   ```python
   import torch.nn.functional as F
   image = F.resize(image, (224, 224))
   ```

#### ERR_VAL_MISSING_FIELD

**Symptoms:**
- Required configuration field missing

**Solutions:**

1. **Provide all required fields:**
   ```python
   model = HybridPixelLLM(
       checkpoint_path="checkpoints/vision_encoder.pt",  # Required
       lm_studio_model="qwen2.5-coder-7b-instruct",     # Required
   )
   ```

2. **Use default configuration:**
   ```python
   model = HybridPixelLLM.from_default_config()
   ```

### API Errors

#### ERR_API_RATE_LIMIT

**Symptoms:**
- Rate limit exceeded errors

**Diagnosis:**
```python
metrics = get_metrics()
api_errors = metrics.get_error_summary()
print(f"Rate limit errors: {api_errors.errors_by_code.get('ERR_API_RATE_LIMIT', 0)}")
```

**Solutions:**

1. **Implement backoff:**
   ```python
   import time

   for attempt in range(3):
       try:
           caption = model.generate(image)
           break
       except APIError as e:
           if e.error_code == "ERR_API_RATE_LIMIT":
               time.sleep(2 ** attempt)  # Exponential backoff
   ```

2. **Reduce request rate:**
   ```python
   import time

   for image in images:
       caption = model.generate(image)
       time.sleep(1)  # Throttle requests
   ```

3. **Use circuit breaker:**
   ```python
   # Circuit breaker automatically handles rate limiting
   # by opening when threshold is exceeded
   ```

#### ERR_API_OVERLOAD

**Symptoms:**
- API service overloaded

**Solutions:**

1. **Wait and retry:**
   ```python
   # Automatic retry with exponential backoff
   caption = model.generate(image)  # Built-in retry
   ```

2. **Use fallback:**
   ```python
   # Configure fallback to cached results
   model = HybridPixelLLM(
       fallback_cache_enabled=True,
       fallback_cache_ttl=3600,  # 1 hour
   )
   ```

3. **Switch to smaller model:**
   ```python
   model = HybridPixelLLM(
       lm_studio_model="qwen2.5-3b-instruct",  # Less load
   )
   ```

### Encoder Errors

#### ERR_ENC_LOAD_FAILED

**Symptoms:**
- Failed to load encoder checkpoint

**Diagnosis:**
```python
from pathlib import Path

checkpoint_path = Path("checkpoints/vision_encoder.pt")
print(f"Exists: {checkpoint_path.exists()}")
print(f"Size: {checkpoint_path.stat().st_size if checkpoint_path.exists() else 'N/A'}")
```

**Solutions:**

1. **Verify checkpoint path:**
   ```python
   model = HybridPixelLLM(
       checkpoint_path="/absolute/path/to/checkpoints/vision_encoder.pt",
   )
   ```

2. **Re-train encoder:**
   ```python
   from geometry_os.systems.pixel_llm import PixelLLMTrainer

   # Train new encoder
   trainer.train()
   trainer.save_checkpoint("vision_encoder_v2")
   ```

3. **Use default encoder:**
   ```python
   model = HybridPixelLLM.from_default_config()
   ```

#### ERR_ENC_FORWARD_FAILED

**Symptoms:**
- Encoder forward pass fails

**Solutions:**

1. **Validate input:**
   ```python
   from geometry_os.systems.pixel_llm.validation import validate_image_tensor

   try:
       validate_image_tensor(image)
   except ValidationError as e:
       print(f"Invalid input: {e}")
   ```

2. **Check encoder state:**
   ```python
   print(f"Encoder device: {model.encoder.device}")
   print(f"Encoder dtype: {model.encoder.dtype}")
   ```

3. **Move to correct device:**
   ```python
   image = image.to(model.encoder.device)
   image = image.to(model.encoder.dtype)
   ```

### Circuit Breaker Errors

#### ERR_CB_OPEN

**Symptoms:**
- Circuit breaker is open, blocking requests

**Diagnosis:**
```python
metrics = get_metrics()
cb_summary = metrics.get_circuit_breaker_summary("lm_studio_api")
print(f"Current state: {cb_summary.current_state}")
print(f"Opens: {cb_summary.opens_count}")
print(f"Total open time: {cb_summary.total_open_time}s")
```

**Solutions:**

1. **Wait for circuit to close:**
   - Circuit breaker automatically closes after cooldown period
   - Default cooldown: 60 seconds

2. **Manually reset circuit breaker:**
   ```python
   model.circuit_breaker.reset()
   ```

3. **Adjust circuit breaker thresholds:**
   ```python
   model = HybridPixelLLM(
       circuit_breaker_failure_threshold=10,  # Increase threshold
       circuit_breaker_cooldown_seconds=30,   # Reduce cooldown
   )
   ```

4. **Use fallback during outage:**
   ```python
   caption = model.generate(
       image,
       enable_fallback=True,  # Use cached results
   )
   ```

### Retry Exhaustion

#### ERR_RETRY_EXHAUSTED

**Symptoms:**
- Maximum retry attempts exhausted

**Diagnosis:**
```python
metrics = get_metrics()
retry_summary = metrics.get_retry_summary()
print(f"Failed retries: {retry_summary.failed_retries}")
print(f"Max attempts: {retry_summary.max_attempts}")
```

**Solutions:**

1. **Increase retry attempts:**
   ```python
   model = HybridPixelLLM(
       retry_max_attempts=5,  # Increase from default
   )
   ```

2. **Increase retry delay:**
   ```python
   model = HybridPixelLLM(
       retry_initial_delay=2.0,     # Increase initial delay
       retry_max_delay=60.0,        # Increase max delay
       retry_backoff_multiplier=2.0,  # Increase multiplier
   )
   ```

3. **Fix underlying issue:**
   - Address the root cause (connection, timeout, etc.)
   - Retry is a mitigation, not a solution

## Configuration Examples

### Basic Configuration

```python
from geometry_os.systems.pixel_llm.lm_studio_integration import HybridPixelLLM

# Default configuration
model = HybridPixelLLM(
    checkpoint_path="checkpoints/vision_encoder.pt",
    lm_studio_model="qwen2.5-coder-7b-instruct",
)
```

### Production Configuration

```python
# Production-ready configuration with robust error handling
model = HybridPixelLLM(
    # Model configuration
    checkpoint_path="checkpoints/vision_encoder.pt",
    lm_studio_model="qwen2.5-coder-7b-instruct",
    lm_studio_host="localhost",
    lm_studio_port=1234,

    # Timeout configuration
    timeout_seconds=30,

    # Retry configuration
    retry_max_attempts=3,
    retry_initial_delay=1.0,
    retry_max_delay=30.0,
    retry_backoff_multiplier=2.0,
    retry_jitter=True,

    # Circuit breaker configuration
    circuit_breaker_failure_threshold=5,
    circuit_breaker_success_threshold=2,
    circuit_breaker_cooldown_seconds=60,
    circuit_breaker_half_open_max_calls=3,

    # Fallback configuration
    fallback_cache_enabled=True,
    fallback_cache_ttl=3600,
    fallback_default_value="Unable to generate caption",

    # Logging configuration
    log_level="INFO",
    log_file="logs/pixel_llm.log",
)
```

### Development Configuration

```python
# Development configuration with verbose logging
model = HybridPixelLLM(
    checkpoint_path="checkpoints/vision_encoder.pt",
    lm_studio_model="qwen2.5-3b-instruct",  # Faster for development

    # Short timeouts for quick feedback
    timeout_seconds=10,

    # Minimal retry for faster debugging
    retry_max_attempts=1,
    retry_initial_delay=0.5,

    # Disabled circuit breaker for testing
    circuit_breaker_enabled=False,

    # Verbose logging
    log_level="DEBUG",
    log_file=None,  # Console only
)
```

### High-Throughput Configuration

```python
# Configuration for high-throughput batch processing
model = HybridPixelLLM(
    checkpoint_path="checkpoints/vision_encoder.pt",
    lm_studio_model="qwen2.5-coder-7b-instruct",

    # Longer timeouts for large batches
    timeout_seconds=120,

    # Aggressive retry for reliability
    retry_max_attempts=5,
    retry_initial_delay=2.0,
    retry_max_delay=60.0,

    # Circuit breaker to prevent cascade failures
    circuit_breaker_failure_threshold=10,
    circuit_breaker_cooldown_seconds=30,

    # Large fallback cache for performance
    fallback_cache_enabled=True,
    fallback_cache_ttl=7200,  # 2 hours
    fallback_cache_max_size=1000,

    # Performance logging
    log_level="WARNING",  # Reduce logging overhead
    log_file="logs/pixel_llm_batch.log",
)
```

### Low-Latency Configuration

```python
# Configuration for low-latency interactive use
model = HybridPixelLLM(
    checkpoint_path="checkpoints/vision_encoder.pt",
    lm_studio_model="qwen2.5-3b-instruct",  # Faster model

    # Short timeouts
    timeout_seconds=5,

    # Minimal retry (fail fast)
    retry_max_attempts=1,
    retry_initial_delay=0.1,

    # Circuit breaker with fast recovery
    circuit_breaker_failure_threshold=3,
    circuit_breaker_cooldown_seconds=10,
    circuit_breaker_success_threshold=1,

    # Aggressive caching
    fallback_cache_enabled=True,
    fallback_cache_ttl=3600,
    fallback_cache_max_size=100,

    # Minimal logging
    log_level="ERROR",
)
```

## Best Practices

### Error Handling

1. **Always handle exceptions:**
   ```python
   try:
       caption = model.generate(image)
   except PixelLMError as e:
       logger.error(f"Generation failed: {e}", error_code=e.error_code)
       # Handle error appropriately
   ```

2. **Use specific exception types:**
   ```python
   try:
       caption = model.generate(image)
   except ConnectionError:
       # Handle connection issues
   except ValidationError:
       # Handle invalid input
   except APIError:
       # Handle API errors
   ```

3. **Log errors with context:**
   ```python
   logger.error(
       "Generation failed",
       error_code=error.error_code,
       exception=error,
       extra={"image_id": image_id, "user_id": user_id}
   )
   ```

### Monitoring

1. **Track key metrics:**
   ```python
   # Monitor error rate
   error_rate = metrics.get_error_rate()
   if error_rate > 1.0:  # More than 1 error per second
       alert_team("High error rate detected")

   # Monitor success rate
   success_rate = metrics.get_success_rate()
   logger.info(f"Success rate: {success_rate:.2f}/sec")
   ```

2. **Set up alerts:**
   ```python
   def on_metric(metric_point):
       if metric_point.metric_type == "error_count":
           if metric_point.value > 10:
               send_alert(f"High error count: {metric_point.value}")

   metrics.register_callback(on_metric)
   ```

3. **Regular health checks:**
   ```python
   # Periodic health check
   summary = metrics.get_full_summary()
   health_status = {
       "healthy": summary["errors"]["total_errors"] < 100,
       "circuit_breaker_open": summary["circuit_breaker"]["current_state"] == "OPEN",
       "fallback_rate": summary["fallbacks"]["total_activations"] / total_requests,
   }
   ```

### Configuration

1. **Use environment-specific configs:**
   ```python
   import os

   config = {
       "timeout": int(os.getenv("PIXEL_LLM_TIMEOUT", "30")),
       "retry_max_attempts": int(os.getenv("PIXEL_LLM_RETRY_ATTEMPTS", "3")),
       "log_level": os.getenv("PIXEL_LLM_LOG_LEVEL", "INFO"),
   }

   model = HybridPixelLLM(**config)
   ```

2. **Validate configuration:**
   ```python
   from geometry_os.systems.pixel_llm.validation import validate_lm_studio_config

   config = {
       "checkpoint_path": "checkpoints/vision_encoder.pt",
       "lm_studio_model": "qwen2.5-coder-7b-instruct",
   }

   validate_lm_studio_config(config)
   model = HybridPixelLLM(**config)
   ```

3. **Document configuration changes:**
   ```python
   # Log configuration on startup
   logger.info(
       "Pixel LLM initialized",
       extra={
           "model": config["lm_studio_model"],
           "timeout": config["timeout"],
           "retry_max_attempts": config["retry_max_attempts"],
       }
   )
   ```

## Support

For issues, questions, or contributions related to Pixel LLM error handling:

1. Check this guide for troubleshooting steps
2. Review metrics and logs for detailed error information
3. Consult the main Pixel LLM documentation
4. Report issues with relevant error codes and context

---

**Last Updated:** 2024-02-08

**Version:** 1.0.0
