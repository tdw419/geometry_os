# AI Agent Control Surface Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Create a structured API for AI agents to interact with Geometry OS terminals and file browser through both WebMCP tools and Python APIs.

**Architecture:** Layered design with WebMCP tools as thin wrappers calling rich Python APIs exposed via Pyodide. All business logic lives in Python. New `agent_control_surface.py` module handles Pyodide registration.

**Tech Stack:** Python (asyncio, dataclasses), JavaScript (WebMCP), Pyodide, Chrome DevTools Protocol

---

## Task 1: Create agent_control_surface.py Module

**Files:**
- Create: `agent_control_surface.py`

**Step 1: Create the module with GeminiModule class**

Create `agent_control_surface.py`:

```python
"""
Geometry OS: AI Agent Control Surface

Exposes Geometry OS capabilities (TerminalManager, FileBrowser) to AI agents
via both WebMCP tools and Pyodide Python APIs.

Usage:
    from agent_control_surface import register_control_surface
    register_control_surface(terminal_manager, file_browser)
"""

import sys
from typing import Optional, List, Dict, Any
from dataclasses import asdict


class GeminiModule:
    """
    The 'gemini' module exposed to Pyodide Python environment.

    Provides:
        - terminal_manager: TerminalManager instance
        - file_browser: FileBrowser instance (when running)
        - Convenience functions for common operations
    """

    def __init__(self, terminal_manager, file_browser=None):
        self._terminal_manager = terminal_manager
        self._file_browser = file_browser

    @property
    def terminal_manager(self):
        """Access the TerminalManager instance."""
        return self._terminal_manager

    @property
    def file_browser(self):
        """Access the FileBrowser instance (may be None)."""
        return self._file_browser

    @property
    def terminals(self) -> Dict:
        """Shorthand for terminal_manager.terminals."""
        return self._terminal_manager.terminals

    @property
    def active_terminal(self):
        """Get the currently active terminal."""
        return self._terminal_manager.get_active()

    async def run_command(self, command: str, term_id: int = None):
        """
        Execute a command in a terminal.

        Args:
            command: Shell command to execute
            term_id: Terminal ID (uses active if None)

        Returns:
            CommandResult with stdout, stderr, exit_code
        """
        if term_id is not None:
            terminal = self._terminal_manager.get_terminal(term_id)
        else:
            terminal = self._terminal_manager.get_active()

        if not terminal:
            raise ValueError(f"Terminal {term_id} not found" if term_id else "No active terminal")

        return await terminal.execute(command)

    def create_terminal(self, x: int = 100, y: int = 100):
        """
        Create a new terminal window.

        Args:
            x: X position on map
            y: Y position on map

        Returns:
            MapTerminal instance
        """
        return self._terminal_manager.create_terminal(x=x, y=y)

    def get_terminal_state(self, term_id: int = None) -> Dict[str, Any]:
        """
        Get state of a terminal (or all terminals).

        Args:
            term_id: Specific terminal ID (all if None)

        Returns:
            Dict with terminal state(s)
        """
        if term_id is not None:
            terminal = self._terminal_manager.get_terminal(term_id)
            if not terminal:
                return {"error": f"Terminal {term_id} not found"}
            return {
                "id": terminal.term_id,
                "working_dir": terminal.working_dir,
                "focused": terminal.focused,
                "x": terminal.x,
                "y": terminal.y,
                "width": terminal.width,
                "height": terminal.height,
                "history_count": len(terminal.command_history),
            }

        # Return all terminals
        return {
            "terminals": [
                self.get_terminal_state(t.term_id)
                for t in self._terminal_manager.terminals.values()
            ],
            "active_id": self._terminal_manager.active_terminal_id,
        }


def register_control_surface(terminal_manager, file_browser=None):
    """
    Register the control surface with Pyodide.

    Call this after creating the TerminalManager in map_terminal.py.

    Args:
        terminal_manager: TerminalManager instance
        file_browser: Optional FileBrowser instance

    Returns:
        GeminiModule instance
    """
    gemini = GeminiModule(terminal_manager, file_browser)
    sys.modules['gemini'] = gemini

    print("✓ Agent Control Surface registered")
    print(f"  - gemini.terminal_manager: {type(terminal_manager).__name__}")
    if file_browser:
        print(f"  - gemini.file_browser: {type(file_browser).__name__}")

    return gemini
```

**Step 2: Run syntax check**

Run: `python3 -m py_compile agent_control_surface.py`
Expected: No output (success)

**Step 3: Commit**

```bash
git add agent_control_surface.py
git commit -m "feat(agent): create agent_control_surface.py with GeminiModule"
```

---

## Task 2: Add get_state() to MapTerminal

**Files:**
- Modify: `map_terminal.py` (MapTerminal class)

**Step 1: Add get_state() method to MapTerminal**

Add this method to the MapTerminal class (after the `_find_common_prefix` method):

```python
    def get_state(self) -> dict:
        """Get terminal state as a dictionary (for API responses)."""
        return {
            "id": self.term_id,
            "working_dir": self.working_dir,
            "focused": self.focused,
            "x": self.x,
            "y": self.y,
            "width": self.width,
            "height": self.height,
            "history_count": len(self.command_history),
            "lines_count": len(self.lines),
        }
```

**Step 2: Run syntax check**

Run: `python3 -m py_compile map_terminal.py`
Expected: No output (success)

**Step 3: Commit**

```bash
git add map_terminal.py
git commit -m "feat(terminal): add get_state() method to MapTerminal"
```

---

## Task 3: Add Helper Methods to FileBrowser

**Files:**
- Modify: `file_browser.py` (FileBrowser class)

**Step 1: Add read_file() and find_files() methods to FileBrowser**

Locate the FileBrowser class and add these methods:

```python
    async def read_file(self, path: str, max_bytes: int = 10000) -> dict:
        """
        Read file contents.

        Args:
            path: File path to read
            max_bytes: Maximum bytes to read (default 10KB)

        Returns:
            Dict with content, truncated flag
        """
        result = await self.bridge.execute(f"head -c {max_bytes} {path}", timeout=5)

        if result.exit_code != 0:
            return {"error": result.stderr, "content": "", "truncated": False}

        content = result.stdout
        truncated = len(content) >= max_bytes

        return {
            "content": content,
            "truncated": truncated,
            "path": path,
        }

    async def find_files(self, pattern: str, root: str = "/") -> list:
        """
        Find files matching a pattern.

        Args:
            pattern: Glob pattern (e.g., "*.log")
            root: Root directory to search

        Returns:
            List of FileInfo dicts
        """
        result = await self.bridge.execute(f"find {root} -name '{pattern}' -type f 2>/dev/null | head -50", timeout=10)

        if result.exit_code != 0 or not result.stdout.strip():
            return []

        files = []
        for line in result.stdout.strip().split('\n')[:50]:
            if line:
                # Get file info
                info_result = await self.bridge.execute(f"ls -la '{line}' 2>/dev/null", timeout=2)
                if info_result.exit_code == 0:
                    parsed = parse_ls_output(info_result.stdout, line.rsplit('/', 1)[0])
                    if parsed:
                        files.append(asdict(parsed[0]))

        return files

    def get_state(self) -> dict:
        """Get browser state as a dictionary."""
        return {
            "current_path": self.current_path,
            "files_count": len(self.files) if hasattr(self, 'files') else 0,
            "x": self.x if hasattr(self, 'x') else 0,
            "y": self.y if hasattr(self, 'y') else 0,
        }
```

**Step 2: Add missing import at top of file**

Add `from dataclasses import asdict` to the imports at the top:

```python
from dataclasses import dataclass, field, asdict
```

**Step 3: Run syntax check**

Run: `python3 -m py_compile file_browser.py`
Expected: No output (success)

**Step 4: Commit**

```bash
git add file_browser.py
git commit -m "feat(browser): add read_file(), find_files(), get_state() to FileBrowser"
```

---

## Task 4: Integrate Control Surface into map_terminal.py

**Files:**
- Modify: `map_terminal.py` (main function)

**Step 1: Add registration call after manager creation**

In the `main()` function, after the line `manager = TerminalManager(ws, bridge)`, add:

```python
        # Create terminal manager
        global manager
        manager = TerminalManager(ws, bridge)

        # Register with Agent Control Surface (for Pyodide)
        try:
            from agent_control_surface import register_control_surface
            gemini = register_control_surface(manager)
            # Expose globally for JavaScript access
            # Note: In browser, this becomes accessible via window.pyodide.globals
        except ImportError as e:
            print(f"⚠ Agent Control Surface not available: {e}")
```

**Step 2: Run syntax check**

Run: `python3 -m py_compile map_terminal.py`
Expected: No output (success)

**Step 3: Commit**

```bash
git add map_terminal.py
git commit -m "feat(terminal): integrate Agent Control Surface registration"
```

---

## Task 5: Add WebMCP Terminal Tools

**Files:**
- Modify: `systems/visual_shell/web/webmcp_bridge.js`

**Step 1: Add terminal tools to WebMCPBridge**

Find the `_initializeTools()` method in WebMCPBridge class and add these tools (after existing tools):

```javascript
        // ============================================================
        // Phase 50.5: AI Agent Control Surface - Terminal Tools
        // ============================================================

        {
            name: 'terminal_execute',
            description: 'Execute a command in a terminal',
            inputSchema: {
                type: 'object',
                properties: {
                    command: { type: 'string', description: 'Command to execute' },
                    terminal_id: { type: 'number', description: 'Terminal ID (optional, uses active)' }
                },
                required: ['command']
            },
            handler: async (params) => {
                self.#toolCallCounts['terminal_execute'] = (self.#toolCallCounts['terminal_execute'] || 0) + 1;
                try {
                    const cmd = params.command;
                    const termId = params.terminal_id || null;

                    // Call Python via Pyodide
                    const pyCode = `
import gemini
result = await gemini.run_command("${cmd.replace(/"/g, '\\"')}", ${termId})
{
    "output": result.stdout + result.stderr,
    "exit_code": result.exit_code,
    "success": result.exit_code == 0
}
                    `;

                    if (typeof pyodide !== 'undefined' && pyodide.runPythonAsync) {
                        const result = await pyodide.runPythonAsync(pyCode);
                        return result.toJs();
                    } else {
                        return { error: 'Pyodide not available', output: '', exit_code: -1 };
                    }
                } catch (error) {
                    console.error('WebMCP terminal_execute error:', error);
                    return { error: error.message, output: '', exit_code: -1 };
                }
            }
        },

        {
            name: 'terminal_create',
            description: 'Create a new terminal window on the map',
            inputSchema: {
                type: 'object',
                properties: {
                    x: { type: 'number', description: 'X position (default 100)' },
                    y: { type: 'number', description: 'Y position (default 100)' }
                }
            },
            handler: async (params) => {
                self.#toolCallCounts['terminal_create'] = (self.#toolCallCounts['terminal_create'] || 0) + 1;
                try {
                    const x = params.x || 100;
                    const y = params.y || 100;

                    const pyCode = `
import gemini
term = gemini.create_terminal(${x}, ${y})
{"terminal_id": term.term_id, "x": term.x, "y": term.y}
                    `;

                    if (typeof pyodide !== 'undefined' && pyodide.runPythonAsync) {
                        const result = await pyodide.runPythonAsync(pyCode);
                        return result.toJs();
                    } else {
                        return { error: 'Pyodide not available' };
                    }
                } catch (error) {
                    console.error('WebMCP terminal_create error:', error);
                    return { error: error.message };
                }
            }
        },

        {
            name: 'terminal_list',
            description: 'List all terminal windows',
            inputSchema: {
                type: 'object',
                properties: {}
            },
            handler: async (params) => {
                self.#toolCallCounts['terminal_list'] = (self.#toolCallCounts['terminal_list'] || 0) + 1;
                try {
                    const pyCode = `
import gemini
state = gemini.get_terminal_state()
state
                    `;

                    if (typeof pyodide !== 'undefined' && pyodide.runPythonAsync) {
                        const result = await pyodide.runPythonAsync(pyCode);
                        return result.toJs();
                    } else {
                        return { error: 'Pyodide not available', terminals: [] };
                    }
                } catch (error) {
                    console.error('WebMCP terminal_list error:', error);
                    return { error: error.message, terminals: [] };
                }
            }
        },
```

**Step 2: Commit**

```bash
git add systems/visual_shell/web/webmcp_bridge.js
git commit -m "feat(webmcp): add terminal_execute, terminal_create, terminal_list tools"
```

---

## Task 6: Add WebMCP File Browser Tools

**Files:**
- Modify: `systems/visual_shell/web/webmcp_bridge.js`

**Step 1: Add file browser tools (after terminal tools)**

```javascript
        // ============================================================
        // Phase 50.5: AI Agent Control Surface - File Browser Tools
        // ============================================================

        {
            name: 'file_list',
            description: 'List files at a given path',
            inputSchema: {
                type: 'object',
                properties: {
                    path: { type: 'string', description: 'Directory path to list' }
                },
                required: ['path']
            },
            handler: async (params) => {
                self.#toolCallCounts['file_list'] = (self.#toolCallCounts['file_list'] || 0) + 1;
                try {
                    const path = params.path || '/';

                    const pyCode = `
import gemini
if gemini.file_browser:
    result = await gemini.file_browser.navigate("${path.replace(/"/g, '\\"')}")
    files = [{"name": f.name, "type": f.file_type, "size": f.size} for f in gemini.file_browser.files]
    {"files": files, "path": "${path.replace(/"/g, '\\"')}"}
else:
    {"error": "File browser not running", "files": []}
                    `;

                    if (typeof pyodide !== 'undefined' && pyodide.runPythonAsync) {
                        const result = await pyodide.runPythonAsync(pyCode);
                        return result.toJs();
                    } else {
                        return { error: 'Pyodide not available', files: [] };
                    }
                } catch (error) {
                    console.error('WebMCP file_list error:', error);
                    return { error: error.message, files: [] };
                }
            }
        },

        {
            name: 'file_find',
            description: 'Find files matching a pattern',
            inputSchema: {
                type: 'object',
                properties: {
                    pattern: { type: 'string', description: 'Glob pattern (e.g., *.log)' },
                    path: { type: 'string', description: 'Root directory (default /)' }
                },
                required: ['pattern']
            },
            handler: async (params) => {
                self.#toolCallCounts['file_find'] = (self.#toolCallCounts['file_find'] || 0) + 1;
                try {
                    const pattern = params.pattern;
                    const path = params.path || '/';

                    const pyCode = `
import gemini
if gemini.file_browser:
    files = await gemini.file_browser.find_files("${pattern.replace(/"/g, '\\"')}", "${path.replace(/"/g, '\\"')}")
    {"files": files, "pattern": "${pattern.replace(/"/g, '\\"')}"}
else:
    {"error": "File browser not running", "files": []}
                    `;

                    if (typeof pyodide !== 'undefined' && pyodide.runPythonAsync) {
                        const result = await pyodide.runPythonAsync(pyCode);
                        return result.toJs();
                    } else {
                        return { error: 'Pyodide not available', files: [] };
                    }
                } catch (error) {
                    console.error('WebMCP file_find error:', error);
                    return { error: error.message, files: [] };
                }
            }
        },

        {
            name: 'file_read',
            description: 'Read file contents',
            inputSchema: {
                type: 'object',
                properties: {
                    path: { type: 'string', description: 'File path to read' },
                    max_bytes: { type: 'number', description: 'Max bytes to read (default 10000)' }
                },
                required: ['path']
            },
            handler: async (params) => {
                self.#toolCallCounts['file_read'] = (self.#toolCallCounts['file_read'] || 0) + 1;
                try {
                    const path = params.path;
                    const maxBytes = params.max_bytes || 10000;

                    const pyCode = `
import gemini
if gemini.file_browser:
    result = await gemini.file_browser.read_file("${path.replace(/"/g, '\\"')}", ${maxBytes})
    result
else:
    {"error": "File browser not running", "content": "", "truncated": False}
                    `;

                    if (typeof pyodide !== 'undefined' && pyodide.runPythonAsync) {
                        const result = await pyodide.runPythonAsync(pyCode);
                        return result.toJs();
                    } else {
                        return { error: 'Pyodide not available', content: '' };
                    }
                } catch (error) {
                    console.error('WebMCP file_read error:', error);
                    return { error: error.message, content: '' };
                }
            }
        },
```

**Step 2: Commit**

```bash
git add systems/visual_shell/web/webmcp_bridge.js
git commit -m "feat(webmcp): add file_list, file_find, file_read tools"
```

---

## Task 7: Add Composite WebMCP Tools

**Files:**
- Modify: `systems/visual_shell/web/webmcp_bridge.js`

**Step 1: Add composite tools (after file tools)**

```javascript
        // ============================================================
        // Phase 50.5: Composite Tools (Convenience)
        // ============================================================

        {
            name: 'run_in_new_terminal',
            description: 'Create a new terminal and execute a command',
            inputSchema: {
                type: 'object',
                properties: {
                    command: { type: 'string', description: 'Command to execute' },
                    x: { type: 'number', description: 'X position (default 100)' },
                    y: { type: 'number', description: 'Y position (default 100)' }
                },
                required: ['command']
            },
            handler: async (params) => {
                self.#toolCallCounts['run_in_new_terminal'] = (self.#toolCallCounts['run_in_new_terminal'] || 0) + 1;
                try {
                    const cmd = params.command;
                    const x = params.x || 100;
                    const y = params.y || 100;

                    const pyCode = `
import gemini
term = gemini.create_terminal(${x}, ${y})
result = await term.execute("${cmd.replace(/"/g, '\\"')}")
{
    "terminal_id": term.term_id,
    "output": result.stdout + result.stderr,
    "exit_code": result.exit_code,
    "success": result.exit_code == 0
}
                    `;

                    if (typeof pyodide !== 'undefined' && pyodide.runPythonAsync) {
                        const result = await pyodide.runPythonAsync(pyCode);
                        return result.toJs();
                    } else {
                        return { error: 'Pyodide not available' };
                    }
                } catch (error) {
                    console.error('WebMCP run_in_new_terminal error:', error);
                    return { error: error.message };
                }
            }
        },
```

**Step 2: Commit**

```bash
git add systems/visual_shell/web/webmcp_bridge.js
git commit -m "feat(webmcp): add run_in_new_terminal composite tool"
```

---

## Task 8: Manual Verification

**Files:**
- None (manual testing)

**Step 1: Start Chrome with debugging**

```bash
google-chrome --remote-debugging-port=9222 http://localhost:8001/index.html
```

**Step 2: Start the terminal**

```bash
python3 map_terminal.py
```

**Step 3: Test Python API via browser console**

```javascript
// In Chrome DevTools console:
await pyodide.runPythonAsync(`
import gemini
gemini.get_terminal_state()
`);
```

**Step 4: Test WebMCP tools (if WebMCP available)**

```javascript
// Check if tools are registered
navigator.modelContext.getTools().then(tools => {
    console.log(tools.filter(t => t.name.startsWith('terminal_') || t.name.startsWith('file_')));
});
```

**Step 5: Document verification**

```bash
echo "Phase 50.5: AI Agent Control Surface - VERIFIED" >> VERIFICATION.md
```

---

## Summary

| Task | Description | Files |
|------|-------------|-------|
| 1 | Create agent_control_surface.py | `agent_control_surface.py` (new) |
| 2 | Add get_state() to MapTerminal | `map_terminal.py` |
| 3 | Add helper methods to FileBrowser | `file_browser.py` |
| 4 | Integrate control surface | `map_terminal.py` |
| 5 | Add WebMCP terminal tools | `webmcp_bridge.js` |
| 6 | Add WebMCP file tools | `webmcp_bridge.js` |
| 7 | Add composite tools | `webmcp_bridge.js` |
| 8 | Manual verification | Manual |
