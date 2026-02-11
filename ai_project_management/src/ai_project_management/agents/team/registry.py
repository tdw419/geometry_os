"""
Agent Registry

Tracks available agents and their capabilities for team coordination.
"""

from enum import Enum
from typing import Dict, List, Optional, Set, Any, Callable
from dataclasses import dataclass, field
from datetime import datetime
from pathlib import Path
import structlog


class AgentStatus(str, Enum):
    """Status of an agent in the registry."""
    AVAILABLE = "available"
    BUSY = "busy"
    OFFLINE = "offline"
    ERROR = "error"
    MAINTENANCE = "maintenance"


class AgentCapability(str, Enum):
    """Core capabilities that agents can provide."""
    # Task execution capabilities
    TASK_EXECUTION = "task_execution"
    CODE_GENERATION = "code_generation"
    CODE_ANALYSIS = "code_analysis"
    TESTING = "testing"
    REVIEW = "review"

    # Domain expertise
    KERNEL_DEVELOPMENT = "kernel_development"
    GRAPHICS_RENDERING = "graphics_rendering"
    DRIVER_DEVELOPMENT = "driver_development"
    NETWORK_STACK = "network_stack"
    FILESYSTEM = "filesystem"
    COMPILER = "compiler"

    # AI/ML capabilities
    LLM_INFERENCE = "llm_inference"
    TRAINING = "training"
    INFERENCE_OPTIMIZATION = "inference_optimization"

    # System capabilities
    ORCHESTRATION = "orchestration"
    MONITORING = "monitoring"
    RESEARCH = "research"
    DOCUMENTATION = "documentation"


@dataclass
class AgentInfo:
    """Information about an agent in the registry."""
    agent_id: str
    name: str
    agent_type: str  # e.g., "llm", "domain", "specialist", "orchestrator"
    capabilities: Set[AgentCapability]
    status: AgentStatus = AgentStatus.AVAILABLE
    metadata: Dict[str, Any] = field(default_factory=dict)

    # Performance metrics
    total_tasks: int = 0
    completed_tasks: int = 0
    failed_tasks: int = 0
    average_task_duration: float = 0.0  # seconds

    # Availability
    max_concurrent_tasks: int = 1
    current_tasks: int = 0

    # Registration info
    registered_at: datetime = field(default_factory=datetime.utcnow)
    last_heartbeat: Optional[datetime] = None
    last_seen: datetime = field(default_factory=datetime.utcnow)

    # Health
    health_score: float = 1.0  # 0.0 to 1.0
    error_count: int = 0
    consecutive_failures: int = 0

    @property
    def is_available(self) -> bool:
        """Check if agent is available for new tasks."""
        return (
            self.status == AgentStatus.AVAILABLE and
            self.current_tasks < self.max_concurrent_tasks and
            self.health_score > 0.5
        )

    @property
    def utilization(self) -> float:
        """Get current utilization ratio."""
        if self.max_concurrent_tasks == 0:
            return 1.0
        return self.current_tasks / self.max_concurrent_tasks

    @property
    def success_rate(self) -> float:
        """Get task success rate."""
        if self.total_tasks == 0:
            return 1.0
        return self.completed_tasks / self.total_tasks

    def can_handle_capability(self, capability: AgentCapability) -> bool:
        """Check if agent has a specific capability."""
        return capability in self.capabilities

    def can_handle_capabilities(self, capabilities: Set[AgentCapability]) -> bool:
        """Check if agent has all specified capabilities."""
        return capabilities.issubset(self.capabilities)

    def update_metrics(self, success: bool, duration: float):
        """Update agent metrics after task completion."""
        self.total_tasks += 1
        if success:
            self.completed_tasks += 1
            self.consecutive_failures = 0
        else:
            self.failed_tasks += 1
            self.error_count += 1
            self.consecutive_failures += 1

        # Update average duration
        if self.average_task_duration == 0:
            self.average_task_duration = duration
        else:
            self.average_task_duration = (
                self.average_task_duration * 0.9 + duration * 0.1
            )

    def heartbeat(self):
        """Update last heartbeat timestamp."""
        self.last_heartbeat = datetime.utcnow()
        self.last_seen = datetime.utcnow()


class AgentRegistry:
    """
    Registry for tracking available agents and their capabilities.

    Provides agent discovery, selection, and lifecycle management.
    """

    def __init__(self, heartbeat_timeout: float = 300.0):
        """
        Initialize the agent registry.

        Args:
            heartbeat_timeout: Seconds before an agent is considered stale
        """
        self._agents: Dict[str, AgentInfo] = {}
        self._heartbeat_timeout = heartbeat_timeout
        self.logger = structlog.get_logger(component="agent_registry")

    def register(
        self,
        agent_id: str,
        name: str,
        agent_type: str,
        capabilities: List[AgentCapability],
        metadata: Optional[Dict[str, Any]] = None,
        max_concurrent_tasks: int = 1,
    ) -> AgentInfo:
        """
        Register a new agent.

        Args:
            agent_id: Unique identifier for the agent
            name: Human-readable name
            agent_type: Type of agent
            capabilities: List of capabilities
            metadata: Additional metadata
            max_concurrent_tasks: Maximum concurrent tasks

        Returns:
            The registered AgentInfo
        """
        if agent_id in self._agents:
            self.logger.warning(
                "Agent already registered, updating",
                agent_id=agent_id,
            )
            agent = self._agents[agent_id]
            agent.name = name
            agent.agent_type = agent_type
            agent.capabilities = set(capabilities)
            if metadata:
                agent.metadata.update(metadata)
            agent.max_concurrent_tasks = max_concurrent_tasks
            agent.registered_at = datetime.utcnow()
            return agent

        agent = AgentInfo(
            agent_id=agent_id,
            name=name,
            agent_type=agent_type,
            capabilities=set(capabilities),
            metadata=metadata or {},
            max_concurrent_tasks=max_concurrent_tasks,
        )
        self._agents[agent_id] = agent
        self.logger.info(
            "Agent registered",
            agent_id=agent_id,
            name=name,
            agent_type=agent_type,
            capabilities=[c.value for c in capabilities],
        )
        return agent

    def unregister(self, agent_id: str) -> bool:
        """
        Unregister an agent.

        Args:
            agent_id: Agent to unregister

        Returns:
            True if agent was removed
        """
        if agent_id in self._agents:
            del self._agents[agent_id]
            self.logger.info("Agent unregistered", agent_id=agent_id)
            return True
        return False

    def get(self, agent_id: str) -> Optional[AgentInfo]:
        """Get agent info by ID."""
        return self._agents.get(agent_id)

    def get_all(self) -> List[AgentInfo]:
        """Get all registered agents."""
        return list(self._agents.values())

    def get_by_status(self, status: AgentStatus) -> List[AgentInfo]:
        """Get agents by status."""
        return [a for a in self._agents.values() if a.status == status]

    def get_by_type(self, agent_type: str) -> List[AgentInfo]:
        """Get agents by type."""
        return [a for a in self._agents.values() if a.agent_type == agent_type]

    def get_by_capability(self, capability: AgentCapability) -> List[AgentInfo]:
        """Get agents that have a specific capability."""
        return [a for a in self._agents.values() if capability in a.capabilities]

    def get_available(self, capability: Optional[AgentCapability] = None) -> List[AgentInfo]:
        """
        Get available agents.

        Args:
            capability: Optional capability filter

        Returns:
            List of available agents
        """
        agents = [a for a in self._agents.values() if a.is_available]
        if capability:
            agents = [a for a in agents if capability in a.capabilities]
        return agents

    def find_best_agent(
        self,
        required_capabilities: Set[AgentCapability],
        exclude_ids: Optional[Set[str]] = None,
    ) -> Optional[AgentInfo]:
        """
        Find the best available agent for given capabilities.

        Selection criteria:
        1. Has all required capabilities
        2. Is available
        3. Not excluded
        4. Lowest utilization
        5. Highest success rate
        6. Highest health score

        Args:
            required_capabilities: Capabilities the agent must have
            exclude_ids: Agent IDs to exclude from selection

        Returns:
            Best matching agent or None
        """
        exclude_ids = exclude_ids or set()

        candidates = [
            a for a in self._agents.values()
            if a.is_available
            and a.can_handle_capabilities(required_capabilities)
            and a.agent_id not in exclude_ids
        ]

        if not candidates:
            return None

        # Sort by: utilization (asc), success rate (desc), health (desc)
        candidates.sort(
            key=lambda a: (
                a.utilization,
                -a.success_rate,
                -a.health_score,
            )
        )

        return candidates[0]

    def update_status(self, agent_id: str, status: AgentStatus) -> bool:
        """
        Update agent status.

        Args:
            agent_id: Agent to update
            status: New status

        Returns:
            True if status was updated
        """
        agent = self._agents.get(agent_id)
        if not agent:
            return False

        old_status = agent.status
        agent.status = status

        if old_status != status:
            self.logger.info(
                "Agent status changed",
                agent_id=agent_id,
                old_status=old_status.value,
                new_status=status.value,
            )

        return True

    def record_heartbeat(self, agent_id: str) -> bool:
        """
        Record a heartbeat from an agent.

        Args:
            agent_id: Agent sending heartbeat

        Returns:
            True if agent exists and heartbeat recorded
        """
        agent = self._agents.get(agent_id)
        if not agent:
            return False

        agent.heartbeat()
        return True

    def cleanup_stale(self) -> List[str]:
        """
        Mark stale agents as offline.

        Returns:
            List of agent IDs that were marked offline
        """
        now = datetime.utcnow()
        stale_agents = []

        for agent in self._agents.values():
            if agent.last_heartbeat is None:
                continue

            stale_seconds = (now - agent.last_heartbeat).total_seconds()
            if stale_seconds > self._heartbeat_timeout and agent.status != AgentStatus.OFFLINE:
                agent.status = AgentStatus.OFFLINE
                stale_agents.append(agent.agent_id)
                self.logger.warning(
                    "Agent marked offline due to stale heartbeat",
                    agent_id=agent.agent_id,
                    stale_seconds=stale_seconds,
                )

        return stale_agents

    def get_statistics(self) -> Dict[str, Any]:
        """Get registry statistics."""
        agents = list(self._agents.values())

        return {
            "total_agents": len(agents),
            "by_status": {
                status.value: len([a for a in agents if a.status == status])
                for status in AgentStatus
            },
            "by_type": {
                agent_type: len([a for a in agents if a.agent_type == agent_type])
                for agent_type in set(a.agent_type for a in agents)
            },
            "available_count": len([a for a in agents if a.is_available]),
            "average_health": sum(a.health_score for a in agents) / len(agents) if agents else 0.0,
            "average_utilization": sum(a.utilization for a in agents) / len(agents) if agents else 0.0,
        }

    def export_state(self) -> Dict[str, Any]:
        """Export registry state for persistence."""
        return {
            "agents": [
                {
                    "agent_id": a.agent_id,
                    "name": a.name,
                    "agent_type": a.agent_type,
                    "capabilities": [c.value for c in a.capabilities],
                    "status": a.status.value,
                    "metadata": a.metadata,
                    "total_tasks": a.total_tasks,
                    "completed_tasks": a.completed_tasks,
                    "failed_tasks": a.failed_tasks,
                    "average_task_duration": a.average_task_duration,
                    "max_concurrent_tasks": a.max_concurrent_tasks,
                    "current_tasks": a.current_tasks,
                    "registered_at": a.registered_at.isoformat(),
                    "last_heartbeat": a.last_heartbeat.isoformat() if a.last_heartbeat else None,
                    "health_score": a.health_score,
                    "error_count": a.error_count,
                }
                for a in self._agents.values()
            ],
        }

    def import_state(self, state: Dict[str, Any]):
        """Import registry state from persistence."""
        for agent_data in state.get("agents", []):
            agent = AgentInfo(
                agent_id=agent_data["agent_id"],
                name=agent_data["name"],
                agent_type=agent_data["agent_type"],
                capabilities=set(AgentCapability(c) for c in agent_data["capabilities"]),
                status=AgentStatus(agent_data["status"]),
                metadata=agent_data.get("metadata", {}),
                total_tasks=agent_data.get("total_tasks", 0),
                completed_tasks=agent_data.get("completed_tasks", 0),
                failed_tasks=agent_data.get("failed_tasks", 0),
                average_task_duration=agent_data.get("average_task_duration", 0.0),
                max_concurrent_tasks=agent_data.get("max_concurrent_tasks", 1),
                current_tasks=agent_data.get("current_tasks", 0),
                health_score=agent_data.get("health_score", 1.0),
                error_count=agent_data.get("error_count", 0),
            )
            self._agents[agent.agent_id] = agent
