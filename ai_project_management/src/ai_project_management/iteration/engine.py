"""
Recursive Iteration Engine Module

Manages recursive execution loops with convergence detection.
Handles artifact refinement and state persistence across iterations.
"""

import asyncio
import hashlib
import json
from pathlib import Path
from typing import Optional, List, Dict, Any, Callable, Awaitable
from datetime import datetime
from dataclasses import dataclass, field
from enum import Enum
import structlog

from ..models import (
    IterationState,
    ExecutionState,
    TaskStatus,
    TaskItem,
    OpenSpecChange,
    TelemetryEvent,
    PerformanceMetrics,
)


class IterationMode(str, Enum):
    """Iteration strategies."""
    UNTIL_COMPLETE = "until_complete"  # Iterate until all tasks complete
    UNTIL_CONVERGED = "until_converged"  # Iterate until artifacts converge
    FIXED_DEPTH = "fixed_depth"  # Iterate for a fixed number of iterations
    CONTINUOUS = "continuous"  # Run indefinitely (daemon mode)


@dataclass
class ConvergenceMetrics:
    """Metrics for convergence detection."""
    artifact_similarity: float = 0.0
    task_completion_delta: float = 0.0
    error_rate_delta: float = 0.0
    quality_score_delta: float = 0.0
    timestamp: datetime = field(default_factory=datetime.now)

    @property
    def overall_convergence(self) -> float:
        """Calculate overall convergence score."""
        score = (
            self.artifact_similarity * 0.4 +
            (1 - self.task_completion_delta) * 0.3 +
            (1 - self.error_rate_delta) * 0.2 +
            self.quality_score_delta * 0.1
        )
        return min(1.0, max(0.0, float(f"{score:.6f}")))


class IterationEngineError(Exception):
    """Base exception for iteration engine errors."""
    pass


class ConvergenceError(IterationEngineError):
    """Raised when convergence fails."""
    pass


class IterationEngine:
    """
    Engine for recursive iteration of project management tasks.

    Features:
    - Multiple iteration modes
    - Convergence detection
    - State persistence
    - Dependency resolution
    - Artifact refinement
    """

    def __init__(
        self,
        mode: IterationMode = IterationMode.UNTIL_COMPLETE,
        max_iterations: int = 10,
        convergence_threshold: float = 0.95,
        state_file: Path = Path(".ai-pm-state.json"),
        telemetry_callback: Optional[Callable[[TelemetryEvent], None]] = None,
        log_level: str = "INFO",
    ):
        """
        Initialize the iteration engine.

        Args:
            mode: Iteration mode
            max_iterations: Maximum number of iterations
            convergence_threshold: Threshold for convergence detection
            state_file: Path to state persistence file
            telemetry_callback: Optional callback for telemetry events
            log_level: Logging level
        """
        structlog.configure(
            logger_factory=structlog.PrintLoggerFactory(),
        )
        self.logger = structlog.get_logger()

        self.mode = mode
        self.max_iterations = max_iterations
        self.convergence_threshold = convergence_threshold
        self.state_file = Path(state_file)
        self.telemetry_callback = telemetry_callback

        self.iteration_state = IterationState(
            max_iterations=max_iterations,
            convergence_threshold=convergence_threshold,
        )

        # Callbacks
        self.on_iteration_start: Optional[Callable[[int], None]] = None
        self.on_iteration_complete: Optional[Callable[[int, ConvergenceMetrics], None]] = None
        self.on_convergence: Optional[Callable[[int, ConvergenceMetrics], None]] = None
        self.on_max_iterations: Optional[Callable[[int], None]] = None

        # Previous state for convergence detection
        self._previous_artifacts: Dict[str, str] = {}
        self._previous_metrics: Optional[PerformanceMetrics] = None

    async def run(
        self,
        execute_callback: Callable[[int], Awaitable[Dict[str, Any]]],
        check_completion: Callable[[], bool],
    ) -> IterationState:
        """
        Run the iteration engine.

        Args:
            execute_callback: Async callback for each iteration (receives iteration number)
            check_completion: Callback to check if tasks are complete

        Returns:
            Final iteration state
        """
        self.logger.info("Starting iteration engine", mode=self.mode)

        try:
            while self._should_continue():
                # Increment iteration
                self.iteration_state.iteration_number += 1
                iteration = self.iteration_state.iteration_number

                self.logger.info("Starting iteration", iteration=iteration)

                # Emit telemetry
                self._emit_telemetry("iteration_started", {"iteration": iteration})

                # Call iteration start callback
                if self.on_iteration_start:
                    try:
                        self.on_iteration_start(iteration)
                    except Exception as e:
                        self.logger.warning("Iteration start callback failed", error=str(e))

                # Execute iteration
                iteration_result = await self._execute_iteration(execute_callback, iteration)

                # Check for completion
                is_complete = check_completion()

                # Calculate convergence
                convergence = self._calculate_convergence(iteration_result)
                self.iteration_state.convergence_score = convergence.overall_convergence
                self.iteration_state.last_update = datetime.now()

                # Call iteration complete callback
                if self.on_iteration_complete:
                    try:
                        self.on_iteration_complete(iteration, convergence)
                    except Exception as e:
                        self.logger.warning("Iteration complete callback failed", error=str(e))

                # Check if converged
                if self._check_convergence(convergence, is_complete):
                    self.logger.info(
                        "Convergence achieved",
                        iteration=iteration,
                        score=convergence.overall_convergence,
                    )
                    self.iteration_state.is_converged = True

                    if self.on_convergence:
                        try:
                            self.on_convergence(iteration, convergence)
                        except Exception as e:
                            self.logger.warning("Convergence callback failed", error=str(e))

                    break

                # Check if max iterations reached
                if iteration >= self.max_iterations:
                    self.logger.warning("Max iterations reached", iteration=iteration)

                    if self.on_max_iterations:
                        try:
                            self.on_max_iterations(iteration)
                        except Exception as e:
                            self.logger.warning("Max iterations callback failed", error=str(e))

                    break

                # Save state
                await self.save_state()

                # Emit telemetry
                self._emit_telemetry("iteration_completed", {
                    "iteration": iteration,
                    "convergence": convergence.overall_convergence,
                    "is_complete": is_complete,
                })

        except Exception as e:
            self.logger.error("Iteration engine error", error=str(e))
            self._emit_telemetry("iteration_error", {"error": str(e)})
            raise IterationEngineError(f"Iteration failed: {e}") from e

        finally:
            # Save final state
            await self.save_state()

        self.logger.info(
            "Iteration engine completed",
            iterations=self.iteration_state.iteration_number,
            converged=self.iteration_state.is_converged,
        )

        return self.iteration_state

    def _should_continue(self) -> bool:
        """Check if iteration should continue."""
        if self.iteration_state.is_converged:
            return False

        if self.mode == IterationMode.CONTINUOUS:
            return True

        if self.mode == IterationMode.FIXED_DEPTH:
            return self.iteration_state.iteration_number < self.max_iterations

        # UNTIL_COMPLETE and UNTIL_CONVERGED are handled in run loop
        return True

    async def _execute_iteration(
        self,
        execute_callback: Callable[[int], Awaitable[Dict[str, Any]]],
        iteration: int,
    ) -> Dict[str, Any]:
        """Execute a single iteration."""
        try:
            result = await execute_callback(iteration)
            return result or {}
        except Exception as e:
            self.logger.error("Iteration execution failed", iteration=iteration, error=str(e))
            raise

    def _calculate_convergence(
        self,
        iteration_result: Dict[str, Any],
    ) -> ConvergenceMetrics:
        """Calculate convergence metrics."""
        metrics = ConvergenceMetrics()

        # Artifact similarity (hash comparison)
        artifacts = iteration_result.get("artifacts", {})
        if artifacts:
            metrics.artifact_similarity = self._calculate_artifact_similarity(artifacts)
            self._previous_artifacts = artifacts

        # Task completion delta
        current_metrics = iteration_result.get("metrics")
        if current_metrics and self._previous_metrics:
            metrics.task_completion_delta = abs(
                current_metrics.task_completion_rate -
                self._previous_metrics.task_completion_rate
            )
            metrics.error_rate_delta = abs(
                current_metrics.error_rate -
                self._previous_metrics.error_rate
            )
            metrics.quality_score_delta = abs(
                current_metrics.artifact_quality_score -
                self._previous_metrics.artifact_quality_score
            )

        self._previous_metrics = current_metrics

        return metrics

    def _calculate_artifact_similarity(self, current_artifacts: Dict[str, str]) -> float:
        """Calculate similarity between current and previous artifacts."""
        if not self._previous_artifacts:
            return 0.0

        # Compare hashes of artifacts
        similar_count = 0
        total_count = 0

        for key, content in current_artifacts.items():
            if key in self._previous_artifacts:
                total_count += 1
                current_hash = hashlib.sha256(content.encode()).hexdigest()
                previous_hash = hashlib.sha256(
                    self._previous_artifacts[key].encode()
                ).hexdigest()

                if current_hash == previous_hash:
                    similar_count += 1

        if total_count == 0:
            return 0.0

        return similar_count / total_count

    def _check_convergence(
        self,
        convergence: ConvergenceMetrics,
        is_complete: bool,
    ) -> bool:
        """Check if convergence criteria are met."""
        if self.mode == IterationMode.FIXED_DEPTH:
            return False  # Convergence handled by iteration count

        if self.mode == IterationMode.UNTIL_COMPLETE:
            return is_complete

        if self.mode == IterationMode.UNTIL_CONVERGED:
            return convergence.overall_convergence >= self.convergence_threshold

        if self.mode == IterationMode.CONTINUOUS:
            return False  # Never converges in continuous mode

        return False

    async def save_state(self) -> None:
        """Save iteration state to disk."""
        try:
            state_data = {
                "iteration_state": self.iteration_state.model_dump(),
                "mode": self.mode.value,
                "previous_artifacts": self._previous_artifacts,
                "saved_at": datetime.now().isoformat(),
            }

            self.state_file.parent.mkdir(parents=True, exist_ok=True)
            self.state_file.write_text(json.dumps(state_data, indent=2, default=str), encoding="utf-8")

            self.logger.debug("State saved", file=str(self.state_file))
        except Exception as e:
            self.logger.warning("Failed to save state", error=str(e))

    async def load_state(self) -> Optional[IterationState]:
        """Load iteration state from disk."""
        try:
            if not self.state_file.exists():
                return None

            state_data = json.loads(self.state_file.read_text(encoding="utf-8"))

            self.iteration_state = IterationState(**state_data["iteration_state"])
            self.mode = IterationMode(state_data["mode"])
            self._previous_artifacts = state_data.get("previous_artifacts", {})

            self.logger.info(
                "State loaded",
                iteration=self.iteration_state.iteration_number,
                mode=self.mode,
            )

            return self.iteration_state

        except Exception as e:
            self.logger.warning("Failed to load state", error=str(e))
            return None

    def reset(self) -> None:
        """Reset the iteration engine."""
        self.iteration_state = IterationState(
            max_iterations=self.max_iterations,
            convergence_threshold=self.convergence_threshold,
        )
        self._previous_artifacts = {}
        self._previous_metrics = None

        self.logger.info("Iteration engine reset")

    def _emit_telemetry(self, event_type: str, data: Dict[str, Any]) -> None:
        """Emit a telemetry event if callback is configured."""
        if self.telemetry_callback:
            event = TelemetryEvent(
                event_type=event_type,
                source="iteration_engine",
                data=data,
            )
            try:
                self.telemetry_callback(event)
            except Exception as e:
                self.logger.warning("Telemetry emission failed", error=str(e))


async def iterate_until_completion(
    tasks: List[TaskItem],
    execute_callback: Callable[[List[TaskItem]], Awaitable[Dict[str, Any]]],
    max_iterations: int = 10,
) -> IterationState:
    """
    Convenience function to iterate until all tasks are complete.

    Args:
        tasks: List of tasks to complete
        execute_callback: Callback to execute tasks (returns artifacts and metrics)
        max_iterations: Maximum number of iterations

    Returns:
        Final iteration state
    """
    engine = IterationEngine(
        mode=IterationMode.UNTIL_COMPLETE,
        max_iterations=max_iterations,
    )

    async def execute(iteration: int) -> Dict[str, Any]:
        # Get pending tasks
        pending = [t for t in tasks if t.status != TaskStatus.COMPLETED]
        return await execute_callback(pending)

    def check_complete() -> bool:
        return all(t.status == TaskStatus.COMPLETED for t in tasks)

    return await engine.run(execute, check_complete)
