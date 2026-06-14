# Geometry OS CI/CD Test Runner

Automated validation suite for Geometry OS.

## Quick Start

```bash
# Run all tests
./scripts/run_all_tests.sh

# Run specific phase only
./scripts/run_all_tests.sh 2>&1 | grep "Phase 1"
```

## Test Phases

1. **Build Sanity** - Cargo check, clippy, format validation
2. **Unit Tests** - Library tests, VM tests, integration tests
3. **Guest Program Tests** - ELF builds and artifact validation
4. **Palace Module Tests** - Kernel module compilation
5. **Memory Palace Features** - Core feature module existence
6. **Boot Verification** - Binary build validation

## CI Integration

For automated pipelines:

```yaml
- name: Run Geometry OS Tests
  run: ./scripts/run_all_tests.sh
  timeout-minutes: 10
```

## Known Limitations

- HTTP feature (`cargo check --all-features`) fails due to Rc<RefCell> thread-safety
- This is an architectural limitation documented in ROADMAP.md Phase 203
- Core features (`--features native,gpu`) pass all checks

## Adding New Tests

Add test entries to `scripts/run_all_tests.sh`:

```bash
run_test_quiet "Description" "cargo test --test my_feature"
```