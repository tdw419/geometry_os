# Testing Guide

> Comprehensive guide to testing in Geometry OS

## Overview

Geometry OS includes a robust testing framework with support for async tests, parallel execution, coverage reporting, and multiple output formats.

## Quick Start

### Run All Tests

```bash
# Run all tests
make test

# Or using pytest directly
pytest

# Or using the unified test runner
python run_tests.py
```

### Run with Coverage

```bash
# Run with coverage report
make test-coverage

# Generate HTML coverage report
python run_tests.py --coverage --html

# Open coverage report
open htmlcov/index.html
```

### Run Specific Tests

```bash
# Run specific test file
pytest tests/test_evolution_daemon.py -v

# Run tests matching a pattern
pytest -k "test_neural" -v

# Run tests for a specific system
pytest tests/systems/evolution_daemon/ -v

# Run specific test function
pytest tests/test_evolution_daemon.py::test_evolution_cycle -v
```

## Test Markers

Tests are organized using markers for selective execution:

### Available Markers

| Marker | Description | Usage |
|--------|-------------|-------|
| `@pytest.mark.unit` | Fast unit tests | `pytest -m unit` |
| `@pytest.mark.integration` | Integration tests | `pytest -m integration` |
| `@pytest.mark.slow` | Slow tests (>1s) | `pytest -m "not slow"` |
| `@pytest.mark.requires_cuda` | Requires CUDA | Auto-skip if unavailable |
| `@pytest.mark.requires_gpu` | Requires GPU | Auto-skip if unavailable |
| `@pytest.mark.requires_network` | Requires network | Auto-skip if offline |
| `@pytest.mark.requires_docker` | Requires Docker | Auto-skip if not running |

### Examples

```python
import pytest

@pytest.mark.unit
def test_quick_calculation():
    """Fast unit test."""
    assert 2 + 2 == 4

@pytest.mark.integration
def test_database_connection():
    """Integration test with external dependencies."""
    # Test database interaction
    
@pytest.mark.slow
def test_long_running_simulation():
    """Test that takes >1s."""
    # Long simulation

@pytest.mark.requires_cuda
def test_gpu_acceleration():
    """Test requiring CUDA GPU."""
    import torch
    assert torch.cuda.is_available()
```

### Running by Marker

```bash
# Run only unit tests
make test-unit
# or
pytest -m unit

# Run only integration tests
make test-integration
# or
pytest -m integration

# Run all except slow tests
pytest -m "not slow"

# Run unit tests excluding slow ones
pytest -m "unit and not slow"
```

## Async Testing

The framework has built-in support for async tests using `pytest-asyncio`.

### Writing Async Tests

```python
# No decorator needed! Just use async def
async def test_async_operation():
    """Test async function - auto-detected."""
    result = await some_async_function()
    assert result == expected

async def test_with_async_fixtures(async_mock_service):
    """Test using async fixtures."""
    data = await async_mock_service.fetch_data()
    assert data is not None
```

### Async Fixtures

```python
import pytest
from testing_framework.fixtures.async_fixtures import async_mock

@pytest.fixture
async def async_database():
    """Async database fixture."""
    db = await Database.connect("sqlite://:memory:")
    yield db
    await db.close()

async def test_with_async_database(async_database):
    """Test using async database fixture."""
    result = await async_database.query("SELECT 1")
    assert result == [(1,)]
```

## Parallel Execution

Run tests in parallel using `pytest-xdist` for faster execution.

### Using All CPU Cores

```bash
# Auto-detect CPU count
make test-parallel
# or
pytest -n auto

# Use specific number of workers
pytest -n 4
```

### Parallel Execution with Coverage

```bash
# Note: Use --dist=loadscope for better coverage accuracy
pytest -n auto --cov --cov-report=html --dist=loadscope
```

## Coverage Reporting

### Generate Coverage Reports

```bash
# Terminal output
pytest --cov

# HTML report
pytest --cov --cov-report=html
open htmlcov/index.html

# JSON report
pytest --cov --cov-report=json
# Creates coverage.json

# XML report (for CI)
pytest --cov --cov-report=xml
# Creates coverage.xml

# Multiple formats
pytest --cov --cov-report=html --cov-report=json --cov-report=xml
```

### Coverage Configuration

Coverage is configured in `pyproject.toml`:

```toml
[tool.coverage.run]
source = ["systems", "apps", "core"]
branch = true
parallel = true
omit = [
    "*/tests/*",
    "*/__pycache__/*",
    "*/.venv/*"
]

[tool.coverage.report]
precision = 2
show_missing = true
skip_covered = false

[tool.coverage.html]
directory = "htmlcov"

[tool.coverage.json]
output = "coverage.json"
```

### Coverage Targets

| Component | Current | Target |
|-----------|---------|--------|
| Unit Tests | ~7% | 30%+ |
| Integration Tests | ~5% | 20%+ |
| Overall | ~12% | 50%+ |

## Test Reports

### HTML Reports

Generate interactive HTML test reports:

```bash
# Generate HTML report
python run_tests.py --html

# Open report
open test-report.html
```

The HTML report includes:
- Test summary with pass/fail statistics
- Detailed test results
- Execution time for each test
- Error messages and stack traces
- Filtering and search

### JSON Reports

For programmatic access:

```bash
# Generate JSON report
python run_tests.py --json

# Creates test-report.json
```

### JUnit XML (CI/CD)

For CI/CD integration:

```bash
# Generate JUnit XML
make test-ci
# or
python run_tests.py --ci

# Creates junit.xml
```

## Property-Based Testing

Use Hypothesis for property-based testing:

```python
from hypothesis import given, strategies as st

@given(st.integers(min_value=0, max_value=100))
def test_cache_size_valid(size):
    """Property: cache size should always be valid."""
    cache = Cache(size_mb=size)
    assert cache.size_mb == size
    assert cache.size_mb >= 0

@given(st.lists(st.integers(), min_size=0, max_size=100))
def test_list_operations(items):
    """Property: list operations should preserve invariants."""
    result = process_items(items)
    assert len(result) <= len(items)  # Never grows
```

### Running Property Tests

```bash
# Run property-based tests
make test-property
# or
pytest -m hypothesis
```

## Benchmark Tests

Use `pytest-benchmark` for performance testing:

```python
def test_hilbert_mapping_performance(benchmark):
    """Benchmark Hilbert curve mapping."""
    mapper = HilbertMapper(order=8)
    
    result = benchmark(mapper.map, 0x1000)
    
    assert result is not None

def test_neural_inference_performance(benchmark):
    """Benchmark neural inference."""
    brain = PixelBrain("model.rts.png")
    
    result = benchmark(brain.infer, "test input")
    
    assert result is not None
```

### Running Benchmarks

```bash
# Run benchmark tests
make test-benchmark
# or
pytest -m benchmark

# Compare with previous results
pytest-benchmark compare
```

## Test Organization

### Directory Structure

```
tests/
├── conftest.py              # Shared fixtures and configuration
├── unit/                    # Unit tests
│   ├── test_evolution.py
│   └── test_visual_shell.py
├── integration/             # Integration tests
│   ├── test_evolution_integration.py
│   └── test_system_integration.py
├── systems/                 # System-specific tests
│   ├── evolution_daemon/
│   ├── visual_shell/
│   └── ...
└── e2e/                     # End-to-end tests
    └── test_full_workflow.py
```

### Naming Conventions

- Test files: `test_<module>.py`
- Test classes: `Test<Feature>`
- Test functions: `test_<scenario>`

```python
# test_evolution_daemon.py

class TestEvolutionCycle:
    """Tests for evolution cycle functionality."""
    
    def test_evolution_cycle_with_valid_input(self):
        """Test evolution cycle with valid input."""
        pass
    
    def test_evolution_cycle_with_invalid_input(self):
        """Test evolution cycle with invalid input."""
        pass
    
    def test_evolution_cycle_handles_errors(self):
        """Test evolution cycle error handling."""
        pass
```

## Fixtures

### Built-in Fixtures

The framework provides many built-in fixtures:

```python
def test_with_temp_dir(tmp_path):
    """Use temporary directory."""
    config_file = tmp_path / "config.yaml"
    config_file.write_text("debug: true")
    
def test_with_temp_file(tmp_path):
    """Use temporary file."""
    data_file = tmp_path / "data.bin"
    data_file.write_bytes(b"\x00\x01\x02")

def test_with_mock(mock_object):
    """Use mock object."""
    pass
```

### Custom Fixtures

Define reusable fixtures in `conftest.py`:

```python
# tests/conftest.py

import pytest
from systems.evolution_daemon import EvolutionDaemon

@pytest.fixture
def evolution_daemon():
    """Create evolution daemon for testing."""
    daemon = EvolutionDaemon(
        pas_threshold=0.5,
        gravity_strength=0.1
    )
    yield daemon
    daemon.shutdown()

@pytest.fixture
def sample_brain():
    """Load sample brain for testing."""
    return PixelBrain("test_brain.rts.png")

@pytest.fixture
def mock_lm_studio():
    """Mock LM Studio server."""
    with mock.patch('requests.post') as mock_post:
        mock_post.return_value.json.return_value = {
            "choices": [{"text": "test response"}]
        }
        yield mock_post
```

## Continuous Integration

### GitHub Actions

Tests run automatically on CI:

```yaml
# .github/workflows/test.yml
name: Tests

on: [push, pull_request]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: actions/setup-python@v4
        with:
          python-version: '3.11'
      - name: Install dependencies
        run: |
          pip install -r requirements.txt
          pip install -r requirements-dev.txt
      - name: Run tests
        run: make test-ci
      - name: Upload coverage
        uses: codecov/codecov-action@v3
```

### CI Test Command

```bash
# Optimized for CI
make test-ci
```

This runs:
- All tests with verbose output
- Coverage collection
- JUnit XML report generation
- Parallel execution

## Debugging Tests

### Verbose Output

```bash
# Show all test names
pytest -v

# Show full output
pytest -vv

# Show local variables on failure
pytest --showlocals

# Show full traceback
pytest --tb=long
```

### Debugging Failed Tests

```bash
# Stop on first failure
pytest -x

# Drop into debugger on failure
pytest --pdb

# Drop into debugger on start
pytest --trace

# Re-run last failed tests
pytest --lf

# Re-run failed tests first
pytest --ff
```

### Print Statements

```bash
# Show print statements
pytest -s

# Show print statements with verbose
pytest -s -v
```

## Test Runner Script

The unified test runner provides a simple interface:

```bash
# Basic usage
python run_tests.py

# With options
python run_tests.py [OPTIONS]

Options:
  --unit              Run unit tests only
  --integration       Run integration tests only
  --coverage          Enable coverage reporting
  --html              Generate HTML reports
  --json              Generate JSON reports
  --ci                CI mode (JUnit XML + coverage)
  --parallel          Run tests in parallel
  --verbose, -v       Verbose output
  --help, -h          Show help message
```

### Examples

```bash
# Unit tests with coverage
python run_tests.py --unit --coverage

# Integration tests in parallel
python run_tests.py --integration --parallel

# Full CI run
python run_tests.py --ci --coverage --html

# Quick unit test run
python run_tests.py --unit -v
```

## Makefile Targets

Convenient make targets for common operations:

```bash
make test              # Run all tests
make test-unit         # Run unit tests
make test-integration  # Run integration tests
make test-async        # Run async tests
make test-coverage     # Run with coverage
make test-coverage-full  # Full coverage including integration
make test-parallel     # Parallel execution
make test-report       # Generate HTML report
make test-ci           # CI mode with JUnit XML
make test-random       # Random test order
make test-property     # Property-based tests
make test-benchmark    # Benchmark tests
make test-watch        # Watch mode (rerun on changes)
make lint              # Run linters
```

## Best Practices

### 1. Write Focused Tests

```python
# Good - tests one thing
def test_evolution_cycle_increments_generation():
    daemon = EvolutionDaemon()
    initial_gen = daemon.generation
    daemon.run_cycle()
    assert daemon.generation == initial_gen + 1

# Avoid - tests multiple things
def test_evolution_daemon():
    daemon = EvolutionDaemon()
    daemon.run_cycle()
    daemon.run_cycle()
    assert daemon.generation == 2
    assert daemon.pas_score > 0.5
    assert daemon.is_healthy()
```

### 2. Use Descriptive Names

```python
# Good
def test_evolution_daemon_raises_error_when_brain_file_missing():
    pass

# Avoid
def test_error():
    pass
```

### 3. Keep Tests Independent

```python
# Good - self-contained
def test_cache_operations():
    cache = Cache(size_mb=100)
    cache.set("key", "value")
    assert cache.get("key") == "value"

# Avoid - depends on external state
cache = Cache(size_mb=100)

def test_cache_set():
    cache.set("key", "value")

def test_cache_get():
    assert cache.get("key") == "value"  # Depends on previous test
```

### 4. Use Fixtures for Setup

```python
# Good - using fixtures
def test_neural_inference(sample_brain):
    result = sample_brain.infer("test")
    assert result is not None

# Avoid - manual setup
def test_neural_inference():
    brain = PixelBrain("test_brain.rts.png")  # Repeated setup
    result = brain.infer("test")
    assert result is not None
```

### 5. Test Edge Cases

```python
def test_cache_handles_zero_size():
    """Edge case: zero cache size."""
    with pytest.raises(ValueError):
        Cache(size_mb=0)

def test_cache_handles_negative_size():
    """Edge case: negative cache size."""
    with pytest.raises(ValueError):
        Cache(size_mb=-1)

def test_cache_handles_maximum_size():
    """Edge case: maximum cache size."""
    cache = Cache(size_mb=4096)
    assert cache.size_mb == 4096
```

## Troubleshooting

### Import Errors

```bash
# Check Python path
python -c "import sys; print('\n'.join(sys.path))"

# Install in development mode
pip install -e .

# Check missing dependencies
pip check
```

### Test Collection Errors

```bash
# Verbose collection
pytest --collect-only -v

# Check for syntax errors
python -m py_compile tests/test_file.py
```

### Slow Tests

```bash
# Identify slow tests
pytest --durations=10

# Profile test execution
pytest --profile
```

### Memory Issues

```bash
# Run with memory profiling
pytest --memray

# Run fewer tests in parallel
pytest -n 2  # Instead of -n auto
```

## See Also

- [Testing Framework Report](../TESTING_FRAMEWORK_REPORT.md)
- [Contributing Guide](../CONTRIBUTING.md)
- [Coverage Configuration](../pyproject.toml)
- [Test Runner Script](../run_tests.py)

---

*Last Updated: 2026-03-11*
*Version: 1.0.0*
