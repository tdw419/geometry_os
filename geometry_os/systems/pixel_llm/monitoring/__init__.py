"""
Monitoring & Logging Module for Pixel LLM Error Handling

This module provides structured logging and metrics collection for monitoring
the health and performance of Pixel LLM operations.

Components:
- StructuredLogger: JSON-based async logging with context tracking
- ErrorMetrics: Comprehensive error tracking and statistics
- Various helper classes for log entries, metric points, and summaries
"""

from .structured_logger import (
    LogLevel,
    LogContext,
    LogEntry,
    AsyncLogHandler,
    StructuredLogger,
    get_logger,
    get_default_logger,
    set_context,
)

from .metrics import (
    MetricType,
    MetricPoint,
    ErrorSummary,
    RetrySummary,
    CircuitBreakerSummary,
    FallbackSummary,
    RollingCounter,
    ErrorMetrics,
    get_metrics,
)

__all__ = [
    # Structured Logger
    "LogLevel",
    "LogContext",
    "LogEntry",
    "AsyncLogHandler",
    "StructuredLogger",
    "get_logger",
    "get_default_logger",
    "set_context",

    # Metrics
    "MetricType",
    "MetricPoint",
    "ErrorSummary",
    "RetrySummary",
    "CircuitBreakerSummary",
    "FallbackSummary",
    "RollingCounter",
    "ErrorMetrics",
    "get_metrics",
]
