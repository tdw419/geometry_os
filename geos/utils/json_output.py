"""JSON output formatting utilities."""

import json
from typing import Any


def format_json_output(data: dict[str, Any], sort_keys: bool = False) -> str:
    """
    Format data as JSON string.

    Args:
        data: Dictionary to format
        sort_keys: Whether to sort keys alphabetically

    Returns:
        JSON string representation
    """
    return json.dumps(data, sort_keys=sort_keys, indent=None)