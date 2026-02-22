# Testing Patterns

**Analysis Date:** 2026-02-11

## Test Framework

**Python:**
- **Runner:** pytest
- **Config:** `pyproject.toml` with `[tool.pytest]` section (minimal config present)
- **Assertion Library:** Built-in pytest assertions
- **Run Commands:**
```bash
# Run all tests
PYTHONPATH=. pytest systems/pixel_compiler/tests/

# Run specific test file
pytest systems/pixel_compiler/tests/test_wasm_gpu_bridge.py -v

# Run with coverage
pytest --cov=systems/pixel_compiler tests/

# Run only unit tests
pytest -m unit

# Run only integration tests
pytest -m integration
```

**TypeScript:**
- **Runner:** Vitest or Jest (varies by subproject)
- **Config:** `vitest.config.ts` or `jest.config.js`
- **Run Commands:**
```bash
# Vitest
vitest

# Jest
jest
```

**Rust:**
- **Runner:** cargo test
- **Run Commands:**
```bash
# Run all tests
cargo test

# Run specific test
cargo test test_name

# Run tests in workspace
cargo test --workspace
```

## Test File Organization

**Python Location:**
- Co-located with source code in `tests/` subdirectories
- Main test directories:
  - `systems/pixel_compiler/tests/` - Core module tests
  - `tests/` - Integration and end-to-end tests
  - `tests/unit/` - Unit tests for specific modules
  - `tests/integration/` - Integration tests

**Python Naming:**
- `test_*.py` for test modules
- `test_*.py` pattern for individual test files
- Example: `test_wasm_gpu_bridge.py`, `test_pixelrts_v2_encoding.py`

**Directory Structure:**
```
systems/pixel_compiler/
├── tests/
│   ├── conftest.py          # Shared fixtures
│   ├── __init__.py
│   ├── test_*.py            # Unit tests
│   └── benchmarks/          # Performance benchmarks
tests/
├── conftest.py              # Root test fixtures
├── unit/                    # Unit tests
│   └── test_*.py
└── integration/             # Integration tests
    └── test_*.py
```

**TypeScript Structure:**
- `__tests__/` directories alongside source
- `*.spec.ts` naming pattern
- Example: `apps/kilocode/packages/types/src/__tests__/kilocode.test.ts`

## Test Structure

**Python Suite Organization:**
```python
class TestWASMGPUBridge:
    """Test suite for WASMGPUBridge class"""

    def test_bridge_initialization(self, tmp_path):
        """Test that WASMGPUBridge can be initialized with shader path"""
        # Arrange
        shader_path = tmp_path / "test_shader.wgsl"
        shader_path.write_text(/* shader content */)

        # Act
        from systems.pixel_compiler.wasm_gpu_bridge import WASMGPUBridge
        bridge = WASMGPUBridge(str(shader_path))

        # Assert
        assert bridge.device is not None
```

**Patterns:**
- **Arrange-Act-Assert (AAA):** Tests organized into three phases
- **Descriptive test names:** `test_<function>_<condition>_<expected_result>()`
- **Class-based suites:** Related tests grouped in classes
- **Docstrings:** Each test has a docstring explaining what it tests

**Setup Pattern:**
```python
def test_with_fixture(self, sample_elf_binary):
    """Test using a fixture"""
    # Use fixture directly
    result = process_binary(sample_elf_binary)
    assert result is not None
```

**Teardown Pattern:**
```python
@pytest.fixture
def temp_file() -> Generator[Path, None, None]:
    """Create temp file that auto-cleans"""
    with tempfile.NamedTemporaryFile(mode='wb', delete=False) as f:
        temp_path = Path(f.name)
    yield temp_path
    # Cleanup after test
    if temp_path.exists():
        temp_path.unlink()
```

**Assertion Pattern:**
```python
# Direct assertions
assert result.success is True
assert len(data) > 0
assert "kernel" in metadata["type"]

# Exception testing
with pytest.raises(ValueError, match="Invalid mode"):
    PixelRTSEncoder(mode="invalid")

# Approximate matching
assert result == pytest.approx(expected, abs=0.001)
```

## Mocking

**Framework:**
- Python: pytest's monkeypatch, tmp_path fixtures
- No explicit mock library imports (mock mode built into classes)

**Mock Mode Pattern:**
Classes often have built-in mock mode for testing without external dependencies:

```python
class WASMGPUBridge:
    def __init__(self, shader_path: str = None):
        self.mock = wgpu is None  # Auto-detect mock mode
        # ... initialization ...
        if self.mock:
            print("Warning: wgpu not found. Using Mock backend.")

    def execute(self, ...):
        if self.mock:
            # Mock implementation for testing
            return ExecutionResult(success=True, return_value=42, ...)
        # Real GPU implementation
```

**What to Mock:**
- External dependencies (wgpu, PIL imports when unavailable)
- GPU operations (use mock mode)
- File I/O (use tmp_path fixture)
- Network operations (not heavily tested)

**What NOT to Mock:**
- Core business logic
- Data transformations
- Encoding/decoding algorithms

## Fixtures and Factories

**Test Data:**
Fixtures defined in `conftest.py` provide reusable test data:

```python
@pytest.fixture
def sample_elf_binary() -> bytes:
    """Create a minimal valid ELF binary for testing."""
    elf_header = bytearray([
        0x7f, 0x45, 0x4c, 0x46,  # ELF magic
        # ... header construction ...
    ])
    return elf_bytes
```

**Location:**
- Primary: `systems/pixel_compiler/tests/conftest.py` (449 lines)
- Secondary: `tests/conftest.py` (minimal, just adds path)

**Key Fixtures from `conftest.py`:**
- `sample_elf_binary` - Minimal ELF binary bytes
- `sample_elf_file` - Temporary ELF file with auto-cleanup
- `sample_rts_png` - Test .rts.png file with metadata
- `sample_blueprint` - Complete PixelRTSBlueprint instance
- `temp_output_dir` - Temporary directory for outputs
- `sample_test_data` - 64KB of test data with patterns

**Parametrized Fixtures:**
```python
@pytest.fixture(params=[(128, 128), (256, 256), (512, 512)])
def benchmark_image_size(request) -> tuple[int, int]:
    """Parametrized fixture for common image sizes."""
    return request.param
```

## Coverage

**Requirements:** None explicitly enforced (no coverage thresholds)

**View Coverage:**
```bash
pytest --cov=systems/pixel_compiler --cov-report=html
```

**Coverage Tools:**
- `pytest-cov` for Python (listed in pyproject.toml)
- No coverage configuration found in project

## Test Types

**Unit Tests:**
- Scope: Individual functions and classes
- Location: `systems/pixel_compiler/tests/test_*.py`
- Approach: Fast, isolated, use fixtures for test data
- Marked with: `@pytest.mark.unit`

**Integration Tests:**
- Scope: Multiple components working together
- Location: `tests/integration/test_*.py`
- Approach: Test real interactions, may use external resources
- Marked with: `@pytest.mark.integration`

**E2E Tests:**
- Scope: Full workflows from start to finish
- Location: `tests/integration/test_*_e2e.py`
- Approach: Test complete user scenarios

**Performance/Benchmark Tests:**
- Scope: Performance measurement
- Location: `systems/pixel_compiler/benchmarks/*.py`
- Framework: Custom benchmark classes
- Marked with: `@pytest.mark.benchmark` or `@pytest.mark.slow`

## Common Patterns

**Async Testing (Python):**
```python
# Not heavily used - most code is synchronous
# For async code, use pytest-asyncio
@pytest.mark.asyncio
async def test_async_function():
    result = await async_operation()
    assert result is not None
```

**Error Testing:**
```python
# Pattern 1: pytest.raises context manager
def test_invalid_mode():
    with pytest.raises(ValueError, match="Invalid mode"):
        PixelRTSEncoder(mode="invalid")

# Pattern 2: Direct exception checking
def test_missing_file():
    with pytest.raises(FileNotFoundError):
        WASMRuntime.from_png("/nonexistent/path.rts.png")
```

**Property-Based Testing:**
```python
# Round-trip testing with various inputs
@pytest.mark.parametrize("data_size", [1, 10, 100, 1000, 10000])
def test_encode_decode_various_sizes(data_size):
    data = b"X" * data_size
    encoder = PixelRTSEncoder(mode="standard")
    decoder = PixelRTSDecoder()

    png_bytes = encoder.encode(data)
    decoder.set_metadata(encoder.get_metadata())
    decoded_data = decoder.decode(png_bytes)

    assert decoded_data == data
```

**Temp File Pattern:**
```python
def test_with_temp_file(self, tmp_path):
    """pytest's tmp_path fixture auto-cleans"""
    test_file = tmp_path / "test.png"
    # Use test_file...
    # Auto-cleanup after test
```

## Custom Markers

**Registered in `conftest.py`:**
```python
def pytest_configure(config):
    config.addinivalue_line("markers", "unit: Unit tests (fast, isolated)")
    config.addinivalue_line("markers", "integration: Integration tests (slower)")
    config.addinivalue_line("markers", "benchmark: Performance tests")
    config.addinivalue_line("markers", "slow: Slow-running tests")
    config.addinivalue_line("markers", "security: Security-focused tests")
```

**Usage:**
```python
@pytest.mark.unit
def test_fast_function():
    pass

@pytest.mark.slow
def test_slow_operation():
    pass
```

## TDD Approach

The codebase follows Test-Driven Development in some areas:

From `test_wasm_gpu_bridge.py`:
```python
"""
Tests for WASM GPU Bridge

Tests the connection between Python and the GPU WASM VM shader.
Follows TDD approach - tests written before implementation.
"""
```

Tests are written first, then implementation follows to make tests pass.

## Pre-commit Testing

**Configuration:** `.pre-commit-config.yaml`

**Test Hooks:**
```yaml
- repo: local
  hooks:
    - id: pytest
      name: pytest
      entry: python -m pytest
      language: system
      pass_filenames: false
      args: ["--tb=short", "--strict-markers"]
      files: ^(tests/|test_.*\.py)$
      types: [python]
```

Tests run automatically on commit for matching files.

## Rust Testing

**Unit Tests:**
- Inline tests in modules: `#[cfg(test)]` mod tests
- Doc tests: Examples in doc comments that are verified

**Integration Tests:**
- `tests/` directory in crate root
- Separate binary for integration testing

**Pattern:**
```rust
#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_waypoint_distance() {
        let w1 = Waypoint::new(0.0, 0.0, 0);
        let w2 = Waypoint::new(3.0, 4.0, 100);
        assert_eq!(w1.distance_to(&w2), 5.0);
    }
}
```

## TypeScript Testing

**Vitest Pattern:**
```typescript
import { describe, it, expect } from "vitest";

describe("Component", () => {
    it("should perform action", async () => {
        const result = await performAction();
        expect(result).toBeDefined();
    });
});
```

---

*Testing analysis: 2026-02-11*
