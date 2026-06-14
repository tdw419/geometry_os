# OpenCode Auto-Continue: Solutions & Limitations

## The Problem

OpenCode doesn't have true auto-continue like Claude Code. After each response, you must manually type `/auto-continue`.

## Why No True Auto-Continue?

OpenCode's plugin hooks can **modify existing behavior** but **cannot trigger new operations**:

### Available Hooks (from plugin API)

```typescript
interface Hooks {
    // Event hook - can listen to events
    event?: (input: { event: Event }) => Promise<void>;

    // Chat hooks - can modify messages/parameters
    chat?: {
        message?: (input, output) => Promise<void>;
        params?: (input, output) => Promise<void>;
        headers?: (input, output) => Promise<void>;
    };

    // Tool hooks - can add/modify tools
    tool?: {
        execute?: { before?: ..., after?: ... };
        definition?: (input, output) => Promise<void>;
    };

    // Experimental hooks - can modify compaction, etc.
    experimental?: {
        compaction?: { autocontinue?: (input, output: { enabled }) => Promise<void> };
        session?: { compacting?: ... };
        text?: { complete?: ... };
    };
}
```

### What Hooks CAN Do

✓ Add custom tools
✓ Modify request parameters (temperature, topP, etc.)
✓ Add custom auth providers
✓ Modify tool definitions
✓ Intercept/modify tool execution
✓ Listen to events
✓ Hook into session compaction

### What Hooks CANNOT Do

✗ Send new messages to OpenCode
✗ Programmatically trigger slash commands
✓ Automate the send/receive loop
✓ Control the conversation flow

## Working Solutions

### Solution 1: Tmux Wrapper (Recommended)

Automatically sends `/auto-continue` after each response:

```bash
# Use the wrapper
opencode-tmux-auto "Refactor auth module" 15

# Or with alias (after source ~/.bashrc)
opencode-auto "Add comprehensive tests" 10
```

**How it works:**
1. Starts OpenCode in a tmux session
2. Sends your initial prompt
3. Monitors for completion
4. Automatically sends `opencode "/auto-continue"`
5. Repeats up to N times

**Monitor progress:**
```bash
# Watch in real-time
watch -n 2 'tmux capture-pane -t opencode-auto-* -p | tail -30'

# Attach to take control
tmux attach -t opencode-auto-*

# Kill when done
tmux kill-session -t opencode-auto-*
```

### Solution 2: Manual `/auto-continue`

Type it manually after each response:

```bash
opencode

> Refactor auth module
[Response]

> /auto-continue
[Autonomous work]

> /auto-continue
[More work]
```

### Solution 3: Use Claude Code

If you need true auto-continuation without manual intervention:

```bash
# Claude Code has built-in auto-continue
claude-auto "Refactor auth module" 15

# Or interactive with auto-continue
claude "Refactor auth module"
# Auto-continues until Ctrl+C
```

## Comparison

| Feature | OpenCode | Claude Code |
|---------|----------|-------------|
| Auto-continue | Manual `/auto-continue` | Built-in + wrappers |
| Hooks | Modify behavior only | Pre/post tool, Stop, SessionStart |
| Plugin system | Yes, but limited auto | No (hooks only) |
| Tmux wrapper | Works (use `opencode-tmux-auto`) | Works (`claude-auto`) |
| True automation | No | Yes |

## Files Created

- `~/zion/bin/opencode-tmux-auto` - Tmux wrapper script
- `~/zion/projects/opencode-auto-continue-plugin/` - Failed plugin attempt (hooks can't send messages)
- Alias added to `~/.bashrc`

## Recommendation

For autonomous coding sessions, **use Claude Code**. For one-off tasks where you don't mind typing `/auto-continue` a few times, OpenCode works fine.

If you prefer OpenCode and want automation, use the **tmux wrapper** (`opencode-auto`).