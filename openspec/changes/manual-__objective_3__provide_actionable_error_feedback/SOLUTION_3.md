# Solution for Task: **Task 1**: **Goal**: # Objective 3: Provide Actionable Error Feedback

Here is the implementation plan for **Objective 3: Provide Actionable Error Feedback**.

### 1. File Paths
*   **Modify:** `src/geometry_os/planner/planner_engine.py` (or equivalent file handling the planning loop and JSON parsing).
*   **Modify:** `src/geometry_os/core/state_manager.py` (if `context` logic is centralized).

### 2. Implementation Code

We will implement a robust error handling wrapper that categorizes exceptions into the three defined types (Prompt, Model, Logic) and updates the context with the specific guidance required.

```python
import json
import re
from typing import Dict, Any, Tuple

class PlannerError(Exception):
    """Base class for planning errors."""
    pass

def classify_and_update_error(context: Dict[str, Any], error: Exception) -> str:
    """
    Inspects an exception, updates the context['last_error'] with actionable guidance,
    and returns a formatted message.
    """
    error_type = "Unknown"
    root_cause = str(error)
    guidance = "Review logs."

    # 1. Distinguish failure types
    
    # Case A: JSON Extraction Failure (Prompt Structure Issue)
    # Usually happens when the LLM returns text outside the JSON block or malformed markdown.
    if isinstance(error, (ValueError, KeyError)) or "No JSON block found" in str(error) or "Expecting value" in str(error):
        error_type = "Prompt Structure Issue"
        root_cause = "The model response did not contain a valid JSON block."
        guidance = (
            "Action: Adjust the system prompt to enforce strict JSON formatting.\n"
            "Details: The model failed to wrap the action in ```json ... ``` or the output was cut off."
        )

    # Case B: JSON Syntax/Repair Failure (Model Capability Issue)
    # Usually happens when the LLM generates valid JSON, but the schema is wrong or repair logic fails.
    elif "JSON syntax error" in str(error) or "repair failed" in str(error):
        error_type = "Model Capability Issue"
        root_cause = "The model generated invalid JSON syntax that could not be auto-repaired."
        guidance = (
            "Action: Simplify the output schema or switch to a more capable model.\n"
            "Details: The model is struggling to generate valid JSON for this specific prompt complexity."
        )

    # Case C: Invalid Action Structure (Planning Logic Issue)
    # Usually happens when JSON is valid, but missing required fields (e.g., 'command').
    elif "Invalid action structure" in str(error) or "Missing required field" in str(error):
        error_type = "Planning Logic Issue"
        root_cause = "The parsed JSON does not conform to the expected Action schema."
        guidance = (
            "Action: Verify the tool definition schema and few-shot examples in the prompt.\n"
            "Details: The model produced a structure that passes JSON validation but fails internal validation."
        )

    # 2. Update context['last_error'] with specific guidance
    context['last_error'] = (
        f"Planning failed: {error_type}\n"
        f"Root cause: {root_cause}\n"
        f"Guidance: {guidance}"
    )

    return context['last_error']

# --- Integration Example ---

def execute_plan_step(context: Dict[str, Any], llm_response: str):
    """
    Example function integrating the error feedback logic.
    """
    try:
        # 1. Extract JSON
        json_match = re.search(r'```json\s+(.*?)\s+```', llm_response, re.DOTALL)
        if not json_match:
            raise ValueError("No JSON block found in response")
        
        raw_json = json_match.group(1)

        # 2. Parse JSON
        try:
            action_data = json.loads(raw_json)
        except json.JSONDecodeError as e:
            # Try repair or fail
            raise SyntaxError(f"JSON syntax error, repair failed: {e}")

        # 3. Validate Structure
        if "command" not in action_data:
            raise ValueError("Invalid action structure: Missing 'command' field")

        return action_data

    except Exception as e:
        # Handle and classify the error
        feedback = classify_and_update_error(context, e)
        # Log for debugging
        print(f"[Geometry OS] {feedback}") 
        return None
```

### 3. Next Step
Run the following command to create a backup of the current planner engine before applying the changes:

```bash
cp src/geometry_os/planner/planner_engine.py src/geometry_os/planner/planner_engine.py.bak
```