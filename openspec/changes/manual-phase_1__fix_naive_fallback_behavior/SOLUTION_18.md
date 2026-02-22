# Solution for Task: **Task 4**: Deliverable 4: It should combine the "Goal" description and its associated "Tasks" or "Implementation" points into one deliverable in the generated `tasks.md`.

Here is the implementation plan for **Deliverable 4**, focusing on the logic to intelligently group Goals with their associated Tasks/Implementation points within the fallback mechanism of `systems/roadmap/change_generator.py`.

### 1. File Paths

*   **Modified:** `systems/roadmap/change_generator.py`
    *   *Note:* This file contains the fallback parsing logic that needs to be upgraded from line-by-line processing to block-based processing.

### 2. Code Solution

The following Python snippet implements the logic required for Deliverable 4. It creates a specific method to parse the roadmap text into structured blocks (Goals + Tasks) before converting them into `ChangeTask` objects.

```python
import re
from typing import List, Dict, Any

# systems/roadmap/change_generator.py

class ChangeGenerator:
    # ... existing class implementation ...

    def _group_roadmap_content(self, text: str) -> List[Dict[str, str]]:
        """
        Parses raw roadmap text into coherent blocks of Goals and their associated Tasks.
        This handles Deliverable 4: Combining Goal descriptions with associated Tasks.
        """
        # Regex to find headers like "Goal:", "Objective:", "Task:", "Implementation:"
        # We assume a standard markdown or list format.
        
        lines = text.split('\n')
        blocks = []
        current_block = {'header': '', 'content': []}
        
        # Keywords that signify the start of a new group
        group_keywords = ['Goal:', 'Objective:', 'Deliverable']
        # Keywords that signify items belonging to the current group
        task_keywords = ['Task:', 'Implementation:', '-', '*']
        
        for line in lines:
            stripped = line.strip()
            if not stripped:
                continue

            # Check if this line starts a new Goal/Objective block
            if any(kw in stripped for kw in group_keywords):
                # Save previous block if it exists
                if current_block['header']:
                    blocks.append(current_block)
                
                # Start new block
                # Extract the header text (e.g., "Goal: Fix Naive Fallback")
                current_block = {
                    'header': stripped, 
                    'content': []
                }
            
            # Check if this line is a task/implementation detail for the current block
            elif any(kw in stripped for kw in task_keywords):
                # It belongs to the current Goal/Objective
                current_block['content'].append(stripped)
                
            # Fallback for text that looks like a task but doesn't have a keyword
            # (e.g. indented lines)
            elif stripped.startswith("    ") or stripped.startswith("\t"):
                current_block['content'].append(stripen)

        # Append the final block
        if current_block['header']:
            blocks.append(current_block)
            
        return blocks

    def generate_roadmap_tasks_fallback(self, content: str) -> List[Any]:
        """
        Fallback mechanism updated for Deliverable 4.
        Intelligently groups related lines into single, coherent tasks.
        """
        # Use the new grouping logic
        grouped_blocks = self._group_roadmap_content(content)
        
        generated_tasks = []
        
        for block in grouped_blocks:
            # Combine the Goal description and the content
            goal_desc = block['header']
            task_items = block['content']
            
            # If there are no specific tasks listed, the goal itself is the task
            if not task_items:
                full_description = goal_desc
            else:
                # Combine Goal + Tasks into one string for the ChangeTask description
                # This ensures the context is preserved
                items_str = "\n".join([f"- {item}" for item in task_items])
                full_description = f"{goal_desc}\n{items_str}"
            
            # Create the ChangeTask object (assuming class structure)
            # We map the 'Goal' to the title/description
            task = {
                "id": f"fallback_task_{len(generated_tasks)}",
                "description": full_description.strip(),
                "status": "pending",
                "source": "fallback_grouped"
            }
            generated_tasks.append(task)
            
        return generated_tasks
```

### 3. Next Step

To apply this change, you should update the `ChangeGenerator` class in the specified file.

**Command:**
```bash
# Edit the roadmap change generator to implement the block-grouping logic
code systems/roadmap/change_generator.py
```