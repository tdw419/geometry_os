---
spec: directive-testing-suite
phase: requirements
created: 2026-02-21T00:00:00Z
generated: auto
---

# Requirements: Directive Testing Suite

## Summary

Create comprehensive testing suite for DirectiveAgent covering edge cases, performance benchmarks, stress tests, and API contracts. Target: 107+ total tests (44+ new).

## User Stories

### US-1: Test Edge Cases in Scope Detection

As a developer, I want edge cases in scope detection tested so that keyword matching is robust.

**Acceptance Criteria**:
- AC-1.1: Mixed case keywords match (EXPLAIN == explain)
- AC-1.2: Keywords in middle of words do NOT match (explanation should not trigger "explain")
- AC-1.3: Multiple keywords in same category work correctly
- AC-1.4: Punctuation does not affect matching
- AC-1.5: Empty/whitespace content returns UNKNOWN scope
- AC-1.6: HTML tags do not affect keyword matching

### US-2: Test Component Lookup Edge Cases

As a developer, I want component lookup edge cases tested so that fuzzy matching works reliably.

**Acceptance Criteria**:
- AC-2.1: Extra whitespace trimmed before lookup
- AC-2.2: Underscores vs spaces handled consistently
- AC-2.3: Partial name matches unique components
- AC-2.4: Description field included in search
- AC-2.5: Garbage input returns None (not exception)

### US-3: Validate Performance Benchmarks

As a developer, I want performance benchmarks so that latency requirements are verified.

**Acceptance Criteria**:
- AC-3.1: Single poll latency < 100ms
- AC-3.2: Process directive latency < 50ms
- AC-3.3: Heartbeat write latency < 10ms
- AC-3.4: 100 directives processed in < 5 seconds
- AC-3.5: Heartbeat file size < 1KB
- AC-3.6: Heartbeat overhead < 10% of processing time

### US-4: Validate Stress Test Resilience

As a developer, I want stress tests so that agent stability is proven under load.

**Acceptance Criteria**:
- AC-4.1: 1000 directives processed without crash
- AC-4.2: No duplicate directive processing
- AC-4.3: No memory leak over 1000 cycles
- AC-4.4: Heartbeat file size does not grow
- AC-4.5: Concurrent heartbeat writes do not corrupt file
- AC-4.6: Agent recovers from API failures
- AC-4.7: Agent handles invalid directive data

### US-5: Validate API Contracts

As a developer, I want API contract tests so that WordPress integration is validated.

**Acceptance Criteria**:
- AC-5.1: getDirectives returns list format
- AC-5.2: getDirectives payload format validated
- AC-5.3: getDirectives handles empty response
- AC-5.4: getDirectives handles failure response
- AC-5.5: markDirectiveProcessed includes post_id
- AC-5.6: markDirectiveProcessed returns boolean
- AC-5.7: postDirectiveResponse includes post_id, response, status
- AC-5.8: Response includes status emoji
- AC-5.9: Substrate cache is dict with required fields
- AC-5.10: Missing substrate file handled gracefully
- AC-5.11: Invalid JSON in substrate file handled gracefully

## Functional Requirements

| ID | Requirement | Priority | Source |
|----|-------------|----------|--------|
| FR-1 | Add 8 scope detection edge case tests | Must | US-1 |
| FR-2 | Add 6 component lookup edge case tests | Must | US-2 |
| FR-3 | Create test_directive_performance.py with 8 tests | Must | US-3 |
| FR-4 | Create test_directive_stress.py with 8 tests | Must | US-4 |
| FR-5 | Create test_directive_contracts.py with 14 tests | Must | US-5 |
| FR-6 | Run full suite and generate coverage report | Must | All |

## Non-Functional Requirements

| ID | Requirement | Category |
|----|-------------|----------|
| NFR-1 | All tests must pass (100% pass rate) | Quality |
| NFR-2 | Code coverage > 80% for directive_agent.py | Quality |
| NFR-3 | Tests must be isolated (no external dependencies) | Reliability |
| NFR-4 | Tests must complete in < 60 seconds total | Performance |

## Out of Scope

- Implementation changes to directive_agent.py
- Integration tests requiring live WordPress
- Load tests exceeding 1000 directives
- Parallel test execution (pytest-xdist)

## Dependencies

- pytest (existing)
- unittest.mock (existing)
- Python 3.12 stdlib
