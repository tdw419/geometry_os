# Solution for Task: **Task 3**: Deliverable 3: The logic should identify a block of text related to a single "Objective" or "Goal".

Here is the implementation plan for **Deliverable 3** of the `manual-phase_1__fix_naive_fallback_behavior` change.

This deliverable focuses on the parsing logic required to identify and extract "Objective" or "Goal" blocks from the input roadmap text, serving as the foundation for the grouping logic in Deliverable 4.

### 1. File Paths

*   **Modified:** `systems/roadmap/change_generator.py`
    *   *Rationale:* This file contains the `ChangeGenerator` class and the `_naive_fallback` method that needs to be upgraded to parse blocks of text rather than individual lines.

### 2. Implementation Code (Python)

We will modify the `_naive_fallback` method in `systems/roadmap/change_generator.py`.

The logic below introduces a state machine approach to iterate through lines. It detects headers (e.g., "## Objective", "- Goal") and aggregates subsequent lines belonging to that block until a new block is detected.

```python
# systems/roadmap/change_generator.py

# ... existing imports and class definition ...

    def _naive_fallback(self, roadmap_text: str) -> List[Dict[str, str]]:
        """
        Parses roadmap text into coherent tasks based on Objectives/Goals.
        Groups related lines instead of treating every line as a distinct task.
        """
        tasks = []
        current_objective = None
        current_description_lines = []
        
        # Keywords that signify the start of a new block
        # Matches: "## Objective", "- Goal:", "Goal:", etc.
        block_headers = ["## objective", "- goal", "goal:", "## goal"]

        lines = roadmap_text.split('\n')

        for line in lines:
            stripped_line = line.strip()
            if not stripped_line:
                # Skip empty lines, but they might signify the end of a block if we wanted to be strict.
                # For now, we ignore them.
                continue

            # Check if this line starts a new Objective/Goal block
            is_header = False
            lower_line = stripped_line.lower()
            
            for header in block_headers:
                if lower_line.startswith(header):
                    is_header = True
                    break
            
            if is_header:
                # 1. Save the previous block if it exists
                if current_objective:
                    full_description = "\n".join(current_description_lines).strip()
                    if full_description:
                        tasks.append({
                            "objective": current_objective,
                            "description": full_description
                        })

                # 2. Start a new block
                # Extract the title (remove the dash/hash if present)
                if ":" in stripped_line:
                    current_objective = stripped_line.split(":", 1)[1].strip()
                else:
                    current_objective = stripped_line.replace("##", "").strip()
                
                current_description_lines = []
            else:
                # It's a detail line, add it to the current block
                # We assume it belongs to the task implementation/details
                if current_objective:
                    current_description_lines.append(stripped_line)
                else:
                    # Handle text appearing before the first objective (e.g. title)
                    # We can create a generic "General" task or ignore it.
                    # Here we create a generic task to ensure no data is lost.
                    current_objective = "General Roadmap Tasks"
                    current_description_lines.append(stripped_line)

        # Append the final block after the loop finishes
        if current_objective:
            full_description = "\n".join(current_description_lines).strip()
            if full_description:
                tasks.append({
                    "objective": current_objective,
                    "description": full_description
                })

        return tasks

# ... rest of the class ...
```

### 3. Next Step

To apply this change and verify the logic, run the following command in your terminal:

```bash
# Apply the code changes to the file (assuming you have the code in a buffer or file)
# Then run the specific unit tests for the roadmap generator to ensure grouping works.

python -m pytest tests/systems/roadmap/test_change_generator.py -v -k "test_naive_fallback"
```

*Note: If the test file does not exist, you should create `tests/systems/roadmap/test_change_generator.py` and add a test case that provides a multi-line roadmap string with 2-3 objectives and asserts that the returned list length matches the number of objectives, not the number of lines.*