# Solution for Task: **Task 1**: Design and implement `_repair_json_with_llm` method in ImplementationAgent class with proper error handling for both LLM API calls (retries, timeouts) and parsing failures.

Here is the implementation plan for **Change OBJ-1-RS-JPRL**, focusing on the `_repair_json_with_llm` method within the `ImplementationAgent` class.

### 1. File Paths

*   **`src/agents/implementation_agent.py`** (or equivalent module path)
    *   *Action*: Modify. Add the `_repair_json_with_llm` method and update the JSON parsing logic within the `ImplementationAgent` class.

### 2. Implementation Code

Below is the Python code snippet required to implement the robust JSON repair logic.

```python
import json
import logging
from typing import Optional, Any
from tenacity import retry, stop_after_attempt, wait_exponential, retry_if_exception_type

# Placeholder for actual LLM client exceptions (adjust based on your specific framework, e.g., OpenAI, Anthropic)
class LLMAPIClientError(Exception):
    """Base class for LLM API errors."""
    pass

class LLMRateLimitError(LLMAPIClientError):
    """Specific error for rate limiting."""
    pass

class ImplementationAgent:
    def __init__(self):
        # Initialize logger
        self.logger = logging.getLogger(__name__)
        # Assuming the agent has access to an LLM client instance
        self.llm_client = None 

    def _get_repair_prompt(self, malformed_json: str) -> str:
        """
        Generates the prompt template for the LLM to fix JSON.
        """
        return f"""
        The following string was supposed to be valid JSON but contains syntax errors or formatting issues.
        Your task is to analyze the input, identify the errors, and return the corrected, valid JSON string.
        
        Constraints:
        1. Return ONLY the raw JSON string. Do not include markdown formatting (like ```json).
        2. Do not include any explanations or conversational text.
        3. Ensure all brackets, braces, and quotes are properly closed and escaped.
        
        Malformed Input:
        {malformed_json}
        
        Repaired JSON:
        """

    @retry(
        stop=stop_after_attempt(3),
        wait=wait_exponential(multiplier=1, min=2, max=10),
        retry=retry_if_exception_type((LLMAPIClientError, LLMRateLimitError)),
        reraise=True
    )
    def _call_llm_for_repair(self, prompt: str) -> str:
        """
        Internal method to handle the LLM API call with Tenacity retries.
        """
        try:
            # Hypothetical LLM call. Replace with actual implementation (e.g., self.llm_client.generate)
            response = self.llm_client.generate(
                prompt=prompt,
                temperature=0.0, # Low temperature for deterministic repair
                max_tokens=2000
            )
            return response.strip()
        except Exception as e:
            self.logger.error(f"LLM API Call failed: {e}")
            # Convert to custom exception for retry handling if necessary
            raise LLMAPIClientError(f"Failed to fetch repair: {e}")

    def _repair_json_with_llm(self, json_str: str) -> Optional[dict]:
        """
        Attempts to repair a malformed JSON string using an LLM.
        
        Args:
            json_str (str): The malformed JSON string.
            
        Returns:
            Optional[dict]: The parsed dictionary if repair succeeds, None otherwise.
        """
        self.logger.warning("Attempting to repair malformed JSON via LLM.")
        
        try:
            prompt = self._get_repair_prompt(json_str)
            
            # 1. Call LLM with retries
            repaired_content = self._call_llm_for_repair(prompt)
            
            # 2. Post-processing to strip markdown code blocks if present
            if repaired_content.startswith("```json"):
                repaired_content = repaired_content.replace("```json", "").strip()
            elif repaired_content.startswith("```"):
                repaired_content = repaired_content.replace("```", "").strip()
                
            # 3. Parse the repaired string
            try:
                data = json.loads(repaired_content)
                self.logger.info("Successfully repaired and parsed JSON.")
                return data
            except json.JSONDecodeError as e:
                self.logger.error(f"LLM returned invalid JSON again: {repaired_content[:100]}... Error: {e}")
                return None

        except Exception as e:
            # Catch-all for unexpected failures during the repair process
            self.logger.error(f"Critical failure during JSON repair process: {e}")
            return None

    # Example usage wrapper
    def safe_parse(self, input_str: str) -> Optional[Any]:
        try:
            return json.loads(input_str)
        except json.JSONDecodeError:
            return self._repair_json_with_llm(input_str)
```

### 3. Next Step

**Command:**
Create (or modify) the file `src/agents/implementation_agent.py` and paste the `_repair_json_with_llm` method and its helper functions into the `ImplementationAgent` class definition. Ensure the `tenacity` library is added to your project's dependencies (e.g., `pip install tenacity`).