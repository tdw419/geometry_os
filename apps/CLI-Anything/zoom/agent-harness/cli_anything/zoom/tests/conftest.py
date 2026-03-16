"""Pytest configuration for Zoom CLI tests.

Adds the agent-harness directory to sys.path so that cli_anything.zoom
can be imported when running tests from the repo root.
"""

import sys
from pathlib import Path

# Add the agent-harness directory to sys.path
agent_harness_dir = Path(__file__).parent.parent.parent.parent.resolve()
if str(agent_harness_dir) not in sys.path:
    sys.path.insert(0, str(agent_harness_dir))
