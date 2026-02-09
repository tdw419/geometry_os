"""
Error Metrics Collector for Pixel LLM

Tracks error counts, retry statistics, circuit breaker state changes,
and provides metrics summaries for monitoring and analysis.
"""

import time
import threading
from collections import defaultdict
from dataclasses import dataclass, field
from datetime import datetime, timedelta
from enum import Enum
from typing import Dict, List, Optional, Any, Callable
from queue import Queue, Empty


class MetricType(Enum):
    """Types of metrics to track."""
    ERROR_COUNT = "error_count"
    RETRY_COUNT = "retry_count"
    CIRCUIT_STATE_CHANGE = "circuit_state_change"
    FALLBACK_ACTIVATION = "fallback_activation"
    LATENCY = "latency"
    SUCCESS_COUNT = "success_count"


@dataclass
class MetricPoint:
    """A single metric data point."""
    timestamp: float
    metric_type: str
    value: float
    tags: Dict[str, str] = field(default_factory=dict)
    metadata: Dict[str, Any] = field(default_factory=dict)

    def to_dict(self) -> Dict[str, Any]:
        """Convert to dictionary."""
        return {
            "timestamp": self.timestamp,
            "metric_type": self.metric_type,
            "value": self.value,
            "tags": self.tags,
            "metadata": self.metadata
        }


@dataclass
class ErrorSummary:
    """Summary of error statistics."""
    total_errors: int = 0
    errors_by_type: Dict[str, int] = field(default_factory=dict)
    errors_by_code: Dict[str, int] = field(default_factory=dict)
    first_error_time: Optional[float] = None
    last_error_time: Optional[float] = None

    def to_dict(self) -> Dict[str, Any]:
        """Convert to dictionary."""
        return {
            "total_errors": self.total_errors,
            "errors_by_type": self.errors_by_type,
            "errors_by_code": self.errors_by_code,
            "first_error_time": self.first_error_time,
            "last_error_time": self.last_error_time
        }


@dataclass
class RetrySummary:
    """Summary of retry statistics."""
    total_retries: int = 0
    successful_retries: int = 0
    failed_retries: int = 0
    total_retry_delay_seconds: float = 0.0
    max_attempts: int = 0
    avg_attempts_before_success: float = 0.0

    def to_dict(self) -> Dict[str, Any]:
        """Convert to dictionary."""
        return {
            "total_retries": self.total_retries,
            "successful_retries": self.successful_retries,
            "failed_retries": self.failed_retries,
            "total_retry_delay_seconds": self.total_retry_delay_seconds,
            "max_attempts": self.max_attempts,
            "avg_attempts_before_success": self.avg_attempts_before_success
        }


@dataclass
class CircuitBreakerSummary:
    """Summary of circuit breaker state."""
    current_state: str = "CLOSED"
    state_transitions: int = 0
    total_open_time: float = 0.0
    last_state_change: Optional[float] = None
    opens_count: int = 0
    closes_count: int = 0
    half_opens_count: int = 0

    def to_dict(self) -> Dict[str, Any]:
        """Convert to dictionary."""
        return {
            "current_state": self.current_state,
            "state_transitions": self.state_transitions,
            "total_open_time": self.total_open_time,
            "last_state_change": self.last_state_change,
            "opens_count": self.opens_count,
            "closes_count": self.closes_count,
            "half_opens_count": self.half_opens_count
        }


@dataclass
class FallbackSummary:
    """Summary of fallback activations."""
    total_activations: int = 0
    cache_hits: int = 0
    cache_misses: int = 0
    default_value_used: int = 0
    custom_function_used: int = 0
    no_fallback_available: int = 0
    cache_hit_rate: float = 0.0

    def to_dict(self) -> Dict[str, Any]:
        """Convert to dictionary."""
        return {
            "total_activations": self.total_activations,
            "cache_hits": self.cache_hits,
            "cache_misses": self.cache_misses,
            "default_value_used": self.default_value_used,
            "custom_function_used": self.custom_function_used,
            "no_fallback_available": self.no_fallback_available,
            "cache_hit_rate": self.cache_hit_rate
        }


class RollingCounter:
    """Thread-safe rolling counter for time-windowed metrics."""

    def __init__(self, window_seconds: float = 60.0):
        """
        Initialize rolling counter.

        Args:
            window_seconds: Time window in seconds.
        """
        self._window = window_seconds
        self._points: List[tuple[float, float]] = []  # (timestamp, value)
        self._lock = threading.Lock()

    def add(self, value: float = 1.0) -> None:
        """Add a value to the counter."""
        with self._lock:
            now = time.time()
            self._points.append((now, value))
            self._cleanup(now)

    def _cleanup(self, now: float) -> None:
        """Remove points outside the time window."""
        cutoff = now - self._window
        self._points = [(t, v) for t, v in self._points if t > cutoff]

    def count(self) -> float:
        """Get the count within the time window."""
        with self._lock:
            now = time.time()
            self._cleanup(now)
            return sum(v for _, v in self._points)

    def rate(self) -> float:
        """Get the rate per second within the time window."""
        with self._lock:
            now = time.time()
            self._cleanup(now)
            if not self._points:
                return 0.0
            # Calculate rate over actual window duration
            oldest = min(t for t, _ in self._points)
            duration = now - oldest
            if duration <= 0:
                return 0.0
            return self.count() / duration


class ErrorMetrics:
    """
    Error metrics collector for Pixel LLM.

    Tracks:
    - Error counts by type and code
    - Retry statistics
    - Circuit breaker state changes
    - Fallback activations
    - Operation latencies
    """

    def __init__(self, max_history_points: int = 10000):
        """
        Initialize metrics collector.

        Args:
            max_history_points: Maximum number of metric points to keep in history.
        """
        self._max_history = max_history_points
        self._lock = threading.Lock()

        # Counters
        self._error_counts: Dict[str, int] = defaultdict(int)
        self._error_counts_by_code: Dict[str, int] = defaultdict(int)
        self._success_counts: Dict[str, int] = defaultdict(int)

        # Rolling counters for rates
        self._error_rate = RollingCounter(window_seconds=60.0)
        self._success_rate = RollingCounter(window_seconds=60.0)

        # Retry tracking
        self._retry_stats: Dict[str, RetrySummary] = defaultdict(
            lambda: RetrySummary()
        )
        self._retry_attempts: List[int] = []

        # Circuit breaker tracking
        self._circuit_stats: Dict[str, CircuitBreakerSummary] = defaultdict(
            lambda: CircuitBreakerSummary()
        )
        self._circuit_state_history: Dict[str, List[tuple[float, str]]] = \
            defaultdict(list)

        # Fallback tracking
        self._fallback_stats: Dict[str, FallbackSummary] = defaultdict(
            lambda: FallbackSummary()
        )

        # Latency tracking
        self._latencies: Dict[str, List[float]] = defaultdict(list)

        # Metric history
        self._history: List[MetricPoint] = []

        # Callbacks for metric events
        self._callbacks: List[Callable[[MetricPoint], None]] = []

    def register_callback(self, callback: Callable[[MetricPoint], None]) -> None:
        """
        Register a callback to be called on each metric.

        Args:
            callback: Function to call with MetricPoint.
        """
        with self._lock:
            self._callbacks.append(callback)

    def _emit_metric(self, metric_type: MetricType, value: float,
                     tags: Optional[Dict[str, str]] = None,
                     metadata: Optional[Dict[str, Any]] = None) -> None:
        """Emit a metric point."""
        point = MetricPoint(
            timestamp=time.time(),
            metric_type=metric_type.value,
            value=value,
            tags=tags or {},
            metadata=metadata or {}
        )

        with self._lock:
            self._history.append(point)
            if len(self._history) > self._max_history:
                self._history.pop(0)

        for callback in self._callbacks:
            try:
                callback(point)
            except Exception:
                pass  # Don't let callback errors affect metrics

    def record_error(self, error_type: str, error_code: Optional[str] = None,
                     operation: Optional[str] = None) -> None:
        """
        Record an error.

        Args:
            error_type: Type of error (e.g., "ConnectionError").
            error_code: Optional error code.
            operation: Optional operation name.
        """
        now = time.time()

        with self._lock:
            self._error_counts[error_type] += 1
            if error_code:
                self._error_counts_by_code[error_code] += 1
            self._error_rate.add()

        tags = {"error_type": error_type, "operation": operation or "unknown"}
        if error_code:
            tags["error_code"] = error_code

        self._emit_metric(
            MetricType.ERROR_COUNT,
            1.0,
            tags=tags,
            metadata={"error_code": error_code}
        )

    def record_success(self, operation: str) -> None:
        """
        Record a successful operation.

        Args:
            operation: Operation name.
        """
        with self._lock:
            self._success_counts[operation] += 1
            self._success_rate.add()

        self._emit_metric(
            MetricType.SUCCESS_COUNT,
            1.0,
            tags={"operation": operation}
        )

    def record_retry(self, operation: str, attempts: int,
                     success: bool, delay: float) -> None:
        """
        Record a retry event.

        Args:
            operation: Operation name.
            attempts: Number of retry attempts.
            success: Whether the retry eventually succeeded.
            delay: Total delay in seconds.
        """
        with self._lock:
            stats = self._retry_stats[operation]
            stats.total_retries += 1
            stats.total_retry_delay_seconds += delay
            if success:
                stats.successful_retries += 1
                # Update average attempts
                n = stats.successful_retries
                stats.avg_attempts_before_success = (
                    (stats.avg_attempts_before_success * (n - 1) + attempts) / n
                )
            else:
                stats.failed_retries += 1
            stats.max_attempts = max(stats.max_attempts, attempts)
            self._retry_attempts.append(attempts)

        self._emit_metric(
            MetricType.RETRY_COUNT,
            float(attempts),
            tags={"operation": operation, "success": str(success)}
        )

    def record_circuit_state_change(self, circuit_name: str,
                                    old_state: str, new_state: str) -> None:
        """
        Record a circuit breaker state change.

        Args:
            circuit_name: Name of the circuit breaker.
            old_state: Previous state.
            new_state: New state.
        """
        now = time.time()

        with self._lock:
            stats = self._circuit_stats[circuit_name]
            stats.state_transitions += 1
            stats.last_state_change = now
            stats.current_state = new_state

            if new_state == "OPEN":
                stats.opens_count += 1
            elif new_state == "CLOSED":
                stats.closes_count += 1
            elif new_state == "HALF_OPEN":
                stats.half_opens_count += 1

            self._circuit_state_history[circuit_name].append((now, new_state))

        self._emit_metric(
            MetricType.CIRCUIT_STATE_CHANGE,
            1.0,
            tags={
                "circuit": circuit_name,
                "old_state": old_state,
                "new_state": new_state
            }
        )

    def record_fallback_activation(self, operation: str,
                                   fallback_type: str,
                                   cache_hit: Optional[bool] = None) -> None:
        """
        Record a fallback activation.

        Args:
            operation: Operation name.
            fallback_type: Type of fallback (cache, default, custom, none).
            cache_hit: Whether it was a cache hit (for cache fallbacks).
        """
        with self._lock:
            stats = self._fallback_stats[operation]
            stats.total_activations += 1

            if fallback_type == "cache":
                if cache_hit:
                    stats.cache_hits += 1
                else:
                    stats.cache_misses += 1
            elif fallback_type == "default":
                stats.default_value_used += 1
            elif fallback_type == "custom":
                stats.custom_function_used += 1
            elif fallback_type == "none":
                stats.no_fallback_available += 1

            # Update cache hit rate
            total_cache = stats.cache_hits + stats.cache_misses
            if total_cache > 0:
                stats.cache_hit_rate = stats.cache_hits / total_cache

        self._emit_metric(
            MetricType.FALLBACK_ACTIVATION,
            1.0,
            tags={"operation": operation, "fallback_type": fallback_type}
        )

    def record_latency(self, operation: str, duration_ms: float) -> None:
        """
        Record operation latency.

        Args:
            operation: Operation name.
            duration_ms: Duration in milliseconds.
        """
        with self._lock:
            self._latencies[operation].append(duration_ms)
            # Keep only last 1000 points per operation
            if len(self._latencies[operation]) > 1000:
                self._latencies[operation].pop(0)

        self._emit_metric(
            MetricType.LATENCY,
            duration_ms,
            tags={"operation": operation}
        )

    def get_error_summary(self, error_type: Optional[str] = None) -> ErrorSummary:
        """
        Get error summary statistics.

        Args:
            error_type: Optional specific error type to query.

        Returns:
            ErrorSummary instance.
        """
        with self._lock:
            if error_type:
                return ErrorSummary(
                    total_errors=self._error_counts.get(error_type, 0),
                    errors_by_type={error_type: self._error_counts.get(error_type, 0)}
                )

            return ErrorSummary(
                total_errors=sum(self._error_counts.values()),
                errors_by_type=dict(self._error_counts),
                errors_by_code=dict(self._error_counts_by_code)
            )

    def get_retry_summary(self, operation: Optional[str] = None) -> RetrySummary:
        """
        Get retry statistics.

        Args:
            operation: Optional specific operation to query.

        Returns:
            RetrySummary instance.
        """
        with self._lock:
            if operation:
                return self._retry_stats.get(operation, RetrySummary())

            # Aggregate all operations
            total = RetrySummary()
            for stats in self._retry_stats.values():
                total.total_retries += stats.total_retries
                total.successful_retries += stats.successful_retries
                total.failed_retries += stats.failed_retries
                total.total_retry_delay_seconds += stats.total_retry_delay_seconds
                total.max_attempts = max(total.max_attempts, stats.max_attempts)

            if total.successful_retries > 0:
                total.avg_attempts_before_success = (
                    sum(s.avg_attempts_before_success * s.successful_retries
                        for s in self._retry_stats.values() if s.successful_retries > 0)
                    / total.successful_retries
                )

            return total

    def get_circuit_breaker_summary(self,
                                   circuit_name: Optional[str] = None) -> CircuitBreakerSummary:
        """
        Get circuit breaker statistics.

        Args:
            circuit_name: Optional specific circuit to query.

        Returns:
            CircuitBreakerSummary instance.
        """
        with self._lock:
            if circuit_name:
                return self._circuit_stats.get(circuit_name,
                                              CircuitBreakerSummary())

            return CircuitBreakerSummary(
                current_state="multiple",
                state_transitions=sum(s.state_transitions
                                     for s in self._circuit_stats.values())
            )

    def get_fallback_summary(self, operation: Optional[str] = None) -> FallbackSummary:
        """
        Get fallback statistics.

        Args:
            operation: Optional specific operation to query.

        Returns:
            FallbackSummary instance.
        """
        with self._lock:
            if operation:
                return self._fallback_stats.get(operation, FallbackSummary())

            # Aggregate all operations
            total = FallbackSummary()
            for stats in self._fallback_stats.values():
                total.total_activations += stats.total_activations
                total.cache_hits += stats.cache_hits
                total.cache_misses += stats.cache_misses
                total.default_value_used += stats.default_value_used
                total.custom_function_used += stats.custom_function_used
                total.no_fallback_available += stats.no_fallback_available

            cache_total = total.cache_hits + total.cache_misses
            if cache_total > 0:
                total.cache_hit_rate = total.cache_hits / cache_total

            return total

    def get_latency_stats(self, operation: str) -> Dict[str, float]:
        """
        Get latency statistics for an operation.

        Args:
            operation: Operation name.

        Returns:
            Dictionary with min, max, avg, p50, p95, p99 latencies in ms.
        """
        with self._lock:
            latencies = sorted(self._latencies.get(operation, []))
            if not latencies:
                return {}

            import statistics
            n = len(latencies)

            def percentile(p: float) -> float:
                idx = int(n * p / 100)
                return latencies[min(idx, n - 1)]

            return {
                "min_ms": latencies[0],
                "max_ms": latencies[-1],
                "avg_ms": statistics.mean(latencies),
                "p50_ms": percentile(50),
                "p95_ms": percentile(95),
                "p99_ms": percentile(99),
                "count": n
            }

    def get_error_rate(self, window_seconds: float = 60.0) -> float:
        """
        Get current error rate (errors per second).

        Args:
            window_seconds: Time window to calculate rate over.

        Returns:
            Error rate in errors per second.
        """
        return self._error_rate.rate()

    def get_success_rate(self, window_seconds: float = 60.0) -> float:
        """
        Get current success rate (successes per second).

        Args:
            window_seconds: Time window to calculate rate over.

        Returns:
            Success rate in successes per second.
        """
        return self._success_rate.rate()

    def get_full_summary(self) -> Dict[str, Any]:
        """
        Get a comprehensive summary of all metrics.

        Returns:
            Dictionary with all metric summaries.
        """
        return {
            "errors": self.get_error_summary().to_dict(),
            "retries": self.get_retry_summary().to_dict(),
            "circuit_breaker": self.get_circuit_breaker_summary().to_dict(),
            "fallbacks": self.get_fallback_summary().to_dict(),
            "error_rate_per_second": self.get_error_rate(),
            "success_rate_per_second": self.get_success_rate(),
            "latencies": {
                op: self.get_latency_stats(op)
                for op in self._latencies.keys()
            }
        }

    def get_history(self, metric_type: Optional[MetricType] = None,
                   limit: int = 100) -> List[MetricPoint]:
        """
        Get metric history.

        Args:
            metric_type: Optional filter by metric type.
            limit: Maximum number of points to return.

        Returns:
            List of MetricPoint instances.
        """
        with self._lock:
            if metric_type:
                points = [p for p in self._history
                         if p.metric_type == metric_type.value]
            else:
                points = self._history

            return points[-limit:]

    def reset(self) -> None:
        """Reset all metrics."""
        with self._lock:
            self._error_counts.clear()
            self._error_counts_by_code.clear()
            self._success_counts.clear()
            self._retry_stats.clear()
            self._retry_attempts.clear()
            self._circuit_stats.clear()
            self._circuit_state_history.clear()
            self._fallback_stats.clear()
            self._latencies.clear()
            self._history.clear()


# Global metrics instance
_global_metrics: Optional[ErrorMetrics] = None


def get_metrics() -> ErrorMetrics:
    """Get the global metrics instance."""
    global _global_metrics
    if _global_metrics is None:
        _global_metrics = ErrorMetrics()
    return _global_metrics
