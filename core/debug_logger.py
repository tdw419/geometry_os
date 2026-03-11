"""
Debug Logger - Granular logging framework for debugging critical operations.

This module provides:
- Operation tracing with timing
- Hierarchical context for nested operations
- Configurable verbosity levels per subsystem
- Structured output for debugging
- Integration with the existing log correlation system
"""

import functools
import json
import logging
import os
import sys
import threading
import time
import traceback
from collections import defaultdict
from contextlib import contextmanager
from dataclasses import dataclass, field
from datetime import datetime
from enum import Enum
from pathlib import Path
from typing import Any, Callable, Optional, TypeVar, ParamSpec

P = ParamSpec("P")
R = TypeVar("R")


class DebugLevel(Enum):
    """Debug verbosity levels."""
    OFF = 0
    ERROR = 1
    WARNING = 2
    INFO = 3
    DEBUG = 4
    TRACE = 5  # Most verbose - logs every step


class OperationCategory(Enum):
    """Categories for different types of operations."""
    # Core system operations
    INIT = "init"
    SHUTDOWN = "shutdown"
    
    # Neural/ML operations
    NEURAL_INFERENCE = "neural_inference"
    NEURAL_TRAINING = "neural_training"
    NEURAL_COMPILE = "neural_compile"
    
    # Visual/GPU operations
    GPU_RENDER = "gpu_render"
    GPU_SHADER = "gpu_shader"
    GPU_MEMORY = "gpu_memory"
    VISUAL_PROCESS = "visual_process"
    
    # Evolution system
    EVOLUTION_CYCLE = "evolution_cycle"
    EVOLUTION_MUTATE = "evolution_mutate"
    EVOLUTION_SELECT = "evolution_select"
    
    # File/IO operations
    FILE_READ = "file_read"
    FILE_WRITE = "file_write"
    FILE_PARSE = "file_parse"
    
    # Network/IPC operations
    NETWORK_SEND = "network_send"
    NETWORK_RECV = "network_recv"
    IPC_CALL = "ipc_call"
    
    # Memory operations
    MEMORY_ALLOC = "memory_alloc"
    MEMORY_FREE = "memory_free"
    CACHE_HIT = "cache_hit"
    CACHE_MISS = "cache_miss"
    
    # Agent/Swarm operations
    AGENT_SPAWN = "agent_spawn"
    AGENT_MESSAGE = "agent_message"
    SWARM_COORD = "swarm_coord"
    
    # User interactions
    USER_INPUT = "user_input"
    USER_OUTPUT = "user_output"
    
    # State management
    STATE_CHANGE = "state_change"
    STATE_QUERY = "state_query"
    
    # Generic
    UNKNOWN = "unknown"


@dataclass
class OperationTrace:
    """Represents a traced operation."""
    operation_id: str
    category: OperationCategory
    name: str
    start_time: float
    end_time: float | None = None
    duration_ms: float | None = None
    parent_id: str | None = None
    thread_id: int = field(default_factory=lambda: threading.current_thread().ident or 0)
    status: str = "running"
    metadata: dict[str, Any] = field(default_factory=dict)
    children: list[str] = field(default_factory=list)
    error: str | None = None
    stack_trace: str | None = None
    
    def to_dict(self) -> dict[str, Any]:
        """Convert to dictionary."""
        return {
            "operation_id": self.operation_id,
            "category": self.category.value,
            "name": self.name,
            "start_time": self.start_time,
            "end_time": self.end_time,
            "duration_ms": self.duration_ms,
            "parent_id": self.parent_id,
            "thread_id": self.thread_id,
            "status": self.status,
            "metadata": self.metadata,
            "children": self.children,
            "error": self.error,
            "stack_trace": self.stack_trace,
        }


@dataclass
class DebugConfig:
    """Configuration for debug logging."""
    # Global minimum level
    global_level: DebugLevel = DebugLevel.INFO
    
    # Per-category levels (override global)
    category_levels: dict[OperationCategory, DebugLevel] = field(default_factory=dict)
    
    # Per-subsystem levels (e.g., "neural_cortex", "visual_shell")
    subsystem_levels: dict[str, DebugLevel] = field(default_factory=dict)
    
    # Output settings
    output_to_console: bool = True
    output_to_file: bool = True
    output_file: str = "logs/debug_trace.log"
    output_json: bool = True
    json_output_file: str = "logs/debug_trace.json"
    
    # Performance settings
    max_traces_in_memory: int = 10000
    slow_operation_threshold_ms: float = 100.0
    very_slow_threshold_ms: float = 1000.0
    
    # Trace settings
    capture_stack_traces: bool = False
    capture_stack_on_error: bool = True
    max_stack_depth: int = 10
    
    # Formatting
    timestamp_format: str = "%Y-%m-%d %H:%M:%S.%f"
    indent_string: str = "  "


class DebugLogger:
    """
    Main debug logging class with granular tracing capabilities.
    
    Features:
    - Hierarchical operation tracing
    - Timing and performance metrics
    - Configurable verbosity per category/subsystem
    - Integration with standard logging
    - Thread-safe operation tracking
    """
    
    _instance: Optional["DebugLogger"] = None
    _lock = threading.Lock()
    
    def __init__(self, config: DebugConfig | None = None):
        self.config = config or DebugConfig()
        self._traces: dict[str, OperationTrace] = {}
        self._active_operations: dict[int, str] = {}  # thread_id -> operation_id
        self._operation_counter = 0
        self._subsystem_loggers: dict[str, logging.Logger] = {}
        self._handlers_configured = False
        self._file_handler: logging.FileHandler | None = None
        self._json_file = None
        
        # Statistics
        self._stats = defaultdict(lambda: {"count": 0, "total_ms": 0.0, "errors": 0})
        
        # Configure output
        self._setup_output()
    
    @classmethod
    def get_instance(cls) -> "DebugLogger":
        """Get singleton instance."""
        if cls._instance is None:
            with cls._lock:
                if cls._instance is None:
                    cls._instance = cls()
        return cls._instance
    
    @classmethod
    def reset_instance(cls) -> None:
        """Reset singleton instance (for testing)."""
        with cls._lock:
            if cls._instance is not None:
                cls._instance._cleanup()
            cls._instance = None
    
    def _setup_output(self) -> None:
        """Set up output handlers."""
        if self._handlers_configured:
            return
            
        if self.config.output_to_file:
            # Ensure log directory exists
            log_dir = Path(self.config.output_file).parent
            log_dir.mkdir(parents=True, exist_ok=True)
            
        if self.config.output_json:
            json_dir = Path(self.config.json_output_file).parent
            json_dir.mkdir(parents=True, exist_ok=True)
        
        self._handlers_configured = True
    
    def _cleanup(self) -> None:
        """Clean up resources."""
        if self._file_handler:
            self._file_handler.close()
            self._file_handler = None
        if self._json_file:
            self._json_file.close()
            self._json_file = None
    
    def _generate_operation_id(self) -> str:
        """Generate unique operation ID."""
        self._operation_counter += 1
        return f"op_{self._operation_counter}_{int(time.time() * 1000000)}"
    
    def _should_log(self, level: DebugLevel, category: OperationCategory, 
                    subsystem: str | None = None) -> bool:
        """Check if we should log at this level."""
        # Check category-specific level first
        if category in self.config.category_levels:
            threshold = self.config.category_levels[category]
        # Then check subsystem level
        elif subsystem and subsystem in self.config.subsystem_levels:
            threshold = self.config.subsystem_levels[subsystem]
        # Fall back to global level
        else:
            threshold = self.config.global_level
        
        return level.value <= threshold.value
    
    def _format_message(self, level: DebugLevel, message: str, 
                        trace: OperationTrace | None = None,
                        indent: int = 0) -> str:
        """Format a log message."""
        timestamp = datetime.now().strftime(self.config.timestamp_format)
        prefix = self.config.indent_string * indent
        
        parts = [f"[{timestamp}]", f"[{level.name}]"]
        
        if trace:
            parts.append(f"[{trace.category.value}]")
            parts.append(f"[{trace.name}]")
            if trace.duration_ms is not None:
                parts.append(f"({trace.duration_ms:.2f}ms)")
        
        parts.append(f"{prefix}{message}")
        
        return " ".join(parts)
    
    def _write_to_file(self, message: str) -> None:
        """Write message to log file."""
        if not self.config.output_to_file:
            return
            
        try:
            with open(self.config.output_file, "a") as f:
                f.write(message + "\n")
        except Exception:
            pass  # Don't fail on logging errors
    
    def _write_trace_json(self, trace: OperationTrace) -> None:
        """Write trace to JSON file."""
        if not self.config.output_json:
            return
            
        try:
            with open(self.config.json_output_file, "a") as f:
                f.write(json.dumps(trace.to_dict()) + "\n")
        except Exception:
            pass
    
    def _update_stats(self, trace: OperationTrace) -> None:
        """Update operation statistics."""
        key = f"{trace.category.value}:{trace.name}"
        stats = self._stats[key]
        stats["count"] += 1
        if trace.duration_ms:
            stats["total_ms"] += trace.duration_ms
        if trace.status == "error":
            stats["errors"] += 1
    
    # === Core Logging Methods ===
    
    def log(self, level: DebugLevel, message: str, 
            category: OperationCategory = OperationCategory.UNKNOWN,
            subsystem: str | None = None,
            metadata: dict[str, Any] | None = None) -> None:
        """
        Log a message at the specified level.
        
        Args:
            level: Debug level for this message
            message: The message to log
            category: Operation category
            subsystem: Optional subsystem name for level override
            metadata: Optional metadata dictionary
        """
        if not self._should_log(level, category, subsystem):
            return
        
        trace = OperationTrace(
            operation_id=self._generate_operation_id(),
            category=category,
            name="log",
            start_time=time.time(),
            metadata=metadata or {},
        )
        
        formatted = self._format_message(level, message, trace)
        
        if self.config.output_to_console:
            print(formatted, file=sys.stderr if level.value <= DebugLevel.ERROR.value else sys.stdout)
        
        self._write_to_file(formatted)
    
    def trace_msg(self, message: str, 
                  category: OperationCategory = OperationCategory.UNKNOWN,
                  subsystem: str | None = None,
                  **kwargs) -> None:
        """Log at TRACE level (most verbose)."""
        self.log(DebugLevel.TRACE, message, category, subsystem, kwargs if kwargs else None)
    
    def debug(self, message: str, 
              category: OperationCategory = OperationCategory.UNKNOWN,
              subsystem: str | None = None,
              **kwargs) -> None:
        """Log at DEBUG level."""
        self.log(DebugLevel.DEBUG, message, category, subsystem, kwargs if kwargs else None)
    
    def info(self, message: str, 
             category: OperationCategory = OperationCategory.UNKNOWN,
             subsystem: str | None = None,
             **kwargs) -> None:
        """Log at INFO level."""
        self.log(DebugLevel.INFO, message, category, subsystem, kwargs if kwargs else None)
    
    def warning(self, message: str, 
                category: OperationCategory = OperationCategory.UNKNOWN,
                subsystem: str | None = None,
                **kwargs) -> None:
        """Log at WARNING level."""
        self.log(DebugLevel.WARNING, message, category, subsystem, kwargs if kwargs else None)
    
    def error(self, message: str, 
              category: OperationCategory = OperationCategory.UNKNOWN,
              subsystem: str | None = None,
              exception: Exception | None = None,
              **kwargs) -> None:
        """Log at ERROR level."""
        metadata = kwargs if kwargs else {}
        if exception:
            metadata["exception_type"] = type(exception).__name__
            metadata["exception_message"] = str(exception)
            if self.config.capture_stack_on_error:
                metadata["stack_trace"] = traceback.format_exc()
        
        self.log(DebugLevel.ERROR, message, category, subsystem, metadata)
    
    # === Operation Tracing ===
    
    @contextmanager
    def trace_operation(
        self,
        name: str,
        category: OperationCategory = OperationCategory.UNKNOWN,
        subsystem: str | None = None,
        metadata: dict[str, Any] | None = None,
        capture_stack: bool | None = None,
    ):
        """
        Context manager for tracing an operation with timing.
        
        Args:
            name: Name of the operation
            category: Operation category
            subsystem: Optional subsystem name
            metadata: Optional metadata
            capture_stack: Whether to capture stack trace
            
        Yields:
            OperationTrace object that can be updated during operation
        """
        thread_id = threading.current_thread().ident or 0
        
        # Get parent operation if any
        parent_id = self._active_operations.get(thread_id)
        
        trace = OperationTrace(
            operation_id=self._generate_operation_id(),
            category=category,
            name=name,
            start_time=time.time(),
            parent_id=parent_id,
            metadata=metadata or {},
        )
        
        # Capture stack if requested
        should_capture = capture_stack if capture_stack is not None else self.config.capture_stack_traces
        if should_capture:
            stack = traceback.extract_stack(limit=self.config.max_stack_depth)
            trace.stack_trace = "".join(traceback.format_list(stack))
        
        # Register trace
        self._traces[trace.operation_id] = trace
        if parent_id and parent_id in self._traces:
            self._traces[parent_id].children.append(trace.operation_id)
        
        # Set as active for this thread
        self._active_operations[thread_id] = trace.operation_id
        
        # Log start
        if self._should_log(DebugLevel.TRACE, category, subsystem):
            self.trace_msg(f"START: {name}", category, subsystem, **(metadata or {}))
        
        try:
            yield trace
            trace.status = "success"
        except Exception as e:
            trace.status = "error"
            trace.error = str(e)
            if self.config.capture_stack_on_error:
                trace.stack_trace = traceback.format_exc()
            self.error(f"ERROR in {name}: {e}", category, subsystem, exception=e)
            raise
        finally:
            # Calculate duration
            trace.end_time = time.time()
            trace.duration_ms = (trace.end_time - trace.start_time) * 1000
            
            # Restore parent as active
            if parent_id:
                self._active_operations[thread_id] = parent_id
            else:
                self._active_operations.pop(thread_id, None)
            
            # Update stats
            self._update_stats(trace)
            
            # Log completion
            if self._should_log(DebugLevel.TRACE, category, subsystem):
                duration_str = f"{trace.duration_ms:.2f}ms"
                status_emoji = "✓" if trace.status == "success" else "✗"
                self.trace_msg(
                    f"END: {name} {status_emoji} ({duration_str})",
                    category, subsystem,
                    status=trace.status
                )
            
            # Warn about slow operations
            if trace.duration_ms > self.config.slow_operation_threshold_ms:
                level = DebugLevel.WARNING if trace.duration_ms < self.config.very_slow_threshold_ms else DebugLevel.ERROR
                if self._should_log(level, category, subsystem):
                    self.log(
                        level,
                        f"SLOW OPERATION: {name} took {trace.duration_ms:.2f}ms",
                        category, subsystem
                    )
            
            # Write to JSON
            self._write_trace_json(trace)
            
            # Trim old traces if needed
            if len(self._traces) > self.config.max_traces_in_memory:
                # Remove oldest traces
                sorted_ids = sorted(self._traces.keys(), 
                                    key=lambda x: self._traces[x].start_time)
                for old_id in sorted_ids[:len(self._traces) - self.config.max_traces_in_memory]:
                    del self._traces[old_id]
    
    def trace_function(
        self,
        name: str | None = None,
        category: OperationCategory = OperationCategory.UNKNOWN,
        subsystem: str | None = None,
        log_args: bool = True,
        log_result: bool = True,
    ) -> Callable[[Callable[P, R]], Callable[P, R]]:
        """
        Decorator for tracing function calls.
        
        Args:
            name: Optional name override (defaults to function name)
            category: Operation category
            subsystem: Optional subsystem
            log_args: Whether to log function arguments
            log_result: Whether to log return value
            
        Returns:
            Decorated function
        """
        def decorator(func: Callable[P, R]) -> Callable[P, R]:
            op_name = name or func.__name__
            
            @functools.wraps(func)
            def wrapper(*args: P.args, **kwargs: P.kwargs) -> R:
                metadata = {}
                if log_args:
                    metadata["args"] = str(args)[:200]  # Truncate long args
                    metadata["kwargs"] = str(kwargs)[:200]
                
                with self.trace_operation(op_name, category, subsystem, metadata) as trace:
                    result = func(*args, **kwargs)
                    
                    if log_result:
                        trace.metadata["result"] = str(result)[:200]
                    
                    return result
            
            return wrapper
        return decorator
    
    # === Query and Analysis Methods ===
    
    def get_trace(self, operation_id: str) -> OperationTrace | None:
        """Get a trace by ID."""
        return self._traces.get(operation_id)
    
    def get_trace_tree(self, operation_id: str) -> dict[str, Any]:
        """Get a trace and its children as a tree."""
        trace = self._traces.get(operation_id)
        if not trace:
            return {}
        
        result = trace.to_dict()
        result["children"] = [
            self.get_trace_tree(child_id)
            for child_id in trace.children
            if child_id in self._traces
        ]
        return result
    
    def get_traces_by_category(self, category: OperationCategory) -> list[OperationTrace]:
        """Get all traces for a category."""
        return [t for t in self._traces.values() if t.category == category]
    
    def get_traces_by_status(self, status: str) -> list[OperationTrace]:
        """Get all traces with a given status."""
        return [t for t in self._traces.values() if t.status == status]
    
    def get_errors(self) -> list[OperationTrace]:
        """Get all failed operations."""
        return self.get_traces_by_status("error")
    
    def get_slow_operations(self, threshold_ms: float | None = None) -> list[OperationTrace]:
        """Get operations slower than threshold."""
        threshold = threshold_ms or self.config.slow_operation_threshold_ms
        return [
            t for t in self._traces.values()
            if t.duration_ms is not None and t.duration_ms > threshold
        ]
    
    def get_statistics(self) -> dict[str, Any]:
        """Get operation statistics."""
        stats = {
            "total_operations": len(self._traces),
            "by_category": defaultdict(lambda: {"count": 0, "total_ms": 0.0, "errors": 0}),
            "by_status": defaultdict(int),
            "slow_operations": len(self.get_slow_operations()),
            "operations": {},
        }
        
        for key, data in self._stats.items():
            stats["operations"][key] = {
                "count": data["count"],
                "total_ms": round(data["total_ms"], 2),
                "avg_ms": round(data["total_ms"] / data["count"], 2) if data["count"] > 0 else 0,
                "errors": data["errors"],
            }
        
        for trace in self._traces.values():
            stats["by_category"][trace.category.value]["count"] += 1
            if trace.duration_ms:
                stats["by_category"][trace.category.value]["total_ms"] += trace.duration_ms
            if trace.status == "error":
                stats["by_category"][trace.category.value]["errors"] += 1
            stats["by_status"][trace.status] += 1
        
        # Convert defaultdicts to regular dicts
        stats["by_category"] = dict(stats["by_category"])
        stats["by_status"] = dict(stats["by_status"])
        
        return stats
    
    def get_active_operations(self) -> list[OperationTrace]:
        """Get currently running operations."""
        thread_ids = set(self._active_operations.values())
        return [self._traces[tid] for tid in thread_ids if tid in self._traces]
    
    def clear_traces(self) -> None:
        """Clear all stored traces."""
        self._traces.clear()
        self._stats.clear()
    
    def dump_session_report(self, output_file: str = "logs/debug_session_report.json") -> None:
        """Dump a comprehensive session report."""
        report = {
            "timestamp": datetime.now().isoformat(),
            "statistics": self.get_statistics(),
            "errors": [t.to_dict() for t in self.get_errors()],
            "slow_operations": [
                t.to_dict() for t in self.get_slow_operations()
            ],
            "root_operations": [
                self.get_trace_tree(tid)
                for tid, trace in self._traces.items()
                if trace.parent_id is None
            ],
        }
        
        Path(output_file).parent.mkdir(parents=True, exist_ok=True)
        with open(output_file, "w") as f:
            json.dump(report, f, indent=2)
        
        self.info(f"Session report written to {output_file}", category=OperationCategory.FILE_WRITE)


# === Convenience Functions ===

def get_debug_logger() -> DebugLogger:
    """Get the singleton debug logger instance."""
    return DebugLogger.get_instance()


def configure_debug_logging(
    global_level: DebugLevel = DebugLevel.INFO,
    output_to_console: bool = True,
    output_to_file: bool = True,
    output_file: str = "logs/debug_trace.log",
    slow_threshold_ms: float = 100.0,
    **kwargs
) -> DebugLogger:
    """
    Configure and get the debug logger.
    
    Args:
        global_level: Minimum level to log
        output_to_console: Whether to print to console
        output_to_file: Whether to write to file
        output_file: Path to log file
        slow_threshold_ms: Threshold for slow operation warnings
        **kwargs: Additional config options
        
    Returns:
        Configured DebugLogger instance
    """
    config = DebugConfig(
        global_level=global_level,
        output_to_console=output_to_console,
        output_to_file=output_to_file,
        output_file=output_file,
        slow_operation_threshold_ms=slow_threshold_ms,
        **kwargs
    )
    
    DebugLogger.reset_instance()
    logger = DebugLogger(config)
    DebugLogger._instance = logger
    return logger


# === Quick Access Shorthands ===

def trace(name: str, category: OperationCategory = OperationCategory.UNKNOWN,
          subsystem: str | None = None, **metadata):
    """Quick access to trace_operation context manager."""
    return get_debug_logger().trace_operation(name, category, subsystem, metadata or None)


def traced(name: str | None = None, category: OperationCategory = OperationCategory.UNKNOWN,
           subsystem: str | None = None):
    """Quick access to trace_function decorator."""
    return get_debug_logger().trace_function(name, category, subsystem)


def debug_log(message: str, category: OperationCategory = OperationCategory.UNKNOWN,
              subsystem: str | None = None, **kwargs):
    """Quick access to debug logging."""
    get_debug_logger().debug(message, category, subsystem, **kwargs)


def debug_info(message: str, category: OperationCategory = OperationCategory.UNKNOWN,
               subsystem: str | None = None, **kwargs):
    """Quick access to info logging."""
    get_debug_logger().info(message, category, subsystem, **kwargs)


def debug_error(message: str, category: OperationCategory = OperationCategory.UNKNOWN,
                subsystem: str | None = None, exception: Exception | None = None, **kwargs):
    """Quick access to error logging."""
    get_debug_logger().error(message, category, subsystem, exception, **kwargs)
