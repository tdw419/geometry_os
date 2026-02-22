"""
Agent Team Coordination System

Provides:
1. Agent Registry - track available agents and their capabilities
2. Event Bus - pub/sub for agent communication
3. Health Monitoring - track agent status
4. Configuration support for agent team
"""

from .registry import (
    AgentCapability,
    AgentInfo,
    AgentStatus,
    AgentRegistry,
)
from .event_bus import (
    EventBus,
    Event,
    EventHandler,
    AgentEvent,
    SystemEvent,
    TaskEvent,
)
from .health_monitor import (
    HealthMonitor,
    HealthCheckResult,
    HealthStatus,
    AgentHeartbeat,
)
from .config import (
    AgentTeamConfig,
    AgentConfig,
    TeamPolicy,
    load_team_config,
    save_team_config,
)
from .coordinator import (
    TeamCoordinator,
    TeamCoordinationResult,
    TaskAssignment,
)

__all__ = [
    # Registry
    "AgentCapability",
    "AgentInfo",
    "AgentStatus",
    "AgentRegistry",
    # Event Bus
    "EventBus",
    "Event",
    "EventHandler",
    "AgentEvent",
    "SystemEvent",
    "TaskEvent",
    # Health Monitor
    "HealthMonitor",
    "HealthCheckResult",
    "HealthStatus",
    "AgentHeartbeat",
    # Config
    "AgentTeamConfig",
    "AgentConfig",
    "TeamPolicy",
    "load_team_config",
    "save_team_config",
    # Coordinator
    "TeamCoordinator",
    "TeamCoordinationResult",
    "TaskAssignment",
]
