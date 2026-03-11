# Solution for Task: **Task 6**: Deliverable 6: Processing a roadmap with "Goal" and "Tasks" sections results in a single, consolidated task in the `tasks.md` file.

Here is the implementation plan for **Task 6**, focusing on modifying the `systems/roadmap/change_generator.py` file to consolidate "Goal" and "Tasks" sections into a single task entry.

### 1. File Paths

*   **File to Modify:** `systems/roadmap/change_generator.py`

### 2. Code Snippet (Python)

This snippet updates the `_parse_roadmap_fallback` method. It implements a state machine approach to group lines: when a "Goal" is encountered, it accumulates subsequent lines (Tasks/Implementation) until a new top-level section is found, creating a single consolidated task.

```python
# systems/roadmap/change_generator.py

import re
import os

# ... (Existing imports and class structure) ...

class ChangeGenerator:
    # ... (Existing methods) ...

    def _parse_roadmap_fallback(self, content: str) -> List[str]:
        """
        Parses roadmap content into tasks using a state-machine approach.
        Groups 'Goal', 'Tasks', and 'Implementation' sections into single entries.
        """
        tasks = []
        lines = content.split('\n')
        
        current_task_lines = []
        current_header = None
        
        # Regex for top-level headers (e.g., ## Phase 1, # Goal)
        # We assume standard Markdown headers.
        header_pattern = re.compile(r'^(#+)\s+(.*)$')
        
        for line in lines:
            header_match = header_pattern.match(line)
            
            if header_match:
                level = len(header_match.group(1))
                title = header_match.group(2).strip()
                
                # If we encounter a top-level header (H1 or H2), 
                # it usually signifies a new distinct phase or major section.
                # We treat H3/H4 as part of the current task context (e.g., "Tasks", "Implementation")
                if level <= 2:
                    # If we have accumulated content for a previous task, save it now
                    if current_task_lines:
                        full_task_text = "\n".join(current_task_lines).strip()
                        if full_task_text:
                            tasks.append(full_task_text)
                        current_task_lines = []
                    
                    # Start a new task block
                    current_task_lines.append(line)
                else:
                    # Sub-headers (H3+) belong to the current task block
                    current_task_lines.append(line)
            else:
                # Regular content lines
                if current_task_lines or line.strip():
                    current_task_lines.append(line)

        # Append the final task block
        if current_task_lines:
            full_task_text = "\n".join(current_task_lines).strip()
            if full_task_text:
                tasks.append(full_task_text)
                
        return tasks
```

### 3. Next Step

**Action:** Run the unit tests to verify that the fallback logic correctly consolidates the roadmap sections and that the `tasks.md` output is formatted as a single consolidated task.

```bash
python -m pytest tests/systems/roadmap/test_change_generator.py -v
```