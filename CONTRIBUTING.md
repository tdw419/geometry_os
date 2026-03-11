# Contributing to Geometry OS

This document establishes coding standards and conventions for the Geometry OS codebase.

## Quick Reference

| Element | Convention | Example |
|---------|------------|---------|
| Python files | `snake_case.py` | `evolution_daemon.py` |
| Python classes | `PascalCase` | `EvolutionDaemon` |
| Python functions | `snake_case` | `run_evolution_cycle()` |
| Python constants | `SCREAMING_SNAKE_CASE` | `MAX_AGENTS = 100` |
| Test files | `test_*.py` | `test_evolution_daemon.py` |
| Rust files | `snake_case.rs` | `damage_tracker.rs` |
| Rust structs | `PascalCase` | `DamageTracker` |
| Directories (Python) | `snake_case/` | `evolution_daemon/` |
| Directories (Web/Config) | `kebab-case/` | `pixelrts-v2/` |

---

## Python Conventions

### File Naming

```bash
# ✅ Correct
evolution_daemon.py
test_evolution_daemon.py
pixel_brain_converter.py

# ❌ Avoid
evolutionDaemon.py          # camelCase
EvolutionDaemon.py          # PascalCase
evolution-daemon.py         # kebab-case
```

### Class Naming

```python
# ✅ Correct
class EvolutionDaemon:
    pass

class PixelRTSConverter:
    pass

# ❌ Avoid
class evolution_daemon:      # snake_case
class pixelRTSConverter:     # mixed case
```

### Function Naming

```python
# ✅ Correct
def run_evolution_cycle():
def calculate_fitness_score():
def _private_helper():       # private with underscore

# ❌ Avoid
def runEvolutionCycle():     # camelCase
def RunEvolutionCycle():     # PascalCase
```

### Import Organization

Use this order (enforced by ruff):
1. Standard library
2. Third-party packages
3. First-party (systems, geometry_os, pixelrts_v2)
4. Local imports

```python
# Standard library
import asyncio
import json
from pathlib import Path
from typing import Optional, List

# Third-party
import numpy as np
from PIL import Image

# First-party
from systems.evolution_daemon.core import WebMCPClient
from systems.pixel_compiler import VLMHealthChecker

# Local
from .helpers import private_function
```

### Type Hints

```python
# ✅ Correct - use type hints for public functions
def process_agent(agent_id: str, rounds: int = 10) -> dict[str, Any]:
    ...

# ✅ Private functions can omit complex type hints
def _internal_process(data):
    ...
```

---

## Rust Conventions

### File Naming

```bash
# ✅ Correct
damage_tracker.rs
hilbert_writer.rs
riscv_executor.rs
```

### Struct Naming

```rust
// ✅ Correct
pub struct DamageTracker {
    dirty_rects: Vec<DirtyRect>,
}

pub struct RiscvExecutor {
    // ...
}
```

### Module Organization

```rust
// lib.rs - Public API
pub mod compositor;
pub mod damage_tracker;
pub mod riscv;

// Re-export main types
pub use compositor::Compositor;
pub use damage_tracker::{DamageTracker, DirtyRect};
```

---

## Test Conventions

### File Naming

```bash
# ✅ Correct
test_evolution_daemon.py     # Unit tests
test_integration_pipeline.py  # Integration tests

# ❌ Avoid
evolution_daemon_test.py     # Wrong prefix
tests_evolution_daemon.py    # Wrong prefix
```

### Test Class Naming

```python
# ✅ Correct
class TestEvolutionDaemon:
    def test_initialization(self):
        ...
    
    def test_run_cycle_with_valid_input(self):
        ...

# ❌ Avoid
class test_evolution_daemon:    # snake_case
class TestEvolutionDaemonV2:    # version in class name
```

### Test Markers

Use pytest markers defined in `pytest.ini`:

```python
import pytest

@pytest.mark.integration
def test_full_evolution_pipeline():
    ...

@pytest.mark.slow
def test_large_scale_simulation():
    ...
```

---

## Directory Conventions

### Python Packages

Use `snake_case` for Python package directories:

```
systems/
├── evolution_daemon/     # ✅ snake_case
├── pixel_compiler/       # ✅ snake_case
├── visual_shell/         # ✅ snake_case
```

### Web/Configuration Directories

Use `kebab-case` for web or configuration directories:

```
pixelrts-v2/              # ✅ kebab-case
geoasm-cli/               # ✅ kebab-case
```

---

## Documentation

### Python Docstrings

Use triple-quoted docstrings with description:

```python
def run_evolution_cycle(rounds: int = 10) -> dict:
    """Run the evolution cycle for specified number of rounds.
    
    Args:
        rounds: Number of evolution rounds to run.
        
    Returns:
        Dictionary containing evolution results.
        
    Raises:
        ValueError: If rounds is negative.
    """
    ...
```

### Rust Documentation

Use `///` for documentation comments:

```rust
/// Runs a single evolution cycle.
///
/// # Arguments
///
/// * `rounds` - Number of rounds to execute
///
/// # Returns
///
/// A `Result` containing evolution statistics or an error.
pub fn run_evolution_cycle(rounds: u32) -> Result<EvolutionStats, Error> {
    ...
}
```

---

## Version Control

### Commit Messages

```
<type>: <subject>

<body>

<footer>
```

Types:
- `feat`: New feature
- `fix`: Bug fix
- `refactor`: Code refactoring
- `docs`: Documentation changes
- `test`: Test additions/modifications
- `chore`: Maintenance tasks

### Branch Naming

```
feat/evolution-daemon-v14
fix/memory-leak-pixel-compiler
refactor/damage-tracker
docs/api-reference
```

---

## Linting and Formatting

### Python

```bash
# Run ruff linting
ruff check .

# Run ruff formatting
ruff format .

# Run tests
pytest -v
```

### Rust

```bash
# Run rustfmt
cargo fmt

# Run clippy
cargo clippy -- -D warnings

# Run tests
cargo test
```

---

## OpenSpec Workflow

When implementing features tracked in OpenSpec:

1. Check `openspec/changes/` for active work
2. Create feature branch following naming convention
3. Implement with tests
4. Run linting and formatting
5. Archive completed changes to `openspec/archive/`

---

## Questions?

- Check `AGENTS.md` for project-specific guidance
- Review `README.md` for architecture overview
- Open an issue for clarification
