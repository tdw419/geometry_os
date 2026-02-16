# Command History & Autocomplete Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Add command history navigation (Up/Down arrows) and tab autocomplete to the Geometry OS terminal.

**Architecture:** Extend MapTerminal with a command_history list and history_index. Modify handle_key to intercept ArrowUp/ArrowDown for history navigation and Tab for autocomplete. Store commands on Enter.

**Tech Stack:** Python asyncio, existing MapTerminal class

---

## Task 1: Add Command History Storage

**Files:**
- Modify: `map_terminal.py` (MapTerminal.__init__)

**Step 1: Add history fields to MapTerminal.__init__**

In the MapTerminal.__init__ method, add after `self.focused = False`:

```python
        # Command history
        self.command_history: list = []  # List of previous commands
        self.history_index: int = -1     # Current position in history (-1 = not browsing)
        self.history_max: int = 100      # Maximum commands to store
```

**Step 2: Run syntax check**

Run: `python3 -m py_compile map_terminal.py`
Expected: No output (success)

**Step 3: Commit**

```bash
git add map_terminal.py
git commit -m "feat(terminal): add command history fields to MapTerminal"
```

---

## Task 2: Store Commands on Enter

**Files:**
- Modify: `map_terminal.py` (handle_key method)

**Step 1: Update Enter key handling to store history**

Find the `if key == 'Enter':` block and update it:

```python
        if key == 'Enter':
            # Store command in history (if non-empty and different from last)
            if self.input_buffer.strip():
                # Don't duplicate consecutive commands
                if not self.command_history or self.command_history[-1] != self.input_buffer.strip():
                    self.command_history.append(self.input_buffer.strip())
                    # Trim history if too long
                    if len(self.command_history) > self.history_max:
                        self.command_history = self.command_history[-self.history_max:]
                await self.execute(self.input_buffer)
            else:
                self.input_buffer = ""
                await self.render()
            # Reset history index
            self.history_index = -1
```

**Step 2: Run syntax check**

Run: `python3 -m py_compile map_terminal.py`
Expected: No output (success)

**Step 3: Commit**

```bash
git add map_terminal.py
git commit -m "feat(terminal): store commands in history on Enter"
```

---

## Task 3: Add Arrow Up/Down History Navigation

**Files:**
- Modify: `map_terminal.py` (handle_key method)

**Step 1: Add ArrowUp and ArrowDown handling**

Add these cases to the handle_key method, after the Escape case:

```python
        elif key == 'ArrowUp':
            # Navigate backward through history
            if self.command_history:
                if self.history_index == -1:
                    # First press - go to most recent
                    self.history_index = len(self.command_history) - 1
                elif self.history_index > 0:
                    self.history_index -= 1

                if self.history_index >= 0:
                    self.input_buffer = self.command_history[self.history_index]
                    await self.render()

        elif key == 'ArrowDown':
            # Navigate forward through history
            if self.history_index != -1:
                if self.history_index < len(self.command_history) - 1:
                    self.history_index += 1
                    self.input_buffer = self.command_history[self.history_index]
                else:
                    # At the end - clear to new line
                    self.history_index = -1
                    self.input_buffer = ""
                await self.render()
```

**Step 2: Run syntax check**

Run: `python3 -m py_compile map_terminal.py`
Expected: No output (success)

**Step 3: Commit**

```bash
git add map_terminal.py
git commit -m "feat(terminal): add ArrowUp/ArrowDown history navigation"
```

---

## Task 4: Add Tab Autocomplete

**Files:**
- Modify: `map_terminal.py` (handle_key method)

**Step 1: Add Tab key autocomplete handling**

Add this case to handle_key, after the ArrowDown case:

```python
        elif key == 'Tab':
            # Autocomplete based on history and common commands
            suggestions = self._get_autocomplete_suggestions(self.input_buffer)
            if suggestions:
                # If multiple matches, show them (or cycle through)
                if len(suggestions) == 1:
                    self.input_buffer = suggestions[0]
                    await self.render()
                # For multiple matches, could show list - for now just take first
                elif len(suggestions) > 1:
                    # Find common prefix
                    common = self._find_common_prefix(suggestions)
                    if common and len(common) > len(self.input_buffer):
                        self.input_buffer = common
                        await self.render()
```

**Step 2: Add autocomplete helper methods**

Add these methods to the MapTerminal class:

```python
    def _get_autocomplete_suggestions(self, partial: str) -> list:
        """Get autocomplete suggestions for partial input."""
        if not partial:
            return []

        suggestions = []
        partial_lower = partial.lower()

        # Check command history first
        for cmd in reversed(self.command_history):
            if cmd.lower().startswith(partial_lower) and cmd not in suggestions:
                suggestions.append(cmd)

        # Add common shell commands
        common_commands = [
            'ls', 'ls -la', 'ls -laF', 'cd', 'cd ..', 'pwd',
            'cat', 'echo', 'mkdir', 'rm', 'cp', 'mv',
            'grep', 'find', 'chmod', 'chown',
            'git status', 'git add', 'git commit', 'git push', 'git pull',
            'python3', 'pip install', 'npm install', 'npm run',
        ]

        for cmd in common_commands:
            if cmd.lower().startswith(partial_lower) and cmd not in suggestions:
                suggestions.append(cmd)

        return suggestions[:10]  # Limit to 10 suggestions

    def _find_common_prefix(self, strings: list) -> str:
        """Find the common prefix among a list of strings."""
        if not strings:
            return ""

        prefix = strings[0]
        for s in strings[1:]:
            while not s.startswith(prefix):
                prefix = prefix[:-1]
                if not prefix:
                    return ""

        return prefix
```

**Step 3: Run syntax check**

Run: `python3 -m py_compile map_terminal.py`
Expected: No output (success)

**Step 4: Commit**

```bash
git add map_terminal.py
git commit -m "feat(terminal): add Tab autocomplete with history and common commands"
```

---

## Task 5: Manual Verification

**Files:**
- None (manual testing)

**Step 1: Start the terminal**

```bash
python3 map_terminal.py
```

**Step 2: Verify command history**

1. Type `echo "hello"` and press Enter
2. Type `pwd` and press Enter
3. Type `ls` and press Enter
4. Press ArrowUp → shows `ls`
5. Press ArrowUp again → shows `pwd`
6. Press ArrowUp again → shows `echo "hello"`
7. Press ArrowDown → shows `pwd`
8. Press ArrowDown → shows `ls`
9. Press ArrowDown → clears to empty line

**Step 3: Verify autocomplete**

1. Type `pw` and press Tab → completes to `pwd`
2. Type `gi` and press Tab → completes to `git`
3. Run `echo test1`, `echo test2`, then type `ec` and Tab → shows `echo`

**Step 4: Document verification**

```bash
echo "Phase 50.2: Command History & Autocomplete - VERIFIED" >> VERIFICATION.md
```

---

## Summary

| Task | Description | Files |
|------|-------------|-------|
| 1 | Add command history storage | `map_terminal.py` |
| 2 | Store commands on Enter | `map_terminal.py` |
| 3 | Add ArrowUp/Down navigation | `map_terminal.py` |
| 4 | Add Tab autocomplete | `map_terminal.py` |
| 5 | Manual verification | Manual |
