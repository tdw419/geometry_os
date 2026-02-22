# OpenSpec Quick Reference

## Overview

OpenSpec is Geometry OS's spec-driven development system. It aligns AI agents and developers on what to build before code is written.

## Directory Structure

```
openspec/
├── project.md           # Project context and conventions
├── specs/               # Ground truth (archived specs)
│   ├── visual-shell/
│   │   └── spec.md
│   └── evolution-daemon/
│       └── spec.md
└── changes/             # Active work
    ├── <feature-name>/
    │   ├── proposal.md
    │   ├── tasks.md
    │   └── specs/<domain>/spec.md
    └── archive/         # Completed changes
```

## Workflow

### 1. Draft a Proposal

```bash
mkdir -p openspec/changes/my-feature/specs/core
```

Create `proposal.md`:
```markdown
# My Feature

## Summary
One sentence goal.

## Architecture
2-3 sentences about approach.

## Success Criteria
- [ ] Tests pass
- [ ] Docs updated
```

### 2. Define Tasks

Create `tasks.md`:
```markdown
# My Feature - Tasks

## 1. Core Implementation
- [ ] 1.1 Create file X
- [ ] 1.2 Add function Y
- [ ] 1.3 Write tests

## 2. Integration
- [ ] 2.1 Update AGENTS.md
```

### 3. Define Spec Delta

Create `specs/<domain>/spec.md`:
```markdown
# Delta for <domain>

## ADDED Requirements
### Requirement: My Feature
The system SHALL <behavior>.

#### Scenario: Basic Usage
- **WHEN** <condition>
- **THEN** <expected result>
```

### 4. Implement

With Claude Code:
```
/openspec:apply my-feature
```

### 5. Archive

```
/openspec:archive my-feature
```

## CLI Commands

```bash
# List active changes
openspec list

# Show change details
openspec show <name>

# Validate spec
openspec validate <name>

# Archive change
openspec archive <name> --yes
```

## Migrating Existing Plans

```bash
# Single plan
python3 scripts/plan_to_openspec.py docs/plans/my-plan.md

# Batch migrate all plans
python3 scripts/plan_to_openspec.py --batch
```

## Spec Format Rules

1. Use `SHALL` or `MUST` in requirements
2. Every requirement needs at least one `Scenario:` block
3. Scenarios use `WHEN`/`THEN`/`AND` format
4. Deltas use `## ADDED`, `## MODIFIED`, `## REMOVED`

## Files

| File | Purpose |
|------|---------|
| `proposal.md` | Goal, architecture, success criteria |
| `tasks.md` | Implementation checklist |
| `specs/*/spec.md` | Requirement delta |
