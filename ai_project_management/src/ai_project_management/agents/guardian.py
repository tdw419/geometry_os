from dataclasses import dataclass
from enum import Enum


class SecurityPolicy(Enum):
    STRICT = "strict"
    PERMISSIVE = "permissive"
    AUDIT_ONLY = "audit"


@dataclass
class GuardianAgent:
    """Agent responsible for security policy enforcement."""
    agent_id: str
    name: str
    policy: SecurityPolicy = SecurityPolicy.STRICT
