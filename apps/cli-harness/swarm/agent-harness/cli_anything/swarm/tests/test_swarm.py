"""
Swarm CLI Tests
"""

import json
import subprocess
import sys
from pathlib import Path


def run_command(args):
    """Run a g-swarm command and return the result"""
    cmd = [sys.executable, "-m", "cli_anything.swarm.swarm_cli"] + args
    result = subprocess.run(
        cmd, capture_output=True, text=True, cwd=Path(__file__).parent.parent.parent
    )
    return result


def test_help():
    """Test that help works"""
    result = run_command(["--help"])
    assert result.returncode == 0
    assert "Geometry OS Swarm CLI" in result.stdout


def test_status():
    """Test status command"""
    result = run_command(["status"])
    assert result.returncode == 0

    # Test JSON output
    result_json = run_command(["--json", "status"])
    assert result_json.returncode == 0
    data = json.loads(result_json.stdout)
    assert "swarm" in data
    assert data["swarm"]["status"] == "running"


def test_agents():
    """Test agents command"""
    result = run_command(["agents"])
    assert result.returncode == 0

    # Test JSON output
    result_json = run_command(["--json", "agents"])
    assert result_json.returncode == 0
    data = json.loads(result_json.stdout)
    assert "swarm" in data
    assert "agents" in data["swarm"]


def test_guilds():
    """Test guilds command"""
    result = run_command(["guilds"])
    assert result.returncode == 0

    # Test JSON output
    result_json = run_command(["--json", "guilds"])
    assert result_json.returncode == 0
    data = json.loads(result_json.stdout)
    assert "swarm" in data
    assert "guilds" in data["swarm"]


def test_spawn():
    """Test spawn command"""
    result = run_command(["spawn", "reasoning", "--guild", "cognitive", "--priority", "high"])
    assert result.returncode == 0

    # Test JSON output
    result_json = run_command(["--json", "spawn", "reasoning", "--guild", "cognitive"])
    assert result_json.returncode == 0
    data = json.loads(result_json.stdout)
    assert "swarm" in data
    assert data["swarm"]["action"] == "spawn"


def test_kill():
    """Test kill command"""
    result = run_command(["kill", "agent_001"])
    assert result.returncode == 0

    # Test JSON output
    result_json = run_command(["--json", "kill", "agent_001"])
    assert result_json.returncode == 0
    data = json.loads(result_json.stdout)
    assert "swarm" in data
    assert data["swarm"]["action"] == "kill"


def test_migrate():
    """Test migrate command"""
    result = run_command(["migrate", "agent_001", "sensory"])
    assert result.returncode == 0

    # Test JSON output
    result_json = run_command(["--json", "migrate", "agent_001", "sensory"])
    assert result_json.returncode == 0
    data = json.loads(result_json.stdout)
    assert "swarm" in data
    assert data["swarm"]["action"] == "migrate"


def test_broadcast():
    """Test broadcast command"""
    result = run_command(["broadcast", "Hello swarm!"])
    assert result.returncode == 0

    # Test JSON output
    result_json = run_command(["--json", "broadcast", "Hello swarm!"])
    assert result_json.returncode == 0
    data = json.loads(result_json.stdout)
    assert "swarm" in data
    assert data["swarm"]["action"] == "broadcast"


def test_metrics():
    """Test metrics command"""
    result = run_command(["metrics"])
    assert result.returncode == 0

    # Test JSON output
    result_json = run_command(["--json", "metrics"])
    assert result_json.returncode == 0
    data = json.loads(result_json.stdout)
    assert "swarm" in data
    assert "performance_metrics" in data["swarm"]


if __name__ == "__main__":
    test_help()
    test_status()
    test_agents()
    test_guilds()
    test_spawn()
    test_kill()
    test_migrate()
    test_broadcast()
    test_metrics()
    print("All tests passed!")
