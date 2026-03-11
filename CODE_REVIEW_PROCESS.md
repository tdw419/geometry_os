# Geometry OS Code Review Process

> **Purpose**: Maintain code quality and prevent entropy through regular, systematic code reviews.

## Overview

This document defines the regular code review cycle for Geometry OS. Reviews are scheduled, tracked, and verified to ensure continuous quality improvement.

## Review Schedule

### Weekly Reviews (Every Monday)

| Area | Files | Reviewer Focus |
|------|-------|----------------|
| **Core Systems** | `systems/core/`, `systems/evolution_daemon_v8.py` | Architecture, performance, safety |
| **Visual Shell** | `systems/visual_shell/`, `map_terminal.py` | Rendering, memory, UX |
| **Pixel Systems** | `systems/pixel*`, `pixelrts_v2/` | Binary handling, WASM, encoding |
| **Testing** | `tests/`, `conftest.py` | Coverage, test quality, fixtures |

### Bi-Weekly Reviews (Every Other Thursday)

| Area | Files | Reviewer Focus |
|------|-------|----------------|
| **Rust Components** | `systems/infinite_map_rs/` | Memory safety, idiomatic Rust, performance |
| **Documentation** | `*.md`, `docs/` | Accuracy, completeness, freshness |
| **Configuration** | `*.yaml`, `*.toml`, `Makefile` | Security, consistency, best practices |

### Monthly Reviews (First Monday of Month)

| Area | Files | Reviewer Focus |
|------|-------|----------------|
| **Security Audit** | All auth, crypto, network code | Vulnerabilities, OWASP compliance |
| **Performance** | Benchmark results, profiling | Regression detection, optimization |
| **Architecture** | Cross-cutting concerns | Coupling, cohesion, dependencies |
| **Entropy Check** | All modified files | Code smell detection, TODO cleanup |

## Review Types

### 1. Scheduled Review
Pre-planned review of specific areas on a regular cadence.

**Process:**
```bash
# Run scheduled review
python3 scripts/code_review.py --scheduled --area <area>
```

### 2. Pre-Merge Review
Required before merging to main branch.

**Process:**
```bash
# Create review for merge
python3 scripts/code_review.py --pre-merge --base origin/main --head HEAD
```

### 3. Post-Incident Review
Triggered after bug fixes or incidents.

**Process:**
```bash
# Review recent changes
python3 scripts/code_review.py --incident --since <commit>
```

### 4. Entropy Review
Quarterly deep-dive to prevent code decay.

**Process:**
```bash
# Full entropy scan
python3 scripts/code_review.py --entropy --full
```

## Review Checklist

### Code Quality
- [ ] Code follows project naming conventions (CONTRIBUTING.md)
- [ ] Functions are single-purpose and well-named
- [ ] No code duplication (DRY principle)
- [ ] Appropriate abstractions (no over-engineering)
- [ ] Error handling is comprehensive

### Testing
- [ ] Unit tests cover new/changed code
- [ ] Integration tests for system boundaries
- [ ] Edge cases and error paths tested
- [ ] Test names describe behavior clearly

### Performance
- [ ] No obvious performance regressions
- [ ] Memory usage is reasonable
- [ ] No unnecessary allocations or copies
- [ ] Async patterns used correctly

### Security
- [ ] No hardcoded credentials or secrets
- [ ] Input validation on all external data
- [ ] Safe handling of user input
- [ ] Proper authentication/authorization

### Documentation
- [ ] Public APIs documented
- [ ] Complex logic explained
- [ ] README updated if needed
- [ ] CHANGELOG entries for user-facing changes

## Tracking System

Reviews are tracked in `.geometry/reviews/`:

```
.geometry/reviews/
├── schedule.json          # Review schedule and history
├── pending/               # Pending review requests
│   └── review-YYYYMMDD-HASH.md
├── completed/             # Completed reviews
│   └── review-YYYYMMDD-HASH.md
└── metrics/               # Review metrics
    └── adherence.json
```

### Schedule Format

```json
{
  "version": 1,
  "last_updated": "2026-03-11",
  "weekly": {
    "core_systems": {
      "day": "monday",
      "last_review": "2026-03-04",
      "next_review": "2026-03-11",
      "reviewer": "auto"
    },
    "visual_shell": {
      "day": "monday",
      "last_review": "2026-03-04",
      "next_review": "2026-03-11",
      "reviewer": "auto"
    }
  },
  "biweekly": {
    "rust_components": {
      "day": "thursday",
      "last_review": "2026-03-06",
      "next_review": "2026-03-20",
      "reviewer": "auto"
    }
  },
  "monthly": {
    "security_audit": {
      "day": "first-monday",
      "last_review": "2026-03-03",
      "next_review": "2026-04-07",
      "reviewer": "auto"
    }
  }
}
```

### Review Report Format

```markdown
# Code Review: [Area Name]
Date: YYYY-MM-DD
Reviewer: [auto/human name]
Type: [scheduled/pre-merge/incident/entropy]

## Scope
- Files reviewed: [count]
- Lines changed: [count]
- Commits: [list]

## Summary
[Overall assessment]

## Issues Found

### Critical
- [Description with file:line reference]

### Important
- [Description with file:line reference]

### Minor
- [Description with file:line reference]

## Recommendations
- [Actionable recommendations]

## Metrics
- Code quality score: [1-10]
- Test coverage: [percent]
- Technical debt items: [count]

## Follow-up
- [ ] Action item 1
- [ ] Action item 2
```

## Automation

### Pre-commit Integration

Reviews are partially automated via pre-commit hooks:

```yaml
# Already in .pre-commit-config.yaml
- ruff (linting)
- mypy (type checking)
- cargo fmt/clippy (Rust)
- performance-check (regression)
```

### CI Integration

GitHub Actions workflow tracks review adherence:

```yaml
# .github/workflows/code-review.yml
name: Code Review Cycle
on:
  schedule:
    - cron: '0 9 * * 1'  # Monday 9 AM
jobs:
  check-schedule:
    # Verify reviews are happening on schedule
  generate-report:
    # Create weekly review summary
```

### Metrics Collection

```bash
# Collect review metrics
python3 scripts/code_review.py --metrics

# Output: .geometry/reviews/metrics/adherence.json
```

## Review Response Protocol

When receiving review feedback, follow the **receiving-code-review** skill:

1. **READ**: Complete feedback without reacting
2. **UNDERSTAND**: Restate requirement in own words
3. **VERIFY**: Check against codebase reality
4. **EVALUATE**: Technically sound for THIS codebase?
5. **RESPOND**: Technical acknowledgment or reasoned pushback
6. **IMPLEMENT**: One item at a time, test each

### Priority Order

1. **Critical** - Fix immediately, blocks merge
2. **Important** - Fix before merge
3. **Minor** - Fix when convenient, create issue if deferred

## Entropy Prevention

### Code Smell Detection

Automated checks for common issues:

```bash
# Run entropy scan
python3 scripts/code_review.py --entropy

# Checks for:
# - TODO/FIXME accumulation
# - Dead code
# - Unused imports
# - Complex functions (high cyclomatic complexity)
# - Large files (>500 lines)
# - Deeply nested code (>4 levels)
```

### Quarterly Deep-Dive

Every quarter, perform a comprehensive entropy review:

1. Run full entropy scan
2. Review technical debt backlog
3. Prioritize refactoring efforts
4. Update architecture documentation
5. Clean up stale branches and issues

## Getting Started

### Initial Setup

```bash
# Initialize review tracking
python3 scripts/code_review.py --init

# This creates:
# - .geometry/reviews/ directory structure
# - Initial schedule.json
# - adherence.json metrics file
```

### Run First Review

```bash
# Schedule initial reviews for all areas
python3 scripts/code_review.py --schedule-all

# Run first weekly review
python3 scripts/code_review.py --scheduled --area core_systems
```

### Track Adherence

```bash
# Check review adherence
python3 scripts/code_review.py --adherence

# Output shows:
# - Reviews completed on time
# - Overdue reviews
# - Upcoming reviews
```

## Integration with Development Workflow

### Branch Protection

Main branch requires:
- [ ] Passing CI tests
- [ ] Pre-commit hooks passed
- [ ] Code review approval (for non-trivial changes)

### Merge Checklist

Before merging:
- [ ] All tests pass
- [ ] Documentation updated
- [ ] CHANGELOG updated
- [ ] Review completed and approved

## Appendix: Review Commands

```bash
# Show help
python3 scripts/code_review.py --help

# List scheduled reviews
python3 scripts/code_review.py --list

# Run specific review
python3 scripts/code_review.py --area <name>

# Generate report
python3 scripts/code_review.py --report

# Check adherence
python3 scripts/code_review.py --adherence

# Mark review as complete
python3 scripts/code_review.py --complete <review-id>
```

---

*Last Updated: 2026-03-11*
*Next Review: 2026-03-11 (Weekly: Core Systems)*
