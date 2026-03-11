"""
Unified Logging Integration - Bridges debug_logger with log_correlation system.

This module provides:
- Integration between DebugLogger and LogCorrelationSystem
- Pre-configured subsystem loggers
- Critical operation tracing for key Geometry OS operations
- Session logging helpers
"""

import functools
import logging
import os
import sys
from typing import Any, Callable, Optional, TypeVar, ParamSpec

# Add project root to path
PROJECT_ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
if PROJECT_ROOT not in sys.path:
    sys.path.insert(0, PROJECT_ROOT)

from core.debug_logger import (
    DebugConfig,
    DebugLevel,
    DebugLogger,
    OperationCategory,
    configure_debug_logging,
    get_debug_logger,
)
from systems.visual_shell.log_correlation import (
    CorrelatedLogger,
    LogAggregator,
    LogContext,
    LogCorrelationSystem,
    LogLevel,
)

P = ParamSpec("P")
R = TypeVar("R")


class UnifiedLogger:
    """
    Unified logger that combines debug tracing with log correlation.
    
    Provides:
    - Granular operation tracing (DebugLogger)
    - Trace ID correlation across services (LogCorrelationSystem)
    - Structured output for debugging
    """
    
    _instance: Optional["UnifiedLogger"] = None
    
    def __init__(
        self,
        service_name: str = "geometry-os",
        debug_level: DebugLevel = DebugLevel.INFO,
        log_dir: str = "logs",
    ):
        self.service_name = service_name
        self.log_dir = log_dir
        
        # Ensure log directory exists
        os.makedirs(log_dir, exist_ok=True)
        
        # Initialize debug logger
        self.debug_config = DebugConfig(
            global_level=debug_level,
            output_to_console=True,
            output_to_file=True,
            output_file=os.path.join(log_dir, "debug_trace.log"),
            output_json=True,
            json_output_file=os.path.join(log_dir, "debug_trace.json"),
            slow_operation_threshold_ms=50.0,
            very_slow_threshold_ms=500.0,
            capture_stack_traces=False,
            capture_stack_on_error=True,
            # Category-specific levels
            category_levels={
                # Be more verbose for critical operations
                OperationCategory.NEURAL_INFERENCE: DebugLevel.DEBUG,
                OperationCategory.GPU_RENDER: DebugLevel.DEBUG,
                OperationCategory.EVOLUTION_CYCLE: DebugLevel.TRACE,
            },
            # Subsystem-specific levels
            subsystem_levels={
                "neural_cortex": DebugLevel.DEBUG,
                "visual_shell": DebugLevel.DEBUG,
                "evolution": DebugLevel.TRACE,
            }
        )
        self.debug_logger = DebugLogger(self.debug_config)
        
        # Initialize log correlation system
        self.correlation_system = LogCorrelationSystem(service_name=service_name)
        
        # Bridge the two systems
        self._setup_bridge()
    
    @classmethod
    def get_instance(cls) -> "UnifiedLogger":
        """Get singleton instance."""
        if cls._instance is None:
            cls._instance = cls()
        return cls._instance
    
    @classmethod
    def reset_instance(cls) -> None:
        """Reset singleton (for testing)."""
        cls._instance = None
    
    def _setup_bridge(self) -> None:
        """Set up bridge between debug logger and correlation system."""
        # Add handler to debug logger that forwards to correlation system
        def forward_to_correlation(trace):
            try:
                logger = self.correlation_system.get_logger(trace.name)
                level_map = {
                    "debug": LogLevel.DEBUG,
                    "info": LogLevel.INFO,
                    "warning": LogLevel.WARNING,
                    "error": LogLevel.ERROR,
                }
                # Don't forward trace-level to avoid noise
                if trace.status == "error":
                    logger.error(
                        f"Operation failed: {trace.name}",
                        error=trace.error,
                        duration_ms=trace.duration_ms,
                        **trace.metadata
                    )
            except Exception:
                pass  # Don't fail on logging errors
        
        # Note: We don't add this as a handler to avoid double-logging
        # The systems can be used independently or together
    
    def get_subsystem_logger(self, subsystem: str) -> "SubsystemLogger":
        """Get a logger configured for a specific subsystem."""
        return SubsystemLogger(self, subsystem)
    
    def trace(
        self,
        name: str,
        category: OperationCategory = OperationCategory.UNKNOWN,
        subsystem: str | None = None,
        metadata: dict[str, Any] | None = None,
    ):
        """Start tracing an operation."""
        return self.debug_logger.trace_operation(name, category, subsystem, metadata)
    
    def traced(
        self,
        name: str | None = None,
        category: OperationCategory = OperationCategory.UNKNOWN,
        subsystem: str | None = None,
    ):
        """Decorator for tracing a function."""
        return self.debug_logger.trace_function(name, category, subsystem)
    
    def log(
        self,
        level: DebugLevel,
        message: str,
        category: OperationCategory = OperationCategory.UNKNOWN,
        subsystem: str | None = None,
        **kwargs,
    ) -> None:
        """Log a message."""
        self.debug_logger.log(level, message, category, subsystem, kwargs if kwargs else None)
    
    def debug(self, message: str, **kwargs) -> None:
        """Log at DEBUG level."""
        self.log(DebugLevel.DEBUG, message, **kwargs)
    
    def info(self, message: str, **kwargs) -> None:
        """Log at INFO level."""
        self.log(DebugLevel.INFO, message, **kwargs)
    
    def warning(self, message: str, **kwargs) -> None:
        """Log at WARNING level."""
        self.log(DebugLevel.WARNING, message, **kwargs)
    
    def error(self, message: str, exception: Exception | None = None, **kwargs) -> None:
        """Log at ERROR level."""
        self.debug_logger.error(message, exception=exception, **kwargs)
    
    def set_trace_context(self, trace_id: str, span_id: str | None = None) -> None:
        """Set trace context for correlation."""
        for logger in self.correlation_system._loggers.values():
            logger.set_trace(trace_id, span_id)
    
    def get_statistics(self) -> dict[str, Any]:
        """Get combined statistics."""
        return {
            "debug_logger": self.debug_logger.get_statistics(),
            "correlation": self.correlation_system.get_statistics(),
        }
    
    def dump_session_report(self, output_file: str | None = None) -> None:
        """Dump a comprehensive session report."""
        if output_file is None:
            output_file = os.path.join(self.log_dir, "session_report.json")
        self.debug_logger.dump_session_report(output_file)


class SubsystemLogger:
    """
    Logger pre-configured for a specific subsystem.
    
    Provides convenience methods with the subsystem already set.
    """
    
    def __init__(self, unified: UnifiedLogger, subsystem: str):
        self.unified = unified
        self.subsystem = subsystem
    
    def trace(
        self,
        name: str,
        category: OperationCategory = OperationCategory.UNKNOWN,
        metadata: dict[str, Any] | None = None,
    ):
        """Trace an operation in this subsystem."""
        return self.unified.trace(name, category, self.subsystem, metadata)
    
    def traced(
        self,
        name: str | None = None,
        category: OperationCategory = OperationCategory.UNKNOWN,
    ):
        """Decorator for tracing a function in this subsystem."""
        return self.unified.traced(name, category, self.subsystem)
    
    def debug(self, message: str, category: OperationCategory = OperationCategory.UNKNOWN) -> None:
        """Log debug message."""
        self.unified.debug(message, category=category, subsystem=self.subsystem)
    
    def info(self, message: str, category: OperationCategory = OperationCategory.UNKNOWN) -> None:
        """Log info message."""
        self.unified.info(message, category=category, subsystem=self.subsystem)
    
    def warning(self, message: str, category: OperationCategory = OperationCategory.UNKNOWN) -> None:
        """Log warning message."""
        self.unified.warning(message, category=category, subsystem=self.subsystem)
    
    def error(
        self, 
        message: str, 
        exception: Exception | None = None,
        category: OperationCategory = OperationCategory.UNKNOWN
    ) -> None:
        """Log error message."""
        self.unified.error(message, exception=exception, category=category, subsystem=self.subsystem)
    
    def trace_msg(
        self,
        message: str,
        category: OperationCategory = OperationCategory.UNKNOWN,
        **kwargs
    ) -> None:
        """Log at TRACE level (most verbose)."""
        self.unified.debug_logger.trace_msg(
            message, category, self.subsystem, **kwargs
        )


# === Pre-configured Subsystem Loggers ===

def get_neural_cortex_logger() -> SubsystemLogger:
    """Get logger for neural cortex operations."""
    return UnifiedLogger.get_instance().get_subsystem_logger("neural_cortex")


def get_visual_shell_logger() -> SubsystemLogger:
    """Get logger for visual shell operations."""
    return UnifiedLogger.get_instance().get_subsystem_logger("visual_shell")


def get_evolution_logger() -> SubsystemLogger:
    """Get logger for evolution system operations."""
    return UnifiedLogger.get_instance().get_subsystem_logger("evolution")


def get_pixel_compiler_logger() -> SubsystemLogger:
    """Get logger for pixel compiler operations."""
    return UnifiedLogger.get_instance().get_subsystem_logger("pixel_compiler")


def get_agent_swarm_logger() -> SubsystemLogger:
    """Get logger for agent swarm operations."""
    return UnifiedLogger.get_instance().get_subsystem_logger("agent_swarm")


# === Critical Operation Tracing ===

def trace_neural_inference(model_name: str, input_shape: tuple | None = None):
    """Trace a neural inference operation."""
    logger = get_neural_cortex_logger()
    metadata = {"model": model_name}
    if input_shape:
        metadata["input_shape"] = str(input_shape)
    return logger.trace(
        f"inference_{model_name}",
        OperationCategory.NEURAL_INFERENCE,
        metadata
    )


def trace_shader_compile(shader_name: str, shader_type: str = "fragment"):
    """Trace a shader compilation operation."""
    logger = get_visual_shell_logger()
    return logger.trace(
        f"compile_{shader_name}",
        OperationCategory.GPU_SHADER,
        {"shader_type": shader_type}
    )


def trace_evolution_cycle(generation: int, population_size: int):
    """Trace an evolution cycle."""
    logger = get_evolution_logger()
    return logger.trace(
        f"evolution_gen_{generation}",
        OperationCategory.EVOLUTION_CYCLE,
        {"generation": generation, "population_size": population_size}
    )


def trace_file_operation(operation: str, path: str, size: int | None = None):
    """Trace a file I/O operation."""
    unified = UnifiedLogger.get_instance()
    category = OperationCategory.FILE_READ if "read" in operation.lower() else OperationCategory.FILE_WRITE
    metadata = {"path": path}
    if size:
        metadata["size_bytes"] = size
    return unified.trace(f"file_{operation}", category, "io", metadata)


def trace_agent_spawn(agent_id: str, agent_type: str):
    """Trace an agent spawn operation."""
    logger = get_agent_swarm_logger()
    return logger.trace(
        f"spawn_{agent_id}",
        OperationCategory.AGENT_SPAWN,
        {"agent_type": agent_type}
    )


# === Session Helpers ===

def start_session(session_name: str = "geometry_os_session") -> str:
    """
    Start a new logging session.
    
    Returns:
        Session trace ID for correlation
    """
    import uuid
    trace_id = f"session_{session_name}_{uuid.uuid4().hex[:8]}"
    
    unified = UnifiedLogger.get_instance()
    unified.set_trace_context(trace_id)
    unified.info(
        f"Starting session: {session_name}",
        category=OperationCategory.INIT,
        subsystem="session",
        trace_id=trace_id
    )
    
    return trace_id


def end_session(trace_id: str | None = None) -> None:
    """
    End the current logging session and dump report.
    """
    unified = UnifiedLogger.get_instance()
    unified.info(
        "Ending session",
        category=OperationCategory.SHUTDOWN,
        subsystem="session"
    )
    unified.dump_session_report()


# === Decorators for Common Patterns ===

def logged_subsystem(subsystem: str):
    """
    Class decorator that adds logging methods to a class.
    
    Usage:
        @logged_subsystem("neural_cortex")
        class NeuralCortex:
            def process(self, data):
                self.log_debug("Processing data")
                with self.log_trace("process", OperationCategory.NEURAL_INFERENCE):
                    # ... processing ...
                    pass
    """
    def decorator(cls):
        original_init = cls.__init__
        
        @functools.wraps(original_init)
        def new_init(self, *args, **kwargs):
            original_init(self, *args, **kwargs)
            self._logger = UnifiedLogger.get_instance().get_subsystem_logger(subsystem)
        
        def log_debug(self, message: str, category: OperationCategory = OperationCategory.UNKNOWN):
            self._logger.debug(message, category)
        
        def log_info(self, message: str, category: OperationCategory = OperationCategory.UNKNOWN):
            self._logger.info(message, category)
        
        def log_warning(self, message: str, category: OperationCategory = OperationCategory.UNKNOWN):
            self._logger.warning(message, category)
        
        def log_error(self, message: str, exception: Exception | None = None,
                      category: OperationCategory = OperationCategory.UNKNOWN):
            self._logger.error(message, exception, category)
        
        def log_trace(self, name: str, category: OperationCategory = OperationCategory.UNKNOWN,
                      metadata: dict | None = None):
            return self._logger.trace(name, category, metadata)
        
        cls.__init__ = new_init
        cls.log_debug = log_debug
        cls.log_info = log_info
        cls.log_warning = log_warning
        cls.log_error = log_error
        cls.log_trace = log_trace
        
        return cls
    
    return decorator


# === Configuration Helpers ===

def configure_from_env() -> UnifiedLogger:
    """
    Configure logging from environment variables.
    
    Environment variables:
        GEOM_LOG_LEVEL: Global log level (DEBUG, INFO, WARNING, ERROR)
        GEOM_LOG_DIR: Directory for log files
        GEOM_LOG_CONSOLE: Whether to log to console (true/false)
        GEOM_SERVICE_NAME: Service name for correlation
    """
    level_map = {
        "DEBUG": DebugLevel.DEBUG,
        "INFO": DebugLevel.INFO,
        "WARNING": DebugLevel.WARNING,
        "ERROR": DebugLevel.ERROR,
        "TRACE": DebugLevel.TRACE,
        "OFF": DebugLevel.OFF,
    }
    
    level_str = os.environ.get("GEOM_LOG_LEVEL", "INFO").upper()
    level = level_map.get(level_str, DebugLevel.INFO)
    
    log_dir = os.environ.get("GEOM_LOG_DIR", "logs")
    service_name = os.environ.get("GEOM_SERVICE_NAME", "geometry-os")
    
    UnifiedLogger.reset_instance()
    
    config = DebugConfig(
        global_level=level,
        output_to_console=os.environ.get("GEOM_LOG_CONSOLE", "true").lower() == "true",
        output_to_file=True,
        output_file=os.path.join(log_dir, "debug_trace.log"),
        output_json=True,
        json_output_file=os.path.join(log_dir, "debug_trace.json"),
    )
    
    unified = UnifiedLogger.__new__(UnifiedLogger)
    unified.service_name = service_name
    unified.log_dir = log_dir
    unified.debug_config = config
    unified.debug_logger = DebugLogger(config)
    unified.correlation_system = LogCorrelationSystem(service_name=service_name)
    unified._setup_bridge()
    
    UnifiedLogger._instance = unified
    
    return unified


# === Convenience Exports ===

__all__ = [
    # Main classes
    "UnifiedLogger",
    "SubsystemLogger",
    
    # Subsystem loggers
    "get_neural_cortex_logger",
    "get_visual_shell_logger",
    "get_evolution_logger",
    "get_pixel_compiler_logger",
    "get_agent_swarm_logger",
    
    # Operation tracing
    "trace_neural_inference",
    "trace_shader_compile",
    "trace_evolution_cycle",
    "trace_file_operation",
    "trace_agent_spawn",
    
    # Session helpers
    "start_session",
    "end_session",
    
    # Decorators
    "logged_subsystem",
    
    # Configuration
    "configure_from_env",
]
