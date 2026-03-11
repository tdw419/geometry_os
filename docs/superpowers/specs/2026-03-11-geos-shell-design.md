# G-Shell Design: Geometry OS AI-Native Terminal

**Date**: 2026-03-11
**Status**: Approved
**Approach**: PTY Wrapper (Split-Brain)

## Overview

G-Shell is a terminal that bridges standard Linux shell workflows with Geometry OS's spatial/AI-native architecture. It wraps a bash PTY and provides:

1. **Automatic AI Context Injection** - `gemini` and `claude` commands receive the terminal screen state
2. **Geometry OS Commands** - `g` prefix commands for spatial operations
3. **State Synchronization** - Terminal screen exported to `.geometry/gnb_state.ascii`

## Problem Statement

When running Claude Code or Gemini CLI in a normal terminal:
- AIs cannot "see" the terminal state
- Users must copy-paste error messages and context
- No connection to Geometry OS spatial features

G-Shell solves this by making the terminal state-native and AI-visible.

## Architecture

```
┌─────────────────────────────────────────────────────────────────┐
│                        User Terminal                            │
└───────────────────────────┬─────────────────────────────────────┘
                            │ stdin/stdout
                            ▼
┌─────────────────────────────────────────────────────────────────┐
│                    GeosTerminal (PTY Wrapper)                   │
│  ┌─────────────┐  ┌──────────────┐  ┌────────────────────────┐ │
│  │ Context     │  │ Screen Buffer│  │ GNB State Sync         │ │
│  │ Injector    │  │ (120x36 grid)│  │ → .geometry/gnb_state  │ │
│  └─────────────┘  └──────────────┘  └────────────────────────┘ │
│  ┌─────────────────────────────────────────────────────────────┐│
│  │ GeosCommands (g map, g spawn, g gls, g ai)                  ││
│  └─────────────────────────────────────────────────────────────┘│
└───────────────────────────┬─────────────────────────────────────┘
                            │ PTY
                            ▼
┌─────────────────────────────────────────────────────────────────┐
│                       Bash / Zsh                                │
└─────────────────────────────────────────────────────────────────┘
```

## Components

### 1. GeosTerminal (`geos_terminal.py`)

The core PTY wrapper that:
- Forks a child process running bash
- Maintains a screen buffer (120x36 default)
- Handles SIGWINCH for resize events
- Syncs screen state to `.geometry/gnb_state.ascii` (every 0.5s or on AI command)
- Delegates input interception to ContextInjector and GeosCommands

### 2. ContextInjector (`context_injector.py`)

Detects and transforms AI commands:
- Intercepts `gemini <args>` and `claude <args>`
- Reads current GNB screen buffer
- Wraps prompt with context block:

```
CONTEXT (Terminal Screen):
$ ./run_broken_script.sh
ERROR: Connection refused on port 8767
$ _

USER REQUEST: why did this fail?
NOTE: You are inside G-Shell. Use the context above.
```

### 3. GeosCommands (`geos_commands.py`)

Handles `g` prefix commands:

| Command | Description | Implementation |
|---------|-------------|----------------|
| `g map <x> <y>` | Pan infinite map focal point | VATManager.set_focal_point() |
| `g spawn` | Create terminal tile on infinite map | TerminalVatBridge.spawn_terminal() |
| `g gls [path]` | Geometric ls with Hilbert entropy | File metadata + entropy calculation |
| `g ai <prompt>` | Write context to intent file | Write to `.geometry/intent/last_ai_request.json` |
| `g help` | Show available commands | Print command list |

## State Files

| File | Purpose | Update Frequency |
|------|---------|------------------|
| `.geometry/gnb_state.ascii` | Terminal screen for AI consumption | 0.5s / on-demand |
| `.geometry/intent/last_ai_request.json` | Pending AI requests | On `g ai` command |

## Entry Point

Add `shell` subcommand to existing CLI:

```bash
python3 geometry_os_cli.py shell
```

Or run directly:

```bash
python3 systems/visual_shell/geos_terminal.py
```

## File Structure

```
systems/visual_shell/
├── geos_terminal.py           # PTY wrapper + screen buffer
├── context_injector.py        # AI prompt wrapping
├── geos_commands.py           # g-* command handlers
└── api/
    ├── geometric_terminal_bridge.py  # Existing
    └── terminal_vat_bridge.py        # Existing

geometry_os_cli.py             # Add "shell" subcommand
```

## User Experience

### Normal Workflow

```bash
# Launch
$ python3 geometry_os_cli.py shell

# Use bash normally
$ ls -la
$ ./run_script.sh
ERROR: Connection refused on port 8767

# Ask AI with automatic context
$ gemini "why did this fail?"
# (Gemini receives the error message automatically)

# Geometry OS commands
$ g map 2048 2048     # Pan infinite map
$ g spawn             # Create visual terminal tile
$ g gls               # Geometric file listing
```

### Comparison: Standard vs G-Shell

| Feature | Standard Terminal | G-Shell |
|---------|------------------|---------|
| State Context | Ephemeral | Persistent GNB sync |
| AI Visibility | Screen-scraping | State-native |
| Spatial Awareness | None | VAT-integrated |
| Command Scope | Linux syscalls | Geometric opcodes |

## Implementation Notes

### PTY Handling

```python
pid, fd = pty.fork()
if pid == 0:
    os.execvpe("bash", ["bash"], os.environ)
# Parent: intercept and sync
```

### Screen Buffer

- 2D array of characters (120x36 default)
- Updated on each PTY read
- Exported as ASCII to `.geometry/gnb_state.ascii`

### Context Injection

```python
if command.startswith(("gemini", "claude")):
    context = read_gnb_state()
    enhanced_prompt = f"CONTEXT:\n{context}\n\nUSER REQUEST: {prompt}"
    execute_command(enhanced_prompt)
```

## Success Criteria

1. Can run `python3 geometry_os_cli.py shell` and get a working bash shell
2. `gemini "question"` includes terminal screen context automatically
3. `claude "question"` includes terminal screen context automatically
4. `g map <x> <y>` moves the infinite map focal point
5. `g spawn` creates a terminal tile on the visual shell
6. `.geometry/gnb_state.ascii` reflects current terminal state

## Future Enhancements

- Hilbert-curve file navigation (`g cd`)
- Live tile output (commands render to PixiJS tiles)
- Multi-terminal coordination via VAT
- GPU-accelerated screen rendering via WGSL
