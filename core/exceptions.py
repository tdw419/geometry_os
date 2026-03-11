"""
Geometry OS Unified Exception System

This module provides a comprehensive exception hierarchy for Geometry OS,
ensuring errors are caught, logged, and handled gracefully.

Key Features:
- Hierarchical exception taxonomy by subsystem
- Structured error context for debugging
- Integration with unified logging
- Recovery hints for common errors
- Error severity classification

Usage:
    from core.exceptions import (
        GeometryOSError, NeuralInferenceError, GPUError,
        handle_errors, ErrorContext, ErrorSeverity
    )

    # Raise domain-specific errors
    raise NeuralInferenceError("Model not found", model="gpt-neo-125m")

    # Use context manager for automatic handling
    with ErrorContext("neural_inference", model="gpt-neo-125m"):
        result = model.infer(input_data)

    # Use decorator for function-level handling
    @handle_errors(recoverable=True)
    def critical_operation():
        ...
"""

import functools
import traceback
from dataclasses import dataclass, field
from datetime import datetime
from enum import Enum
from typing import Any, Callable, Optional, TypeVar, ParamSpec

P = ParamSpec("P")
R = TypeVar("R")


class ErrorSeverity(Enum):
    """Error severity levels for classification."""
    LOW = "low"           # Minor issues, can be safely ignored
    MEDIUM = "medium"     # Problems that should be addressed but don't break functionality
    HIGH = "high"         # Significant errors affecting core functionality
    CRITICAL = "critical" # System-breaking errors requiring immediate attention
    FATAL = "fatal"       # Unrecoverable errors requiring system restart


class ErrorCategory(Enum):
    """Categories for classifying errors."""
    # Infrastructure
    SYSTEM = "system"
    CONFIGURATION = "configuration"
    RESOURCE = "resource"
    
    # Neural/AI
    NEURAL_INFERENCE = "neural_inference"
    NEURAL_TRAINING = "neural_training"
    NEURAL_MEMORY = "neural_memory"
    
    # Visual/GPU
    GPU_ERROR = "gpu_error"
    SHADER_ERROR = "shader_error"
    RENDER_ERROR = "render_error"
    
    # Evolution
    EVOLUTION_ERROR = "evolution_error"
    MUTATION_ERROR = "mutation_error"
    
    # IO
    FILE_ERROR = "file_error"
    NETWORK_ERROR = "network_error"
    PARSE_ERROR = "parse_error"
    
    # Agent/Swarm
    AGENT_ERROR = "agent_error"
    SWARM_ERROR = "swarm_error"
    COORDINATION_ERROR = "coordination_error"
    
    # State
    STATE_ERROR = "state_error"
    VALIDATION_ERROR = "validation_error"
    
    # External
    EXTERNAL_SERVICE = "external_service"
    DEPENDENCY_ERROR = "dependency_error"


@dataclass
class ErrorContext:
    """Context information for error tracking and debugging."""
    operation: str
    component: str = "unknown"
    timestamp: str = field(default_factory=lambda: datetime.now().isoformat())
    details: dict[str, Any] = field(default_factory=dict)
    parent_error: Optional[Exception] = None
    stack_trace: Optional[str] = None
    recovery_hint: Optional[str] = None
    
    def __post_init__(self):
        if self.stack_trace is None:
            self.stack_trace = traceback.format_exc()
    
    def to_dict(self) -> dict[str, Any]:
        """Convert to dictionary for logging/serialization."""
        return {
            "operation": self.operation,
            "component": self.component,
            "timestamp": self.timestamp,
            "details": self.details,
            "parent_error": str(self.parent_error) if self.parent_error else None,
            "stack_trace": self.stack_trace,
            "recovery_hint": self.recovery_hint,
        }


class GeometryOSError(Exception):
    """
    Base exception for all Geometry OS errors.
    
    All custom exceptions should inherit from this class to ensure
    consistent error handling across the system.
    """
    
    # Default values for subclasses
    default_severity: ErrorSeverity = ErrorSeverity.MEDIUM
    default_category: ErrorCategory = ErrorCategory.SYSTEM
    default_recoverable: bool = True
    default_recovery_hint: Optional[str] = None
    
    def __init__(
        self,
        message: str,
        *,
        severity: Optional[ErrorSeverity] = None,
        category: Optional[ErrorCategory] = None,
        recoverable: Optional[bool] = None,
        context: Optional[ErrorContext] = None,
        recovery_hint: Optional[str] = None,
        cause: Optional[Exception] = None,
        **kwargs
    ):
        super().__init__(message)
        self.message = message
        
        # Ensure severity is an enum, convert string if needed
        if severity is None:
            self.severity = self.default_severity
        elif isinstance(severity, str):
            # Convert string to enum
            try:
                self.severity = ErrorSeverity(severity)
            except ValueError:
                self.severity = self.default_severity
        else:
            self.severity = severity
        
        # Ensure category is an enum, convert string if needed
        if category is None:
            self.category = self.default_category
        elif isinstance(category, str):
            # Convert string to enum
            try:
                self.category = ErrorCategory(category)
            except ValueError:
                self.category = self.default_category
        else:
            self.category = category
        
        self.recoverable = recoverable if recoverable is not None else self.default_recoverable
        self.context = context
        self.recovery_hint = recovery_hint or self.default_recovery_hint
        self.cause = cause
        self.extra = kwargs
        
        # Build error context if not provided
        if self.context is None:
            self.context = ErrorContext(
                operation="unknown",
                component=self.__class__.__name__,
                details=kwargs,
                parent_error=cause,
                recovery_hint=self.recovery_hint,
            )
    
    def to_dict(self) -> dict[str, Any]:
        """Convert to dictionary for logging/serialization."""
        return {
            "error_type": self.__class__.__name__,
            "message": self.message,
            "severity": self.severity.value,
            "category": self.category.value,
            "recoverable": self.recoverable,
            "context": self.context.to_dict() if self.context else None,
            "extra": self.extra,
        }
    
    def __str__(self) -> str:
        parts = [self.message]
        if self.recovery_hint:
            parts.append(f"Hint: {self.recovery_hint}")
        if self.cause:
            parts.append(f"Caused by: {self.cause}")
        return " | ".join(parts)


# =============================================================================
# INFRASTRUCTURE ERRORS
# =============================================================================

class SystemError(GeometryOSError):
    """Base for system-level errors."""
    default_category = ErrorCategory.SYSTEM
    default_severity = ErrorSeverity.HIGH


class ConfigurationError(GeometryOSError):
    """Configuration-related errors."""
    default_category = ErrorCategory.CONFIGURATION
    default_severity = ErrorSeverity.MEDIUM
    default_recovery_hint = "Check configuration files and environment variables."


class ResourceError(GeometryOSError):
    """Resource-related errors (memory, CPU, etc.)."""
    default_category = ErrorCategory.RESOURCE
    default_severity = ErrorSeverity.HIGH


class MemoryError(ResourceError):
    """Memory allocation/exhaustion errors."""
    default_recovery_hint = "Free up memory or increase resource limits."


class DependencyError(GeometryOSError):
    """Missing or incompatible dependency errors."""
    default_category = ErrorCategory.DEPENDENCY_ERROR
    default_severity = ErrorSeverity.HIGH
    default_recovery_hint = "Install missing dependencies with: pip install -r requirements.txt"


# =============================================================================
# NEURAL/AI ERRORS
# =============================================================================

class NeuralError(GeometryOSError):
    """Base for neural network errors."""
    default_category = ErrorCategory.NEURAL_INFERENCE


class NeuralInferenceError(NeuralError):
    """Errors during neural inference."""
    default_category = ErrorCategory.NEURAL_INFERENCE
    default_recovery_hint = "Check model availability and input format."


class NeuralTrainingError(NeuralError):
    """Errors during neural training."""
    default_category = ErrorCategory.NEURAL_TRAINING
    default_recovery_hint = "Check training data and hyperparameters."


class NeuralMemoryError(NeuralError):
    """Errors in neural memory systems."""
    default_category = ErrorCategory.NEURAL_MEMORY


class ModelNotFoundError(NeuralInferenceError):
    """Requested model not found."""
    default_severity = ErrorSeverity.HIGH
    default_recoverable = True
    default_recovery_hint = "Ensure LM Studio is running with the model loaded."


class ModelLoadError(NeuralInferenceError):
    """Failed to load model."""
    default_severity = ErrorSeverity.HIGH
    default_recoverable = True


class InferenceTimeoutError(NeuralInferenceError):
    """Inference operation timed out."""
    default_severity = ErrorSeverity.MEDIUM
    default_recoverable = True
    default_recovery_hint = "Reduce input size or increase timeout."


# =============================================================================
# GPU/VISUAL ERRORS
# =============================================================================

class GPUGeometryError(GeometryOSError):
    """Base for GPU-related errors."""
    default_category = ErrorCategory.GPU_ERROR


class GPUInitError(GPUGeometryError):
    """GPU initialization failed."""
    default_severity = ErrorSeverity.HIGH
    default_recovery_hint = "Check GPU drivers and availability."


class ShaderCompileError(GPUGeometryError):
    """Shader compilation failed."""
    default_category = ErrorCategory.SHADER_ERROR
    default_severity = ErrorSeverity.MEDIUM
    default_recovery_hint = "Check shader syntax and GPU capabilities."


class RenderError(GPUGeometryError):
    """Rendering operation failed."""
    default_category = ErrorCategory.RENDER_ERROR
    default_severity = ErrorSeverity.MEDIUM


class GPUOutOfMemoryError(GPUGeometryError):
    """GPU ran out of memory."""
    default_severity = ErrorSeverity.HIGH
    default_recovery_hint = "Reduce batch size or model dimensions."


# =============================================================================
# EVOLUTION ERRORS
# =============================================================================

class EvolutionError(GeometryOSError):
    """Base for evolution system errors."""
    default_category = ErrorCategory.EVOLUTION_ERROR


class MutationError(EvolutionError):
    """Errors during mutation operations."""
    default_category = ErrorCategory.MUTATION_ERROR
    default_severity = ErrorSeverity.MEDIUM
    default_recoverable = True


class EvolutionCycleError(EvolutionError):
    """Errors during evolution cycle."""
    default_severity = ErrorSeverity.MEDIUM


class FitnessEvaluationError(EvolutionError):
    """Failed to evaluate fitness."""
    default_severity = ErrorSeverity.MEDIUM


# =============================================================================
# IO ERRORS
# =============================================================================

class IOError(GeometryOSError):
    """Base for IO-related errors."""
    pass


class FileOperationError(IOError):
    """File operation failed."""
    default_category = ErrorCategory.FILE_ERROR
    default_severity = ErrorSeverity.MEDIUM


class NetworkError(GeometryOSError):
    """Network operation failed."""
    default_category = ErrorCategory.NETWORK_ERROR
    default_severity = ErrorSeverity.MEDIUM
    default_recoverable = True


class ParseError(IOError):
    """Parsing operation failed."""
    default_category = ErrorCategory.PARSE_ERROR
    default_severity = ErrorSeverity.MEDIUM


class RTSParseError(ParseError):
    """RTS file parsing failed."""
    default_recovery_hint = "Verify RTS file format and integrity."


# =============================================================================
# AGENT/SWARM ERRORS
# =============================================================================

class AgentError(GeometryOSError):
    """Base for agent errors."""
    default_category = ErrorCategory.AGENT_ERROR


class AgentSpawnError(AgentError):
    """Failed to spawn agent."""
    default_severity = ErrorSeverity.MEDIUM


class AgentCommunicationError(AgentError):
    """Agent communication failed."""
    default_category = ErrorCategory.COORDINATION_ERROR
    default_recoverable = True


class SwarmError(GeometryOSError):
    """Base for swarm errors."""
    default_category = ErrorCategory.SWARM_ERROR


class SwarmCoordinationError(SwarmError):
    """Swarm coordination failed."""
    default_category = ErrorCategory.COORDINATION_ERROR


# =============================================================================
# STATE ERRORS
# =============================================================================

class StateError(GeometryOSError):
    """State management errors."""
    default_category = ErrorCategory.STATE_ERROR


class ValidationError(GeometryOSError):
    """Validation failed."""
    default_category = ErrorCategory.VALIDATION_ERROR
    default_severity = ErrorSeverity.LOW


class TransitionError(StateError):
    """Invalid state transition."""
    default_severity = ErrorSeverity.MEDIUM


# =============================================================================
# EXTERNAL SERVICE ERRORS
# =============================================================================

class ExternalServiceError(GeometryOSError):
    """External service errors."""
    default_category = ErrorCategory.EXTERNAL_SERVICE
    default_severity = ErrorSeverity.MEDIUM
    default_recoverable = True


class LMStudioError(ExternalServiceError):
    """LM Studio API errors."""
    default_recovery_hint = "Ensure LM Studio is running on localhost:1234"


class WordPressError(ExternalServiceError):
    """WordPress integration errors."""
    default_recovery_hint = "Check WordPress credentials and endpoint availability."


# =============================================================================
# ERROR HANDLING UTILITIES
# =============================================================================

def handle_errors(
    recoverable: bool = True,
    default_return: Any = None,
    log_traceback: bool = True,
    reraise: bool = False,
    error_types: tuple = (Exception,),
    on_error: Optional[Callable[[Exception], None]] = None,
):
    """
    Decorator for handling errors gracefully.
    
    Args:
        recoverable: Whether errors are recoverable
        default_return: Value to return on error
        log_traceback: Whether to log full traceback
        reraise: Whether to re-raise the exception
        error_types: Types of exceptions to catch
        on_error: Callback to run on error
    
    Usage:
        @handle_errors(recoverable=True, default_return=None)
        def risky_operation():
            ...
    """
    def decorator(func: Callable[P, R]) -> Callable[P, R]:
        @functools.wraps(func)
        def wrapper(*args: P.args, **kwargs: P.kwargs) -> R:
            try:
                return func(*args, **kwargs)
            except error_types as e:
                # Convert to GeometryOSError if needed
                if not isinstance(e, GeometryOSError):
                    error = GeometryOSError(
                        str(e),
                        cause=e,
                        recoverable=recoverable,
                        context=ErrorContext(
                            operation=func.__name__,
                            component=func.__module__,
                        ),
                    )
                else:
                    error = e
                
                # Log the error
                try:
                    from core.unified_logging import UnifiedLogger
                    logger = UnifiedLogger.get_instance()
                    logger.error(
                        f"Error in {func.__name__}: {error.message}",
                        exception=error,
                        subsystem=func.__module__.split(".")[-1],
                    )
                except ImportError:
                    import logging
                    logging.getLogger(func.__module__).error(
                        f"Error in {func.__name__}: {error.message}",
                        exc_info=log_traceback,
                    )
                
                # Run callback if provided
                if on_error:
                    try:
                        on_error(error)
                    except Exception:
                        pass  # Don't fail on callback errors
                
                if reraise:
                    raise error from error.cause
                
                return default_return
        
        return wrapper
    return decorator


class ErrorContextManager:
    """
    Context manager for error handling with detailed context.
    
    Usage:
        with ErrorContextManager("neural_inference", model="gpt-neo") as ctx:
            result = model.infer(data)
            ctx.set_result(result)
    """
    
    def __init__(
        self,
        operation: str,
        component: str = "unknown",
        reraise: bool = False,
        on_error: Optional[Callable[[Exception], None]] = None,
        **context_details
    ):
        self.operation = operation
        self.component = component
        self.reraise = reraise
        self.on_error = on_error
        self.context_details = context_details
        self.result = None
        self.error = None
        self._start_time = None
    
    def __enter__(self):
        import time
        self._start_time = time.time()
        return self
    
    def __exit__(self, exc_type, exc_val, exc_tb):
        if exc_type is not None:
            # Handle the error
            if not isinstance(exc_val, GeometryOSError):
                self.error = GeometryOSError(
                    str(exc_val),
                    cause=exc_val,
                    context=ErrorContext(
                        operation=self.operation,
                        component=self.component,
                        details=self.context_details,
                    ),
                )
            else:
                self.error = exc_val
            
            # Log the error
            try:
                from core.unified_logging import UnifiedLogger
                logger = UnifiedLogger.get_instance()
                logger.error(
                    f"Error in {self.operation}: {self.error.message}",
                    exception=self.error,
                    subsystem=self.component,
                )
            except ImportError:
                import logging
                logging.getLogger(self.component).error(
                    f"Error in {self.operation}: {self.error.message}",
                    exc_info=True,
                )
            
            # Run callback if provided
            if self.on_error:
                try:
                    self.on_error(self.error)
                except Exception:
                    pass
            
            return not self.reraise  # Suppress exception if not reraising
        
        return False  # Don't suppress normal exit
    
    def set_result(self, result: Any):
        """Set the result of the operation."""
        self.result = result


# Alias for convenience
error_context = ErrorContextManager


class ErrorHandlerRegistry:
    """
    Registry for error handlers by error type.
    
    Allows registering custom handlers for specific error types.
    """
    
    _handlers: dict[type, list[Callable]] = {}
    
    @classmethod
    def register(cls, error_type: type, handler: Callable[[Exception], None]):
        """Register a handler for an error type."""
        if error_type not in cls._handlers:
            cls._handlers[error_type] = []
        cls._handlers[error_type].append(handler)
    
    @classmethod
    def handle(cls, error: Exception) -> bool:
        """
        Handle an error using registered handlers.
        
        Returns True if error was handled, False otherwise.
        """
        error_type = type(error)
        
        # Check for exact match
        if error_type in cls._handlers:
            for handler in cls._handlers[error_type]:
                try:
                    handler(error)
                except Exception:
                    pass  # Don't fail on handler errors
            return True
        
        # Check for parent class matches
        for registered_type, handlers in cls._handlers.items():
            if isinstance(error, registered_type):
                for handler in handlers:
                    try:
                        handler(error)
                    except Exception:
                        pass
                return True
        
        return False


def safe_call(
    func: Callable[P, R],
    *args: P.args,
    default: Any = None,
    log_errors: bool = True,
    **kwargs: P.kwargs
) -> R:
    """
    Safely call a function, returning default on error.
    
    Usage:
        result = safe_call(risky_function, arg1, arg2, default=None)
    """
    try:
        return func(*args, **kwargs)
    except Exception as e:
        if log_errors:
            try:
                from core.unified_logging import UnifiedLogger
                logger = UnifiedLogger.get_instance()
                logger.warning(f"safe_call failed: {e}", subsystem="error_handler")
            except ImportError:
                import logging
                logging.getLogger("error_handler").warning(f"safe_call failed: {e}")
        return default


# =============================================================================
# CONVENIENCE EXPORTS
# =============================================================================

__all__ = [
    # Base classes
    "GeometryOSError",
    "ErrorSeverity",
    "ErrorCategory",
    "ErrorContext",
    
    # Infrastructure errors
    "SystemError",
    "ConfigurationError",
    "ResourceError",
    "MemoryError",
    "DependencyError",
    
    # Neural errors
    "NeuralError",
    "NeuralInferenceError",
    "NeuralTrainingError",
    "NeuralMemoryError",
    "ModelNotFoundError",
    "ModelLoadError",
    "InferenceTimeoutError",
    
    # GPU errors
    "GPUGeometryError",
    "GPUInitError",
    "ShaderCompileError",
    "RenderError",
    "GPUOutOfMemoryError",
    
    # Evolution errors
    "EvolutionError",
    "MutationError",
    "EvolutionCycleError",
    "FitnessEvaluationError",
    
    # IO errors
    "IOError",
    "FileOperationError",
    "NetworkError",
    "ParseError",
    "RTSParseError",
    
    # Agent/Swarm errors
    "AgentError",
    "AgentSpawnError",
    "AgentCommunicationError",
    "SwarmError",
    "SwarmCoordinationError",
    
    # State errors
    "StateError",
    "ValidationError",
    "TransitionError",
    
    # External errors
    "ExternalServiceError",
    "LMStudioError",
    "WordPressError",
    
    # Utilities
    "handle_errors",
    "ErrorContextManager",
    "error_context",
    "ErrorHandlerRegistry",
    "safe_call",
]
