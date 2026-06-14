# OpenCode Auto-Continue Installation

## What Was Added

### 1. OpenCode Skill: `auto-continue`

**Location:** `~/.config/opencode/skill/auto-continue/SKILL.md`

This skill enables autonomous continuation in OpenCode via the `/auto-continue` slash command. When invoked, OpenCode will:

- Analyze current work state
- Identify next steps
- Continue working autonomously
- Iterate until complete or interrupted

### 2. Auto-Continue Wrapper Script

**Location:** `~/zion/bin/opencode-auto`

A bash wrapper that runs OpenCode with automatic continuation loops:

```bash
# Initial task with auto-continue loop
opencode-auto "Refactor auth module" 15

# Continue last session with auto-continue
opencode-auto "" 10
```

### 3. Shell Alias

Added to `~/.bashrc`:

```bash
alias opencode-auto="~/zion/bin/opencode-auto"
```

Reload your shell: `source ~/.bashrc`

## Usage Examples

### Interactive Mode (Background Process)

```bash
# Start OpenCode in background
opencode &
OPENCODE_PID=$!

# Send initial task
echo "Refactor auth module" | nc localhost $PORT  # or use the process tools

# After first response, trigger auto-continue
echo "/auto-continue" | nc localhost $PORT
```

### Automated Loop (Wrapper Script)

```bash
# Run 15 iterations automatically
opencode-auto "Add comprehensive test suite" 15

# Output shows each iteration:
# === Iteration 1/15 ===
# [OpenCode output...]
# === Iteration 2/15 ===
# [OpenCode output...]
# ...
```

### Manual Continuation

```bash
# Start a session
opencode run "Implement OAuth flow"

# Manually continue
opencode -c  # Continue last session
opencode run "/auto-continue"  # Or trigger the skill
```

## How It Works

### OpenCode vs Claude Code Approach

| Aspect | Claude Code | OpenCode |
|--------|-------------|----------|
| Auto-continue method | Tmux wrapper monitors prompt | Skill + wrapper script |
| Session model | Interactive REPL stays open | `run` command exits after completion |
| Continuation trigger | Detects prompt (❯ or >$) | Calls `opencode run` again with `/auto-continue` |
| Hooks | Stop/PostToolUse hooks available | Skills system via slash commands |

### Skill Implementation

The auto-continue skill is invoked as a slash command (`/auto-continue`) and instructs the AI to:

1. **Context preservation**: Maintain full awareness of what was discussed
2. **Pattern recognition**: Continue using the same approaches and style
3. **Progressive building**: Each response builds on the previous one
4. **Self-correction**: Detect and fix issues autonomously
5. **Natural stopping**: Know when to stop (completion, blockers, decisions needed)

### Wrapper Script Logic

```bash
iteration=0
while [ $iteration -lt MAX_CONTINUES ]; do
    iteration=$((iteration + 1))
    if [ $iteration -eq 1 ]; then
        opencode run "$INITIAL_PROMPT"
    else
        opencode run "/auto-continue"
    fi
    sleep 2  # Brief pause between iterations
done
```

## Monitoring Autonomous Sessions

### Check Session State

```bash
# List all sessions
opencode session list

# View session stats
opencode stats

# Export session data for inspection
opencode export <session_id> | jq .
```

### Interrupt and Resume

```bash
# Stop wrapper script with Ctrl+C
opencode-auto "task" 10
# Press Ctrl+C to stop

# Resume where you left off
opencode -c  # Continue last session
opencode run "/auto-continue"  # Trigger skill
```

## Verification

Test the auto-continue installation:

```bash
# 1. Verify skill exists
ls -la ~/.config/opencode/skill/auto-continue/SKILL.md

# 2. Verify wrapper script
which opencode-auto
bash -n ~/zion/bin/opencode-auto && echo "Script syntax OK"

# 3. Quick test (should respond autonomously)
opencode run "List all files in current directory, then say AUTO_CONTINUE_TEST_DONE"
```

## Troubleshooting

**Skill not found:**
```bash
# Check skill directory structure
ls -la ~/.config/opencode/skill/

# Verify skill format
cat ~/.config/opencode/skill/auto-continue/SKILL.md | head -5
```

**Wrapper script not working:**
```bash
# Check permissions
ls -la ~/zion/bin/opencode-auto
# Should show -rwxrwxr-x

# Test syntax
bash -n ~/zion/bin/opencode-auto

# Run with debug
bash -x ~/zion/bin/opencode-auto "test" 1
```

**OpenCode exits immediately:**
- Check provider configuration: `opencode providers list`
- Verify model availability: `opencode models`
- Check logs: `opencode --print-logs run "test"`

## Skill Content Reference

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

The skill also includes best practices:
- Monitor progress (don't be random)
- Summarize what you did
- State what you're doing next
- Flag blockers or decisions needed
- Limit to 10-15 iterations for complex tasks
- Handle interruptions gracefully

## Integration with Hermes

The `opencode` skill (located at `~/.hermes/skills/autonomous-ai-agents/opencode/SKILL.md`) has been updated with:

1. **Auto-Continue Feature** section documenting the skill and wrapper
2. **Usage examples** for both interactive and automated modes
3. **Skill installation** instructions
4. **Updated Rules** section with auto-continue guidelines

When a Hermes agent delegates to OpenCode for autonomous coding, it can now:
- Use `opencode-auto "prompt" N` for fully automated loops
- Use `/auto-continue` slash command in interactive sessions
- Monitor progress via `opencode stats` and session exports