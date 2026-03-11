"""GEOS CLI commands."""

from geos.commands.status import run as run_status
from geos.commands.chat import run as run_chat
from geos.commands.map import run as run_map
from geos.commands.inspect import run as run_inspect

__all__ = ["run_status", "run_chat", "run_map", "run_inspect"]
