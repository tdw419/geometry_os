# Coding Conventions

**Analysis Date:** 2026-02-11

## Naming Patterns

**Files:**
- Python: `snake_case.py` (e.g., `wasm_gpu_bridge.py`, `pixelrts_v2_core.py`)
- Rust: `snake_case.rs` (e.g., `hilbert_pathfinder.rs`, `hot_swap.rs`)
- TypeScript: `camelCase.ts` or `kebab-case.ts` (mixed usage in codebase)
- Tests: `test_*.py` for unit tests, `*.spec.ts` for TypeScript tests

**Functions:**
- Python: `snake_case` (e.g., `generate_lut()`, `configure_memory()`)
- Rust: `snake_case` (e.g., `new()`, `distance_to()`, `next_waypoint()`)
- TypeScript: `camelCase` (e.g., `inspectTreeStructure()`, `testParseSourceCodeDefinitions()`)

**Variables:**
- Python: `snake_case` (e.g., `pixel_idx`, `grid_size`, `memory_pages`)
- Rust: `snake_case` (e.g., `map_width`, `match_count`, `write_y`)
- TypeScript: `camelCase` (e.g., `samplePythonContent`, `queryString`)

**Types/Classes:**
- Python: `PascalCase` (e.g., `HilbertCurve`, `PixelRTSEncoder`, `WASMGPUBridge`)
- Rust: `PascalCase` (e.g., `VatId`, `HilbertPath`, `Waypoint`, `VatError`)
- TypeScript: `PascalCase` (e.g., `TestWASMGPUBridge`, `WASMRuntime`)

**Constants:**
- Python: `UPPER_CASE` (e.g., `MAX_MEMORY_PAGES`, `MAGIC`, `VERSION`)
- Rust: `SCREAMING_SNAKE_CASE` (e.g., `SourceCityLoader` is a type, but const values use UPPER)

**Private Members:**
- Python: `_leading_underscore` (e.g., `_lut`, `_memory_data`, `_last_return_value`)
- Rust: No prefix (privacy via `pub` keyword)

## Code Style

**Formatting:**
- Python: Black (line-length: 88)
  - Configured in `pyproject.toml` with `[tool.black]` section
- Rust: rustfmt (default settings)
- TypeScript: Prettier (where configured)
- Shell: shfmt with `-i 2 -ci` (2-space indent, comma-first)

**Linting:**
- Python: flake8 (max-line-length: 88, ignores E203, W503)
  - Configured in `.pre-commit-config.yaml` and `pyproject.toml`
- TypeScript: ESLint (various configs across subprojects)
- Shell: shellcheck (severity: warning)

**Import Organization:**
Python imports follow this order (from `systems/pixel_compiler`):
1. Standard library imports
2. Third-party imports (numpy, PIL, etc.)
3. Local application imports (relative imports)
4. Type checking imports (under `TYPE_CHECKING` guard)

Example from `wasm_runtime.py`:
```python
from pathlib import Path
from typing import Optional, List, Any, TYPE_CHECKING
import struct

from .wasm_extractor import WASMExtractor
from .wasm_gpu_bridge import WASMGPUBridge, ExecutionResult
from .wasm_tracer import WasmTracer, TraceLevel

if TYPE_CHECKING:
    from .wasm_debugger import WasmDebugger
```

**Path Aliases:**
- Python: Uses relative imports within packages (`from .wasm_extractor import WASMExtractor`)
- Tests: Add parent directories to sys.path for imports

## Error Handling

**Patterns:**
- Python: Raise specific exceptions with descriptive messages
  - `ValueError` for invalid arguments (e.g., "Invalid mode", "Grid size must be power of 2")
  - `RuntimeError` for operational failures (e.g., "memory not configured")
  - `FileNotFoundError` for missing files
  - Custom exceptions in domain-specific code

Example from `wasm_gpu_bridge.py`:
```python
def configure_memory(self, pages: int) -> None:
    if pages <= 0:
        raise ValueError("pages must be positive")
    if pages > self.MAX_MEMORY_PAGES:
        raise ValueError(f"too many pages (max {self.MAX_MEMORY_PAGES})")
```

- Rust: Use `Result<T, E>` with `thiserror` for error types
  - Custom error enums with `#[derive(Debug, thiserror::Error)]`
  - Descriptive error messages via `#[error("...")]` attributes

Example from `hot_swap.rs`:
```rust
#[derive(Debug, thiserror::Error)]
pub enum VatError {
    #[error("Vat not found: {0:?}")]
    VatNotFound(VatId),

    #[error("Serialization failed: {0}")]
    SerializationFailed(String),
}
```

**Validation:**
- Validate inputs at function entry
- Use type hints for all function parameters
- Return `None`/`Option` for optional values rather than throwing errors

## Logging

**Framework:**
- Python: `logging` module (standard library) or `print()` for simple output
- Rust: `log` crate with `env_logger` for runtime initialization

**Patterns:**
- Use `print()` for mock mode warnings and development output
- Reserve logging for actual runtime events
- Mock mode warnings: `print(f"Warning: {message}")`

Example from `wasm_gpu_bridge.py`:
```python
if self.mock:
    print("Warning: wgpu not found or failed. Using Mock backend for testing.")
```

## Comments

**When to Comment:**
- Module docstrings: Triple-quoted strings at file start explaining purpose
- Class docstrings: Describe class purpose and usage
- Function docstrings: Args, Returns, Raises sections
- Inline comments: For non-obvious logic (e.g., Hilbert curve algorithm)

**JSDoc/TSDoc:**
- Used in TypeScript code
- Not extensively used in Python (docstrings instead)

**Module Docstring Example** from `test_wasm_gpu_bridge.py`:
```python
"""
Tests for WASM GPU Bridge

Tests the connection between Python and the GPU WASM VM shader.
Follows TDD approach - tests written before implementation.
"""
```

**Function Docstring Example** from `wasm_gpu_bridge.py`:
```python
def configure_memory(self, pages: int) -> None:
    """
    Allocate WASM linear memory with the specified number of 64KB pages.

    Args:
        pages: Number of 64KB pages to allocate (must be positive and <= MAX_MEMORY_PAGES)

    Raises:
        ValueError: If pages is not positive or exceeds maximum
    """
```

## Function Design

**Size:**
- Functions should be focused on a single responsibility
- Prefer smaller functions under 50 lines
- Complex operations broken into helper methods

**Parameters:**
- Use keyword arguments for optional parameters
- Provide default values where appropriate
- Type hints required for all parameters

Example from `pixelrts_v2_core.py`:
```python
def encode(
    self,
    data: bytes,
    metadata: dict = None,
    grid_size: int = None,
    blueprint: dict = None
) -> bytes:
```

**Return Values:**
- Always specify return type in type hints
- Return `None` for operations without meaningful return
- Use dataclass/NamedTuple for complex return values

Example from `wasm_gpu_bridge.py`:
```python
class ExecutionResult(NamedTuple):
    success: bool
    return_value: Optional[int]
    memory_dump: Optional[bytes]
    trace_data: List[int]
    instruction_count: int
    error: Optional[str] = None
```

## Module Design

**Exports:**
- Python: `__all__` lists for public API (where used)
- Explicit public functions/classes
- Private members use leading underscore

**Barrel Files:**
- `__init__.py` files import from submodules for cleaner API
- Example: `from .wasm_extractor import WASMExtractor`

**Rust Modules:**
- `pub mod` declarations in `lib.rs`
- `pub use` for re-exports
- Module structure follows directory hierarchy

Example from `runtime/src/lib.rs`:
```rust
pub mod cognitive;
pub mod spatial;
pub mod hot_swap;
pub mod source_city;

pub use cognitive::ace_runtime;
pub use cognitive::host_functions;
```

## Language-Specific Patterns

**Python:**
- Use `@classmethod` for alternative constructors (e.g., `from_png()`, `from_wasm()`)
- Context managers (`with` statements) for resource management
- `@dataclass` for simple data containers
- `@property` for computed attributes

**Rust:**
- `#[no_std]` for WASM-compatible agents
- `extern "C"` for FFI boundaries
- `Option<T>` instead of null
- `Result<T, E>` for error handling
- `impl Default` for default values
- Derive macros: `Debug`, `Clone`, `Copy`, `Serialize`, `Deserialize`

**TypeScript:**
- Jest/Vitest for testing with `describe()`/`it()` blocks
- Async/await for asynchronous operations
- Type imports: `import type { ... }`
- Enum classes for typed constants

## Concurrency Patterns

**Python:**
- Use `threading` for simple cases
- `asyncio` for I/O-bound operations
- Mock mode for testing without GPU/concurrency

**Rust:**
- `Arc<Mutex<T>>` for shared state
- `tokio` for async runtime (where used)
- Message passing for agent communication

---

*Convention analysis: 2026-02-11*
