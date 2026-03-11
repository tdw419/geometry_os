"""
Configuration support for agent team.

Provides configuration loading, saving, and validation.
"""

from enum import Enum
from typing import Dict, List, Optional, Any
from dataclasses import dataclass, field
from pathlib import Path
import yaml
import structlog

from .registry import AgentCapability


class TeamPolicy(str, Enum):
    """Team formation policies."""
    # Selection policies
    ROUND_ROBIN = "round_robin"  # Distribute tasks evenly
    LEAST_LOADED = "least_loaded"  # Choose agent with lowest utilization
    BEST_FIT = "best_fit"  # Choose agent with best capability match
    PRIORITY = "priority"  # Respect agent priority

    # Scaling policies
    AUTO_SCALE = "auto_scale"  # Add/remove agents based on load
    FIXED = "fixed"  # Fixed number of agents

    # Failure policies
    RETRY = "retry"  # Retry failed tasks
    FAILOVER = "failover"  # Reassign to another agent
    ESCALATE = "escalate"  # Escalate to orchestrator


@dataclass
class AgentConfig:
    """Configuration for a single agent."""
    agent_id: str
    name: str
    agent_type: str
    capabilities: List[str]  # List of capability strings
    enabled: bool = True
    max_concurrent_tasks: int = 1
    priority: int = 0  # Higher priority = preferred
    metadata: Dict[str, Any] = field(default_factory=dict)

    # Health check config
    health_check_interval: float = 30.0
    health_check_timeout: float = 120.0

    # Scaling config
    min_instances: int = 1
    max_instances: int = 1

    def to_dict(self) -> Dict[str, Any]:
        """Convert to dictionary."""
        return {
            "agent_id": self.agent_id,
            "name": self.name,
            "agent_type": self.agent_type,
            "capabilities": self.capabilities,
            "enabled": self.enabled,
            "max_concurrent_tasks": self.max_concurrent_tasks,
            "priority": self.priority,
            "metadata": self.metadata,
            "health_check_interval": self.health_check_interval,
            "health_check_timeout": self.health_check_timeout,
            "min_instances": self.min_instances,
            "max_instances": self.max_instances,
        }

    @classmethod
    def from_dict(cls, data: Dict[str, Any]) -> "AgentConfig":
        """Create from dictionary."""
        return cls(
            agent_id=data["agent_id"],
            name=data["name"],
            agent_type=data["agent_type"],
            capabilities=data["capabilities"],
            enabled=data.get("enabled", True),
            max_concurrent_tasks=data.get("max_concurrent_tasks", 1),
            priority=data.get("priority", 0),
            metadata=data.get("metadata", {}),
            health_check_interval=data.get("health_check_interval", 30.0),
            health_check_timeout=data.get("health_check_timeout", 120.0),
            min_instances=data.get("min_instances", 1),
            max_instances=data.get("max_instances", 1),
        )

    def get_capabilities(self) -> List[AgentCapability]:
        """Get capabilities as AgentCapability enum values."""
        caps = []
        for cap_str in self.capabilities:
            try:
                caps.append(AgentCapability(cap_str))
            except ValueError:
                # Unknown capability, skip
                pass
        return caps


@dataclass
class AgentTeamConfig:
    """Configuration for an agent team."""

    # Team info
    name: str
    description: str = ""

    # Selection policy
    selection_policy: TeamPolicy = TeamPolicy.BEST_FIT

    # Scaling policy
    scaling_policy: TeamPolicy = TeamPolicy.FIXED

    # Failure policy
    failure_policy: TeamPolicy = TeamPolicy.FAILOVER

    # Retry config
    max_retries: int = 3
    retry_delay: float = 5.0  # seconds

    # Team communication
    enable_event_bus: bool = True
    enable_health_monitoring: bool = True

    # Health monitoring config
    health_check_interval: float = 30.0
    heartbeat_timeout: float = 120.0
    health_history_limit: int = 100

    # Event bus config
    event_history_limit: int = 1000
    enable_dead_letter_queue: bool = True

    # Agents
    agents: List[AgentConfig] = field(default_factory=list)

    # Team constraints
    max_concurrent_tasks: int = 10
    max_queue_size: int = 100
    task_timeout: float = 300.0  # seconds

    # Metadata
    metadata: Dict[str, Any] = field(default_factory=dict)

    def to_dict(self) -> Dict[str, Any]:
        """Convert to dictionary."""
        return {
            "name": self.name,
            "description": self.description,
            "selection_policy": self.selection_policy.value,
            "scaling_policy": self.scaling_policy.value,
            "failure_policy": self.failure_policy.value,
            "max_retries": self.max_retries,
            "retry_delay": self.retry_delay,
            "enable_event_bus": self.enable_event_bus,
            "enable_health_monitoring": self.enable_health_monitoring,
            "health_check_interval": self.health_check_interval,
            "heartbeat_timeout": self.heartbeat_timeout,
            "health_history_limit": self.health_history_limit,
            "event_history_limit": self.event_history_limit,
            "enable_dead_letter_queue": self.enable_dead_letter_queue,
            "agents": [a.to_dict() for a in self.agents],
            "max_concurrent_tasks": self.max_concurrent_tasks,
            "max_queue_size": self.max_queue_size,
            "task_timeout": self.task_timeout,
            "metadata": self.metadata,
        }

    @classmethod
    def from_dict(cls, data: Dict[str, Any]) -> "AgentTeamConfig":
        """Create from dictionary."""
        agents = [
            AgentConfig.from_dict(a) if isinstance(a, dict) else a
            for a in data.get("agents", [])
        ]

        return cls(
            name=data["name"],
            description=data.get("description", ""),
            selection_policy=TeamPolicy(data.get("selection_policy", "best_fit")),
            scaling_policy=TeamPolicy(data.get("scaling_policy", "fixed")),
            failure_policy=TeamPolicy(data.get("failure_policy", "failover")),
            max_retries=data.get("max_retries", 3),
            retry_delay=data.get("retry_delay", 5.0),
            enable_event_bus=data.get("enable_event_bus", True),
            enable_health_monitoring=data.get("enable_health_monitoring", True),
            health_check_interval=data.get("health_check_interval", 30.0),
            heartbeat_timeout=data.get("heartbeat_timeout", 120.0),
            health_history_limit=data.get("health_history_limit", 100),
            event_history_limit=data.get("event_history_limit", 1000),
            enable_dead_letter_queue=data.get("enable_dead_letter_queue", True),
            agents=agents,
            max_concurrent_tasks=data.get("max_concurrent_tasks", 10),
            max_queue_size=data.get("max_queue_size", 100),
            task_timeout=data.get("task_timeout", 300.0),
            metadata=data.get("metadata", {}),
        )

    def validate(self) -> List[str]:
        """
        Validate configuration.

        Returns:
            List of validation errors (empty if valid)
        """
        errors = []

        if not self.name:
            errors.append("Team name is required")

        if self.max_retries < 0:
            errors.append("max_retries must be >= 0")

        if self.retry_delay < 0:
            errors.append("retry_delay must be >= 0")

        if self.health_check_interval <= 0:
            errors.append("health_check_interval must be > 0")

        if self.heartbeat_timeout <= 0:
            errors.append("heartbeat_timeout must be > 0")

        if self.heartbeat_timeout <= self.health_check_interval:
            errors.append("heartbeat_timeout must be > health_check_interval")

        if self.max_concurrent_tasks <= 0:
            errors.append("max_concurrent_tasks must be > 0")

        if self.max_queue_size <= 0:
            errors.append("max_queue_size must be > 0")

        if self.task_timeout <= 0:
            errors.append("task_timeout must be > 0")

        # Validate agents
        agent_ids = set()
        for agent in self.agents:
            if not agent.agent_id:
                errors.append(f"Agent {agent.name} missing agent_id")

            if agent.agent_id in agent_ids:
                errors.append(f"Duplicate agent_id: {agent.agent_id}")
            agent_ids.add(agent.agent_id)

            if agent.max_concurrent_tasks <= 0:
                errors.append(f"Agent {agent.agent_id} max_concurrent_tasks must be > 0")

            if agent.min_instances < 0:
                errors.append(f"Agent {agent.agent_id} min_instances must be >= 0")

            if agent.max_instances < agent.min_instances:
                errors.append(
                    f"Agent {agent.agent_id} max_instances must be >= min_instances"
                )

        return errors

    def get_agent_config(self, agent_id: str) -> Optional[AgentConfig]:
        """Get configuration for a specific agent."""
        for agent in self.agents:
            if agent.agent_id == agent_id:
                return agent
        return None

    def get_enabled_agents(self) -> List[AgentConfig]:
        """Get list of enabled agents."""
        return [a for a in self.agents if a.enabled]

    def get_agents_by_type(self, agent_type: str) -> List[AgentConfig]:
        """Get agents of a specific type."""
        return [a for a in self.agents if a.agent_type == agent_type]


def load_team_config(config_path: Path) -> AgentTeamConfig:
    """
    Load team configuration from a YAML file.

    Args:
        config_path: Path to config file

    Returns:
        AgentTeamConfig

    Raises:
        FileNotFoundError: If config file doesn't exist
        ValueError: If config is invalid
    """
    logger = structlog.get_logger(component="team_config")

    if not config_path.exists():
        raise FileNotFoundError(f"Config file not found: {config_path}")

    with open(config_path) as f:
        data = yaml.safe_load(f)

    config = AgentTeamConfig.from_dict(data)

    # Validate
    errors = config.validate()
    if errors:
        logger.error("Config validation failed", errors=errors)
        raise ValueError(f"Invalid config: {errors}")

    logger.info("Team config loaded", team_name=config.name)
    return config


def save_team_config(config: AgentTeamConfig, config_path: Path):
    """
    Save team configuration to a YAML file.

    Args:
        config: Configuration to save
        config_path: Path to save to
    """
    logger = structlog.get_logger(component="team_config")

    # Validate before saving
    errors = config.validate()
    if errors:
        logger.error("Config validation failed", errors=errors)
        raise ValueError(f"Invalid config: {errors}")

    config_path.parent.mkdir(parents=True, exist_ok=True)

    with open(config_path, "w") as f:
        yaml.dump(config.to_dict(), f, default_flow_style=False)

    logger.info("Team config saved", team_name=config.name, path=str(config_path))


def create_default_config() -> AgentTeamConfig:
    """Create a default team configuration."""
    return AgentTeamConfig(
        name="default_team",
        description="Default agent team configuration",
        selection_policy=TeamPolicy.BEST_FIT,
        scaling_policy=TeamPolicy.FIXED,
        failure_policy=TeamPolicy.FAILOVER,
        agents=[
            AgentConfig(
                agent_id="orchestrator",
                name="Orchestrator",
                agent_type="orchestrator",
                capabilities=["orchestration", "monitoring"],
                priority=100,
            ),
            AgentConfig(
                agent_id="llm_agent",
                name="LLM Agent",
                agent_type="llm",
                capabilities=["llm_inference", "code_generation", "code_analysis"],
                priority=50,
            ),
        ],
    )
