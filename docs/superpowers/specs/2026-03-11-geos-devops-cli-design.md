# GEOS DevOps CLI Design

**Date:** 2026-03-11
**Status:** Draft
**Scope:** Developer workflow CLI for building Geometry OS

## Overview

A CLI tool that accelerates Geometry OS development by unifying test execution, daemon control, and code quality checks into a single cohesive interface.

**v1.0 Scope:** `test`, `daemon`, `check` commands only. `map` and `brain` deferred to v1.1.

## Existing Implementation

The `geos/` directory already contains a basic CLI with:
- `geos status` - System health check
- `geos chat` - Conversational REPL (stub)
- `geos map` - ASCII map visualization
- `geos inspect` - Hilbert sector inspection

**Migration Strategy:**
- Keep existing commands as-is (additive approach)
- New commands (`test`, `daemon`, `check`) added alongside
- `geos inspect` remains unchanged (not merged with `map`)
- REPL accessed via `geos repl` subcommand (not default behavior)

## Goals

1. **Faster development cycles** - Smart test runner with limited auto-fix
2. **Unified daemon control** - One interface for all daemons
3. **Agent-native output** - JSON mode for AI agent consumption
4. **REPL for exploration** - Interactive shell via `geos repl`

## Command Structure

```
geos
├── status      # (existing) System health check
├── chat        # (existing) Conversational REPL
├── map         # (existing) ASCII map visualization
├── inspect     # (existing) Hilbert sector inspection
├── test        # (new) Test execution and repair
├── daemon      # (new) Daemon lifecycle management
├── check       # (new) Code quality (lint, types, imports)
└── repl        # (new) Interactive DevOps shell
```

## Command Groups

### 1. test - Test Execution and Repair

| Command | Description |
|---------|-------------|
| `geos test run [path]` | Run tests, optionally scoped to path |
| `geos test watch [path]` | Watch mode - rerun on file changes |
| `geos test fix` | Auto-fix collection errors (imports, syntax) |
| `geos test coverage [path]` | Show coverage report |
| `geos test failed` | Re-run only failed tests from last run |

**Flags:**
- `--json` - Machine-readable output
- `--evolution` - Scope to evolution_daemon tests
- `--swarm` - Scope to swarm tests
- `--visual` - Scope to visual_shell tests
- `--all` - Run all tests
- `--failfast` - Stop on first failure
- `--verbose` - Show full output
- `--parallel N` - Run N workers in parallel

**Smart Fix Behavior (Limited Scope):**
1. Create missing `__init__.py` files in test directories
2. Fix obvious relative imports (e.g., `from systems.x` → `from project.systems.x`)
3. Add obvious stdlib imports (e.g., `os`, `sys`, `pathlib` when used)
4. Report what was fixed

**NOT in scope:**
- Complex import resolution
- Syntax error repair
- Adding third-party imports

### 2. daemon - Daemon Lifecycle

| Command | Description |
|---------|-------------|
| `geos daemon start <name>` | Start a daemon (sisyphus, evolution, swarm) |
| `geos daemon stop <name>` | Stop a daemon gracefully |
| `geos daemon status [name]` | Show daemon status (all if no name) |
| `geos daemon logs <name>` | Tail daemon logs |
| `geos daemon restart <name>` | Restart a daemon |

**Flags:**
- `--all` - Apply to all daemons
- `--follow` - Follow log output (like `tail -f`)
- `--json` - Machine-readable status

**Daemon Discovery (Convention + Registry):**
1. Scan for daemon modules:
   - `systems/*/daemon.py` (catches swarm, sisyphus)
   - `systems/evolution_daemon/evolution_daemon.py` (special case)
2. PID files stored at `.geometry/{daemon_name}.pid`
3. Known daemons: `sisyphus`, `evolution`, `swarm`
4. Status check: verify PID exists and process is running

### 3. check - Code Quality

| Command | Description |
|---------|-------------|
| `geos check lint [path]` | Run linting (ruff/mypy) |
| `geos check types [path]` | Run type checking |
| `geos check imports [path]` | Check import organization |
| `geos check all [path]` | Run all checks |

**Flags:**
- `--fix` - Auto-fix issues where possible
- `--json` - Machine-readable output

## REPL Mode

Access via `geos repl` subcommand.

**Note:** `geos repl` is a DevOps shell for running test/daemon/check commands interactively. This is distinct from `geos chat` which is a conversational AI interface (LLM-powered).

```
$ geos repl
GEOS DevOps CLI v1.0.0
Type 'help' for commands, 'exit' to quit.

geos> test --evolution
Running evolution_daemon tests... (196 tests)
✓ All passed (0:02.14)

geos> daemon status --all
sisyphus    ● running    pid: 12345    uptime: 2h 14m
evolution   ● running    pid: 12346    uptime: 2h 14m
swarm       ○ stopped

geos> exit
```

## Output Formats

### Human-Readable (default)

```
$ geos test --evolution

Running evolution_daemon tests... (196 tests)

✓ test_mutation_protocol.py ............. 12 passed
✓ test_sandbox_manager.py ............... 8 passed
✗ test_fracture_detector.py ............. FAILED
  │ Line 47: AssertionError on gravity threshold
  │
  │ Run: geos test fix test_fracture_detector.py

3 suites passed, 1 failed (0:02.14)
```

### JSON (for agents)

```json
$ geos test --evolution --json

{
  "command": "test",
  "scope": "evolution_daemon",
  "total": 196,
  "passed": 188,
  "failed": 8,
  "duration_ms": 2140,
  "results": [
    {"file": "test_mutation_protocol.py", "status": "passed", "count": 12},
    {"file": "test_sandbox_manager.py", "status": "passed", "count": 8},
    {"file": "test_fracture_detector.py", "status": "failed", "error": "Line 47: AssertionError"}
  ]
}
```

## Implementation Approach

**Framework:** Keep existing `argparse` structure (no Click migration)

### Phase 1: Test Commands
- Add `test` subparser with `run`, `watch`, `fix`, `coverage`, `failed`
- Integrate pytest via subprocess
- Add `--json` output support

### Phase 2: Test Utilities
- Implement `test watch` with watchdog file watching
- Implement `test fix` with limited auto-repair scope
- Implement `test coverage` with coverage.py integration

### Phase 3: Daemon Control
- Add `daemon` subparser
- Implement daemon discovery via `systems/*/daemon.py` convention
- Implement start/stop/status/logs via PID files at `.geometry/{name}.pid`

### Phase 4: Code Quality
- Add `check` subparser
- Integrate ruff for linting
- Integrate mypy for type checking

### Phase 5: REPL
- Add `repl` subparser
- Interactive mode with prompt_toolkit
- Tab completion for commands

## Dependencies

- `argparse` - CLI framework (existing)
- `pytest` - Test execution
- `watchdog` - File watching
- `prompt_toolkit` - REPL
- `ruff` - Linting
- `mypy` - Type checking
- `coverage` - Coverage reporting

## Success Criteria

1. `geos test --watch` reruns tests within 2 seconds of file change
2. `geos test fix` resolves missing `__init__.py` and obvious stdlib import errors
3. `geos daemon status --all` completes in under 1 second
4. JSON output is valid and parseable by agents
5. REPL provides tab completion for commands

## Error Handling

| Scenario | Behavior |
|----------|----------|
| `test fix` can't fix | Print warning, continue, exit code 0 if partial success |
| `test fix` finds nothing | Print "No fixable errors found", exit code 0 |
| Daemon start fails | Print error message, exit code 1 |
| Daemon not found | Print "Daemon '{name}' not found", exit code 1 |
| `--follow` timeout | No timeout; Ctrl+C to exit |
| pytest not installed | Print "Install pytest: pip install pytest", exit code 3 |

## Exit Codes

| Code | Meaning |
|------|---------|
| 0 | Success |
| 1 | General error (test failure, daemon not found, etc.) |
| 2 | Usage error (invalid arguments) |
| 3 | Configuration error (missing dependencies) |

## File Structure

```
geos/
├── cli.py              # Main CLI entry point (existing)
├── commands/
│   ├── __init__.py
│   ├── status.py       # (existing) System health check
│   ├── chat.py         # (existing) Conversational REPL
│   ├── map.py          # (existing) ASCII map visualization
│   ├── inspect.py      # (existing) Hilbert sector inspection
│   ├── test.py         # (new) Test commands
│   ├── daemon.py       # (new) Daemon commands
│   ├── check.py        # (new) Code quality commands
│   └── repl.py         # (new) DevOps REPL
├── utils/
│   ├── __init__.py
│   ├── json_output.py  # JSON formatting helpers
│   ├── test_runner.py  # pytest integration
│   ├── daemon_mgr.py   # Daemon management
│   └── fixer.py        # Auto-fix utilities
```

## v1.1 Future Scope

Deferred to next version:
- `geos map entropy` - Spatial entropy metrics
- `geos brain status` - PixelBrain pipeline status
- Multi-line REPL commands

---

*Next step: Implementation plan via writing-plans skill*
