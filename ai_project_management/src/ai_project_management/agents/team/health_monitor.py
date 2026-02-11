"""
Health Monitoring

Tracks agent health status and provides health check functionality.
"""

import asyncio
from enum import Enum
from typing import Dict, List, Optional, Callable, Any
from dataclasses import dataclass, field
from datetime import datetime, timedelta
import structlog


class HealthStatus(str, Enum):
    """Health status of an agent or component."""
    HEALTHY = "healthy"
    DEGRADED = "degraded"
    UNHEALTHY = "unhealthy"
    UNKNOWN = "unknown"


@dataclass
class HealthCheckResult:
    """Result of a health check."""
    status: HealthStatus
    component: str
    message: str
    timestamp: datetime = field(default_factory=datetime.utcnow)
    details: Dict[str, Any] = field(default_factory=dict)
    response_time_ms: float = 0.0
    error: Optional[str] = None

    def to_dict(self) -> Dict[str, Any]:
        """Convert to dictionary."""
        return {
            "status": self.status.value,
            "component": self.component,
            "message": self.message,
            "timestamp": self.timestamp.isoformat(),
            "details": self.details,
            "response_time_ms": self.response_time_ms,
            "error": self.error,
        }


@dataclass
class AgentHeartbeat:
    """Heartbeat data from an agent."""
    agent_id: str
    timestamp: datetime
    status: HealthStatus
    load: float = 0.0  # 0.0 to 1.0
    memory_usage_mb: float = 0.0
    active_tasks: int = 0
    error_count: int = 0
    metadata: Dict[str, Any] = field(default_factory=dict)


HealthCheckFunc = Callable[[], HealthCheckResult]


class HealthMonitor:
    """
    Health monitoring system for agents and components.

    Features:
    - Periodic health checks
    - Agent heartbeat tracking
    - Health history and trending
    - Alert generation for unhealthy states
    - Configurable check intervals and thresholds
    """

    def __init__(
        self,
        check_interval: float = 30.0,
        heartbeat_timeout: float = 120.0,
        health_history_limit: int = 100,
    ):
        """
        Initialize the health monitor.

        Args:
            check_interval: Seconds between health checks
            heartbeat_timeout: Seconds before agent is considered unhealthy
            health_history_limit: Max history entries per component
        """
        self._check_interval = check_interval
        self._heartbeat_timeout = heartbeat_timeout
        self._health_history_limit = health_history_limit

        # Health checks
        self._health_checks: Dict[str, HealthCheckFunc] = {}

        # Heartbeat tracking
        self._heartbeats: Dict[str, AgentHeartbeat] = {}

        # Health history
        self._health_history: Dict[str, List[HealthCheckResult]] = {}

        # Alert callbacks
        self._alert_handlers: List[Callable[[HealthCheckResult], None]] = []

        # Monitoring state
        self._running = False
        self._monitor_task: Optional[asyncio.Task] = None

        self.logger = structlog.get_logger(component="health_monitor")

    async def start(self):
        """Start health monitoring."""
        if self._running:
            return

        self._running = True
        self._monitor_task = asyncio.create_task(self._monitor_loop())
        self.logger.info("Health monitor started")

    async def stop(self):
        """Stop health monitoring."""
        if not self._running:
            return

        self._running = False
        if self._monitor_task:
            self._monitor_task.cancel()
            try:
                await self._monitor_task
            except asyncio.CancelledError:
                pass

        self.logger.info("Health monitor stopped")

    async def _monitor_loop(self):
        """Main monitoring loop."""
        while self._running:
            try:
                await self._run_health_checks()
                await self._check_heartbeats()
                await asyncio.sleep(self._check_interval)
            except asyncio.CancelledError:
                break
            except Exception as e:
                self.logger.error("Health monitor error", error=str(e))

    async def _run_health_checks(self):
        """Run all registered health checks."""
        for component, check_func in self._health_checks.items():
            try:
                result = check_func()
                if asyncio.iscoroutine(result):
                    result = await result

                await self._record_health_result(component, result)

                # Trigger alerts for unhealthy states
                if result.status in (HealthStatus.UNHEALTHY, HealthStatus.DEGRADED):
                    await self._trigger_alerts(result)

            except Exception as e:
                self.logger.error(
                    "Health check failed",
                    component=component,
                    error=str(e),
                )
                result = HealthCheckResult(
                    status=HealthStatus.UNKNOWN,
                    component=component,
                    message=f"Health check error: {str(e)}",
                    error=str(e),
                )
                await self._record_health_result(component, result)
                await self._trigger_alerts(result)

    async def _check_heartbeats(self):
        """Check for stale heartbeats."""
        now = datetime.utcnow()
        timeout_threshold = now - timedelta(seconds=self._heartbeat_timeout)

        for agent_id, heartbeat in self._heartbeats.items():
            if heartbeat.timestamp < timeout_threshold:
                result = HealthCheckResult(
                    status=HealthStatus.UNHEALTHY,
                    component=agent_id,
                    message=f"Heartbeat timeout: last seen {heartbeat.timestamp.isoformat()}",
                    details={
                        "last_heartbeat": heartbeat.timestamp.isoformat(),
                        "timeout_seconds": self._heartbeat_timeout,
                    },
                )
                await self._trigger_alerts(result)

    async def _record_health_result(
        self,
        component: str,
        result: HealthCheckResult,
    ):
        """Record a health check result."""
        if component not in self._health_history:
            self._health_history[component] = []

        self._health_history[component].append(result)

        # Trim history
        if len(self._health_history[component]) > self._health_history_limit:
            self._health_history[component].pop(0)

        self.logger.debug(
            "Health check recorded",
            component=component,
            status=result.status.value,
            message=result.message,
        )

    async def _trigger_alerts(self, result: HealthCheckResult):
        """Trigger alert handlers."""
        for handler in self._alert_handlers:
            try:
                ret = handler(result)
                if asyncio.iscoroutine(ret):
                    await ret
            except Exception as e:
                self.logger.error("Alert handler failed", error=str(e))

    def register_health_check(
        self,
        component: str,
        check_func: HealthCheckFunc,
    ) -> Callable[[], None]:
        """
        Register a health check for a component.

        Args:
            component: Component name
            check_func: Health check function

        Returns:
            Unregister function
        """
        self._health_checks[component] = check_func

        def unregister():
            if component in self._health_checks:
                del self._health_checks[component]

        return unregister

    def register_heartbeat(self, heartbeat: AgentHeartbeat):
        """
        Register a heartbeat from an agent.

        Args:
            heartbeat: Heartbeat data
        """
        self._heartbeats[heartbeat.agent_id] = heartbeat

        # Record as health result
        result = HealthCheckResult(
            status=heartbeat.status,
            component=heartbeat.agent_id,
            message=f"Heartbeat received: {heartbeat.status.value}",
            details={
                "load": heartbeat.load,
                "memory_usage_mb": heartbeat.memory_usage_mb,
                "active_tasks": heartbeat.active_tasks,
                "error_count": heartbeat.error_count,
            },
        )
        asyncio.create_task(self._record_health_result(heartbeat.agent_id, result))

    def on_alert(self, handler: Callable[[HealthCheckResult], None]) -> Callable[[], None]:
        """
        Register an alert handler.

        Args:
            handler: Alert callback function

        Returns:
            Unregister function
        """
        self._alert_handlers.append(handler)

        def unregister():
            if handler in self._alert_handlers:
                self._alert_handlers.remove(handler)

        return unregister

    def get_health_status(
        self,
        component: Optional[str] = None,
    ) -> HealthStatus:
        """
        Get current health status.

        Args:
            component: Specific component or None for overall status

        Returns:
            Health status
        """
        if component:
            history = self._health_history.get(component, [])
            if not history:
                return HealthStatus.UNKNOWN
            return history[-1].status

        # Overall status is the worst of all components
        if not self._health_history:
            return HealthStatus.UNKNOWN

        all_statuses = [
            history[-1].status
            for history in self._health_history.values()
            if history
        ]

        if not all_statuses:
            return HealthStatus.UNKNOWN

        # Priority: UNHEALTHY > DEGRADED > UNKNOWN > HEALTHY
        if HealthStatus.UNHEALTHY in all_statuses:
            return HealthStatus.UNHEALTHY
        if HealthStatus.DEGRADED in all_statuses:
            return HealthStatus.DEGRADED
        if HealthStatus.UNKNOWN in all_statuses:
            return HealthStatus.UNKNOWN
        return HealthStatus.HEALTHY

    def get_health_history(
        self,
        component: Optional[str] = None,
        limit: int = 50,
    ) -> List[HealthCheckResult]:
        """
        Get health check history.

        Args:
            component: Specific component or None for all
            limit: Maximum results to return

        Returns:
            List of health check results
        """
        if component:
            history = self._health_history.get(component, [])
            return history[-limit:]

        # Flatten all history
        all_results = []
        for history in self._health_history.values():
            all_results.extend(history)

        # Sort by timestamp
        all_results.sort(key=lambda r: r.timestamp, reverse=True)
        return all_results[:limit]

    def get_component_health_summary(self) -> Dict[str, Dict[str, Any]]:
        """
        Get health summary for all components.

        Returns:
            Dictionary mapping component names to health info
        """
        summary = {}

        for component, history in self._health_history.items():
            if not history:
                summary[component] = {
                    "status": HealthStatus.UNKNOWN.value,
                    "last_check": None,
                    "recent_failures": 0,
                }
                continue

            latest = history[-1]

            # Count recent failures
            recent_failures = sum(
                1 for r in history[-10:]
                if r.status in (HealthStatus.UNHEALTHY, HealthStatus.DEGRADED)
            )

            summary[component] = {
                "status": latest.status.value,
                "last_check": latest.timestamp.isoformat(),
                "message": latest.message,
                "recent_failures": recent_failures,
                "response_time_ms": latest.response_time_ms,
            }

        return summary

    def get_heartbeat_status(self, agent_id: str) -> Optional[AgentHeartbeat]:
        """
        Get latest heartbeat for an agent.

        Args:
            agent_id: Agent ID

        Returns:
            Latest heartbeat or None
        """
        return self._heartbeats.get(agent_id)

    def get_all_heartbeats(self) -> Dict[str, AgentHeartbeat]:
        """Get all heartbeats."""
        return dict(self._heartbeats)

    def get_statistics(self) -> Dict[str, Any]:
        """Get health monitor statistics."""
        components_monitored = len(self._health_checks)
        agents_tracking = len(self._heartbeats)
        total_history = sum(len(h) for h in self._health_history.values())

        # Calculate overall health
        overall_status = self.get_health_status()
        component_summary = self.get_component_health_summary()

        healthy_count = sum(
            1 for s in component_summary.values()
            if s["status"] == HealthStatus.HEALTHY.value
        )
        degraded_count = sum(
            1 for s in component_summary.values()
            if s["status"] == HealthStatus.DEGRADED.value
        )
        unhealthy_count = sum(
            1 for s in component_summary.values()
            if s["status"] == HealthStatus.UNHEALTHY.value
        )

        return {
            "overall_status": overall_status.value,
            "components_monitored": components_monitored,
            "agents_tracking": agents_tracking,
            "total_history_entries": total_history,
            "healthy_components": healthy_count,
            "degraded_components": degraded_count,
            "unhealthy_components": unhealthy_count,
            "alert_handlers": len(self._alert_handlers),
        }
