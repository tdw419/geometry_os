"""
Geometry OS Error Handler - Centralized error handling and recovery.

This module provides:
- Global error handler with graceful degradation
- Circuit breaker pattern for failing services
- Retry logic with exponential backoff
- Error aggregation and reporting
- Integration with unified logging

Usage:
    from core.error_handler import (
        GlobalErrorHandler, CircuitBreaker, retry_with_backoff,
        setup_global_error_handler
    )
    
    # Setup global handler (call once at startup)
    setup_global_error_handler()
    
    # Use circuit breaker for external services
    cb = CircuitBreaker("lm_studio", failure_threshold=3)
    with cb:
        result = lm_studio_client.infer(data)
    
    # Retry with exponential backoff
    result = retry_with_backoff(
        risky_operation,
        max_retries=3,
        initial_delay=0.1,
    )
"""

import functools
import logging
import random
import threading
import time
import traceback
from collections import defaultdict
from contextlib import contextmanager
from dataclasses import dataclass, field
from datetime import datetime, timedelta
from enum import Enum
from typing import Any, Callable, Optional, TypeVar, ParamSpec

from core.exceptions import (
    GeometryOSError,
    ErrorSeverity,
    ErrorCategory,
    ErrorContext,
    ExternalServiceError,
)

P = ParamSpec("P")
R = TypeVar("R")


class CircuitState(Enum):
    """Circuit breaker states."""
    CLOSED = "closed"      # Normal operation
    OPEN = "open"          # Failing, reject all calls
    HALF_OPEN = "half_open"  # Testing if recovered


@dataclass
class ErrorRecord:
    """Record of an error occurrence."""
    timestamp: datetime
    error_type: str
    message: str
    severity: ErrorSeverity
    category: ErrorCategory
    component: str
    stack_trace: Optional[str] = None
    context: Optional[dict] = None
    recovered: bool = False
    recovery_action: Optional[str] = None


@dataclass
class CircuitBreakerStats:
    """Statistics for a circuit breaker."""
    name: str
    state: CircuitState = CircuitState.CLOSED
    failure_count: int = 0
    success_count: int = 0
    last_failure_time: Optional[datetime] = None
    last_state_change: Optional[datetime] = None
    total_failures: int = 0
    total_successes: int = 0


class CircuitBreaker:
    """
    Circuit breaker pattern for external service calls.
    
    Prevents cascading failures by failing fast when a service is down.
    
    Usage:
        cb = CircuitBreaker("lm_studio", failure_threshold=3, recovery_timeout=30)
        
        with cb:
            result = lm_studio.infer(data)
        
        if cb.is_open:
            # Use fallback
            result = fallback_inference(data)
    """
    
    _instances: dict[str, "CircuitBreaker"] = {}
    _lock = threading.Lock()
    
    def __init__(
        self,
        name: str,
        failure_threshold: int = 3,
        recovery_timeout: float = 30.0,
        half_open_max_calls: int = 1,
    ):
        self.name = name
        self.failure_threshold = failure_threshold
        self.recovery_timeout = recovery_timeout
        self.half_open_max_calls = half_open_max_calls
        
        self._state = CircuitState.CLOSED
        self._failure_count = 0
        self._success_count = 0
        self._last_failure_time: Optional[datetime] = None
        self._last_state_change: Optional[datetime] = None
        self._half_open_calls = 0
        self._lock = threading.Lock()
        
        # Register instance
        with CircuitBreaker._lock:
            CircuitBreaker._instances[name] = self
    
    @classmethod
    def get(cls, name: str) -> Optional["CircuitBreaker"]:
        """Get a circuit breaker by name."""
        with cls._lock:
            return cls._instances.get(name)
    
    @classmethod
    def get_all_stats(cls) -> dict[str, CircuitBreakerStats]:
        """Get stats for all circuit breakers."""
        with cls._lock:
            return {
                name: cb.get_stats()
                for name, cb in cls._instances.items()
            }
    
    @property
    def state(self) -> CircuitState:
        """Get current state, checking for recovery timeout."""
        with self._lock:
            self._check_recovery()
            return self._state
    
    @property
    def is_open(self) -> bool:
        """Check if circuit is open (failing)."""
        return self.state == CircuitState.OPEN
    
    @property
    def is_closed(self) -> bool:
        """Check if circuit is closed (healthy)."""
        return self.state == CircuitState.CLOSED
    
    def _check_recovery(self):
        """Check if we should transition from OPEN to HALF_OPEN."""
        if (
            self._state == CircuitState.OPEN
            and self._last_failure_time is not None
        ):
            elapsed = (datetime.now() - self._last_failure_time).total_seconds()
            if elapsed >= self.recovery_timeout:
                self._transition_to(CircuitState.HALF_OPEN)
    
    def _transition_to(self, new_state: CircuitState):
        """Transition to a new state."""
        old_state = self._state
        self._state = new_state
        self._last_state_change = datetime.now()
        
        if new_state == CircuitState.HALF_OPEN:
            self._half_open_calls = 0
        elif new_state == CircuitState.CLOSED:
            self._failure_count = 0
            self._success_count = 0
        
        logging.getLogger("circuit_breaker").info(
            f"Circuit breaker '{self.name}' transitioned: {old_state.value} -> {new_state.value}"
        )
    
    def record_success(self):
        """Record a successful call."""
        with self._lock:
            self._success_count += 1
            
            if self._state == CircuitState.HALF_OPEN:
                self._half_open_calls += 1
                if self._half_open_calls >= self.half_open_max_calls:
                    self._transition_to(CircuitState.CLOSED)
    
    def record_failure(self):
        """Record a failed call."""
        with self._lock:
            self._failure_count += 1
            self._last_failure_time = datetime.now()
            
            if self._state == CircuitState.HALF_OPEN:
                self._transition_to(CircuitState.OPEN)
            elif self._state == CircuitState.CLOSED:
                if self._failure_count >= self.failure_threshold:
                    self._transition_to(CircuitState.OPEN)
    
    def __enter__(self):
        """Enter context, raising if circuit is open."""
        with self._lock:
            self._check_recovery()
            
            if self._state == CircuitState.OPEN:
                raise ExternalServiceError(
                    f"Circuit breaker '{self.name}' is open - service unavailable",
                    severity=ErrorSeverity.MEDIUM,
                    recoverable=True,
                    recovery_hint=f"Wait {self.recovery_timeout}s for recovery attempt",
                )
            
            return self
    
    def __exit__(self, exc_type, exc_val, exc_tb):
        """Exit context, recording success or failure."""
        if exc_type is not None:
            self.record_failure()
        else:
            self.record_success()
        return False  # Don't suppress exceptions
    
    def get_stats(self) -> CircuitBreakerStats:
        """Get current statistics."""
        with self._lock:
            return CircuitBreakerStats(
                name=self.name,
                state=self._state,
                failure_count=self._failure_count,
                success_count=self._success_count,
                last_failure_time=self._last_failure_time,
                last_state_change=self._last_state_change,
                total_failures=self._failure_count,
                total_successes=self._success_count,
            )
    
    def reset(self):
        """Manually reset the circuit breaker."""
        with self._lock:
            self._transition_to(CircuitState.CLOSED)


class RetryPolicy:
    """
    Retry policy with exponential backoff and jitter.
    
    Usage:
        policy = RetryPolicy(max_retries=3, initial_delay=0.1)
        
        for attempt in policy:
            try:
                result = risky_operation()
                break
            except Exception:
                if not policy.should_retry():
                    raise
    """
    
    def __init__(
        self,
        max_retries: int = 3,
        initial_delay: float = 0.1,
        max_delay: float = 10.0,
        exponential_base: float = 2.0,
        jitter: float = 0.1,
        retryable_exceptions: tuple = (Exception,),
    ):
        self.max_retries = max_retries
        self.initial_delay = initial_delay
        self.max_delay = max_delay
        self.exponential_base = exponential_base
        self.jitter = jitter
        self.retryable_exceptions = retryable_exceptions
        self._attempt = 0
        self._last_exception: Optional[Exception] = None
    
    def __iter__(self):
        self._attempt = 0
        return self
    
    def __next__(self) -> int:
        if self._attempt >= self.max_retries:
            raise StopIteration
        self._attempt += 1
        return self._attempt
    
    def get_delay(self) -> float:
        """Calculate delay for current attempt with jitter."""
        delay = self.initial_delay * (self.exponential_base ** (self._attempt - 1))
        delay = min(delay, self.max_delay)
        
        # Add jitter
        jitter_amount = delay * self.jitter * random.random()
        return delay + jitter_amount
    
    def should_retry(self, exception: Optional[Exception] = None) -> bool:
        """Check if we should retry after an exception."""
        if exception is not None:
            self._last_exception = exception
        
        if self._attempt >= self.max_retries:
            return False
        
        if not isinstance(exception, self.retryable_exceptions):
            return False
        
        return True
    
    def wait(self):
        """Wait for the calculated delay."""
        if self._attempt > 0:
            time.sleep(self.get_delay())


def retry_with_backoff(
    func: Callable[P, R],
    *args: P.args,
    max_retries: int = 3,
    initial_delay: float = 0.1,
    max_delay: float = 10.0,
    retryable_exceptions: tuple = (Exception,),
    on_retry: Optional[Callable[[int, Exception], None]] = None,
    **kwargs: P.kwargs
) -> R:
    """
    Execute a function with retry and exponential backoff.
    
    Args:
        func: Function to execute
        max_retries: Maximum number of retries
        initial_delay: Initial delay in seconds
        max_delay: Maximum delay cap
        retryable_exceptions: Tuple of exceptions to retry on
        on_retry: Callback called on each retry (attempt, exception)
    
    Returns:
        Result of the function
    
    Raises:
        Last exception if all retries fail
    
    Usage:
        result = retry_with_backoff(
            lm_studio.infer,
            data,
            max_retries=3,
            retryable_exceptions=(NetworkError, InferenceTimeoutError),
        )
    """
    policy = RetryPolicy(
        max_retries=max_retries,
        initial_delay=initial_delay,
        max_delay=max_delay,
        retryable_exceptions=retryable_exceptions,
    )
    
    last_exception: Optional[Exception] = None
    
    for attempt in policy:
        try:
            return func(*args, **kwargs)
        except retryable_exceptions as e:
            last_exception = e
            
            if not policy.should_retry(e):
                raise
            
            if on_retry:
                try:
                    on_retry(attempt, e)
                except Exception:
                    pass  # Don't fail on callback errors
            
            policy.wait()
    
    # Should not reach here, but raise last exception just in case
    if last_exception:
        raise last_exception
    raise RuntimeError("Retry loop exited without result or exception")


class GlobalErrorHandler:
    """
    Global error handler for the entire system.
    
    Provides:
    - Error aggregation and statistics
    - Graceful degradation
    - Error reporting
    - Recovery actions
    
    Usage:
        handler = GlobalErrorHandler.get_instance()
        
        # Handle an error
        handler.handle(error, context={"operation": "inference"})
        
        # Get statistics
        stats = handler.get_error_statistics()
    """
    
    _instance: Optional["GlobalErrorHandler"] = None
    _lock = threading.Lock()
    
    def __init__(
        self,
        max_errors: int = 1000,
        reporting_interval: float = 60.0,
        enable_reporting: bool = True,
    ):
        self.max_errors = max_errors
        self.reporting_interval = reporting_interval
        self.enable_reporting = enable_reporting
        
        self._errors: list[ErrorRecord] = []
        self._error_counts: dict[str, int] = defaultdict(int)
        self._component_errors: dict[str, int] = defaultdict(int)
        self._severity_counts: dict[ErrorSeverity, int] = defaultdict(int)
        self._category_counts: dict[ErrorCategory, int] = defaultdict(int)
        self._recovery_actions: dict[str, Callable] = {}
        self._fallback_handlers: dict[str, Callable] = {}
        self._lock = threading.Lock()
        self._last_report_time = datetime.now()
    
    @classmethod
    def get_instance(cls) -> "GlobalErrorHandler":
        """Get singleton instance."""
        with cls._lock:
            if cls._instance is None:
                cls._instance = cls()
            return cls._instance
    
    @classmethod
    def reset_instance(cls):
        """Reset singleton (for testing)."""
        with cls._lock:
            cls._instance = None
    
    def register_recovery_action(
        self,
        error_type: str,
        action: Callable[[Exception], bool]
    ):
        """
        Register a recovery action for an error type.
        
        Action should return True if recovery was successful.
        """
        self._recovery_actions[error_type] = action
    
    def register_fallback(
        self,
        component: str,
        fallback: Callable[..., Any]
    ):
        """Register a fallback handler for a component."""
        self._fallback_handlers[component] = fallback
    
    def handle(
        self,
        error: Exception,
        context: Optional[dict] = None,
        component: str = "unknown",
        recoverable: bool = True,
    ) -> bool:
        """
        Handle an error with optional recovery.
        
        Returns True if error was recovered, False otherwise.
        """
        # Convert to GeometryOSError if needed
        if not isinstance(error, GeometryOSError):
            geom_error = GeometryOSError(
                str(error),
                cause=error,
                recoverable=recoverable,
                context=ErrorContext(
                    operation=context.get("operation", "unknown") if context else "unknown",
                    component=component,
                    details=context or {},
                ),
            )
        else:
            geom_error = error
        
        # Create error record
        record = ErrorRecord(
            timestamp=datetime.now(),
            error_type=type(geom_error).__name__,
            message=geom_error.message,
            severity=geom_error.severity,
            category=geom_error.category,
            component=component,
            stack_trace=traceback.format_exc(),
            context=context,
        )
        
        # Update statistics
        with self._lock:
            self._errors.append(record)
            if len(self._errors) > self.max_errors:
                self._errors.pop(0)
            
            self._error_counts[record.error_type] += 1
            self._component_errors[component] += 1
            self._severity_counts[record.severity] += 1
            self._category_counts[record.category] += 1
        
        # Log the error
        self._log_error(geom_error, component)
        
        # Attempt recovery if recoverable
        recovered = False
        if geom_error.recoverable and recoverable:
            recovered = self._attempt_recovery(geom_error, component)
            record.recovered = recovered
        
        # Check for reporting
        self._check_report()
        
        return recovered
    
    def _log_error(self, error: GeometryOSError, component: str):
        """Log error using unified logging."""
        try:
            from core.unified_logging import UnifiedLogger
            logger = UnifiedLogger.get_instance()
            logger.error(
                f"[{component}] {error.message}",
                exception=error.cause,
                subsystem=component,
            )
        except ImportError:
            logging.getLogger(component).error(
                f"[{component}] {error.message}",
                exc_info=error.cause is not None,
            )
    
    def _attempt_recovery(self, error: GeometryOSError, component: str) -> bool:
        """Attempt to recover from an error."""
        error_type = type(error).__name__
        
        # Check for registered recovery action for the GeometryOSError type
        if error_type in self._recovery_actions:
            try:
                return self._recovery_actions[error_type](error)
            except Exception as e:
                logging.getLogger("error_handler").warning(
                    f"Recovery action failed for {error_type}: {e}"
                )
        
        # Check for recovery action for the underlying cause type
        if error.cause is not None:
            cause_type = type(error.cause).__name__
            if cause_type in self._recovery_actions:
                try:
                    return self._recovery_actions[cause_type](error)
                except Exception as e:
                    logging.getLogger("error_handler").warning(
                        f"Recovery action failed for {cause_type}: {e}"
                    )
        
        # Check for fallback handler
        if component in self._fallback_handlers:
            # Fallback is handled by caller
            pass
        
        return False
    
    def _check_report(self):
        """Check if we should generate a report."""
        if not self.enable_reporting:
            return
        
        elapsed = (datetime.now() - self._last_report_time).total_seconds()
        if elapsed >= self.reporting_interval:
            self._generate_report()
            self._last_report_time = datetime.now()
    
    def _generate_report(self):
        """Generate an error report."""
        with self._lock:
            stats = self.get_error_statistics()
        
        # Log summary
        logging.getLogger("error_handler").info(
            f"Error Report: {stats['total_errors']} errors, "
            f"{stats['recovered_count']} recovered, "
            f"top components: {list(stats['by_component'].keys())[:3]}"
        )
    
    def get_error_statistics(self) -> dict[str, Any]:
        """Get error statistics."""
        with self._lock:
            total = len(self._errors)
            recovered = sum(1 for e in self._errors if e.recovered)
            
            return {
                "total_errors": total,
                "recovered_count": recovered,
                "recovery_rate": recovered / total if total > 0 else 0,
                "by_type": dict(self._error_counts),
                "by_component": dict(self._component_errors),
                "by_severity": {k.value: v for k, v in self._severity_counts.items()},
                "by_category": {k.value: v for k, v in self._category_counts.items()},
                "recent_errors": [
                    {
                        "timestamp": e.timestamp.isoformat(),
                        "type": e.error_type,
                        "message": e.message,
                        "component": e.component,
                        "recovered": e.recovered,
                    }
                    for e in self._errors[-10:]
                ],
            }
    
    def get_recent_errors(self, limit: int = 10) -> list[ErrorRecord]:
        """Get recent errors."""
        with self._lock:
            return self._errors[-limit:]
    
    def clear_errors(self):
        """Clear all recorded errors."""
        with self._lock:
            self._errors.clear()
            self._error_counts.clear()
            self._component_errors.clear()
            self._severity_counts.clear()
            self._category_counts.clear()


def setup_global_error_handler(
    enable_reporting: bool = True,
    reporting_interval: float = 60.0,
) -> GlobalErrorHandler:
    """
    Setup the global error handler.
    
    Should be called once at application startup.
    """
    handler = GlobalErrorHandler.get_instance()
    handler.enable_reporting = enable_reporting
    handler.reporting_interval = reporting_interval
    
    # Register common recovery actions
    def recover_network_error(error: Exception) -> bool:
        # Simple network recovery - just wait a bit
        time.sleep(0.1)
        return False  # Let retry logic handle it
    
    handler.register_recovery_action("NetworkError", recover_network_error)
    
    return handler


@contextmanager
def error_boundary(
    component: str,
    operation: str = "unknown",
    recoverable: bool = True,
    default_return: Any = None,
    reraise: bool = False,
):
    """
    Context manager for error boundaries.
    
    Usage:
        with error_boundary("neural_cortex", "inference", default_return=[]):
            result = model.infer(data)
    """
    handler = GlobalErrorHandler.get_instance()
    error = None
    
    try:
        yield
    except Exception as e:
        error = e
        handler.handle(e, context={"operation": operation}, component=component, recoverable=recoverable)
        
        if reraise:
            raise
    
    # Return default on error (context manager doesn't return value)
    # This is just for error handling, not value transformation


def graceful_fallback(component: str, fallback_value: Any = None):
    """
    Decorator that provides graceful fallback on error.
    
    Usage:
        @graceful_fallback("neural_cortex", fallback_value=[])
        def get_suggestions(query):
            return model.infer(query)
    """
    def decorator(func: Callable[P, R]) -> Callable[P, R]:
        @functools.wraps(func)
        def wrapper(*args: P.args, **kwargs: P.kwargs) -> R:
            handler = GlobalErrorHandler.get_instance()
            
            try:
                return func(*args, **kwargs)
            except Exception as e:
                handler.handle(
                    e,
                    context={"operation": func.__name__},
                    component=component,
                )
                return fallback_value
        
        return wrapper
    return decorator


# =============================================================================
# CONVENIENCE EXPORTS
# =============================================================================

__all__ = [
    # Circuit breaker
    "CircuitBreaker",
    "CircuitState",
    "CircuitBreakerStats",
    
    # Retry
    "RetryPolicy",
    "retry_with_backoff",
    
    # Global handler
    "GlobalErrorHandler",
    "setup_global_error_handler",
    "ErrorRecord",
    
    # Utilities
    "error_boundary",
    "graceful_fallback",
]
