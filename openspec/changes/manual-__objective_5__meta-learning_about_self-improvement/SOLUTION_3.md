# Solution for Task: **Task 1**: **Goal**: # Objective 5: Meta-Learning About Self-Improvement

Here is the implementation plan for **Objective 5: Meta-Learning About Self-Improvement**.

This solution focuses on integrating the specific `CTRM` logging calls into the `JsonRepair` mechanism and setting up the weekly analysis pattern.

### 1. File Paths

*   **`src/core/repair/json_repair.py`** (Modify)
    *   *Reasoning*: This is where the JSON repair logic resides. We need to hook into the `repair` function to emit the logs.
*   **`src/core/meta/learning_loop.py`** (Create)
    *   *Reasoning*: This new module will handle the "Analyze repair patterns weekly" requirement.
*   **`src/core/meta/ctrm_manager.py`** (Modify - assumed existing)
    *   *Reasoning*: Ensures the `log_decision` method accepts the structured data defined in the proposal.

---

### 2. Code Snippets

#### A. Modify `src/core/repair/json_repair.py`
We will update the repair function to track attempts and confidence, then log the outcome to the CTRM manager.

```python
import json
import logging
from typing import Dict, Any, Optional, Tuple
from src.core.meta.ctrm_manager import ctrm_manager

logger = logging.getLogger(__name__)

def attempt_json_repair(json_str: str, error_context: str) -> Tuple[Optional[Dict], bool]:
    """
    Attempts to parse and repair a JSON string.
    Returns (data, repaired_successfully)
    """
    attempts = 0
    repaired = False
    original_error = None
    data = None

    try:
        # Attempt 1: Standard Parse
        data = json.loads(json_str)
        return data, False
    except json.JSONDecodeError as e:
        original_error = str(e)
        attempts += 1
        
        # Attempt 2: Repair Strategy (e.g., stripping trailing commas, fixing quotes)
        # This is a simplified placeholder for the actual repair logic
        try:
            # Example repair logic: replace single quotes with double quotes if malformed
            fixed_str = json_str.replace("'", '"') 
            data = json.loads(fixed_str)
            repaired = True
        except Exception:
            attempts += 1
            # If it fails again, we return the failure

    # --- IMPLEMENTING OBJECTIVE 5: LOGGING ---
    # Log the outcome of the repair process
    ctrm_manager.log_decision(
        event_type="JsonRepairOutcome",
        payload={
            "confidence": 1.0 if repaired else 0.0,
            "original_error": original_error,
            "repair_successful": repaired,
            "repair_attempts": attempts
        },
        outcome_label="success" if repaired else "failed"
    )
    # ---------------------------------------

    return data, repaired
```

#### B. Create `src/core/meta/learning_loop.py`
This module creates the foundation for the weekly analysis task.

```python
import logging
from datetime import datetime
from src.core.meta.ctrm_manager import ctrm_manager

logger = logging.getLogger(__name__)

class WeeklyMetaAnalyzer:
    """
    Analyzes CTRM logs to identify patterns in repair events 
    and suggest prompt improvements.
    """

    def run_weekly_analysis(self):
        logger.info("Starting weekly meta-learning analysis...")
        
        # 1. Fetch recent repair outcomes
        # (Assuming ctrm_manager has a query method)
        repair_logs = ctrm_manager.query_logs(
            event_type="JsonRepairOutcome", 
            lookback_days=7
        )

        if not repair_logs:
            logger.info("No repair logs found for this week.")
            return

        failure_rate = self._calculate_failure_rate(repair_logs)
        error_distribution = self._group_errors_by_type(repair_logs)

        logger.info(f"Weekly Repair Stats | Failure Rate: {failure_rate:.2%}")
        logger.info(f"Top Error Types: {error_distribution}")

        # 2. Determine if prompts need adjustment
        if failure_rate > 0.2: # Threshold: if 20% of repairs fail
            logger.warning("High repair failure rate detected. Flagging base prompt for review.")
            self._flag_prompt_for_review(error_distribution)

    def _calculate_failure_rate(self, logs):
        failures = sum(1 for log in logs if not log.payload.get('repair_successful', False))
        return failures / len(logs) if logs else 0

    def _group_errors_by_type(self, logs):
        # Logic to aggregate 'original_error' strings
        pass

    def _flag_prompt_for_review(self, error_dist):
        # Logic to update a 'roadmap' or 'todo' file
        pass

# Usage: Can be called by a cron job or a system scheduler
# analyzer = WeeklyMetaAnalyzer()
# analyzer.run_weekly_analysis()
```

---

### 3. Next Step

**Command:**
Create the new analysis module file to establish the pattern for weekly reviews.

```bash
mkdir -p src/core/meta
touch src/core/meta/learning_loop.py
```