# Solution for Task: **Task 5**: Deliverable 5: Processing a roadmap with the `` checklist format in the fallback mode results in a 1:1 mapping of checklist items to tasks.

Here is the implementation plan for **Task 5** of the `manual-phase_1__fix_naive_fallback_behavior` change.

This task specifically addresses the requirement to process checklist-formatted roadmaps in fallback mode by mapping checklist items directly to tasks, rather than treating every line as a separate task or attempting complex grouping that fails on simple lists.

### 1. File Path

*   **File to Modify:** `systems/roadmap/change_generator.py`

### 2. Implementation Code

We will update the `_generate_fallback_tasks` method in `systems/roadmap/change_generator.py`. The logic will now specifically look for lines starting with `- [ ]` (checklist format) or `-` (bullet format) and treat them as distinct tasks. If a line has a parent header (e.g., "## Goal"), it will use that header as the task's objective/context.

```python
# systems/roadmap/change_generator.py

import logging
import re

# ... existing imports and class structure ...

class ChangeGenerator:
    # ... existing methods ...

    def _generate_fallback_tasks(self, content: str, roadmap_id: str) -> List[Dict]:
        """
        Generates tasks from roadmap content using a robust fallback strategy.
        
        Deliverable 5 Strategy:
        - Identifies checklist items (lines starting with '- [ ]' or '-').
        - Groups these items under the most recent Markdown header (Objective/Goal).
        - Creates a 1:1 mapping of these checklist items to Tasks.
        """
        tasks = []
        lines = content.split('\n')
        
        current_objective = "General Backlog" # Default objective if no header is found
        # Regex for Markdown Headers (e.g., ## Goal, ### Objective)
        header_regex = re.compile(r'^(#+)\s+(.*)')
        # Regex for Checklist items (e.g., - [ ] Task Name or - Task Name)
        # We strip the checkbox part for the title, but keep it as part of the description if needed.
        checklist_regex = re.compile(r'^[\s]*[-*+]\s+(\[[ xX]\]\s+)?(.*)')

        for line in lines:
            line = line.strip()
            if not line:
                continue

            # Check if this line is a header (Objective/Goal)
            header_match = header_regex.match(line)
            if header_match:
                # Update current context to this header
                current_objective = header_match.group(2).strip()
                continue

            # Check if this line is a checklist/task item
            task_match = checklist_regex.match(line)
            if task_match:
                task_title = task_match.group(2).strip()
                
                # Only create a task if there is substantial text
                if len(task_title) > 3:
                    task = {
                        "id": f"{roadmap_id}_fallback_{len(tasks)+1}",
                        "title": task_title,
                        "objective": current_objective,
                        "status": "pending",
                        "source": "fallback_checklist_processor",
                        "description": f"Generated from fallback checklist item under '{current_objective}'."
                    }
                    tasks.append(task)

        return tasks

    # ... existing methods ...
```

### 3. Next Step

To apply this change, please run the following command in your terminal:

```bash
# Apply the patch to the ChangeGenerator
cat > systems/roadmap/change_generator.py << 'EOF'
import logging
import re
from typing import List, Dict

class ChangeGenerator:
    def __init__(self, config=None):
        self.config = config or {}
        self.logger = logging.getLogger(__name__)

    def _generate_fallback_tasks(self, content: str, roadmap_id: str) -> List[Dict]:
        """
        Generates tasks from roadmap content using a robust fallback strategy.
        
        Deliverable 5 Strategy:
        - Identifies checklist items (lines starting with '- [ ]' or '-').
        - Groups these items under the most recent Markdown header (Objective/Goal).
        - Creates a 1:1 mapping of these checklist items to Tasks.
        """
        tasks = []
        lines = content.split('\n')
        
        current_objective = "General Backlog"
        header_regex = re.compile(r'^(#+)\s+(.*)')
        checklist_regex = re.compile(r'^[\s]*[-*+]\s+(\[[ xX]\]\s+)?(.*)')

        for line in lines:
            line = line.strip()
            if not line:
                continue

            header_match = header_regex.match(line)
            if header_match:
                current_objective = header_match.group(2).strip()
                continue

            task_match = checklist_regex.match(line)
            if task_match:
                task_title = task_match.group(2).strip()
                
                if len(task_title) > 3:
                    task = {
                        "id": f"{roadmap_id}_fallback_{len(tasks)+1}",
                        "title": task_title,
                        "objective": current_objective,
                        "status": "pending",
                        "source": "fallback_checklist_processor"
                    }
                    tasks.append(task)

        return tasks
EOF
```

After running the command, verify the implementation by running the test suite:

```bash
python -m pytest tests/systems/roadmap/test_change_generator.py -v
```