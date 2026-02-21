---
spec: directive-testing-suite
phase: research
created: 2026-02-21T00:00:00Z
generated: auto
---

# Research: Directive Testing Suite

## Executive Summary

Feasibility: **High**. DirectiveAgent has 63 existing tests with clear patterns. New tests follow same pytest structure. No architectural changes needed - only adding test files and test cases.

## Codebase Analysis

### Existing Patterns

- **Test file**: `tests/test_directive_agent.py` - 1016 lines, 63 tests
- **Test structure**: pytest with fixtures (`@pytest.fixture`), mock via `unittest.mock.patch`
- **Directives under test**: `systems/intelligence/directive_agent.py` - 607 lines
- **Key classes**: `Directive`, `DirectiveAgent`, `DirectiveScope`, `DirectiveStatus`
- **Fixtures pattern**: `mock_substrate_map` dict, `agent` fixture with patched `_load_substrate_map`

### Dependencies

- `pytest` - test framework (already in use)
- `unittest.mock` - mocking (already in use)
- `json`, `tempfile`, `pathlib` - test utilities (std lib)
- `threading` - for concurrent tests (std lib)
- `time` - for performance tests (std lib)

### Constraints

1. **No implementation changes**: Only adding tests, not modifying `directive_agent.py`
2. **Isolation required**: Tests must not depend on external WordPress
3. **Performance thresholds**: Poll <100ms, process <50ms, heartbeat <10ms
4. **Memory limits**: Heartbeat <1KB, cache for 1000 components <10MB

## Feasibility Assessment

| Aspect | Assessment | Notes |
|--------|------------|-------|
| Technical Viability | High | Existing test patterns well established |
| Effort Estimate | S | 2-3 hours per plan, 6 tasks total |
| Risk Level | Low | No production code changes |

## Recommendations

1. Follow existing test class naming: `TestScopeDetectionEdgeCases`, `TestComponentLookupEdgeCases`
2. Reuse `agent` fixture pattern from existing tests
3. Create new test files for separation: `test_directive_performance.py`, `test_directive_stress.py`, `test_directive_contracts.py`
4. Use `tmp_path` fixture for filesystem operations
5. Mock `_api_call` method for API tests (existing pattern)
