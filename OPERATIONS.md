# Geometry OS - Operations Protocol

> How we work together. The contract between human and AI.

---

## Autonomy Levels

| Level | Name | When to Use | Example |
|-------|------|-------------|---------|
| 1 | Propose & Wait | Architectural changes, new features | "Should we add a new agent type?" |
| 2 | Execute & Report | Established patterns, bug fixes | "Fixed the NEB subscription bug" |
| 3 | Autonomous | Routine operations, tests | "Running the test suite" |

**Default:** Level 2 (Execute & Report)

Escalate to Level 1 when:
- Adding new system components
- Changing core abstractions
- Modifying the evolution daemon
- Anything affecting data persistence

---

## Commit Protocol

### Commit Style

**Format:**
```
<type>(<scope>): <description>

[optional body]

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>
```

**Types:**
| Type | When |
|------|------|
| feat | New feature |
| fix | Bug fix |
| docs | Documentation |
| test | Adding/updating tests |
| refactor | Code restructuring |
| chore | Maintenance |

**Examples:**
```bash
feat(swarm): add WebSense with rate limiting
fix(neb): resolve wildcard subscription edge case
docs: add NORTH_STAR.md and ARCHITECTURE.md
test(guilds): add 12 tests for EngineerAgent
```

### Commit Frequency

- **Atomic commits** - One logical change per commit
- **Every test pass** - Commit after tests go green
- **Before context switch** - Commit before switching tasks

---

## Testing Requirements

### Before Committing

1. Run relevant tests: `pytest systems/<module>/ -v`
2. Ensure no regressions: `pytest systems/swarm/ -v` (baseline: 180 tests)
3. Check type hints: `mypy systems/<module>/` (if configured)

### Test Coverage

| Component | Tests | Command |
|-----------|-------|---------|
| NEB + Subscriptions | 13 | `pytest systems/swarm/test_neb*.py -v` |
| Guilds | 60 | `pytest systems/swarm/test_guild*.py -v` |
| Senses | 28 | `pytest systems/swarm/test_sense*.py -v` |
| Memory/Growth | 44 | `pytest systems/swarm/test_memory*.py systems/swarm/test_growth*.py -v` |
| Evolution | 35 | `pytest systems/evolution_daemon/tests/ -v` |

---

## Definition of Done

A task is complete when:

- [ ] Code written and working
- [ ] Tests written and passing
- [ ] Documentation updated (if public API)
- [ ] Committed with proper message
- [ ] No regressions in other tests

---

## Code Style

### Python

- **Formatting:** Follow existing patterns in the file
- **Type hints:** Optional but encouraged for public APIs
- **Docstrings:** Only when logic isn't self-evident
- **Imports:** Standard library → third-party → local

### JavaScript (Visual Shell)

- **Style:** Follow existing `web/*.js` patterns
- **PixiJS:** Use established particle patterns
- **WebSocket:** Use `webmcp_bridge.js` conventions

---

## File Organization

### New Features

```
systems/<feature>/
├── __init__.py          # Public exports
├── core.py              # Main implementation
├── test_<feature>.py    # Tests (same directory)
└── README.md            # If complex
```

### Specs

```
specs/<feature-name>/
├── research.md          # What we learned
├── requirements.md      # What we need
├── design.md            # How we'll build it
└── tasks.md             # Implementation steps
```

---

## Review Process

### Self-Review Checklist

Before asking for review:

- [ ] Does this align with NORTH_STAR.md?
- [ ] Does this follow the architecture in ARCHITECTURE.md?
- [ ] Are all tests passing?
- [ ] Is the commit message clear?

### AI Review (Claude)

After completing a feature:
1. Run full test suite
2. Summarize changes made
3. Ask: "Ready for review?" (Level 1 escalation)

---

## Memory Management

### What to Remember (MEMORY.md)

- Stable patterns confirmed across multiple sessions
- Key architectural decisions
- Important file paths
- Solutions to recurring problems

### What NOT to Remember

- Session-specific context
- Temporary state
- Unverified conclusions

### Organization

```
memory/
├── MEMORY.md       # Index (keep <200 lines)
├── neb.md          # NEB details
├── swarm.md        # Swarm patterns
├── visual-shell.md # Visual Shell notes
└── debugging.md    # Debugging insights
```

---

## Emergency Protocols

### If Tests Fail

1. Don't commit
2. Read the error message
3. Isolate the failure (run single test)
4. Fix or revert
5. Re-run tests

### If Evolution Daemon Misbehaves

```bash
./evolution_ctl.sh stop
./evolution_ctl.sh report  # Check last state
# Investigate, then:
./evolution_ctl.sh start
```

### If Lost Context

1. Read `NORTH_STAR.md` for vision
2. Read `ARCHITECTURE.md` for structure
3. Check `MEMORY.md` for patterns
4. Ask for clarification

---

## Quick Reference

```bash
# Run all swarm tests
pytest systems/swarm/ -v

# Start evolution daemon
./evolution_ctl.sh start

# Check daemon status
./evolution_ctl.sh status

# View daemon logs
./evolution_ctl.sh tail

# Run visual shell
cd systems/visual_shell/web && python -m http.server 8080
```

---

*Last updated: 2026-02-24*
