"""Pytest configuration for Zoom CLI tests.

Adds the agent-harness directory to sys.path so that cli_anything.zoom
can be imported when running tests from the repo root.
"""

import sys
from pathlib import Path

import pytest


def pytest_configure(config):
    """Add the agent-harness directory to sys.path before collection."""
    agent_harness_dir = Path(__file__).parent.parent.parent.parent.resolve()
    if str(agent_harness_dir) not in sys.path:
        sys.path.insert(0, str(agent_harness_dir))


# Skip all tests in this directory if cli_anything.zoom is not available
collect_ignore_glob = []
try:
    import cli_anything.zoom  # noqa: F401
except ImportError:
    collect_ignore_glob = ["test_*.py"]
