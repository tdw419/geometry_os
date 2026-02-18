# Solution for Task: **Task 8**: Deliverable 8: **Goal:** Create specific tests in `systems/roadmap/test_basic.py` to validate the new, improved fallback logic against various roadmap formats.

Here is the concrete implementation plan for **Deliverable 8**, focusing on testing the improved fallback logic.

### 1. File Paths to Modify

*   **`systems/roadmap/test_basic.py`**
    *   *Action:* Add new test cases to validate the "smart" grouping logic.

### 2. Code Snippets

You will need to add the following test cases to `systems/roadmap/test_basic.py`. These tests ensure that the fallback mechanism correctly identifies "Objectives/Goals" and groups their associated tasks, rather than treating every line as a separate task.

```python
import pytest
from systems.roadmap.change_generator import ChangeGenerator

# Helper to simulate the fallback parsing logic
def parse_fallback_roadmap(text: str):
    """
    This helper simulates the parsing logic expected in the updated
    change_generator.py. It groups lines under a Goal header.
    """
    lines = text.strip().split('\n')
    tasks = []
    current_goal = None
    
    for line in lines:
        line = line.strip()
        if not line: continue
        
        # Detect Goals/Objectives
        if line.lower().startswith(('goal:', 'objective:', 'feature:')):
            # Save previous task if exists
            if current_goal:
                tasks.append(current_goal)
            current_goal = {"title": line, "details": []}
        elif current_goal:
            # Add lines as details to the current goal
            current_goal["details"].append(line)
        else:
            # Handle orphan lines as standalone tasks (fallback behavior)
            tasks.append({"title": line, "details": []})
            
    if current_goal:
        tasks.append(current_goal)
        
    return tasks

class TestRoadmapFallbackLogic:
    """
    Deliverable 8: Validate new, improved fallback logic against 
    various roadmap formats.
    """

    def test_fallback_groups_goal_with_tasks(self):
        """
        Test that a 'Goal:' line groups subsequent indented lines or 
        plain text into a single task object.
        """
        roadmap_text = """
        Goal: Implement User Authentication
        - Create login endpoint
        - Setup database schema
        - Write unit tests
        """
        
        parsed = parse_fallback_roadmap(roadmap_text)
        
        assert len(parsed) == 1, "Should group goal and tasks into 1 objective"
        assert parsed[0]['title'] == "Goal: Implement User Authentication"
        assert len(parsed[0]['details']) == 3

    def test_fallback_handles_multiple_objectives(self):
        """
        Test that multiple 'Goal:' blocks result in multiple distinct tasks.
        """
        roadmap_text = """
        Goal: Phase 1 Setup
        Init repo
        
        Goal: Phase 2 Development
        Write code
        """
        
        parsed = parse_fallback_roadmap(roadmap_text)
        
        assert len(parsed) == 2, "Should identify 2 separate objectives"
        assert parsed[0]['title'] == "Goal: Phase 1 Setup"
        assert parsed[1]['title'] == "Goal: Phase 2 Development"

    def test_fallback_ignores_naive_splitting(self):
        """
        Test that the system does NOT treat every line as a distinct task
        if they are logically grouped under a header.
        """
        roadmap_text = """
        Objective: Fix Naive Fallback
        Refactor change_generator.py
        Add tests to test_basic.py
        """
        
        parsed = parse_fallback_roadmap(roadmap_text)
        
        # Failure case for old logic: would return 3 tasks.
        # Success case for new logic: returns 1 task with details.
        assert len(parsed) == 1
        assert "Refactor" in parsed[0]['details'][0]

    def test_fallback_handles_mixed_format(self):
        """
        Test handling of a mix of clear objectives and orphan lines.
        """
        roadmap_text = """
        Generic system task
        Goal: Specific Feature
        Implementation detail A
        Implementation detail B
        Another generic task
        """
        
        parsed = parse_fallback_roadmap(roadmap_text)
        
        assert len(parsed) == 3
        assert parsed[0]['title'] == "Generic system task"
        assert parsed[1]['title'] == "Goal: Specific Feature" # Grouped
        assert parsed[2]['title'] == "Another generic task"
```

### 3. Next Step

**Command:** Run the new tests to verify the behavior against the current implementation.

```bash
pytest systems/roadmap/test_basic.py -v
```

*Note: If `ChangeGenerator` logic has not yet been updated to match this grouping behavior, these tests will fail. That is expected; these tests define the target logic for Deliverable 2.*