"""
Geometry OS Error Handling Integration Module

This module provides integration utilities for applying consistent error handling
across all system components. It wraps common operations with proper error handling,
logging, and recovery strategies.

Usage:
    from core.error_integration import (
        initialize_error_handling,
        NeuralOperation,
        GPUOperation,
        EvolutionOperation,
        NetworkOperation,
    )
    
    # Initialize at application startup
    initialize_error_handling()
    
    # Use operation wrappers
    async with NeuralOperation("inference", model="gpt-neo") as op:
        result = await model.infer(data)
        op.set_result(result)
"""

import asyncio
import functools
import logging
import time
from contextlib import asynccontextmanager, contextmanager
from typing import Any, Callable, Optional, TypeVar, ParamSpec

from core.exceptions import (
    GeometryOSError,
    ErrorSeverity,
    ErrorCategory,
    ErrorContext,
    # Neural errors
    NeuralInferenceError,
    ModelNotFoundError,
    InferenceTimeoutError,
    NeuralMemoryError,
    # GPU errors
    GPUGeometryError,
    GPUInitError,
    ShaderCompileError,
    RenderError,
    GPUOutOfMemoryError,
    # Evolution errors
    EvolutionError,
    MutationError,
    EvolutionCycleError,
    FitnessEvaluationError,
    # IO errors
    FileOperationError,
    NetworkError,
    ParseError,
    RTSParseError,
    # Agent errors
    AgentError,
    AgentSpawnError,
    SwarmError,
    SwarmCoordinationError,
    # External errors
    ExternalServiceError,
    LMStudioError,
    WordPressError,
)
from core.error_handler import (
    GlobalErrorHandler,
    CircuitBreaker,
    CircuitState,
    retry_with_backoff,
    error_boundary,
)

P = ParamSpec("P")
R = TypeVar("R")

logger = logging.getLogger("error_integration")


# =============================================================================
# INITIALIZATION
# =============================================================================

def initialize_error_handling(
    enable_reporting: bool = True,
    reporting_interval: float = 60.0,
) -> GlobalErrorHandler:
    """
    Initialize the error handling system.
    
    Should be called once at application startup.
    
    Args:
        enable_reporting: Enable periodic error reports
        reporting_interval: Seconds between error reports
    
    Returns:
        GlobalErrorHandler instance
    """
    from core.error_handler import setup_global_error_handler
    
    handler = setup_global_error_handler(
        enable_reporting=enable_reporting,
        reporting_interval=reporting_interval,
    )
    
    # Register recovery actions for common errors
    def recover_lm_studio(error: Exception) -> bool:
        """Attempt to recover from LM Studio errors."""
        logger.info("Attempting LM Studio recovery...")
        # Could implement connection retry logic here
        return False
    
    def recover_gpu_oom(error: Exception) -> bool:
        """Attempt to recover from GPU OOM."""
        logger.info("Attempting GPU memory recovery...")
        # Could implement cache clearing here
        return False
    
    handler.register_recovery_action("LMStudioError", recover_lm_studio)
    handler.register_recovery_action("GPUOutOfMemoryError", recover_gpu_oom)
    handler.register_recovery_action("InferenceTimeoutError", lambda e: False)
    
    logger.info("Error handling system initialized")
    return handler


# =============================================================================
# OPERATION CONTEXT MANAGERS
# =============================================================================

class OperationContext:
    """
    Base class for operation context managers.
    
    Provides structured error handling for operations with:
    - Automatic error logging
    - Timing metrics
    - Result tracking
    - Recovery attempts
    """
    
    def __init__(
        self,
        operation: str,
        component: str,
        error_class: type = GeometryOSError,
        reraise: bool = False,
        **context_details
    ):
        self.operation = operation
        self.component = component
        self.error_class = error_class
        self.reraise = reraise
        self.context_details = context_details
        self.result = None
        self.error = None
        self._start_time = None
    
    def __enter__(self):
        self._start_time = time.time()
        return self
    
    def __exit__(self, exc_type, exc_val, exc_tb):
        if exc_type is not None:
            # Convert to appropriate error type
            if not isinstance(exc_val, GeometryOSError):
                self.error = self.error_class(
                    str(exc_val),
                    cause=exc_val,
                    context=ErrorContext(
                        operation=self.operation,
                        component=self.component,
                        details={
                            **self.context_details,
                            "duration": time.time() - self._start_time if self._start_time else 0,
                        },
                    ),
                )
            else:
                self.error = exc_val
            
            # Handle the error
            handler = GlobalErrorHandler.get_instance()
            handler.handle(self.error, component=self.component, recoverable=True)
            
            return not self.reraise
        
        return False
    
    def set_result(self, result: Any):
        """Set the result of the operation."""
        self.result = result


class NeuralOperation(OperationContext):
    """Context manager for neural network operations."""
    
    def __init__(self, operation: str, reraise: bool = False, **context):
        super().__init__(
            operation=operation,
            component="neural_cortex",
            error_class=NeuralInferenceError,
            reraise=reraise,
            **context
        )


class GPUOperation(OperationContext):
    """Context manager for GPU operations."""
    
    def __init__(self, operation: str, reraise: bool = False, **context):
        super().__init__(
            operation=operation,
            component="visual_shell",
            error_class=GPUGeometryError,
            reraise=reraise,
            **context
        )


class EvolutionOperation(OperationContext):
    """Context manager for evolution system operations."""
    
    def __init__(self, operation: str, reraise: bool = False, **context):
        super().__init__(
            operation=operation,
            component="evolution_daemon",
            error_class=EvolutionError,
            reraise=reraise,
            **context
        )


class NetworkOperation(OperationContext):
    """Context manager for network operations."""
    
    def __init__(self, operation: str, reraise: bool = False, **context):
        super().__init__(
            operation=operation,
            component="network",
            error_class=NetworkError,
            reraise=reraise,
            **context
        )


class AgentOperation(OperationContext):
    """Context manager for agent operations."""
    
    def __init__(self, operation: str, reraise: bool = False, **context):
        super().__init__(
            operation=operation,
            component="agent_system",
            error_class=AgentError,
            reraise=reraise,
            **context
        )


# =============================================================================
# ASYNC OPERATION CONTEXT MANAGERS
# =============================================================================

class AsyncOperationContext:
    """Async version of OperationContext."""
    
    def __init__(
        self,
        operation: str,
        component: str,
        error_class: type = GeometryOSError,
        reraise: bool = False,
        **context_details
    ):
        self.operation = operation
        self.component = component
        self.error_class = error_class
        self.reraise = reraise
        self.context_details = context_details
        self.result = None
        self.error = None
        self._start_time = None
    
    async def __aenter__(self):
        self._start_time = time.time()
        return self
    
    async def __aexit__(self, exc_type, exc_val, exc_tb):
        if exc_type is not None:
            # Convert to appropriate error type
            if not isinstance(exc_val, GeometryOSError):
                self.error = self.error_class(
                    str(exc_val),
                    cause=exc_val,
                    context=ErrorContext(
                        operation=self.operation,
                        component=self.component,
                        details={
                            **self.context_details,
                            "duration": time.time() - self._start_time if self._start_time else 0,
                        },
                    ),
                )
            else:
                self.error = exc_val
            
            # Handle the error
            handler = GlobalErrorHandler.get_instance()
            handler.handle(self.error, component=self.component, recoverable=True)
            
            return not self.reraise
        
        return False
    
    def set_result(self, result: Any):
        """Set the result of the operation."""
        self.result = result


class AsyncNeuralOperation(AsyncOperationContext):
    """Async context manager for neural network operations."""
    
    def __init__(self, operation: str, reraise: bool = False, **context):
        super().__init__(
            operation=operation,
            component="neural_cortex",
            error_class=NeuralInferenceError,
            reraise=reraise,
            **context
        )


class AsyncGPUOperation(AsyncOperationContext):
    """Async context manager for GPU operations."""
    
    def __init__(self, operation: str, reraise: bool = False, **context):
        super().__init__(
            operation=operation,
            component="visual_shell",
            error_class=GPUGeometryError,
            reraise=reraise,
            **context
        )


# =============================================================================
# DECORATORS
# =============================================================================

def with_error_handling(
    component: str,
    operation: Optional[str] = None,
    error_class: type = GeometryOSError,
    reraise: bool = False,
    default_return: Any = None,
):
    """
    Decorator for automatic error handling.
    
    Args:
        component: Component name for error tracking
        operation: Operation name (defaults to function name)
        error_class: Exception class to use for wrapping
        reraise: Whether to re-raise the exception
        default_return: Value to return on error (if not reraise)
    
    Usage:
        @with_error_handling("neural_cortex", error_class=NeuralInferenceError)
        def infer(model, data):
            return model.run(data)
    """
    def decorator(func: Callable[P, R]) -> Callable[P, R]:
        @functools.wraps(func)
        def wrapper(*args: P.args, **kwargs: P.kwargs) -> R:
            op_name = operation or func.__name__
            
            with OperationContext(
                operation=op_name,
                component=component,
                error_class=error_class,
                reraise=reraise,
                function=func.__name__,
            ) as ctx:
                result = func(*args, **kwargs)
                ctx.set_result(result)
                return result
            
            # If we get here, there was an error and reraise=False
            return default_return
        
        return wrapper
    return decorator


def with_async_error_handling(
    component: str,
    operation: Optional[str] = None,
    error_class: type = GeometryOSError,
    reraise: bool = False,
    default_return: Any = None,
):
    """
    Async decorator for automatic error handling.
    
    Usage:
        @with_async_error_handling("neural_cortex", error_class=NeuralInferenceError)
        async def infer(model, data):
            return await model.run(data)
    """
    def decorator(func: Callable[P, R]) -> Callable[P, R]:
        @functools.wraps(func)
        async def wrapper(*args: P.args, **kwargs: P.kwargs) -> R:
            op_name = operation or func.__name__
            
            async with AsyncOperationContext(
                operation=op_name,
                component=component,
                error_class=error_class,
                reraise=reraise,
                function=func.__name__,
            ) as ctx:
                result = await func(*args, **kwargs)
                ctx.set_result(result)
                return result
            
            # If we get here, there was an error and reraise=False
            return default_return
        
        return wrapper
    return decorator


def with_circuit_breaker(
    service_name: str,
    failure_threshold: int = 3,
    recovery_timeout: float = 30.0,
):
    """
    Decorator that wraps function with circuit breaker.
    
    Usage:
        @with_circuit_breaker("lm_studio", failure_threshold=2)
        def call_lm_studio(prompt):
            return client.generate(prompt)
    """
    def decorator(func: Callable[P, R]) -> Callable[P, R]:
        cb = CircuitBreaker(
            service_name,
            failure_threshold=failure_threshold,
            recovery_timeout=recovery_timeout,
        )
        
        @functools.wraps(func)
        def wrapper(*args: P.args, **kwargs: P.kwargs) -> R:
            with cb:
                return func(*args, **kwargs)
        
        return wrapper
    return decorator


def with_retry(
    max_retries: int = 3,
    initial_delay: float = 0.1,
    max_delay: float = 10.0,
    retryable_exceptions: tuple = (Exception,),
):
    """
    Decorator that adds retry logic to a function.
    
    Usage:
        @with_retry(max_retries=3, retryable_exceptions=(NetworkError,))
        def unreliable_network_call():
            return requests.get("https://api.example.com")
    """
    def decorator(func: Callable[P, R]) -> Callable[P, R]:
        @functools.wraps(func)
        def wrapper(*args: P.args, **kwargs: P.kwargs) -> R:
            return retry_with_backoff(
                func,
                *args,
                max_retries=max_retries,
                initial_delay=initial_delay,
                max_delay=max_delay,
                retryable_exceptions=retryable_exceptions,
                **kwargs
            )
        
        return wrapper
    return decorator


# =============================================================================
# CIRCUIT BREAKER FACTORY
# =============================================================================

def get_lm_studio_circuit_breaker() -> CircuitBreaker:
    """Get or create circuit breaker for LM Studio."""
    return CircuitBreaker(
        "lm_studio",
        failure_threshold=3,
        recovery_timeout=30.0,
    )


def get_wordpress_circuit_breaker() -> CircuitBreaker:
    """Get or create circuit breaker for WordPress."""
    return CircuitBreaker(
        "wordpress",
        failure_threshold=2,
        recovery_timeout=60.0,
    )


def get_network_circuit_breaker(service_name: str) -> CircuitBreaker:
    """Get or create circuit breaker for a network service."""
    return CircuitBreaker(
        service_name,
        failure_threshold=3,
        recovery_timeout=30.0,
    )


# =============================================================================
# ERROR REPORTING UTILITIES
# =============================================================================

def get_error_summary() -> dict[str, Any]:
    """
    Get a summary of all errors in the system.
    
    Returns:
        Dictionary with error statistics and recent errors
    """
    handler = GlobalErrorHandler.get_instance()
    stats = handler.get_error_statistics()
    circuit_stats = CircuitBreaker.get_all_stats()
    
    return {
        "errors": stats,
        "circuit_breakers": {
            name: {
                "state": cb_stats.state.value,
                "failure_count": cb_stats.failure_count,
                "success_count": cb_stats.success_count,
                "last_failure": cb_stats.last_failure_time.isoformat() if cb_stats.last_failure_time else None,
            }
            for name, cb_stats in circuit_stats.items()
        },
    }


def format_error_report(summary: dict[str, Any]) -> str:
    """Format error summary as human-readable report."""
    lines = [
        "=" * 60,
        "GEOMETRY OS ERROR REPORT",
        "=" * 60,
        "",
        "ERROR STATISTICS:",
        f"  Total Errors: {summary['errors']['total_errors']}",
        f"  Recovered: {summary['errors']['recovered_count']} ({summary['errors']['recovery_rate']:.1%})",
        "",
        "BY COMPONENT:",
    ]
    
    for component, count in sorted(
        summary['errors']['by_component'].items(),
        key=lambda x: x[1],
        reverse=True
    )[:10]:
        lines.append(f"  {component}: {count}")
    
    lines.extend([
        "",
        "BY SEVERITY:",
    ])
    
    for severity, count in summary['errors']['by_severity'].items():
        lines.append(f"  {severity}: {count}")
    
    if summary['circuit_breakers']:
        lines.extend([
            "",
            "CIRCUIT BREAKERS:",
        ])
        
        for name, stats in summary['circuit_breakers'].items():
            lines.append(f"  {name}: {stats['state']} (failures: {stats['failure_count']})")
    
    lines.extend([
        "",
        "=" * 60,
    ])
    
    return "\n".join(lines)


def print_error_report():
    """Print error report to console."""
    summary = get_error_summary()
    print(format_error_report(summary))


# =============================================================================
# CONVENIENCE EXPORTS
# =============================================================================

__all__ = [
    # Initialization
    "initialize_error_handling",
    
    # Sync context managers
    "OperationContext",
    "NeuralOperation",
    "GPUOperation",
    "EvolutionOperation",
    "NetworkOperation",
    "AgentOperation",
    
    # Async context managers
    "AsyncOperationContext",
    "AsyncNeuralOperation",
    "AsyncGPUOperation",
    
    # Decorators
    "with_error_handling",
    "with_async_error_handling",
    "with_circuit_breaker",
    "with_retry",
    
    # Circuit breaker factory
    "get_lm_studio_circuit_breaker",
    "get_wordpress_circuit_breaker",
    "get_network_circuit_breaker",
    
    # Reporting
    "get_error_summary",
    "format_error_report",
    "print_error_report",
]
