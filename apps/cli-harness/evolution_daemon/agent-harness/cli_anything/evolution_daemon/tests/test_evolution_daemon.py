"""
Evolution Daemon CLI Tests
"""

import json
import subprocess
import sys
from pathlib import Path


def run_command(args):
    """Run a g-evolve command and return the result"""
    cmd = [sys.executable, "-m", "cli_anything.evolution_daemon.evolution_daemon_cli"] + args
    result = subprocess.run(
        cmd, capture_output=True, text=True, cwd=Path(__file__).parent.parent.parent
    )
    return result


def test_help():
    """Test that help works"""
    result = run_command(["--help"])
    assert result.returncode == 0
    assert "Geometry OS Evolution Daemon CLI" in result.stdout


def test_status():
    """Test status command"""
    result = run_command(["status"])
    assert result.returncode == 0

    # Test JSON output
    result_json = run_command(["--json", "status"])
    assert result_json.returncode == 0
    data = json.loads(result_json.stdout)
    assert "evolution_daemon" in data
    assert data["evolution_daemon"]["status"] == "running"


def test_trigger():
    """Test trigger command"""
    result = run_command(["trigger"])
    assert result.returncode == 0

    # Test JSON output
    result_json = run_command(["--json", "trigger"])
    assert result_json.returncode == 0
    data = json.loads(result_json.stdout)
    assert "evolution_daemon" in data
    assert data["evolution_daemon"]["action"] == "trigger_cycle"


def test_mutations():
    """Test mutations command"""
    result = run_command(["mutations"])
    assert result.returncode == 0

    # Test JSON output
    result_json = run_command(["--json", "mutations"])
    assert result_json.returncode == 0
    data = json.loads(result_json.stdout)
    assert "evolution_daemon" in data
    assert "recent_mutations" in data["evolution_daemon"]


def test_config():
    """Test config command"""
    result = run_command(["config"])
    assert result.returncode == 0

    # Test JSON output
    result_json = run_command(["--json", "config"])
    assert result_json.returncode == 0
    data = json.loads(result_json.stdout)
    assert "evolution_daemon" in data
    assert "configuration" in data["evolution_daemon"]


def test_log():
    """Test log command"""
    result = run_command(["log"])
    assert result.returncode == 0

    # Test JSON output
    result_json = run_command(["--json", "log"])
    assert result_json.returncode == 0
    data = json.loads(result_json.stdout)
    assert "evolution_daemon" in data
    assert "recent_logs" in data["evolution_daemon"]


if __name__ == "__main__":
    test_help()
    test_status()
    test_trigger()
    test_mutations()
    test_config()
    test_log()
    print("All tests passed!")
