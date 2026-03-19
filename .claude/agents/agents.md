# Geometry OS - Agent Orchestration

> Extends `~/.claude/rules/common/agents.md` with Geometry OS-specific agents.

## Available Agents

Located in `~/.claude/agents/`:

| Agent | Purpose | When to Use |
|-------|---------|-------------|
| planner | Implementation planning | Complex features, refactoring |
| architect | System design | Architectural decisions |
| tdd-guide | Test-driven development | New features, bug fixes |
| code-reviewer | Code review | After writing code |
| security-reviewer | Security analysis | Before commits |
| build-error-resolver | Fix build errors | When build fails |
| e2e-runner | E2E testing | Critical user flows |
| refactor-cleaner | Dead code cleanup | Code maintenance |
| doc-updater | Documentation | Updating docs |

## Geometry OS Specific Patterns

### Glyph Program Development

When developing Glyph programs, use this workflow:

1. **Test on Synthetic VRAM first** - Use `cargo test --lib synthetic_vram`
2. **Use glyph-programming skill** - Invoke `/glyph-programming` before writing any Glyph code
3. **Reference example programs** - See `apps/ascii-world/ascii-world-master/apps/geos-ascii/examples/loop_demo.ascii`

### Spatial Assembly Agents

For GPU substrate work:

| Task | Agent | Notes |
|------|-------|-------|
| New Glyph opcode | planner | Design opcode semantics first |
| GPU shader changes | architect | Review spatial implications |
| VM state debugging | tdd-guide | Write Synthetic VRAM tests |
| Performance optimization | code-reviewer | Review cache locality |

## Immediate Agent Usage

No user prompt needed:
1. Complex feature requests - Use **planner** agent
2. Code just written/modified - Use **code-reviewer** agent
3. Bug fix or new feature - Use **tdd-guide** agent
4. Architectural decision - Use **architect** agent
5. **Glyph/GPU code** - Use **glyph-programming** skill first

## Parallel Task Execution

ALWAYS use parallel Task execution for independent operations:

```markdown
# GOOD: Parallel execution
Launch 3 agents in parallel:
1. Agent 1: Security analysis of auth module
2. Agent 2: Performance review of cache system
3. Agent 3: Type checking of utilities

# BAD: Sequential when unnecessary
First agent 1, then agent 2, then agent 3
```

## Multi-Perspective Analysis

For complex problems, use split role sub-agents:
- Factual reviewer
- Senior engineer
- Security expert
- Consistency reviewer
- Redundancy checker
