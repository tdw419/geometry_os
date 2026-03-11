# Solution for Task: **Task 7**: Deliverable 7: **Objective 2: Add Unit Tests for Fallback Logic**

Here is the implementation plan for **Deliverable 7: Objective 2 (Add Unit Tests for Fallback Logic)**.

This plan creates a dedicated test suite to verify the intelligent grouping logic in `systems/roadmap/change_generator.py`, ensuring that fallback tasks are generated coherently rather than line-by-line.

### 1. File Paths

*   **Create:** `systems/roadmap/tests/test_fallback_logic.py`
*   **Modify:** `systems/roadmap/change_generator.py` (To ensure the logic is importable/testable)

### 2. Code Snippets

**A. The Test Suite (`systems/roadmap/tests/test_fallback_logic.py`)**

This file uses `pytest` to validate the fallback behavior. It simulates a scenario where the fallback parser must group a "Goal" with its associated "Tasks" and "Implementation" details into a single task object.

```python
# systems/roadmap/tests/test_fallback_logic.py
import pytest
from systems.roadmap.change_generator import ChangeGenerator

# Mock LLM response to force fallback mode for testing
class MockLLMResponse:
    def __init__(self, content):
        self.content = content

def test_fallback_groups_related_lines():
    """
    Tests that the fallback mechanism groups a Goal and its related 
    Implementation points into a single task, rather than creating 
    a task for every line.
    """
    # Input roadmap text simulating the Deliverable 2 scenario
    roadmap_content = """
    - Objective 1: Refine Fallback Task Generation
    - Goal: The fallback mechanism should intelligently group related lines.
    - Implementation: Update parsing logic in change_generator.py.
    - Implementation: Add unit tests to verify grouping.
    """
    
    # Initialize generator
    generator = ChangeGenerator(roadmap_content=roadmap_content)
    
    # 1. Force Fallback Scenario
    # We assume the generator has a method or state where LLM fails/returns None
    # or we directly invoke the internal fallback parser for this unit test.
    # Assuming a public method `parse_with_fallback` exists or is exposed for testing:
    tasks = generator._parse_fallback_logic(roadmap_content)
    
    # 2. Validate Grouping (Objective 2)
    # We expect 2 main tasks: 
    # 1. The Objective/Goal block
    # 2. The Implementation block (if separated) OR 1 combined task.
    # Based on Deliverable 2, we want "single, coherent tasks".
    
    assert len(tasks) > 0, "Fallback should generate tasks"
    
    # Validate that we haven't just split every line.
    # There are 4 lines in the input. Naive approach would be 4 tasks.
    # Smart approach should be 1 or 2 tasks.
    assert len(tasks) < 4, "Fallback should group lines, not treat every line as a distinct task."
    
    # Validate content grouping
    # Check if "Goal" and "Implementation" context is preserved in the task description
    combined_description = " ".join([t.description for t in tasks])
    
    assert "intelligently group related lines" in combined_description
    assert "parsing logic" in combined_description

def test_fallback_handles_empty_input():
    generator = ChangeGenerator(roadmap_content="")
    tasks = generator._parse_fallback_logic("")
    assert len(tasks) == 0

def test_fallback_preserves_structure():
    """
    Test that fallback logic distinguishes between different Objectives.
    """
    roadmap_content = """
    - Objective 1: Fix Fallback
    - Task: Write tests.
    - Objective 2: Update UI
    - Task: Change color to blue.
    """
    
    generator = ChangeGenerator(roadmap_content=roadmap_content)
    tasks = generator._parse_fallback_logic(roadmap_content)
    
    # We expect 2 tasks (one for each objective block)
    # Naive would be 4.
    assert len(tasks) == 2, "Fallback should group by Objective headers"
    
    assert "Fallback" in tasks[0].title
    assert "UI" in tasks[1].title
```

**B. Implementation Adjustment (`systems/roadmap/change_generator.py`)**

Ensure the fallback logic is exposed or modular enough to be tested. If `_parse_fallback_logic` is currently private and tightly coupled, refactor it slightly to accept the text string as an argument.

```python
# systems/roadmap/change_generator.py

class ChangeGenerator:
    # ... existing init ...

    def _parse_fallback_logic(self, text_content: str) -> list[Task]:
        """
        Refactored internal helper to parse text into tasks using 
        intelligent grouping (Deliverable 2).
        """
        tasks = []
        current_objective = None
        current_buffer = []
        
        lines = text_content.strip().split('\n')
        
        for line in lines:
            line = line.strip()
            if not line: continue
            
            # Detect new Objective/Goal headers
            if line.startswith("- Objective") or line.startswith("- Goal"):
                # If we have a buffer, create a task from it first
                if current_buffer:
                    tasks.append(self._create_task_from_buffer(current_objective, current_buffer))
                    current_buffer = []
                
                current_objective = line.replace("- ", "").strip()
                current_buffer.append(line)
            else:
                # Add related lines to the current buffer
                current_buffer.append(line)
                
        # Don't forget the last block
        if current_buffer:
            tasks.append(self._create_task_from_buffer(current_objective, current_buffer))
            
        return tasks

    def _create_task_from_buffer(self, title, buffer):
        # Helper to combine buffer into a single Task object
        description = "\n".join(buffer)
        return Task(title=title or "Untitled Task", description=description)
```

### 3. Next Step

**Command:** Create the test file and run the suite to verify the fallback behavior.

```bash
# 1. Create the test file
touch systems/roadmap/tests/test_fallback_logic.py

# 2. Run the tests (assuming pytest is set up in your Geometry OS environment)
pytest systems/roadmap/tests/test_fallback_logic.py -v
```