# Solution for Task: **Task 1**: Deliverable 1: **Objective 1: Refine Fallback Task Generation**

Here is the implementation plan for **Phase 1: Fix Naive Fallback Behavior**.

### 1. File Paths

*   **`systems/roadmap/change_generator.py`** (Modified)
    *   The fallback logic (likely in a helper function or the main class) needs to be updated to aggregate lines based on indentation and context (Goals vs Tasks) rather than processing line-by-line.

### 2. Python Code Snippet

The following snippet implements the "Intelligent Grouping" logic. It parses the roadmap text, identifies headers (Goals/Objectives), and groups subsequent implementation details (Tasks) under them until a new header is found.

```python
import re
import logging

logger = logging.getLogger(__name__)

def generate_roadmap_changes_intelligent(roadmap_text: str) -> list[dict]:
    """
    Parses a roadmap text and groups related lines into coherent tasks.
    
    Logic:
    1. Identifies 'Objective' or 'Goal' lines as parents.
    2. Groups subsequent indented lines or bullet points as children of that parent.
    3. If a line has no parent, it is treated as a standalone task.
    """
    tasks = []
    lines = roadmap_text.split('\n')
    
    current_objective = None
    current_buffer = []
    
    # Regex to find headers like "Objective 1:", "Goal:", "Deliverable:"
    header_pattern = re.compile(r"^(Objective|Goal|Deliverable).*?:", re.IGNORECASE)
    # Regex to detect list items or indentation
    item_pattern = re.compile(r"^\s*[-*•]\s*|^\s{2,}")

    for line in lines:
        line = line.strip()
        if not line:
            continue

        # Check if this line is a new Header/Goal
        if header_pattern.match(line):
            # Save the previous buffer if it exists
            if current_objective or current_buffer:
                tasks.append(_create_task_object(current_objective, current_buffer))
            
            # Start a new group
            current_objective = line
            current_buffer = []
            
        # Check if this line is a sub-task (indented or list item)
        elif item_pattern.match(line):
            current_buffer.append(line)
            
        # If it's a loose line without a header, treat as standalone or append to current
        else:
            if current_objective:
                current_buffer.append(line)
            else:
                # Standalone line with no context yet
                tasks.append(_create_task_object(None, [line]))

    # Append the final buffer
    if current_objective or current_buffer:
        tasks.append(_create_task_object(current_objective, current_buffer))

    return tasks

def _create_task_object(objective: str | None, items: list[str]) -> dict:
    """Helper to format the task dictionary."""
    # Filter out empty items
    clean_items = [i for i in items if i.strip()]
    
    description = objective if objective else "Miscellaneous Roadmap Tasks"
    
    # Combine Goal + Tasks into a single coherent description
    full_content = description
    if clean_items:
        full_content += "\n" + "\n".join(clean_items)

    return {
        "summary": description,
        "description": full_content,
        "type": "roadmap_update"
    }
```

### 3. Next Step

**Apply the patch:**
Replace the existing `generate_roadmap_changes` function (or the specific fallback section) in `systems/roadmap/change_generator.py` with the logic provided above. Ensure the regex patterns cover the specific formatting used in your roadmap files.

**Command to run tests:**
```bash
python -m pytest tests/systems/roadmap/test_change_generator.py -v
```