# OpenCode Auto-Continue - Fixed

## Problem & Solution

**Problem:** OpenCode hung on startup when the auto-continue skill was initially installed.

**Root Cause:** The initial SKILL.md file had formatting/content issues that caused OpenCode to hang during skill loading.

**Solution:** Rewrote the skill with cleaner content. OpenCode now starts correctly.

## Installation Status

✓ Skill installed at: `~/.aline/skills/auto-continue/SKILL.md`
✓ Symlink created: `~/.config/opencode/skill/auto-continue/SKILL.md`
✓ OpenCode starts without hanging
✓ Skill available as `/auto-continue` slash command

## Usage

### Interactive Mode

```bash
# Start OpenCode interactively
opencode

# After response, trigger auto-continue
/auto-continue
```

### Wrapper Script (Not Recommended - OpenCode Architecture Limitation)

The `opencode-auto` wrapper is not recommended because:
- OpenCode's `run` command exits after each completion
- There's no `-c` flag to continue the last session
- Cannot loop autonomously like Claude Code

**Recommended approach:** Use the `/auto-continue` skill in interactive sessions.

## Skill Content

The auto-continue skill instructs the AI to autonomously:
- Read and analyze files it just created/modified
- Run tests and fix failures automatically
- Refactor code based on its own review
- Write documentation for code it just produced
- Expand on partial implementations
- Handle edge cases it discovers
- Optimize performance of code it wrote
- Add error handling to working code
- Write tests for implementations

## Architecture Difference

| Aspect | Claude Code | OpenCode |
|--------|-------------|----------|
| Session model | Interactive REPL stays open | `run` exits after completion |
| Continue method | `-c` flag or `/continue` | `/auto-continue` skill |
| Auto-continue | Tmux wrapper monitors prompt | Manual skill invocation |
| Loop support | Yes (wrapper monitors prompt) | No (no continue flag) |

## Verification

```bash
# Verify OpenCode starts
opencode run "test"  # Should respond quickly

# Verify skill is loaded
ls -la ~/.config/opencode/skill/auto-continue/SKILL.md

# Test skill in interactive mode
opencode
# After first response, type: /auto-continue
```