# Solution for Task: **Task 1**: **Goal**: Phase 1: Add a Validation and Retry Loop

Here is the implementation plan for **Phase 1: Add a Validation and Retry Loop**.

### 1. File Paths

*   **Modify:** `systems/roadmap/change_generator.py`
    *   Update `_get_system_prompt` to include strict JSON syntax instructions.
    *   Update `_decompose_phase` to implement the JSON validation and retry logic.
*   **Modify:** `systems/roadmap/test_basic.py`
    *   Update `test_change_generator` to mock invalid JSON responses and verify the retry mechanism.

---

### 2. Code Snippets

#### A. Update `systems/roadmap/change_generator.py`

**1. Update `_get_system_prompt`**
Add explicit JSON formatting instructions to the system prompt to prevent errors before they happen.

```python
    def _get_system_prompt(self) -> str:
        base_prompt = "You are an expert software architect..."
        
        # Add explicit JSON instruction
        json_instruction = """
        
        CRITICAL OUTPUT FORMAT:
        Your response must contain a valid JSON object enclosed in triple backticks (```json ... ```).
        - Ensure all keys and string values are enclosed in DOUBLE quotes.
        - Do not use trailing commas.
        - Ensure the JSON is well-formed and can be parsed by standard JSON parsers.
        """
        
        return base_prompt + json_instruction
```

**2. Update `_decompose_phase`**
Implement the try/except block and the retry loop.

```python
import json
import re
from json.decoder import JSONDecodeError

# ... inside class ChangeGenerator ...

    def _decompose_phase(self, phase_description: str) -> List[dict]:
        prompt = f"Decompose this phase into tasks: {phase_description}"
        
        max_retries = 2
        attempt = 0
        
        while attempt <= max_retries:
            response = self.bridge.generate_completion(prompt)
            
            # 1. Extract JSON string using Regex
            match = re.search(r'```json\s*(.*?)\s*```', response, re.DOTALL)
            if not match:
                # Fallback if regex fails completely
                return self._fallback_decompose(phase_description) 
                
            json_str = match.group(1)

            # 2. Validate JSON
            try:
                data = json.loads(json_str)
                return data # Success
                
            except JSONDecodeError as e:
                # 3. Handle Error & Retry
                if attempt < max_retries:
                    attempt += 1
                    # Construct a specific error prompt for the AI
                    error_msg = f"Error: {e.msg} at line {e.lineno} column {e.colno}."
                    prompt = f"""
                    The previous JSON output was invalid: {error_msg}
                    Original Request: {phase_description}
                    Invalid JSON: {json_str}
                    
                    Please fix the JSON syntax and try again. Ensure valid double quotes.
                    """
                    continue # Loop again
                else:
                    # Retries exhausted
                    print(f"JSON validation failed after {max_retries} retries. Using fallback.")
                    return self._fallback_decompose(phase_description)

        return self._fallback_decompose(phase_description)
```

#### B. Update `systems/roadmap/test_basic.py`

**Update `test_change_generator`**
This test mocks the `LMStudioBridge` to simulate a "bad" JSON response followed by a "good" one.

```python
from unittest.mock import Mock, patch
import json

# ... inside test_basic.py ...

def test_change_generator_with_retry(self):
    # Setup
    bridge_mock = Mock()
    generator = ChangeGenerator(bridge_mock)
    
    # Define responses: First is broken JSON, second is fixed JSON
    invalid_json = "```json\n { 'tasks': [ { 'name': 'Fix quotes' } ] } \n```" # Single quotes error
    valid_json = "```json\n { \"tasks\": [ { \"name\": \"Fix quotes\" } ] } \n```"
    
    bridge_mock.generate_completion.side_effect = [invalid_json, valid_json]
    
    # Execute
    result = generator._decompose_phase("Implement Phase 1")
    
    # Assert
    # 1. It should have called the bridge twice (initial try + 1 retry)
    assert bridge_mock.generate_completion.call_count == 2
    
    # 2. The final result should be the parsed valid JSON
    assert result == json.loads(valid_json)
    
    # 3. Verify the second prompt (the retry request) contained the error context
    second_call_prompt = bridge_mock.generate_completion.call_args_list[1][0][0]
    assert "JSON output was invalid" in second_call_prompt
    assert "Fix the JSON syntax" in second_call_prompt
```

---

### 3. Next Step

**Command:** Apply the changes to `_decompose_phase` in `systems/roadmap/change_generator.py` and run the updated unit tests to verify the retry logic works as expected.

```bash
# Run the specific test file to verify implementation
python -m pytest systems/roadmap/test_basic.py -k test_change_generator -v
```