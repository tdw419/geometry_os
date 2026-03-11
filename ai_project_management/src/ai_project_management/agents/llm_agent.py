from dataclasses import dataclass


@dataclass
class LLMAgent:
    """Agent powered by a Large Language Model."""
    agent_id: str
    name: str
    model: str = "default"
