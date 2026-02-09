"""
Structured Logger for Pixel LLM Error Handling

Provides JSON-based structured logging with async, non-blocking writes.
Includes error codes, context, stack traces, and multiple log levels.
"""

import asyncio
import json
import logging
import sys
import threading
import traceback
from dataclasses import dataclass, field, asdict
from datetime import datetime
from enum import Enum
from pathlib import Path
from queue import Queue, Empty
from typing import Any, Optional, Dict, List, Callable
import contextvars


class LogLevel(Enum):
    """Log severity levels."""
    DEBUG = "DEBUG"
    INFO = "INFO"
    WARNING = "WARNING"
    ERROR = "ERROR"
    CRITICAL = "CRITICAL"


@dataclass
class LogContext:
    """Context information for log entries."""
    component: str
    operation: Optional[str] = None
    request_id: Optional[str] = None
    session_id: Optional[str] = None
    user_id: Optional[str] = None
    extra: Dict[str, Any] = field(default_factory=dict)

    def to_dict(self) -> Dict[str, Any]:
        """Convert context to dictionary."""
        return {k: v for k, v in asdict(self).items() if v is not None}


@dataclass
class LogEntry:
    """A single log entry."""
    timestamp: str
    level: str
    message: str
    context: Optional[Dict[str, Any]] = None
    error_code: Optional[str] = None
    exception_type: Optional[str] = None
    stack_trace: Optional[str] = None
    extra: Dict[str, Any] = field(default_factory=dict)

    def to_dict(self) -> Dict[str, Any]:
        """Convert log entry to JSON-serializable dictionary."""
        return {
            "timestamp": self.timestamp,
            "level": self.level,
            "message": self.message,
            "context": self.context,
            "error_code": self.error_code,
            "exception_type": self.exception_type,
            "stack_trace": self.stack_trace,
            "extra": self.extra
        }

    def to_json(self) -> str:
        """Convert log entry to JSON string."""
        return json.dumps(self.to_dict(), default=str)


class AsyncLogHandler:
    """Non-blocking async log handler using queue and background thread."""

    def __init__(self, output: Callable[[str], None] = None):
        """
        Initialize async log handler.

        Args:
            output: Function to call with formatted log messages.
                   Defaults to printing to stdout.
        """
        self._queue: Queue = Queue()
        self._running = False
        self._thread: Optional[threading.Thread] = None
        self._output = output or self._default_output
        self._lock = threading.Lock()

    def _default_output(self, message: str) -> None:
        """Default output function (print to stdout)."""
        print(message, flush=True)

    def start(self) -> None:
        """Start the background logging thread."""
        with self._lock:
            if self._running:
                return
            self._running = True
            self._thread = threading.Thread(target=self._process_queue, daemon=True)
            self._thread.start()

    def stop(self) -> None:
        """Stop the background logging thread."""
        with self._lock:
            if not self._running:
                return
            self._running = False
            # Add sentinel to wake up thread
            self._queue.put(None)
            if self._thread:
                self._thread.join(timeout=5.0)
                self._thread = None

    def emit(self, message: str) -> None:
        """
        Queue a log message for async writing.

        Args:
            message: Formatted log message to write.
        """
        if self._running:
            self._queue.put(message)

    def _process_queue(self) -> None:
        """Background thread that processes the log queue."""
        while self._running:
            try:
                message = self._queue.get(timeout=1.0)
                if message is None:  # Sentinel
                    break
                self._output(message)
            except Empty:
                continue
            except Exception as e:
                # Don't use logging here to avoid recursion
                print(f"Error in log handler: {e}", file=sys.stderr, flush=True)

    def flush(self) -> None:
        """Flush any pending log messages."""
        while not self._queue.empty():
            try:
                message = self._queue.get_nowait()
                if message is not None:
                    self._output(message)
            except Empty:
                break


class StructuredLogger:
    """
    Structured logger for JSON-based logging.

    Features:
    - JSON format for easy parsing and analysis
    - Async, non-blocking writes
    - Multiple log levels
    - Error code tracking
    - Stack trace capture
    - Context tracking
    - Per-component loggers
    """

    # Thread-safe context storage
    _context_var: contextvars.ContextVar[LogContext] = contextvars.ContextVar(
        'log_context', default=LogContext(component='unknown')
    )

    def __init__(
        self,
        name: str = "pixel_llm",
        level: LogLevel = LogLevel.INFO,
        output_file: Optional[Path] = None,
        enable_console: bool = True,
        enable_async: bool = True,
    ):
        """
        Initialize structured logger.

        Args:
            name: Logger name (usually component/module name).
            level: Minimum log level to record.
            output_file: Optional file path to write logs to.
            enable_console: Whether to output to console.
            enable_async: Whether to use async, non-blocking writes.
        """
        self._name = name
        self._level = level
        self._enable_console = enable_console
        self._enable_async = enable_async
        self._output_file = output_file

        # Initialize handlers
        self._handlers: List[Callable[[str], None]] = []
        self._async_handler: Optional[AsyncLogHandler] = None

        if enable_async:
            self._async_handler = AsyncLogHandler()
            self._async_handler.start()
            self._handlers.append(self._async_handler.emit)

        if output_file:
            output_file.parent.mkdir(parents=True, exist_ok=True)
            self._file_handle = open(output_file, 'a')
            self._handlers.append(lambda m: self._file_handle.write(m + '\n'))
        else:
            self._file_handle = None

    def __del__(self):
        """Cleanup resources."""
        if self._async_handler:
            self._async_handler.stop()
        if self._file_handle:
            self._file_handle.close()

    @classmethod
    def set_context(cls, context: LogContext) -> None:
        """
        Set the logging context for the current execution context.

        Args:
            context: LogContext instance with contextual information.
        """
        cls._context_var.set(context)

    @classmethod
    def get_context(cls) -> LogContext:
        """Get the current logging context."""
        return cls._context_var.get()

    def _should_log(self, level: LogLevel) -> bool:
        """Check if a log level should be recorded."""
        levels = [LogLevel.DEBUG, LogLevel.INFO, LogLevel.WARNING,
                 LogLevel.ERROR, LogLevel.CRITICAL]
        try:
            return levels.index(level) >= levels.index(self._level)
        except ValueError:
            return False

    def _format_entry(self, entry: LogEntry) -> str:
        """Format log entry for output."""
        return entry.to_json()

    def _emit(self, entry: LogEntry) -> None:
        """Emit a log entry to all handlers."""
        message = self._format_entry(entry)

        if self._enable_console and not self._enable_async:
            print(message, flush=True)

        for handler in self._handlers:
            handler(message)

    def _create_log_entry(
        self,
        level: LogLevel,
        message: str,
        error_code: Optional[str] = None,
        exception: Optional[Exception] = None,
        extra: Optional[Dict[str, Any]] = None,
    ) -> LogEntry:
        """Create a log entry with current context."""
        context = self.get_context()
        stack_trace = None

        if exception:
            exception_type = type(exception).__name__
            stack_trace = ''.join(traceback.format_exception(
                type(exception), exception, exception.__traceback__
            ))
        else:
            exception_type = None

        return LogEntry(
            timestamp=datetime.utcnow().isoformat() + 'Z',
            level=level.value,
            message=message,
            context=context.to_dict(),
            error_code=error_code,
            exception_type=exception_type,
            stack_trace=stack_trace,
            extra=extra or {}
        )

    def debug(
        self,
        message: str,
        error_code: Optional[str] = None,
        exception: Optional[Exception] = None,
        extra: Optional[Dict[str, Any]] = None,
    ) -> None:
        """Log a debug message."""
        if not self._should_log(LogLevel.DEBUG):
            return
        entry = self._create_log_entry(LogLevel.DEBUG, message, error_code,
                                       exception, extra)
        self._emit(entry)

    def info(
        self,
        message: str,
        error_code: Optional[str] = None,
        exception: Optional[Exception] = None,
        extra: Optional[Dict[str, Any]] = None,
    ) -> None:
        """Log an info message."""
        if not self._should_log(LogLevel.INFO):
            return
        entry = self._create_log_entry(LogLevel.INFO, message, error_code,
                                       exception, extra)
        self._emit(entry)

    def warning(
        self,
        message: str,
        error_code: Optional[str] = None,
        exception: Optional[Exception] = None,
        extra: Optional[Dict[str, Any]] = None,
    ) -> None:
        """Log a warning message."""
        if not self._should_log(LogLevel.WARNING):
            return
        entry = self._create_log_entry(LogLevel.WARNING, message, error_code,
                                       exception, extra)
        self._emit(entry)

    def error(
        self,
        message: str,
        error_code: Optional[str] = None,
        exception: Optional[Exception] = None,
        extra: Optional[Dict[str, Any]] = None,
    ) -> None:
        """Log an error message."""
        if not self._should_log(LogLevel.ERROR):
            return
        entry = self._create_log_entry(LogLevel.ERROR, message, error_code,
                                       exception, extra)
        self._emit(entry)

    def critical(
        self,
        message: str,
        error_code: Optional[str] = None,
        exception: Optional[Exception] = None,
        extra: Optional[Dict[str, Any]] = None,
    ) -> None:
        """Log a critical message."""
        if not self._should_log(LogLevel.CRITICAL):
            return
        entry = self._create_log_entry(LogLevel.CRITICAL, message, error_code,
                                       exception, extra)
        self._emit(entry)

    def log_exception(
        self,
        message: str,
        exception: Exception,
        error_code: Optional[str] = None,
        level: LogLevel = LogLevel.ERROR,
        extra: Optional[Dict[str, Any]] = None,
    ) -> None:
        """
        Log an exception with full context.

        Args:
            message: Human-readable error message.
            exception: Exception instance to log.
            error_code: Optional error code.
            level: Log level (default: ERROR).
            extra: Optional additional context.
        """
        if not self._should_log(level):
            return
        entry = self._create_log_entry(level, message, error_code,
                                       exception, extra)
        self._emit(entry)

    def flush(self) -> None:
        """Flush any pending log messages."""
        if self._async_handler:
            self._async_handler.flush()
        if self._file_handle:
            self._file_handle.flush()

    def change_level(self, level: LogLevel) -> None:
        """
        Change the minimum log level.

        Args:
            level: New minimum log level.
        """
        self._level = level


# Global logger registry
_loggers: Dict[str, StructuredLogger] = {}
_default_logger: Optional[StructuredLogger] = None


def get_logger(
    name: str = "pixel_llm",
    level: LogLevel = LogLevel.INFO,
    output_file: Optional[Path] = None,
    enable_console: bool = True,
    enable_async: bool = True,
) -> StructuredLogger:
    """
    Get or create a structured logger.

    Args:
        name: Logger name.
        level: Minimum log level.
        output_file: Optional file path for logs.
        enable_console: Whether to enable console output.
        enable_async: Whether to enable async logging.

    Returns:
        StructuredLogger instance.
    """
    global _default_logger

    if name not in _loggers:
        _loggers[name] = StructuredLogger(
            name=name,
            level=level,
            output_file=output_file,
            enable_console=enable_console,
            enable_async=enable_async,
        )

    if _default_logger is None:
        _default_logger = _loggers[name]

    return _loggers[name]


def get_default_logger() -> StructuredLogger:
    """Get the default logger instance."""
    global _default_logger
    if _default_logger is None:
        _default_logger = get_logger()
    return _default_logger


def set_context(component: str, **kwargs) -> None:
    """
    Set logging context for the current scope.

    Args:
        component: Component name.
        **kwargs: Additional context fields.
    """
    context = LogContext(component=component, **kwargs)
    StructuredLogger.set_context(context)
