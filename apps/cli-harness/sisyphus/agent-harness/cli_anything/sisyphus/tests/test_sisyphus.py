"""
Sisyphus Daemon CLI Tests
"""

import json
import subprocess
import sys
from pathlib import Path


def run_command(args):
    """Run a g-sisyphus command and return the result"""
    cmd = [sys.executable, "-m", "cli_anything.sisyphus.sisyphus_cli"] + args
    result = subprocess.run(
        cmd, capture_output=True, text=True, cwd=Path(__file__).parent.parent.parent
    )
    return result


def test_help():
    """Test that help works"""
    result = run_command(["--help"])
    assert result.returncode == 0
    assert "Geometry OS Sisyphus Daemon CLI" in result.stdout


def test_status():
    """Test status command"""
    result = run_command(["status"])
    assert result.returncode == 0

    # Test JSON output
    result_json = run_command(["--json", "status"])
    assert result_json.returncode == 0
    data = json.loads(result_json.stdout)
    assert "sisyphus_daemon" in data
    assert data["sisyphus_daemon"]["status"] == "running"


def test_cycles():
    """Test cycles command"""
    result = run_command(["cycles"])
    assert result.returncode == 0

    # Test JSON output
    result_json = run_command(["--json", "cycles"])
    assert result_json.returncode == 0
    data = json.loads(result_json.stdout)
    assert "sisyphus_daemon" in data
    assert "recent_cycles" in data["sisyphus_daemon"]


def test_trigger():
    """Test trigger command"""
    result = run_command(["trigger"])
    assert result.returncode == 0

    # Test JSON output
    result_json = run_command(["--json", "trigger"])
    assert result_json.returncode == 0
    data = json.loads(result_json.stdout)
    assert "sisyphus_daemon" in data
    assert data["sisyphus_daemon"]["action"] == "trigger_cycle"


def test_optimize():
    """Test optimize command"""
    result = run_command(["optimize"])
    assert result.returncode == 0

    # Test JSON output
    result_json = run_command(["--json", "optimize"])
    assert result_json.returncode == 0
    data = json.loads(result_json.stdout)
    assert "sisyphus_daemon" in data
    assert data["sisyphus_daemon"]["action"] == "optimize"


def test_metrics():
    """Test metrics command"""
    result = run_command(["metrics"])
    assert result.returncode == 0

    # Test JSON output
    result_json = run_command(["--json", "metrics"])
    assert result_json.returncode == 0
    data = json.loads(result_json.stdout)
    assert "sisyphus_daemon" in data
    assert "performance_metrics" in data["sisyphus_daemon"]


def test_goals():
    """Test goals command"""
    result = run_command(["goals"])
    assert result.returncode == 0

    # Test JSON output
    result_json = run_command(["--json", "goals"])
    assert result_json.returncode == 0
    data = json.loads(result_json.stdout)
    assert "sisyphus_daemon" in data
    assert "current_goals" in data["sisyphus_daemon"]


def test_set_goal():
    """Test set-goal command"""
    result = run_command(
        ["set-goal", "--description", "Test goal", "--target", "10%", "--priority", "high"]
    )
    assert result.returncode == 0

    # Test JSON output
    result_json = run_command(
        ["--json", "set-goal", "--description", "Test goal", "--target", "10%"]
    )
    assert result_json.returncode == 0
    data = json.loads(result_json.stdout)
    assert "sisyphus_daemon" in data
    assert data["sisyphus_daemon"]["action"] == "set_goal"


if __name__ == "__main__":
    test_help()
    test_status()
    test_cycles()
    test_trigger()
    test_optimize()
    test_metrics()
    test_goals()
    test_set_goal()
    print("All tests passed!")
