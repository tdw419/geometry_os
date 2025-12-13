
import time
from typing import List, Dict, Any
from dataclasses import dataclass
from .nexus import Nexus, EdgeType

@dataclass
class trace_step:
    tool: str
    args: Dict
    result: Any
    timestamp: float = 0.0

@dataclass
class Trace:
    """The Atom of Cognition"""
    id: str
    intent: str
    steps: List[trace_step]
    outcome: str
    confidence: float
    verified: bool = False

class Kernel:
    """The Watcher"""
    def __init__(self, nexus: Nexus):
        self.nexus = nexus
        self.event_log = []

    def verify_plan(self, plan_graph: List[trace_step]) -> float:
        """
        G-OS Principle: Verify before Commit.
        L0 Mock: Checks for 'rm -rf' or dangerous keywords.
        """
        risk = 0.0
        for step in plan_graph:
            s_str = str(step)
            if "rm " in s_str or "drop table" in s_str.lower():
                risk += 1.0
        return 1.0 - risk

    def commit_transaction(self, intent: str, steps: List[trace_step], result: str, confidence: float):
        """
        Atomic commit of a Reasoning Trace to the Nexus.
        """
        # 1. Create Trace Node (Linkable in Graph)
        trace_node = self.nexus.ingest(
            content=f"Intent: {intent}\nResult: {result}",
            type="trace",
            metadata={"confidence": confidence}
        )

        # 2. Persist Structural Trace (Retrievable Skill)
        trace_data = {
            "id": trace_node.id,
            "intent": intent,
            "steps": steps,
            "outcome": result,
            "confidence": confidence,
            "verified": True
        }
        self.nexus.db.store_trace(trace_data)

        # 3. Link steps (Causal Edges) in Graph
        prev_node = trace_node
        for step in steps:
            step_node = self.nexus.ingest(
                content=str(step),
                type="trace_step"
            )
            self.nexus.connect(prev_node.id, step_node.id, EdgeType.CAUSAL)
            prev_node = step_node

        self.event_log.append({
            "trace_id": trace_node.id,
            "intent": intent,
            "timestamp": time.time(),
            "verified": True
        })
        
        # Return object for caller convenience
        return Trace(
            id=trace_node.id,
            intent=intent,
            steps=steps,
            outcome=result,
            confidence=confidence,
            verified=True
        )
