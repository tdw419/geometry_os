# Claude Code Auto-Continue Setup

This setup provides intelligent continuation hooks and commands for Claude Code.

## What's installed

### 1. Enhanced `/continue` slash command
Location: `.claude/commands/continue.md`

When you type `/continue` in Claude Code, it:
- Analyzes current work state
- Continues autonomously until complete
- Handles multi-step iterations
- Self-corrects and optimizes

### 2. Post-tool-use hints
Location: `~/.claude/hooks/continue-hints.sh`

After each tool use, shows intelligent suggestions:
- "Type /continue to add tests"
- "Type /continue to continue refactoring"
- Context-aware hints based on what Claude just did

### 3. Session state tracking
Location: `~/.claude/hooks/auto-continue.sh`

When sessions stop, saves:
- Session ID and timestamp
- Project directory
- Git context
- Recent files modified

### 4. Autonomous wrapper script
Location: `~/.claude/hooks/claude-auto-continue.sh`

Run fully autonomous Claude Code sessions:
```bash
claude-auto-continue "Refactor auth module" 15
```

## How to use

### Interactive mode (most common)
1. Start Claude Code: `claude`
2. Give initial task
3. After each response, type: `/continue`
4. Claude continues autonomously
5. Press Ctrl+C to stop

### Print mode (for automation)
1. Use the wrapper:
```bash
claude-auto-continue "Add comprehensive tests" 20
```
2. Claude works autonomously for up to 20 turns
3. Get structured JSON output

### With hints enabled
1. Just work normally
2. After each tool use, you'll see helpful hints
3. Follow the hints with `/continue` when appropriate

## Configuration

The hooks are configured in `.claude/settings.json`:

```json
{
  "hooks": {
    "PostToolUse": [
      {
        "type": "command",
        "command": "$HOME/.claude/hooks/continue-hints.sh"
      }
    ],
    "Stop": [
      {
        "type": "command",
        "command": "$HOME/.claude/hooks/auto-continue.sh"
      }
    ]
  }
}
```

## What happens when you use `/continue`

Claude enters autonomous mode and:
1. Reads and analyzes its previous output
2. Identifies next logical steps
3. Executes them automatically
4. Iterates until done or interrupted
5. Self-corrects when it finds issues

## Stopping continuation

- **Ctrl+C**: Stop immediately
- **Let it finish**: Claude stops when task is complete
- **Type new prompt**: Overrides continuation

## Examples

### Refactoring workflow
```
You: Refactor the auth module to use JWT
Claude: [writes refactored code]
You: /continue
Claude: [adds tests]
Claude: [writes docs]
Claude: [handles edge cases]
You: Ctrl+C
```

### Feature development
```
You: Add user profile feature
Claude: [creates models, routes, views]
You: /continue
Claude: [adds migrations]
Claude: [writes tests]
Claude: [adds validation]
You: Ctrl+C
```

### Bug fixing
```
You: Fix the memory leak in the image processor
Claude: [identifies and fixes leak]
You: /continue
Claude: [adds tests to prevent regression]
Claude: [documents the fix]
You: Ctrl+C
```

## Tips

1. **Start clear**: Give good initial direction
2. **Monitor**: Watch what Claude does
3. **Compact first**: Use `/compact` if context is large
4. **Set limits**: Use iteration limits for complex tasks
5. **Interrupt safely**: Ctrl+C won't lose work

## Troubleshooting

If `/continue` doesn't work:
1. Check `.claude/commands/continue.md` exists
2. Verify Claude Code version: `claude --version` (needs v2.x)
3. Check hooks are executable: `ls -la ~/.claude/hooks/`

If hints don't appear:
1. Check `.claude/settings.json` has PostToolUse hook
2. Verify `continue-hints.sh` is executable
3. Check Claude Code supports hooks in your version

## Files created

```
~/.claude/
├── hooks/
│   ├── auto-continue.sh          # Session state saver
│   ├── continue-helper.sh        # Context loader on start
│   ├── continue-hints.sh         # Post-tool hints
│   └── claude-auto-continue.sh   # Autonomous wrapper
└── session-states/               # Saved session data
    └── latest-<project-hash> -> last-session-<id>.json

.claude/
├── commands/
│   └── continue.md               # The /continue slash command
└── settings.json                 # Hook configuration
```