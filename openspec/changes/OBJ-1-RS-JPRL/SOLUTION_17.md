# Solution for Task: **Task 3**: Integrate repair mechanism into existing `_plan_actions` method by wrapping json.loads() calls in try-except blocks and implementing fallback logic.

Here is the concrete implementation plan for **Task 3** of Change ID **OBJ-1-RS-JPRL**.

### 1. File Paths

*   **File to Modify**: `geometry/os/agents/implementation_agent.py`
    *   *Action*: Update the `_plan_actions` method to wrap JSON parsing in a `try-except` block and call the new repair method on failure.

*   **File to Modify**: `geometry/os/agents/implementation_agent.py` (Class: `ImplementationAgent`)
    *   *Action*: Implement the `_repair_json_with_llm` method (referenced as `repair_malformed` in the design) to handle the LLM fallback logic.

### 2. Code Implementation

#### A. New Method: `_repair_json_with_llm`
*Location: Inside `ImplementationAgent` class in `implementation_agent.py`*

This method handles the logic of constructing a prompt to ask the LLM to fix its own output, with retries and timeouts.

```python
import json
import time
from typing import Optional, Dict, Any

# ... existing imports ...

class ImplementationAgent:
    # ... existing code ...

    def _repair_json_with_llm(self, malformed_json: str, max_retries: int = 2) -> Optional[Dict[str, Any]]:
        """
        Attempts to repair malformed JSON strings by querying the LLM.
        
        Args:
            malformed_json (str): The raw string that failed to parse.
            max_retries (int): Number of times to retry the LLM call.
            
        Returns:
            Optional[Dict[str, Any]]: The parsed JSON dictionary if successful, else None.
        """
        repair_prompt = f"""
        The following JSON data is malformed or corrupted. 
        Please analyze the syntax errors and return the corrected, valid JSON object.
        Ensure no markdown formatting (like ```json) is used, return the raw JSON string only.
        
        Malformed Data:
        {malformed_json}
        """
        
        for attempt in range(max_retries):
            try:
                # Use the existing LLM interface from the agent instance
                # Assuming self.llm is the interface and .generate is the method
                response = self.llm.generate(
                    prompt=repair_prompt,
                    temperature=0.0,  # Low temperature for deterministic repair
                    timeout=10.0      # Timeout to prevent hanging
                )
                
                if response:
                    # Attempt to parse the repaired response
                    return json.loads(response)
                    
            except json.JSONDecodeError:
                # If the LLM returned bad JSON again, retry
                time.sleep(1)
                continue
            except Exception as e:
                # Log API errors (Timeout, Connection, etc.)
                print(f"LLM Repair API Error: {e}")
                break
                
        return None
```

#### B. Modified Method: `_plan_actions`
*Location: Inside `ImplementationAgent` class in `implementation_agent.py`*

This integrates the repair mechanism into the standard workflow.

```python
    def _plan_actions(self, thought_process: str) -> List[Action]:
        """
        Generates a list of actions based on the current thought process.
        Integrates resilient JSON parsing with LLM fallback.
        """
        # 1. Generate raw content from LLM
        raw_response = self.llm.generate(
            prompt=self._construct_planning_prompt(thought_process),
            temperature=0.7
        )
        
        # 2. Initial Parse Attempt
        try:
            data = json.loads(raw_response)
            # Validate specific schema if necessary
            return self._instantiate_actions(data)
            
        except json.JSONDecodeError as e:
            print(f"Initial JSON parsing failed: {e}. Attempting LLM repair...")
            
            # 3. Fallback: Repair Mechanism
            repaired_data = self._repair_json_with_llm(raw_response)
            
            if repaired_data:
                print("JSON successfully repaired via LLM.")
                return self._instantiate_actions(repaired_data)
            else:
                # 4. Critical Failure
                raise ValueError(f"Failed to parse and repair JSON response. Original error: {e}")
```

### 3. Next Step

**Command:** Run the unit tests to verify the integration.

```bash
python -m pytest tests/unit/test_implementation_agent.py -v -k "test_plan_actions" 
```

*(Note: If the test file does not exist, you may need to create `tests/unit/test_implementation_agent.py` and mock the LLM responses to simulate a malformed JSON string to ensure the fallback logic triggers correctly.)*