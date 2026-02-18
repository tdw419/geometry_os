# Solution for Task: **Task 2**: Create and document the LLM-based prompt template specifically designed for syntax error correction while preserving original data semantics.

Here is the concrete implementation plan for **Task 2** of Change ID `OBJ-1-RS-JPRL`.

This plan focuses on creating the modular Prompt Template and the Repair Logic required to fix malformed JSON while preserving the original data semantics.

### 1. File Paths

*   **`src/geometry_os/agents/prompts.py`** (New)
    *   This file will house the centralized prompt templates to keep them maintainable and version-controlled.
*   **`src/geometry_os/agents/implementation_agent.py`** (Modified)
    *   This file will be updated to import the new prompt and implement the `_repair_json_with_llm` logic.

---

### 2. Code Implementation

#### A. The Prompt Template (`src/geometry_os/agents/prompts.py`)

This template uses a "Chain of Thought" approach to force the LLM to analyze the structure before outputting the code, minimizing the risk of it hallucinating new data.

```python
# src/geometry_os/agents/prompts.py

class RepairPrompts:
    """
    Centralized prompt templates for LLM-based repair mechanisms.
    """
    
    JSON_REPAIR_TEMPLATE = """
You are an expert JSON data repair engine. Your goal is to fix syntax errors in a malformed JSON string 
while preserving the exact data semantics and values of the original input.

**Strict Rules:**
1. **Preserve Data:** DO NOT change the values of keys, numbers, or strings unless they are syntactically broken (e.g., mismatched quotes).
2. **No Hallucination:** DO NOT add new keys or data that were not present in the original input.
3. **Structure Only:** Fix missing commas, trailing commas, unescaped characters, or mismatched brackets.
4. **Format:** Return ONLY the raw JSON object. Do not wrap it in markdown code blocks (```json).

**Malformed Input:**
{malformed_json}

**Repaired JSON:**
"""
```

#### B. The Repair Logic (`src/geometry_os/agents/implementation_agent.py`)

This implementation includes error handling for LLM timeouts and parsing failures, ensuring the system degrades gracefully if repair is impossible.

```python
import json
import logging
from typing import Optional, Dict, Any
# Assuming the LLM client is available via self._agent_instance or similar context
# Adjust import based on actual Geometry OS architecture
from .prompts import RepairPrompts

logger = logging.getLogger(__name__)

class ImplementationAgent:
    # ... existing class methods ...

    def _repair_json_with_llm(self, malformed_json: str) -> Optional[Dict[str, Any]]:
        """
        Attempts to repair malformed JSON strings using the LLM.
        
        Args:
            malformed_json (str): The raw string that failed JSON parsing.
            
        Returns:
            Optional[Dict[str, Any]]: The parsed dictionary if repair succeeds, else None.
        """
        if not malformed_json or not malformed_json.strip():
            return None

        # 1. Prepare the prompt using the centralized template
        prompt = RepairPrompts.JSON_REPAIR_TEMPLATE.format(malformed_json=malformed_json)
        
        try:
            # 2. Call LLM with strict temperature settings for deterministic output
            # Assuming self._llm_client is the configured LLM interface
            response = self._llm_client.generate(
                prompt,
                temperature=0.0,  # Lowest temperature for syntax/logic tasks
                max_tokens=2000   # Limit output size to prevent runaway loops
            )
            
            if not response:
                logger.warning("LLM repair returned empty response.")
                return None

            repaired_text = response.strip()
            
            # 3. Clean common LLM artifacts (e.g., markdown code blocks)
            if repaired_text.startswith("```"):
                repaired_text = repaired_text.split("```")[1]
                if repaired_text.startswith("json"):
                    repaired_text = repaired_text[4:]
            
            # 4. Validate the repair
            return json.loads(repaired_text)

        except json.JSONDecodeError as e:
            logger.error(f"LLM returned invalid JSON again: {e}")
            return None
            
        except Exception as e:
            # Catch API timeouts, connection errors, etc.
            logger.error(f"LLM API call failed during repair: {e}")
            return None
```

---

### 3. Next Step

**Command:** Create the prompt definition file.

```bash
mkdir -p src/geometry_os/agents
touch src/geometry_os/agents/prompts.py
```

Once the file is created, paste the **Code A** snippet into it. Then, integrate **Code B** into your existing `implementation_agent.py`.