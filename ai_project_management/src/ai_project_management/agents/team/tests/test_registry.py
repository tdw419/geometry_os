"""Tests for agent registry."""

import pytest
import asyncio
from datetime import datetime, timedelta

from ai_project_management.agents.team.registry import (
    AgentRegistry,
    AgentInfo,
    AgentStatus,
    AgentCapability,
)


class TestAgentInfo:
    """Tests for AgentInfo dataclass."""

    def test_agent_info_creation(self):
        """Test creating agent info."""
        agent = AgentInfo(
            agent_id="test_agent",
            name="Test Agent",
            agent_type="test",
            capabilities={AgentCapability.CODE_GENERATION, AgentCapability.LLM_INFERENCE},
        )

        assert agent.agent_id == "test_agent"
        assert agent.name == "Test Agent"
        assert agent.agent_type == "test"
        assert len(agent.capabilities) == 2
        assert agent.status == AgentStatus.AVAILABLE
        assert agent.is_available

    def test_is_available_with_busy_status(self):
        """Test is_available returns False when busy."""
        agent = AgentInfo(
            agent_id="test",
            name="Test",
            agent_type="test",
            capabilities={AgentCapability.CODE_GENERATION},
            status=AgentStatus.BUSY,
        )

        assert not agent.is_available

    def test_is_available_at_max_capacity(self):
        """Test is_available returns False at max capacity."""
        agent = AgentInfo(
            agent_id="test",
            name="Test",
            agent_type="test",
            capabilities={AgentCapability.CODE_GENERATION},
            max_concurrent_tasks=2,
            current_tasks=2,
        )

        assert not agent.is_available

    def test_is_available_with_low_health(self):
        """Test is_available returns False with low health."""
        agent = AgentInfo(
            agent_id="test",
            name="Test",
            agent_type="test",
            capabilities={AgentCapability.CODE_GENERATION},
            health_score=0.3,
        )

        assert not agent.is_available

    def test_utilization_calculation(self):
        """Test utilization calculation."""
        agent = AgentInfo(
            agent_id="test",
            name="Test",
            agent_type="test",
            capabilities={AgentCapability.CODE_GENERATION},
            max_concurrent_tasks=4,
            current_tasks=2,
        )

        assert agent.utilization == 0.5

    def test_utilization_with_zero_max_tasks(self):
        """Test utilization with zero max_tasks."""
        agent = AgentInfo(
            agent_id="test",
            name="Test",
            agent_type="test",
            capabilities={AgentCapability.CODE_GENERATION},
            max_concurrent_tasks=0,
        )

        assert agent.utilization == 1.0

    def test_success_rate_with_no_tasks(self):
        """Test success rate with no tasks."""
        agent = AgentInfo(
            agent_id="test",
            name="Test",
            agent_type="test",
            capabilities={AgentCapability.CODE_GENERATION},
        )

        assert agent.success_rate == 1.0

    def test_success_rate_with_tasks(self):
        """Test success rate calculation."""
        agent = AgentInfo(
            agent_id="test",
            name="Test",
            agent_type="test",
            capabilities={AgentCapability.CODE_GENERATION},
            total_tasks=10,
            completed_tasks=8,
            failed_tasks=2,
        )

        assert agent.success_rate == 0.8

    def test_can_handle_capability(self):
        """Test capability checking."""
        agent = AgentInfo(
            agent_id="test",
            name="Test",
            agent_type="test",
            capabilities={AgentCapability.CODE_GENERATION, AgentCapability.TESTING},
        )

        assert agent.can_handle_capability(AgentCapability.CODE_GENERATION)
        assert not agent.can_handle_capability(AgentCapability.KERNEL_DEVELOPMENT)

    def test_can_handle_capabilities(self):
        """Test multiple capabilities checking."""
        agent = AgentInfo(
            agent_id="test",
            name="Test",
            agent_type="test",
            capabilities={AgentCapability.CODE_GENERATION, AgentCapability.TESTING, AgentCapability.REVIEW},
        )

        assert agent.can_handle_capabilities({
            AgentCapability.CODE_GENERATION,
            AgentCapability.TESTING,
        })
        assert not agent.can_handle_capabilities({
            AgentCapability.CODE_GENERATION,
            AgentCapability.KERNEL_DEVELOPMENT,
        })

    def test_update_metrics_success(self):
        """Test metrics update on success."""
        agent = AgentInfo(
            agent_id="test",
            name="Test",
            agent_type="test",
            capabilities={AgentCapability.CODE_GENERATION},
        )

        agent.update_metrics(success=True, duration=5.0)

        assert agent.total_tasks == 1
        assert agent.completed_tasks == 1
        assert agent.failed_tasks == 0
        assert agent.average_task_duration == 5.0
        assert agent.consecutive_failures == 0

    def test_update_metrics_failure(self):
        """Test metrics update on failure."""
        agent = AgentInfo(
            agent_id="test",
            name="Test",
            agent_type="test",
            capabilities={AgentCapability.CODE_GENERATION},
        )

        agent.update_metrics(success=False, duration=3.0)

        assert agent.total_tasks == 1
        assert agent.completed_tasks == 0
        assert agent.failed_tasks == 1
        assert agent.consecutive_failures == 1
        assert agent.error_count == 1

    def test_update_metrics_averaging(self):
        """Test average duration calculation."""
        agent = AgentInfo(
            agent_id="test",
            name="Test",
            agent_type="test",
            capabilities={AgentCapability.CODE_GENERATION},
            average_task_duration=10.0,
        )

        agent.update_metrics(success=True, duration=5.0)

        # EMA: 10.0 * 0.9 + 5.0 * 0.1 = 9.5
        assert agent.average_task_duration == 9.5

    def test_heartbeat_updates_timestamps(self):
        """Test heartbeat updates timestamps."""
        agent = AgentInfo(
            agent_id="test",
            name="Test",
            agent_type="test",
            capabilities={AgentCapability.CODE_GENERATION},
            last_heartbeat=None,
        )

        before = datetime.utcnow()
        agent.heartbeat()
        after = datetime.utcnow()

        assert agent.last_heartbeat is not None
        assert before <= agent.last_heartbeat <= after


class TestAgentRegistry:
    """Tests for AgentRegistry."""

    def test_register_new_agent(self):
        """Test registering a new agent."""
        registry = AgentRegistry()

        agent = registry.register(
            agent_id="test_agent",
            name="Test Agent",
            agent_type="test",
            capabilities=[AgentCapability.CODE_GENERATION],
        )

        assert agent.agent_id == "test_agent"
        assert registry.get("test_agent") == agent

    def test_register_duplicate_updates(self):
        """Test registering duplicate agent updates existing."""
        registry = AgentRegistry()

        registry.register(
            agent_id="test",
            name="Old Name",
            agent_type="test",
            capabilities=[AgentCapability.CODE_GENERATION],
        )

        agent = registry.register(
            agent_id="test",
            name="New Name",
            agent_type="test",
            capabilities=[AgentCapability.CODE_GENERATION, AgentCapability.TESTING],
        )

        assert agent.name == "New Name"
        assert len(agent.capabilities) == 2

    def test_unregister_agent(self):
        """Test unregistering an agent."""
        registry = AgentRegistry()

        registry.register(
            agent_id="test",
            name="Test",
            agent_type="test",
            capabilities=[AgentCapability.CODE_GENERATION],
        )

        assert registry.unregister("test") is True
        assert registry.get("test") is None
        assert registry.unregister("test") is False

    def test_get_by_status(self):
        """Test getting agents by status."""
        registry = AgentRegistry()

        registry.register("a1", "Agent 1", "test", [AgentCapability.CODE_GENERATION])
        registry.register("a2", "Agent 2", "test", [AgentCapability.CODE_GENERATION])

        registry.update_status("a1", AgentStatus.BUSY)

        available = registry.get_by_status(AgentStatus.AVAILABLE)
        busy = registry.get_by_status(AgentStatus.BUSY)

        assert len(available) == 1
        assert len(busy) == 1
        assert available[0].agent_id == "a2"
        assert busy[0].agent_id == "a1"

    def test_get_by_type(self):
        """Test getting agents by type."""
        registry = AgentRegistry()

        registry.register("a1", "Agent 1", "type_a", [AgentCapability.CODE_GENERATION])
        registry.register("a2", "Agent 2", "type_b", [AgentCapability.CODE_GENERATION])
        registry.register("a3", "Agent 3", "type_a", [AgentCapability.TESTING])

        type_a = registry.get_by_type("type_a")
        type_b = registry.get_by_type("type_b")

        assert len(type_a) == 2
        assert len(type_b) == 1

    def test_get_by_capability(self):
        """Test getting agents by capability."""
        registry = AgentRegistry()

        registry.register("a1", "Agent 1", "test", [AgentCapability.CODE_GENERATION])
        registry.register("a2", "Agent 2", "test", [AgentCapability.TESTING])
        registry.register("a3", "Agent 3", "test", [
            AgentCapability.CODE_GENERATION,
            AgentCapability.TESTING,
        ])

        code_gen = registry.get_by_capability(AgentCapability.CODE_GENERATION)
        testing = registry.get_by_capability(AgentCapability.TESTING)

        assert len(code_gen) == 2
        assert len(testing) == 2

    def test_get_available(self):
        """Test getting available agents."""
        registry = AgentRegistry()

        registry.register("a1", "Agent 1", "test", [AgentCapability.CODE_GENERATION])
        registry.register("a2", "Agent 2", "test", [AgentCapability.CODE_GENERATION])
        registry.register("a3", "Agent 3", "test", [AgentCapability.CODE_GENERATION])

        registry.update_status("a1", AgentStatus.BUSY)
        registry.update_status("a3", AgentStatus.OFFLINE)

        available = registry.get_available()

        assert len(available) == 1
        assert available[0].agent_id == "a2"

    def test_get_available_with_capability_filter(self):
        """Test getting available agents with capability filter."""
        registry = AgentRegistry()

        registry.register("a1", "Agent 1", "test", [AgentCapability.CODE_GENERATION])
        registry.register("a2", "Agent 2", "test", [AgentCapability.TESTING])
        registry.register("a3", "Agent 3", "test", [
            AgentCapability.CODE_GENERATION,
            AgentCapability.TESTING,
        ])

        registry.update_status("a3", AgentStatus.BUSY)

        available = registry.get_available(AgentCapability.CODE_GENERATION)

        assert len(available) == 1
        assert available[0].agent_id == "a1"

    def test_find_best_agent(self):
        """Test finding the best agent for capabilities."""
        registry = AgentRegistry()

        registry.register("a1", "Agent 1", "test", [
            AgentCapability.CODE_GENERATION,
            AgentCapability.TESTING,
        ])
        registry.register("a2", "Agent 2", "test", [
            AgentCapability.CODE_GENERATION,
            AgentCapability.TESTING,
            AgentCapability.REVIEW,
        ])

        # Both agents have the capabilities, a2 has more
        best = registry.find_best_agent({
            AgentCapability.CODE_GENERATION,
            AgentCapability.TESTING,
        })

        assert best is not None
        # Both qualify, selection depends on sorting

    def test_find_best_agent_with_exclusions(self):
        """Test finding best agent with exclusions."""
        registry = AgentRegistry()

        registry.register("a1", "Agent 1", "test", [AgentCapability.CODE_GENERATION])
        registry.register("a2", "Agent 2", "test", [AgentCapability.CODE_GENERATION])

        best = registry.find_best_agent(
            {AgentCapability.CODE_GENERATION},
            exclude_ids={"a1"},
        )

        assert best is not None
        assert best.agent_id == "a2"

    def test_find_best_agent_no_match(self):
        """Test finding best agent with no matches."""
        registry = AgentRegistry()

        registry.register("a1", "Agent 1", "test", [AgentCapability.CODE_GENERATION])

        best = registry.find_best_agent({AgentCapability.TESTING})

        assert best is None

    def test_update_status(self):
        """Test updating agent status."""
        registry = AgentRegistry()

        registry.register("test", "Test", "test", [AgentCapability.CODE_GENERATION])

        result = registry.update_status("test", AgentStatus.BUSY)

        assert result is True
        assert registry.get("test").status == AgentStatus.BUSY

    def test_update_status_nonexistent_agent(self):
        """Test updating status of nonexistent agent."""
        registry = AgentRegistry()

        result = registry.update_status("nonexistent", AgentStatus.BUSY)

        assert result is False

    def test_record_heartbeat(self):
        """Test recording heartbeat."""
        registry = AgentRegistry()

        registry.register("test", "Test", "test", [AgentCapability.CODE_GENERATION])

        result = registry.record_heartbeat("test")

        assert result is True
        assert registry.get("test").last_heartbeat is not None

    def test_cleanup_stale_agents(self):
        """Test cleaning up stale agents."""
        registry = AgentRegistry(heartbeat_timeout=60.0)

        registry.register("test", "Test", "test", [AgentCapability.CODE_GENERATION])

        # Set heartbeat to past
        old_time = datetime.utcnow() - timedelta(seconds=120)
        registry.get("test").last_heartbeat = old_time

        stale = registry.cleanup_stale()

        assert len(stale) == 1
        assert stale[0] == "test"
        assert registry.get("test").status == AgentStatus.OFFLINE

    def test_get_statistics(self):
        """Test getting registry statistics."""
        registry = AgentRegistry()

        registry.register("a1", "Agent 1", "type_a", [AgentCapability.CODE_GENERATION])
        registry.register("a2", "Agent 2", "type_b", [AgentCapability.TESTING])

        registry.update_status("a1", AgentStatus.BUSY)

        stats = registry.get_statistics()

        assert stats["total_agents"] == 2
        assert stats["available_count"] == 1
        assert stats["by_type"]["type_a"] == 1
        assert stats["by_type"]["type_b"] == 1

    def test_export_import_state(self):
        """Test exporting and importing registry state."""
        registry = AgentRegistry()

        registry.register("test", "Test", "test", [AgentCapability.CODE_GENERATION])

        state = registry.export_state()

        new_registry = AgentRegistry()
        new_registry.import_state(state)

        agent = new_registry.get("test")
        assert agent is not None
        assert agent.name == "Test"
        assert agent.agent_type == "test"
