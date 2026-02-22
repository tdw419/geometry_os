# Phase 50.5: AI Agent Control Surface - Design Document

**Goal:** Create a structured API for AI agents to interact with Geometry OS terminals and file browser through both WebMCP tools and Python APIs.

**Architecture:** Layered design with WebMCP tools as thin wrappers calling rich Python APIs exposed via Pyodide. All business logic lives in Python.

**Tech Stack:** Python (asyncio, dataclasses), JavaScript (WebMCP), Pyodide, Chrome DevTools Protocol

---

## Architecture Overview

```
┌─────────────────────────────────────────────────────────────────┐
│                      AI Agents (External)                        │
│                   Chrome Gemini / Claude / GPT                   │
└─────────────────────┬───────────────────────────────────────────┘
                      │ WebMCP Protocol
                      ▼
┌─────────────────────────────────────────────────────────────────┐
│                   WebMCP Bridge (JS)                             │
│  ┌─────────────────┐  ┌─────────────────┐  ┌─────────────────┐  │
│  │ terminal_execute│  │ terminal_create │  │ file_list       │  │
│  │ terminal_list   │  │ file_find       │  │ file_navigate   │  │
│  └────────┬────────┘  └────────┬────────┘  └────────┬────────┘  │
└───────────┼────────────────────┼────────────────────┼───────────┘
            │                    │                    │
            ▼                    ▼                    ▼
┌─────────────────────────────────────────────────────────────────┐
│                 Pyodide Python Environment                       │
│  ┌─────────────────────────────────────────────────────────────┐│
│  │ gemini.terminal_manager → TerminalManager (from Python)     ││
│  │ gemini.file_browser → FileBrowser (from Python)             ││
│  │                                                             ││
│  │ Helper Functions:                                           ││
│  │   run_in_terminal(cmd, term_id=None) → result               ││
│  │   create_terminal(x, y) → term_id                           ││
│  │   list_files(path) → [FileInfo]                             ││
│  │   find_file(pattern, path) → FileInfo | None                ││
│  └─────────────────────────────────────────────────────────────┘│
└─────────────────────┬───────────────────────────────────────────┘
                      │ Python imports
                      ▼
┌─────────────────────────────────────────────────────────────────┐
│                   Core Python Modules                            │
│  ┌──────────────────────┐  ┌──────────────────────┐             │
│  │ map_terminal.py      │  │ file_browser.py      │             │
│  │ - TerminalManager    │  │ - FileBrowser        │             │
│  │ - MapTerminal        │  │ - FileInfo           │             │
│  │ - InputServer        │  │ - ClickServer        │             │
│  └──────────────────────┘  └──────────────────────┘             │
│  ┌──────────────────────┐                                       │
│  │ vm_linux_bridge.py   │  (Shared execution backend)           │
│  │ - HostBridge         │                                       │
│  │ - QEMUBridge         │                                       │
│  └──────────────────────┘                                       │
└─────────────────────────────────────────────────────────────────┘
```

**Key insight:** WebMCP tools are thin wrappers that call Python APIs. All business logic lives in Python.

---

## WebMCP Tools Specification

### Terminal Tools

| Tool | Parameters | Returns | Description |
|------|------------|---------|-------------|
| `terminal_execute` | `command: string, terminal_id?: number` | `{output, exit_code, terminal_id}` | Execute command in terminal |
| `terminal_create` | `x?: number, y?: number` | `{terminal_id, x, y}` | Create new terminal window |
| `terminal_list` | — | `[{id, working_dir, focused}]` | List all terminals |
| `terminal_focus` | `terminal_id: number` | `{success}` | Focus specific terminal |
| `terminal_close` | `terminal_id: number` | `{success}` | Close terminal |

### File Browser Tools

| Tool | Parameters | Returns | Description |
|------|------------|---------|-------------|
| `file_list` | `path: string` | `[{name, type, size, color}]` | List files at path |
| `file_navigate` | `path: string` | `{success, files_count}` | Navigate browser to path |
| `file_find` | `pattern: string, path?: string` | `[{name, path, type}]` | Find files matching pattern |
| `file_read` | `path: string, max_bytes?: number` | `{content, truncated}` | Read file contents |

### Composite Tools

| Tool | Parameters | Returns | Description |
|------|------------|---------|-------------|
| `run_in_new_terminal` | `command: string` | `{terminal_id, output}` | Create terminal + execute |
| `find_and_edit` | `pattern: string, editor?: string` | `{files_found, terminal_id}` | Find files + open in editor |

---

## Python API (Pyodide Environment)

### Global Namespace: `gemini`

```python
import gemini

# Terminal management
gemini.terminal_manager     # TerminalManager instance
gemini.terminals            # Dict[int, MapTerminal] shorthand
gemini.active_terminal      # MapTerminal | None

# File browser
gemini.file_browser         # FileBrowser instance (when running)

# Convenience functions
gemini.run_command(cmd, term_id=None)    # → CommandResult
gemini.create_terminal(x=100, y=100)     # → MapTerminal
gemini.list_files(path)                   # → List[FileInfo]
gemini.find_file(pattern, root="/")       # → List[FileInfo]
```

### MapTerminal Object

```python
class MapTerminal:
    term_id: int
    working_dir: str
    focused: bool
    x: int
    y: int
    width: int
    height: int
    command_history: List[str]
    lines: List[str]

    async def execute(self, command: str) -> CommandResult
    async def input(self, command: str)
    def clear(self)
```

### CommandResult

```python
@dataclass
class CommandResult:
    stdout: str
    stderr: str
    exit_code: int
    success: bool  # exit_code == 0
```

### FileInfo

```python
@dataclass
class FileInfo:
    name: str
    path: str
    file_type: str
    size: int
    permissions: str
    modified: str
    x: int
    y: int
    color: int
```

---

## Implementation Plan

### File Changes

| File | Action | Description |
|------|--------|-------------|
| `agent_control_surface.py` | **Create** | Pyodide registration + helper functions |
| `map_terminal.py` | Modify | Add `get_state()`, call registration |
| `file_browser.py` | Modify | Add `read_file()`, `find_files()` |
| `webmcp_bridge.js` | Modify | Add 10 new tools |

### Data Flow

```
1. Chrome Gemini calls WebMCP tool
2. webmcp_bridge.js handler calls Pyodide
3. Python executes via TerminalManager/FileBrowser
4. Command runs via VMLinuxBridge
5. Result flows back: CommandResult → dict → JS → WebMCP response
```

### Integration Point

```python
# In map_terminal.py main()
manager = TerminalManager(ws, bridge)

# Register with Pyodide
try:
    from agent_control_surface import register_control_surface
    register_control_surface(manager)
except ImportError:
    print("⚠ Agent Control Surface not available")
```

### Testing Strategy

1. **Unit test** `agent_control_surface.py` with mock manager
2. **Integration test** WebMCP tools via Chrome DevTools console
3. **E2E test** with Pyodide script running multi-step workflow

---

## Example Usage

### WebMCP Call (External Agent)

```json
{
  "tool": "terminal_execute",
  "params": {"command": "ls -la /tmp", "terminal_id": 1}
}
```

### Pyodide Script (In-Browser Python)

```python
import gemini

term = gemini.create_terminal(x=100, y=100)
result = await term.execute("cd /project && make build")

if not result.success:
    logs = gemini.find_file("*.log", "/project")
    for log in logs:
        content = await gemini.file_browser.read_file(log.path)
        if "error" in content.lower():
            print(f"Found error in {log.path}")
```
