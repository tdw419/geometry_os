# Solution for Task: **Task 4**: Define Truth Engine integration protocol for learning patterns and successful repair strategies during self-improvement cycles, enabling future improvements to become more reliable.

Here is the implementation plan for **RSI-001**, focusing on the Truth Engine's role in the recursive self-improvement cycle.

### 1. File Paths

*   `geometry_os/core/truth_engine/learning.py` (New)
    *   Defines the protocol for ingesting repair data and updating the pattern weight database.
*   `geometry_os/core/truth_engine/models.py` (New)
    *   Defines the Pydantic schemas for `RepairStrategy` and `LearningFeedback`.
*   `geometry_os/core/ctrm/tracker.py` (Modified)
    *   Updated to export successful repair data to the Truth Engine upon completion of a roadmap task.

### 2. Code Implementation

#### A. Data Models (`geometry_os/core/truth_engine/models.py`)
We need structured data to transfer repair outcomes to the Truth Engine.

```python
from pydantic import BaseModel, Field
from typing import Dict, Any

class RepairStrategy(BaseModel):
    """
    Captures the specific logic applied to fix a defect.
    """
    agent_id: str
    algorithm_used: str
    parameters: Dict[str, Any] = Field(default_factory=dict)
    code_diff_hash: str

class LearningFeedback(BaseModel):
    """
    The input packet for the Truth Engine to learn from.
    """
    change_id: str
    success: bool
    strategy: RepairStrategy
    execution_metrics: Dict[str, float] # e.g., time_taken, memory_usage
```

#### B. Truth Engine Integration Protocol (`geometry_os/core/truth_engine/learning.py`)
This component receives successful repair data and updates the system's "beliefs," making future similar repairs more likely and reliable.

```python
import json
from typing import List
from .models import LearningFeedback

class TruthEngineLearner:
    def __init__(self, knowledge_base_path: str):
        self.kb_path = knowledge_base_path
        # In-memory representation of learned patterns (Pattern -> Reliability Score)
        self.pattern_weights = self._load_weights()

    def _load_weights(self) -> dict:
        try:
            with open(self.kb_path, 'r') as f:
                return json.load(f)
        except FileNotFoundError:
            return {"repair_patterns": {}}

    def process_repair_cycle(self, feedback: List[LearningFeedback]):
        """
        Main integration point: Ingests results from the CTRM/Evolution loop
        to refine future decision making.
        """
        for item in feedback:
            if item.success:
                self._reinforce_pattern(item.strategy)
            else:
                self._suppress_pattern(item.strategy)
        
        self._persist_weights()

    def _reinforce_pattern(self, strategy: RepairStrategy):
        """
        Increases the reliability weight of a successful repair strategy.
        """
        pattern_key = f"{strategy.algorithm_used}:{strategy.code_diff_hash}"
        
        if pattern_key not in self.pattern_weights["repair_patterns"]:
            self.pattern_weights["repair_patterns"][pattern_key] = 0.0
        
        # Exponential moving average or simple increment for reliability
        current_weight = self.pattern_weights["repair_patterns"][pattern_key]
        self.pattern_weights["repair_patterns"][pattern_key] = min(1.0, current_weight + 0.1)
        
        print(f"[Truth Engine] Learned: Pattern {pattern_key} reliability increased to {self.pattern_weights['repair_patterns'][pattern_key]}")

    def _persist_weights(self):
        with open(self.kb_path, 'w') as f:
            json.dump(self.pattern_weights, f, indent=2)

# Singleton instance for the OS
learner = TruthEngineLearner("/data/truth_engine/pattern_weights.json")
```

### 3. Next Step

To implement the recursive feedback loop, you need to wire the output of the CTRM tracker to the input of the Truth Engine Learner.

**Command:**
Modify the `CTRM` component to call `process_repair_cycle` whenever a roadmap task reaches a `COMPLETED` state.

```bash
# Create the new models file
touch geometry_os/core/truth_engine/models.py

# Create the new learning logic
touch geometry_os/core/truth_engine/learning.py
```