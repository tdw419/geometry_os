"""Gather system context for geos chat."""

import json
from pathlib import Path
from typing import Any


def gather_system_context() -> dict[str, Any]:
    """
    Gather current system state for chat context.

    Returns:
        Dictionary with cycle, agents, mutations, fractures, etc.
    """
    context = {
        "cycle": "Unknown",
        "agents": 0,
        "mutations": 0,
        "fractures": 0,
        "dopamine": 0.0,
        "acetylcholine": 0.0,
    }

    # Read Sisyphus checkpoint
    checkpoint_path = Path(".loop/checkpoint.json")
    if checkpoint_path.exists():
        try:
            with open(checkpoint_path) as f:
                state = json.load(f)
            context["cycle"] = state.get("cycle", "Unknown")
            context["task_name"] = state.get("task_name", "Unknown")
        except Exception:
            pass

    # Read evolution daemon state
    evolution_path = Path(".geometry/evolution_state.json")
    if evolution_path.exists():
        try:
            with open(evolution_path) as f:
                state = json.load(f)
            context["mutations"] = state.get("pending_mutations", 0)
            context["fractures"] = state.get("fractures", 0)
            context["dopamine"] = state.get("dopamine", 0.0)
            context["acetylcholine"] = state.get("acetylcholine", 0.0)
        except Exception:
            pass

    # Count active agents from districts
    districts_path = Path(".geometry/districts.json")
    if districts_path.exists():
        try:
            with open(districts_path) as f:
                districts = json.load(f)
            if isinstance(districts, list):
                context["agents"] = sum(len(d.get("agents", [])) for d in districts if isinstance(d, dict))
        except Exception:
            pass

    return context
