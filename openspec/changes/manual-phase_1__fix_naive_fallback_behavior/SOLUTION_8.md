# Solution for Task: **Task 2**: Deliverable 2: **Goal:** The fallback mechanism in `systems/roadmap/change_generator.py` should intelligently group related lines from the input roadmap into single, coherent tasks. It should not treat every single line as a distinct task.

Here is the implementation plan for **Task 2: Deliverable 2** of the `manual-phase_1__fix_naive_fallback_behavior` change.

### 1. File Paths

*   **Modified File:** `systems/roadmap/change_generator.py`
    *   *Reasoning:* This file contains the `FallbackGenerator` class (or similar logic) that processes raw roadmap text when the primary generation strategy fails. We need to update the parsing logic here to group lines by semantic context (e.g., grouping a "Goal" with its list items) rather than treating every line as an independent task.

### 2. Python Code Snippet

The following snippet refactors the fallback logic. It introduces a state-machine approach to iterate through lines, identifying "headers" (Goals/Objectives) and accumulating subsequent "tasks" (indented lines or dash points) into a single coherent task object.

```python
# systems/roadmap/change_generator.py

import re
from typing import List, Dict, Any

class FallbackGenerator:
    # ... existing init methods ...

    def _generate_fallback_tasks(self, roadmap_text: str) -> List[Dict[str, Any]]:
        """
        Intelligently groups related lines from the input roadmap into 
        single, coherent tasks instead of treating every line as distinct.
        """
        lines = roadmap_text.split('\n')
        grouped_tasks = []
        
        # State variables
        current_goal = None
        current_task_buffer = []
        
        # Regex to identify headers (e.g., "Goal:", "Objective:", "Deliverable N:")
        # Case insensitive, handles colons
        header_pattern = re.compile(r'^(goal|objective|deliverable)\s*\d*:.*', re.IGNORECASE)
        # Regex for list items (dashes, asterisks, or indentation)
        item_pattern = re.compile(r'^(\s*[-*]|\s{2,})')

        for line in lines:
            line = line.strip()
            if not line:
                continue

            # Check if this line is a new Header/Goal
            if header_pattern.match(line):
                # If we have a previous goal in buffer, save it now
                if current_goal or current_task_buffer:
                    grouped_tasks.append(self._create_task_object(current_goal, current_task_buffer))
                
                # Reset for the new section
                current_goal = line
                current_task_buffer = []
            
            # Check if this line is a sub-task/implementation detail
            elif item_pattern.match(line):
                # It belongs to the current goal
                current_task_buffer.append(line)
            
            # If it's a plain text line but we are already inside a goal context
            elif current_goal:
                current_task_buffer.append(line)
                
            # If it's a plain text line at the start (no context yet), treat as a generic task
            else:
                grouped_tasks.append({
                    "description": line,
                    "details": []
                })

        # Don't forget the last section
        if current_goal or current_task_buffer:
            grouped_tasks.append(self._create_task_object(current_goal, current_task_buffer))

        return grouped_tasks

    def _create_task_object(self, goal: str, items: List[str]) -> Dict[str, Any]:
        """
        Helper to structure the final task dictionary.
        """
        # If there is no explicit Goal header, but we have items, use the first item as title
        if not goal and items:
            goal = items.pop(0)
            
        return {
            "title": goal, # e.g., "Goal: Implement feature X"
            "description": "\n".join(items), # The grouped implementation points
            "type": "fallback_grouped"
        }
```

### 3. Next Step

To apply this change, run the following command in your terminal to update the `change_generator.py` file with the new grouping logic:

```bash
# Create a backup before applying changes
cp systems/roadmap/change_generator.py systems/roadmap/change_generator.py.bak

# Apply the patch (assuming you saved the snippet to a file named fallback_fix.patch)
# Or simply open the file in your editor:
code systems/roadmap/change_generator.py
```