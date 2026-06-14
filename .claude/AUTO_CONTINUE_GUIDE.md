# Claude Code Auto-Continue Setup

## Problem Solved

You want Claude to automatically continue working after each response, not just when you manually type `/continue`. Since Claude Code doesn't have an "after response" hook, here are the solutions:

## Solution 1: Interactive `/continue` (easiest)

Just type `/continue` after each response. The enhanced command makes Claude work autonomously.

```bash
claude
> Refactor auth module
[Claude responds]
> /continue
[Claude continues autonomously until Ctrl+C]
```

## Solution 2: Print Mode Loop (for automation)

Use the loop wrapper for fully autonomous sessions:

```bash
~/.claude/hooks/claude-loop.sh "Refactor auth module" 15
```

This runs Claude in a loop, automatically continuing until:
- Task is complete
- Max iterations reached (15 in this example)
- You Ctrl+C to stop

## Solution 3: Tmux Auto-Continue (closest to what you want)

Automatically sends `/continue` after each response in a tmux session:

```bash
~/.claude/hooks/claude-tmux-auto.sh claude-work "Refactor auth module" 10
```

This:
1. Starts Claude Code in tmux
2. Sends your initial prompt
3. Waits for Claude to respond
4. Automatically sends `/continue`
5. Repeats until max continues (10) or you stop it

Monitor progress:
```bash
# See current state
tmux capture-pane -t claude-work -p

# Attach to session (take control)
tmux attach -t claude-work

# Kill session when done
tmux kill-session -t claude-work
```

## Solution 4: Shell Alias (quickest)

Add to your `~/.bashrc` or `~/.zshrc`:

```bash
alias cc='claude'
alias ccloop='~/.claude/hooks/claude-loop.sh'
alias ccauto='~/.claude/hooks/claude-tmux-auto.sh'
```

Then use:
```bash
ccloop "Add tests" 20          # Loop mode
ccauto work "Refactor" 10     # Tmux auto mode
```

## How the Enhanced `/continue` Works

When you type `/continue`, Claude:
1. Analyzes its previous output
2. Identifies next steps
3. Continues autonomously
4. Self-corrects when needed
5. Stops when done or interrupted

This is different from just asking "continue" - the command explicitly programs Claude to work autonomously.

## Which Solution to Use?

| Need | Solution |
|------|----------|
| Manual control, autonomous behavior | Solution 1 (interactive `/continue`) |
| Fully automated, no interaction | Solution 2 (print loop) |
| Watch Claude work live | Solution 3 (tmux auto) |
| Quick access | Solution 4 (aliases) |

## Example: Full Autonomous Session

```bash
# Start auto-continue session
~/.claude/hooks/claude-tmux-auto.sh my-session "Add comprehensive test suite" 15

# In another terminal, monitor progress
watch -n 2 'tmux capture-pane -t my-session -p | tail -30'

# When done, kill the session
tmux kill-session -t my-session
```

## Files Installed

```
~/.claude/hooks/
├── auto-continue.sh          # Session state tracking
├── continue-helper.sh        # Context loader
├── continue-hints.sh         # Post-tool hints
├── claude-auto-continue.sh   # Print mode wrapper
├── claude-loop.sh            # Loop wrapper
└── claude-tmux-auto.sh       # Tmux auto-continue
```

## Troubleshooting

**Tmux auto doesn't continue:**
- Check session name: `tmux ls`
- Verify Claude is running: `tmux capture-pane -t <session> -p`
- Adjust sleep times in the script

**Loop mode stops early:**
- Increase max iterations
- Check for errors in Claude output
- Verify task is clear enough

**Interactive `/continue` doesn't work:**
- Check `.claude/commands/continue.md` exists
- Verify Claude Code v2.x+: `claude --version`
- Try in a fresh session