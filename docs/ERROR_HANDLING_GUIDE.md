# Error Handling Refactoring Guide

This guide provides instructions for refactoring error handling across the Geometry OS system to ensure errors are caught, logged, and handled gracefully without causing system crashes.

## Table of Contents

1. [Overview](#overview)
2. [Error Handling Architecture](#error-handling-architecture)
3. [Refactoring Patterns](#refactoring-patterns)
4. [Common Scenarios](#common-scenarios)
5. [Testing Requirements](#testing-requirements)
6. [Migration Checklist](#migration-checklist)

## Overview

### Goals

- **Catch all errors**: No uncaught exceptions that crash the system
- **Log properly**: All errors logged with context for debugging
- **Recover gracefully**: System continues operating after recoverable errors
- **Fail fast**: Circuit breakers prevent cascading failures
- **Provide visibility**: Error reports and statistics for monitoring

### Key Components

1. **Exception Hierarchy** (`core/exceptions.py`)
   - Domain-specific exceptions (Neural, GPU, Evolution, etc.)
   - Structured error context with severity and category
   - Recovery hints for common errors

2. **Error Handler** (`core/error_handler.py`)
   - Global error handler for aggregation
   - Circuit breaker pattern for external services
   - Retry logic with exponential backoff
   - Error recovery actions

3. **Error Integration** (`core/error_integration.py`)
   - Operation context managers
   - Decorators for automatic error handling
   - Circuit breaker factories
   - Error reporting utilities

## Error Handling Architecture

### Exception Hierarchy

```
GeometryOSError (base)
├── SystemError
├── ConfigurationError
├── ResourceError
│   └── MemoryError
├── NeuralError
│   ├── NeuralInferenceError
│   │   ├── ModelNotFoundError
│   │   ├── ModelLoadError
│   │   └── InferenceTimeoutError
│   ├── NeuralTrainingError
│   └── NeuralMemoryError
├── GPUGeometryError
│   ├── GPUInitError
│   ├── ShaderCompileError
│   ├── RenderError
│   └── GPUOutOfMemoryError
├── EvolutionError
│   ├── MutationError
│   ├── EvolutionCycleError
│   └── FitnessEvaluationError
├── IOError
│   ├── FileOperationError
│   ├── NetworkError
│   └── ParseError
│       └── RTSParseError
├── AgentError
│   ├── AgentSpawnError
│   └── AgentCommunicationError
├── SwarmError
│   └── SwarmCoordinationError
└── ExternalServiceError
    ├── LMStudioError
    └── WordPressError
```

### Error Flow

```
Error Occurs
    ↓
Convert to GeometryOSError (if needed)
    ↓
Log with context (operation, component, details)
    ↓
Record in GlobalErrorHandler
    ↓
Attempt recovery (if recoverable)
    ↓
Report (periodically)
```

## Refactoring Patterns

### Pattern 1: Context Manager (Recommended)

Use operation context managers for structured error handling:

```python
from core.error_integration import NeuralOperation, GPUOperation

# Before
def run_inference(model, data):
    try:
        result = model.infer(data)
        return result
    except Exception as e:
        logging.error(f"Inference failed: {e}")
        return None

# After
def run_inference(model, data):
    with NeuralOperation("inference", model=model.name, reraise=False) as op:
        result = model.infer(data)
        op.set_result(result)
        return result
```

### Pattern 2: Decorator

Use decorators for function-level error handling:

```python
from core.error_integration import with_error_handling

# Before
def load_model(name):
    try:
        model = Model.load(name)
        return model
    except FileNotFoundError:
        logging.error(f"Model {name} not found")
        return None

# After
@with_error_handling(
    component="neural_cortex",
    error_class=NeuralInferenceError,
    reraise=False,
    default_return=None,
)
def load_model(name):
    model = Model.load(name)
    return model
```

### Pattern 3: Circuit Breaker

Use circuit breakers for external services:

```python
from core.error_integration import get_lm_studio_circuit_breaker

# Before
def call_lm_studio(prompt):
    try:
        return client.generate(prompt)
    except Exception as e:
        logging.error(f"LM Studio call failed: {e}")
        return None

# After
def call_lm_studio(prompt):
    cb = get_lm_studio_circuit_breaker()
    
    try:
        with cb:
            return client.generate(prompt)
    except ExternalServiceError:
        # Circuit is open, use fallback
        return cached_response(prompt)
```

### Pattern 4: Retry with Backoff

Use retry for transient failures:

```python
from core.error_integration import with_retry

# Before
def unreliable_network_call():
    max_retries = 3
    for attempt in range(max_retries):
        try:
            return api.call()
        except NetworkError:
            if attempt == max_retries - 1:
                raise
            time.sleep(2 ** attempt)

# After
@with_retry(max_retries=3, retryable_exceptions=(NetworkError,))
def unreliable_network_call():
    return api.call()
```

### Pattern 5: Async Operations

Use async context managers for async operations:

```python
from core.error_integration import AsyncNeuralOperation

# Before
async def async_inference(model, data):
    try:
        result = await model.infer(data)
        return result
    except Exception as e:
        logging.error(f"Async inference failed: {e}")
        return None

# After
async def async_inference(model, data):
    async with AsyncNeuralOperation("inference", model=model.name, reraise=False) as op:
        result = await model.infer(data)
        op.set_result(result)
        return result
```

## Common Scenarios

### Scenario 1: Neural Inference

```python
from core.error_integration import NeuralOperation, get_lm_studio_circuit_breaker
from core.exceptions import ModelNotFoundError, InferenceTimeoutError

class NeuralCortex:
    def __init__(self):
        self.circuit_breaker = get_lm_studio_circuit_breaker()
    
    async def infer(self, prompt: str) -> dict:
        """Run inference with comprehensive error handling."""
        async with AsyncNeuralOperation("inference", prompt_length=len(prompt)) as op:
            # Check circuit breaker
            if self.circuit_breaker.is_open:
                # Use fallback
                result = self._fallback_inference(prompt)
                op.set_result(result)
                return result
            
            # Try inference with circuit breaker
            try:
                with self.circuit_breaker:
                    result = await self._call_lm_studio(prompt)
                    op.set_result(result)
                    return result
            except ExternalServiceError:
                # Circuit opened, use fallback
                result = self._fallback_inference(prompt)
                op.set_result(result)
                return result
    
    def _fallback_inference(self, prompt: str) -> dict:
        """Fallback when LM Studio is unavailable."""
        return {"text": "Service temporarily unavailable", "cached": True}
```

### Scenario 2: GPU Operations

```python
from core.error_integration import GPUOperation
from core.exceptions import GPUOutOfMemoryError, ShaderCompileError

class VisualShell:
    def compile_shader(self, shader_code: str) -> Shader:
        """Compile shader with error handling."""
        with GPUOperation("compile_shader", shader_length=len(shader_code)) as op:
            try:
                shader = self.gpu.compile_wgsl(shader_code)
                op.set_result(shader)
                return shader
            except Exception as e:
                # Convert to domain-specific error
                raise ShaderCompileError(
                    f"Shader compilation failed: {e}",
                    shader_preview=shader_code[:100],
                    cause=e,
                )
    
    def render_frame(self, scene: Scene) -> Frame:
        """Render frame with OOM handling."""
        with GPUOperation("render_frame", scene_id=scene.id, reraise=False) as op:
            try:
                frame = self.gpu.render(scene)
                op.set_result(frame)
                return frame
            except GPUMemoryError as e:
                # Try to recover by clearing cache
                self.gpu.clear_cache()
                # Retry once
                try:
                    frame = self.gpu.render(scene)
                    op.set_result(frame)
                    return frame
                except GPUMemoryError:
                    # Still OOM, return fallback
                    return self._get_fallback_frame()
```

### Scenario 3: Evolution System

```python
from core.error_integration import EvolutionOperation, with_error_handling
from core.exceptions import MutationError, EvolutionCycleError

class EvolutionDaemon:
    @with_error_handling(
        component="evolution_daemon",
        error_class=MutationError,
        reraise=False,
    )
    def mutate(self, genome: Genome) -> Genome:
        """Mutate genome with error handling."""
        with EvolutionOperation("mutate", genome_id=genome.id) as op:
            # Validate genome
            if not genome.is_valid():
                raise MutationError(
                    "Cannot mutate invalid genome",
                    genome_id=genome.id,
                )
            
            # Apply mutation
            mutated = self._apply_mutation(genome)
            
            # Validate result
            if not mutated.is_valid():
                # Return original on invalid mutation
                op.set_result(genome)
                return genome
            
            op.set_result(mutated)
            return mutated
    
    def run_evolution_cycle(self) -> EvolutionResult:
        """Run evolution cycle with comprehensive error handling."""
        with EvolutionOperation("evolution_cycle", generation=self.generation) as op:
            try:
                # Evaluate fitness
                fitness_scores = self._evaluate_fitness()
                
                # Select parents
                parents = self._select_parents(fitness_scores)
                
                # Create offspring
                offspring = self._create_offspring(parents)
                
                # Replace population
                result = self._replace_population(offspring)
                
                op.set_result(result)
                return result
                
            except Exception as e:
                # Log and continue - evolution should be resilient
                logging.error(f"Evolution cycle failed: {e}")
                # Return current state
                return EvolutionResult(
                    generation=self.generation,
                    population=self.population,
                    error=str(e),
                )
```

### Scenario 4: Network Operations

```python
from core.error_integration import NetworkOperation, with_retry, with_circuit_breaker
from core.exceptions import NetworkError, ExternalServiceError

class WordPressClient:
    def __init__(self):
        self.circuit_breaker = CircuitBreaker(
            "wordpress",
            failure_threshold=2,
            recovery_timeout=60.0,
        )
    
    @with_retry(max_retries=3, retryable_exceptions=(NetworkError,))
    def publish_post(self, post: Post) -> dict:
        """Publish post with retry and circuit breaker."""
        with NetworkOperation("wordpress_publish", post_id=post.id) as op:
            try:
                with self.circuit_breaker:
                    result = self._api_call("POST", "/posts", post.to_dict())
                    op.set_result(result)
                    return result
            except ExternalServiceError:
                # Circuit is open
                # Queue for later retry
                self._queue_for_retry(post)
                return {"status": "queued", "reason": "service_unavailable"}
```

## Testing Requirements

### Unit Tests

Each refactored component should have tests for:

1. **Happy path**: Operation succeeds
2. **Error handling**: Operation fails, error is caught and logged
3. **Recovery**: Recovery action is attempted
4. **Fallback**: Fallback value is returned on error
5. **Circuit breaker**: Circuit opens/closes correctly
6. **Retry**: Retry logic works as expected

### Integration Tests

Test error flows across components:

```python
def test_neural_inference_error_flow():
    """Test complete error flow from inference to handling."""
    handler = GlobalErrorHandler.get_instance()
    
    # Simulate error
    cortex = NeuralCortex()
    result = cortex.infer("test prompt")
    
    # Verify error logged
    stats = handler.get_error_statistics()
    assert stats["total_errors"] >= 1
    
    # Verify system continues
    assert result is not None  # Should have fallback
```

### Verification Tests

Run the verification suite:

```bash
pytest tests/test_error_simulation_verification.py -v
```

This tests:
- Neural system errors
- GPU system errors
- Evolution system errors
- Network errors
- Circuit breaker behavior
- Retry logic
- Error reporting
- Concurrent error handling
- Stress scenarios

## Migration Checklist

For each file being refactored:

### Step 1: Analysis
- [ ] Identify all try/except blocks
- [ ] Identify all bare except clauses
- [ ] Identify all logging.error calls
- [ ] Identify external service calls
- [ ] Identify potential error sources

### Step 2: Import Error Handling
- [ ] Add `from core.error_integration import ...`
- [ ] Add `from core.exceptions import ...`
- [ ] Import operation context managers
- [ ] Import decorators as needed

### Step 3: Refactor Error Handling
- [ ] Replace bare except with specific exceptions
- [ ] Add operation context managers
- [ ] Add decorators to functions
- [ ] Add circuit breakers for external services
- [ ] Add retry logic for transient failures
- [ ] Add fallback values/recovery actions

### Step 4: Test
- [ ] Run existing tests
- [ ] Add new error scenario tests
- [ ] Verify errors are logged
- [ ] Verify system continues after errors
- [ ] Verify recovery mechanisms work
- [ ] Run verification suite

### Step 5: Review
- [ ] Check error messages are clear
- [ ] Check error context is complete
- [ ] Check severity is appropriate
- [ ] Check recovery hints are helpful
- [ ] Check no silent failures

## Example Refactoring

### Before

```python
# systems/pixel_brain/inference_bridge.py

import logging

logger = logging.getLogger(__name__)

class PixelBrainBridge:
    def __init__(self, endpoint="http://localhost:1234"):
        self.endpoint = endpoint
        self.client = AsyncInferenceClient(endpoint)
    
    async def analyze_claim(self, tile, purpose, budget):
        try:
            prompt = CLAIM_ANALYSIS_PROMPT.format(
                tile=tile,
                purpose=purpose,
                budget=budget,
            )
            response = await self.client.generate(prompt)
            result = self._parse_response(response)
            return result
        except Exception as e:
            logger.error(f"Claim analysis failed: {e}")
            return None
```

### After

```python
# systems/pixel_brain/inference_bridge.py

import logging
from core.error_integration import (
    AsyncNeuralOperation,
    get_lm_studio_circuit_breaker,
    with_retry,
)
from core.exceptions import (
    NeuralInferenceError,
    InferenceTimeoutError,
    ModelNotFoundError,
)

logger = logging.getLogger(__name__)

class PixelBrainBridge:
    def __init__(self, endpoint="http://localhost:1234"):
        self.endpoint = endpoint
        self.client = AsyncInferenceClient(endpoint)
        self.circuit_breaker = get_lm_studio_circuit_breaker()
    
    @with_retry(max_retries=2, retryable_exceptions=(InferenceTimeoutError,))
    async def analyze_claim(self, tile, purpose, budget):
        """Analyze tile claim with comprehensive error handling."""
        async with AsyncNeuralOperation(
            "analyze_claim",
            tile=str(tile),
            purpose=purpose,
            reraise=False,
        ) as op:
            # Check circuit breaker
            if self.circuit_breaker.is_open:
                logger.warning("LM Studio circuit breaker open, using fallback")
                result = self._fallback_claim_analysis(tile, purpose, budget)
                op.set_result(result)
                return result
            
            # Build prompt
            prompt = CLAIM_ANALYSIS_PROMPT.format(
                tile=tile,
                purpose=purpose,
                budget=budget,
            )
            
            # Call with circuit breaker
            try:
                with self.circuit_breaker:
                    response = await self.client.generate(prompt)
                    result = self._parse_response(response)
                    op.set_result(result)
                    return result
            except Exception as e:
                # Convert to domain-specific error
                if "timeout" in str(e).lower():
                    raise InferenceTimeoutError(
                        "Claim analysis timed out",
                        timeout=30.0,
                        cause=e,
                    )
                elif "model" in str(e).lower() and "not found" in str(e).lower():
                    raise ModelNotFoundError(
                        "Model not loaded in LM Studio",
                        cause=e,
                    )
                else:
                    raise NeuralInferenceError(
                        f"Claim analysis failed: {e}",
                        cause=e,
                    )
    
    def _fallback_claim_analysis(self, tile, purpose, budget):
        """Fallback analysis when LM Studio is unavailable."""
        return ClaimAnalysisResult(
            recommended_bid=budget * 0.5,  # Conservative bid
            confidence=0.3,
            reasoning="Fallback analysis - LM Studio unavailable",
        )
```

## Best Practices

### Do's

✅ Use specific exception types from `core.exceptions`
✅ Provide context with all errors (operation, component, details)
✅ Use operation context managers for structured error handling
✅ Use circuit breakers for all external services
✅ Use retry logic for transient failures
✅ Implement fallback behavior for critical operations
✅ Register recovery actions for common errors
✅ Log errors with appropriate severity
✅ Test error scenarios explicitly

### Don'ts

❌ Don't use bare `except:` clauses
❌ Don't silently swallow errors without logging
❌ Don't use generic Exception when specific type is available
❌ Don't forget to set reraise=False when you want to continue
❌ Don't skip error handling for "simple" operations
❌ Don't hardcode error messages - use recovery hints
❌ Don't ignore circuit breaker state
❌ Don't retry indefinitely without backoff

## Monitoring and Debugging

### Error Reports

Generate error reports:

```python
from core.error_integration import print_error_report, get_error_summary

# Print report to console
print_error_report()

# Get summary for programmatic use
summary = get_error_summary()
```

### Error Statistics

```python
handler = GlobalErrorHandler.get_instance()
stats = handler.get_error_statistics()

print(f"Total errors: {stats['total_errors']}")
print(f"Recovery rate: {stats['recovery_rate']:.1%}")
print(f"By component: {stats['by_component']}")
print(f"By severity: {stats['by_severity']}")
```

### Circuit Breaker Status

```python
from core.error_handler import CircuitBreaker

# Get all circuit breaker stats
all_stats = CircuitBreaker.get_all_stats()

for name, stats in all_stats.items():
    print(f"{name}: {stats.state.value} (failures: {stats.failure_count})")
```

## Support

For questions or issues with error handling:

1. Check `core/exceptions.py` for available exception types
2. Check `core/error_handler.py` for error handling utilities
3. Check `core/error_integration.py` for integration utilities
4. Check `tests/test_error_handling.py` for usage examples
5. Check `tests/test_error_simulation_verification.py` for verification tests
