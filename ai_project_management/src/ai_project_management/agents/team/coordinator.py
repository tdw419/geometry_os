"""
Team Coordinator

Coordinates agent team operations including task assignment,
load balancing, and team communication.
"""

import asyncio
from typing import Dict, List, Optional, Set, Any
from dataclasses import dataclass, field
from datetime import datetime
from enum import Enum
import structlog

from .registry import (
    AgentRegistry,
    AgentInfo,
    AgentStatus,
    AgentCapability,
)
from .event_bus import (
    EventBus,
    EventType,
    Event,
    TaskEvent,
)
from .health_monitor import (
    HealthMonitor,
    HealthStatus,
    HealthCheckResult,
    AgentHeartbeat,
)
from .config import (
    AgentTeamConfig,
    AgentConfig,
    TeamPolicy,
)


class CoordinationStatus(str, Enum):
    """Status of team coordination operations."""
    SUCCESS = "success"
    NO_AGENTS = "no_agents"
    ALL_BUSY = "all_busy"
    NO_CAPABILITY = "no_capability"
    FAILED = "failed"
    TIMEOUT = "timeout"


@dataclass
class TaskAssignment:
    """Result of a task assignment."""
    task_id: str
    agent_id: str
    status: CoordinationStatus
    assigned_at: datetime = field(default_factory=datetime.utcnow)
    completed_at: Optional[datetime] = None
    result: Optional[Any] = None
    error: Optional[str] = None
    retry_count: int = 0


@dataclass
class TeamCoordinationResult:
    """Result of a team coordination operation."""
    status: CoordinationStatus
    agent: Optional[AgentInfo] = None
    assignment: Optional[TaskAssignment] = None
    message: str = ""
    retry_attempted: bool = False
    fallback_used: bool = False


class TeamCoordinator:
    """
    Coordinates agent team operations.

    Features:
    - Task assignment with multiple policies
    - Load balancing
    - Health-aware routing
    - Automatic retry and failover
    - Team lifecycle management
    """

    def __init__(
        self,
        config: AgentTeamConfig,
        registry: Optional[AgentRegistry] = None,
        event_bus: Optional[EventBus] = None,
        health_monitor: Optional[HealthMonitor] = None,
    ):
        """
        Initialize the team coordinator.

        Args:
            config: Team configuration
            registry: Agent registry (will create if None)
            event_bus: Event bus for communication (will create if None)
            health_monitor: Health monitor (will create if None)
        """
        self.config = config
        self.logger = structlog.get_logger(component="team_coordinator")

        # Initialize components
        self.registry = registry or AgentRegistry(
            heartbeat_timeout=config.heartbeat_timeout,
        )
        self.event_bus = event_bus or EventBus(
            max_history=config.event_history_limit,
            enable_dead_letter=config.enable_dead_letter_queue,
        )
        self.health_monitor = health_monitor or HealthMonitor(
            check_interval=config.health_check_interval,
            heartbeat_timeout=config.heartbeat_timeout,
            health_history_limit=config.health_history_limit,
        )

        # Task tracking
        self._pending_tasks: Dict[str, TaskAssignment] = {}
        self._active_tasks: Dict[str, TaskAssignment] = {}
        self._completed_tasks: List[TaskAssignment] = []

        # Agent round-robin tracking
        self._round_robin_index: Dict[str, int] = {}

        # Coordinator state
        self._running = False
        self._coordination_lock = asyncio.Lock()

        # Statistics
        self._stats = {
            "tasks_assigned": 0,
            "tasks_completed": 0,
            "tasks_failed": 0,
            "tasks_retried": 0,
            "tasks_failed_over": 0,
            "agents_selected": {},
        }

    async def start(self):
        """Start the team coordinator."""
        if self._running:
            return

        self._running = True

        # Start health monitor
        if self.config.enable_health_monitoring:
            await self.health_monitor.start()

        # Register health check for coordinator
        self.health_monitor.register_health_check(
            "coordinator",
            self._health_check,
        )

        # Initialize agents from config
        await self._initialize_agents()

        # Subscribe to events
        if self.config.enable_event_bus:
            await self._setup_event_subscriptions()

        await self.event_bus.publish_system_event(
            EventType.SYSTEM_STARTUP,
            "team_coordinator",
            message="Team coordinator started",
            team_name=self.config.name,
        )

        self.logger.info("Team coordinator started", team_name=self.config.name)

    async def stop(self):
        """Stop the team coordinator."""
        if not self._running:
            return

        self._running = False

        await self.event_bus.publish_system_event(
            EventType.SYSTEM_SHUTDOWN,
            "team_coordinator",
            message="Team coordinator stopping",
        )

        # Stop health monitor
        await self.health_monitor.stop()

        self.logger.info("Team coordinator stopped")

    async def _initialize_agents(self):
        """Initialize agents from configuration."""
        for agent_config in self.config.get_enabled_agents():
            capabilities = agent_config.get_capabilities()

            self.registry.register(
                agent_id=agent_config.agent_id,
                name=agent_config.name,
                agent_type=agent_config.agent_type,
                capabilities=capabilities,
                metadata=agent_config.metadata,
                max_concurrent_tasks=agent_config.max_concurrent_tasks,
            )

            self.logger.info(
                "Agent initialized",
                agent_id=agent_config.agent_id,
                agent_type=agent_config.agent_type,
                capabilities=[c.value for c in capabilities],
            )

    async def _setup_event_subscriptions(self):
        """Setup event bus subscriptions."""
        # Track task events
        async def on_task_assigned(event: Event):
            if isinstance(event, TaskEvent):
                self._stats["tasks_assigned"] += 1

        async def on_task_completed(event: Event):
            if isinstance(event, TaskEvent) and event.success:
                self._stats["tasks_completed"] += 1
                # Track which agents are handling tasks
                if event.agent_id:
                    agent_stats = self._stats["agents_selected"]
                    agent_stats[event.agent_id] = agent_stats.get(event.agent_id, 0) + 1

        async def on_task_failed(event: Event):
            if isinstance(event, TaskEvent) and event.success is False:
                self._stats["tasks_failed"] += 1

        self.event_bus.subscribe(EventType.TASK_ASSIGNED, on_task_assigned)
        self.event_bus.subscribe(EventType.TASK_COMPLETED, on_task_completed)
        self.event_bus.subscribe(EventType.TASK_FAILED, on_task_failed)

    def _health_check(self) -> HealthCheckResult:
        """Health check for the coordinator."""
        issues = []

        # Check if we have available agents
        available_agents = self.registry.get_available()
        if not available_agents:
            issues.append("No available agents")

        # Check pending queue
        if len(self._pending_tasks) > self.config.max_queue_size:
            issues.append(f"Queue size ({len(self._pending_tasks)}) exceeds limit")

        status = HealthStatus.HEALTHY
        if issues:
            status = HealthStatus.DEGRADED if len(issues) == 1 else HealthStatus.UNHEALTHY

        return HealthCheckResult(
            status=status,
            component="team_coordinator",
            message=f"Coordinator health: {len(available_agents)} agents available",
            details={
                "pending_tasks": len(self._pending_tasks),
                "active_tasks": len(self._active_tasks),
                "available_agents": len(available_agents),
                "issues": issues,
            },
        )

    async def assign_task(
        self,
        task_id: str,
        required_capabilities: Set[AgentCapability],
        task_data: Optional[Dict[str, Any]] = None,
        timeout: Optional[float] = None,
    ) -> TeamCoordinationResult:
        """
        Assign a task to an agent.

        Args:
            task_id: Unique task identifier
            required_capabilities: Capabilities required for the task
            task_data: Additional task data
            timeout: Assignment timeout in seconds

        Returns:
            Coordination result
        """
        timeout = timeout or self.config.task_timeout

        try:
            async with asyncio.timeout(timeout):
                return await self._assign_task_internal(
                    task_id,
                    required_capabilities,
                    task_data or {},
                )
        except asyncio.TimeoutError:
            return TeamCoordinationResult(
                status=CoordinationStatus.TIMEOUT,
                message=f"Task assignment timed out after {timeout}s",
            )

    async def _assign_task_internal(
        self,
        task_id: str,
        required_capabilities: Set[AgentCapability],
        task_data: Dict[str, Any],
    ) -> TeamCoordinationResult:
        """Internal task assignment logic."""

        # Select agent based on policy
        agent = await self._select_agent(required_capabilities)

        if agent is None:
            return TeamCoordinationResult(
                status=CoordinationStatus.NO_AGENTS,
                message="No suitable agent available",
            )

        # Create assignment
        assignment = TaskAssignment(
            task_id=task_id,
            agent_id=agent.agent_id,
            status=CoordinationStatus.SUCCESS,
        )

        # Track the assignment
        self._active_tasks[task_id] = assignment

        # Publish task assigned event
        await self.event_bus.publish_task_event(
            EventType.TASK_ASSIGNED,
            task_id=task_id,
            task_type=task_data.get("task_type", "unknown"),
            agent_id=agent.agent_id,
            **task_data,
        )

        # Update agent metrics
        agent.current_tasks += 1

        return TeamCoordinationResult(
            status=CoordinationStatus.SUCCESS,
            agent=agent,
            assignment=assignment,
            message=f"Task {task_id} assigned to {agent.name}",
        )

    async def _select_agent(
        self,
        required_capabilities: Set[AgentCapability],
    ) -> Optional[AgentInfo]:
        """
        Select an agent based on the configured policy.

        Args:
            required_capabilities: Required capabilities

        Returns:
            Selected agent or None
        """
        policy = self.config.selection_policy

        if policy == TeamPolicy.BEST_FIT:
            return self.registry.find_best_agent(required_capabilities)

        elif policy == TeamPolicy.LEAST_LOADED:
            available = self.registry.get_available()
            capable = [a for a in available if a.can_handle_capabilities(required_capabilities)]
            if not capable:
                return None
            return min(capable, key=lambda a: a.utilization)

        elif policy == TeamPolicy.ROUND_ROBIN:
            available = self.registry.get_available()
            capable = [a for a in available if a.can_handle_capabilities(required_capabilities)]
            if not capable:
                return None

            # Get or initialize round-robin index
            key = ",".join(sorted(c.value for c in required_capabilities))
            index = self._round_robin_index.get(key, 0)
            agent = capable[index % len(capable)]
            self._round_robin_index[key] = index + 1
            return agent

        elif policy == TeamPolicy.PRIORITY:
            available = self.registry.get_available()
            capable = [
                a for a in available
                if a.can_handle_capabilities(required_capabilities)
            ]

            # Get agent configs for priority
            config_map = {
                a.agent_id: self.config.get_agent_config(a.agent_id)
                for a in capable
            }

            # Sort by priority (descending)
            capable.sort(
                key=lambda a: config_map.get(a.agent_id, AgentConfig(
                    agent_id=a.agent_id,
                    name=a.name,
                    agent_type=a.agent_type,
                    capabilities=[],
                )).priority,
                reverse=True,
            )

            return capable[0] if capable else None

        return None

    async def complete_task(
        self,
        task_id: str,
        success: bool,
        result: Optional[Any] = None,
        error: Optional[str] = None,
    ) -> bool:
        """
        Mark a task as completed.

        Args:
            task_id: Task identifier
            success: Whether the task succeeded
            result: Task result
            error: Error message if failed

        Returns:
            True if task was found and updated
        """
        assignment = self._active_tasks.pop(task_id, None)
        if not assignment:
            return False

        assignment.completed_at = datetime.utcnow()
        assignment.result = result
        assignment.error = error

        # Update agent metrics
        agent = self.registry.get(assignment.agent_id)
        if agent:
            duration = (assignment.completed_at - assignment.assigned_at).total_seconds()
            agent.update_metrics(success, duration)
            agent.current_tasks -= 1

        # Publish completion event
        event_type = EventType.TASK_COMPLETED if success else EventType.TASK_FAILED
        await self.event_bus.publish_task_event(
            event_type,
            task_id=task_id,
            task_type="",
            agent_id=assignment.agent_id,
            success=success,
            error=error,
        )

        return True

    async def process_heartbeat(self, heartbeat: AgentHeartbeat):
        """
        Process a heartbeat from an agent.

        Args:
            heartbeat: Heartbeat data
        """
        # Update registry
        self.registry.record_heartbeat(heartbeat.agent_id)

        # Update health monitor
        self.health_monitor.register_heartbeat(heartbeat)

        # Publish heartbeat event
        await self.event_bus.publish_agent_event(
            EventType.AGENT_HEARTBEAT,
            agent_id=heartbeat.agent_id,
            agent_type="",
            status=heartbeat.status.value,
            **heartbeat.metadata,
        )

    def get_team_status(self) -> Dict[str, Any]:
        """Get overall team status."""
        agents = self.registry.get_all()

        return {
            "config_name": self.config.name,
            "total_agents": len(agents),
            "available_agents": len([a for a in agents if a.is_available]),
            "busy_agents": len(self.registry.get_by_status(AgentStatus.BUSY)),
            "offline_agents": len(self.registry.get_by_status(AgentStatus.OFFLINE)),
            "pending_tasks": len(self._pending_tasks),
            "active_tasks": len(self._active_tasks),
            "selection_policy": self.config.selection_policy.value,
            "statistics": self._stats,
        }

    def get_task_status(self, task_id: str) -> Optional[TaskAssignment]:
        """Get status of a specific task."""
        # Check active tasks
        if task_id in self._active_tasks:
            return self._active_tasks[task_id]

        # Check completed tasks
        for assignment in self._completed_tasks:
            if assignment.task_id == task_id:
                return assignment

        return None
