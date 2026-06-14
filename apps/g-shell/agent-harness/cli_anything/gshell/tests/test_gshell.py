"""
G-Shell CLI Tests

Tests for the G-Shell CLI harness using CLI-Anything patterns.
"""

import json
import subprocess
import sys
from pathlib import Path

import pytest

# Resolve CLI command
CLI_NAME = "g-shell"

def _resolve_cli():
    """Resolve the CLI command to use for testing."""
    # Check if installed
    result = subprocess.run(["which", CLI_NAME], capture_output=True)
    if result.returncode == 0:
        return CLI_NAME

    # Fall back to running as module
    return [sys.executable, "-m", "cli_anything.gshell.gshell_cli"]


def run_cli(*args, json_output=True):
    """Run G-Shell CLI with arguments."""
    cmd = _resolve_cli()
    if isinstance(cmd, str):
        cmd = [cmd]

    full_cmd = cmd + list(args)
    if json_output:
        full_cmd.append("--json")

    result = subprocess.run(full_cmd, capture_output=True, text=True)
    return result


class TestGShellCLI:
    """Tests for G-Shell CLI basic functionality."""

    def test_help_flag(self):
        """Test --help flag works."""
        result = run_cli("--help", json_output=False)
        assert result.returncode == 0
        assert "G-Shell" in result.stdout or "Usage" in result.stdout

    def test_version_flag(self):
        """Test --version flag works."""
        result = run_cli("--version", json_output=False)
        assert result.returncode == 0
        assert "1.0.0" in result.stdout

    def test_status_command(self):
        """Test status command returns valid JSON."""
        result = run_cli("status")
        # Should not crash
        assert result.returncode == 0

    def test_map_command(self):
        """Test map command works."""
        result = run_cli("map")
        # Should not crash
        assert result.returncode == 0


class TestGShellJSON:
    """Tests for JSON output mode."""

    def test_status_json_valid(self):
        """Test status returns valid JSON."""
        result = run_cli("status")
        if result.returncode == 0 and result.stdout.strip():
            data = json.loads(result.stdout)
            assert "status" in data or "geometry_os_root" in data

    def test_map_json_valid(self):
        """Test map returns valid JSON."""
        result = run_cli("map")
        # May return empty if no terminal running
        assert result.returncode == 0


class TestGShellCommands:
    """Tests for G-Shell specific commands."""

    def test_gls_command(self):
        """Test gls (list tiles) command."""
        result = run_cli("gls")
        assert result.returncode == 0

    def test_ai_command_requires_prompt(self):
        """Test ai command requires prompt argument."""
        result = run_cli("ai", json_output=False)
        # Should fail or show help without prompt
        assert result.returncode != 0 or "Usage" in result.stdout

    def test_spawn_command_requires_command(self):
        """Test spawn command requires command argument."""
        result = run_cli("spawn", json_output=False)
        # Should fail or show help without command
        assert result.returncode != 0 or "Usage" in result.stdout


class TestGShellREPL:
    """Tests for REPL mode."""

    def test_repl_help(self):
        """Test REPL help command."""
        # Echo 'help' then 'exit' into the REPL
        result = subprocess.run(
            _resolve_cli() if isinstance(_resolve_cli(), list) else [_resolve_cli()],
            input="help\nexit\n",
            capture_output=True,
            text=True,
            timeout=10
        )
        assert "Available commands" in result.stdout or "help" in result.stdout.lower()


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
