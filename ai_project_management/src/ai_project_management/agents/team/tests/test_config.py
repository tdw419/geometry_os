"""Tests for agent team configuration."""

import pytest
import tempfile
from pathlib import Path

from ai_project_management.agents.team.config import (
    AgentConfig,
    AgentTeamConfig,
    TeamPolicy,
    load_team_config,
    save_team_config,
    create_default_config,
)


class TestAgentConfig:
    """Tests for AgentConfig."""

    def test_agent_config_creation(self):
        """Test creating agent config."""
        config = AgentConfig(
            agent_id="test_agent",
            name="Test Agent",
            agent_type="test",
            capabilities=["code_generation", "testing"],
        )

        assert config.agent_id == "test_agent"
        assert config.name == "Test Agent"
        assert config.agent_type == "test"
        assert config.capabilities == ["code_generation", "testing"]
        assert config.enabled is True
        assert config.max_concurrent_tasks == 1
        assert config.priority == 0

    def test_to_dict(self):
        """Test converting config to dictionary."""
        config = AgentConfig(
            agent_id="test",
            name="Test",
            agent_type="test",
            capabilities=["code_generation"],
            priority=10,
        )

        result = config.to_dict()

        assert result["agent_id"] == "test"
        assert result["priority"] == 10
        assert result["capabilities"] == ["code_generation"]

    def test_from_dict(self):
        """Test creating config from dictionary."""
        data = {
            "agent_id": "test",
            "name": "Test",
            "agent_type": "test",
            "capabilities": ["code_generation"],
            "priority": 5,
        }

        config = AgentConfig.from_dict(data)

        assert config.agent_id == "test"
        assert config.priority == 5

    def test_get_capabilities(self):
        """Test getting capabilities as enums."""
        from ai_project_management.agents.team.registry import AgentCapability

        config = AgentConfig(
            agent_id="test",
            name="Test",
            agent_type="test",
            capabilities=["code_generation", "invalid_capability"],
        )

        caps = config.get_capabilities()

        assert AgentCapability.CODE_GENERATION in caps
        # Invalid capability should be filtered out
        assert len(caps) == 1


class TestAgentTeamConfig:
    """Tests for AgentTeamConfig."""

    def test_config_creation(self):
        """Test creating team config."""
        config = AgentTeamConfig(
            name="test_team",
            description="Test team",
        )

        assert config.name == "test_team"
        assert config.description == "Test team"
        assert config.selection_policy == TeamPolicy.BEST_FIT
        assert config.scaling_policy == TeamPolicy.FIXED
        assert config.failure_policy == TeamPolicy.FAILOVER

    def test_to_dict(self):
        """Test converting config to dictionary."""
        config = AgentTeamConfig(
            name="test",
            selection_policy=TeamPolicy.ROUND_ROBIN,
            max_retries=5,
        )

        result = config.to_dict()

        assert result["name"] == "test"
        assert result["selection_policy"] == "round_robin"
        assert result["max_retries"] == 5

    def test_from_dict(self):
        """Test creating config from dictionary."""
        data = {
            "name": "test",
            "selection_policy": "priority",
            "max_retries": 3,
            "agents": [],
        }

        config = AgentTeamConfig.from_dict(data)

        assert config.name == "test"
        assert config.selection_policy == TeamPolicy.PRIORITY
        assert config.max_retries == 3

    def test_validate_empty_name(self):
        """Test validation rejects empty name."""
        config = AgentTeamConfig(name="")

        errors = config.validate()

        assert "Team name is required" in errors

    def test_validate_negative_retries(self):
        """Test validation rejects negative retries."""
        config = AgentTeamConfig(name="test", max_retries=-1)

        errors = config.validate()

        assert "max_retries must be >= 0" in errors

    def test_validate_invalid_health_check_interval(self):
        """Test validation rejects invalid health check interval."""
        config = AgentTeamConfig(name="test", health_check_interval=0)

        errors = config.validate()

        assert "health_check_interval must be > 0" in errors

    def test_validate_heartbeat_timeout(self):
        """Test validation rejects heartbeat timeout <= check interval."""
        config = AgentTeamConfig(
            name="test",
            health_check_interval=60,
            heartbeat_timeout=30,
        )

        errors = config.validate()

        assert "heartbeat_timeout must be > health_check_interval" in errors

    def test_validate_duplicate_agent_ids(self):
        """Test validation rejects duplicate agent IDs."""
        config = AgentTeamConfig(
            name="test",
            agents=[
                AgentConfig(
                    agent_id="duplicate",
                    name="Agent 1",
                    agent_type="test",
                    capabilities=["code_generation"],
                ),
                AgentConfig(
                    agent_id="duplicate",
                    name="Agent 2",
                    agent_type="test",
                    capabilities=["code_generation"],
                ),
            ],
        )

        errors = config.validate()

        assert any("Duplicate agent_id: duplicate" in e for e in errors)

    def test_validate_agent_min_max_instances(self):
        """Test validation rejects max < min instances."""
        config = AgentTeamConfig(
            name="test",
            agents=[
                AgentConfig(
                    agent_id="test",
                    name="Test",
                    agent_type="test",
                    capabilities=["code_generation"],
                    min_instances=5,
                    max_instances=3,
                ),
            ],
        )

        errors = config.validate()

        assert any("max_instances must be >= min_instances" in e for e in errors)

    def test_get_agent_config(self):
        """Test getting specific agent config."""
        agent = AgentConfig(
            agent_id="test_agent",
            name="Test",
            agent_type="test",
            capabilities=["code_generation"],
        )
        config = AgentTeamConfig(name="test", agents=[agent])

        result = config.get_agent_config("test_agent")

        assert result is not None
        assert result.agent_id == "test_agent"

    def test_get_agent_config_not_found(self):
        """Test getting non-existent agent config."""
        config = AgentTeamConfig(name="test", agents=[])

        result = config.get_agent_config("nonexistent")

        assert result is None

    def test_get_enabled_agents(self):
        """Test getting enabled agents."""
        agents = [
            AgentConfig(
                agent_id="a1",
                name="Agent 1",
                agent_type="test",
                capabilities=["code_generation"],
                enabled=True,
            ),
            AgentConfig(
                agent_id="a2",
                name="Agent 2",
                agent_type="test",
                capabilities=["code_generation"],
                enabled=False,
            ),
        ]
        config = AgentTeamConfig(name="test", agents=agents)

        enabled = config.get_enabled_agents()

        assert len(enabled) == 1
        assert enabled[0].agent_id == "a1"

    def test_get_agents_by_type(self):
        """Test getting agents by type."""
        agents = [
            AgentConfig(
                agent_id="a1",
                name="Agent 1",
                agent_type="type_a",
                capabilities=["code_generation"],
            ),
            AgentConfig(
                agent_id="a2",
                name="Agent 2",
                agent_type="type_b",
                capabilities=["code_generation"],
            ),
            AgentConfig(
                agent_id="a3",
                name="Agent 3",
                agent_type="type_a",
                capabilities=["code_generation"],
            ),
        ]
        config = AgentTeamConfig(name="test", agents=agents)

        type_a = config.get_agents_by_type("type_a")
        type_b = config.get_agents_by_type("type_b")

        assert len(type_a) == 2
        assert len(type_b) == 1


class TestConfigIO:
    """Tests for config loading/saving."""

    def test_create_default_config(self):
        """Test creating default configuration."""
        config = create_default_config()

        assert config.name == "default_team"
        assert len(config.agents) > 0
        assert "orchestrator" in [a.agent_id for a in config.agents]

    def test_save_and_load_config(self):
        """Test saving and loading configuration."""
        with tempfile.TemporaryDirectory() as tmpdir:
            config_path = Path(tmpdir) / "config.yaml"

            original_config = AgentTeamConfig(
                name="test_team",
                agents=[
                    AgentConfig(
                        agent_id="agent1",
                        name="Agent 1",
                        agent_type="test",
                        capabilities=["code_generation"],
                    )
                ],
            )

            save_team_config(original_config, config_path)
            loaded_config = load_team_config(config_path)

            assert loaded_config.name == original_config.name
            assert len(loaded_config.agents) == len(original_config.agents)
            assert loaded_config.agents[0].agent_id == original_config.agents[0].agent_id

    def test_load_nonexistent_config(self):
        """Test loading non-existent config raises error."""
        with pytest.raises(FileNotFoundError):
            load_team_config(Path("/nonexistent/path/config.yaml"))

    def test_save_invalid_config(self):
        """Test saving invalid config raises error."""
        with tempfile.TemporaryDirectory() as tmpdir:
            config_path = Path(tmpdir) / "config.yaml"

            invalid_config = AgentTeamConfig(name="")  # Empty name

            with pytest.raises(ValueError, match="Invalid config"):
                save_team_config(invalid_config, config_path)
