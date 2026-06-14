# Continue — Autonomous work continuation

**IMPORTANT**: This command triggers autonomous work continuation. Claude will keep working on the current task until completion or until you interrupt with Ctrl+C.

## What this does

When invoked, Claude enters autonomous continuation mode:
1. Analyzes the current work state and context
2. Identifies what needs to be done next
3. Continues working automatically without further prompts
4. Iterates until the task is complete or hits natural stopping points

## Usage

### Basic autonomous continuation
```
/continue
```
Claude will analyze the current state and continue working autonomously.

### After a partial response
```
/continue
```
Picks up exactly where the previous response left off and continues.

### With specific focus
```
/continue focus on X
```
Continues work but focuses specifically on aspect X.

### With iteration limit
```
/continue for 5 more iterations
```
Limits autonomous work to 5 additional turns.

## Autonomous behavior patterns

When you use `/continue`, Claude will:

1. **Context preservation**: Maintain full awareness of what was discussed
2. **Pattern recognition**: Continue using the same approaches and style
3. **Progressive building**: Each response builds on the previous one
4. **Self-correction**: Detect and fix issues autonomously
5. **Natural stopping**: Know when to stop (completion, blockers, decisions needed)

## What Claude does autonomously

- Reads and analyzes files it just created/modified
- Runs tests and fixes failures automatically
- Refactors code based on its own review
- Writes documentation for code it just produced
- Expands on partial implementations
- Handles edge cases it discovers
- Optimizes performance of code it wrote
- Adds error handling to working code
- Writes tests for implementations

## Stopping autonomous continuation

**To stop at any time**: Press `Ctrl+C`

**To stop after current turn**: Let Claude finish, then don't type anything

**To change direction**: Type a new prompt - this overrides the continuation

## When to use `/continue`

Perfect for:
- Large refactoring tasks that span multiple responses
- Multi-step implementations
- Test-driven development cycles
- Documentation generation
- Code review and fix cycles
- Exploratory programming
- Iterative problem-solving

## Example workflow

```
You: Refactor the auth module to use JWT tokens
Claude: [writes initial refactored code]
You: /continue
Claude: [adds tests for the new JWT code]
Claude: [writes documentation]
Claude: [adds error handling]
Claude: [optimizes performance]
You: Ctrl+C (stop when satisfied)
```

## Best practices

1. **Start with clear initial prompt**: Give Claude good direction before using `/continue`
2. **Monitor progress**: Watch what Claude is doing - it's autonomous, not random
3. **Use `/compact` first**: If context is large, compact before continuing
4. **Set iteration limits**: For complex tasks, use `/continue for N iterations`
5. **Interrupt gracefully**: Ctrl+C is safe - Claude won't lose work
6. **Review before accepting**: Check autonomous work before committing

## Advanced usage

### With compacting
```
/compact
/continue
```
Frees up context, then continues autonomously.

### With focus shift
```
/continue now focus on tests
```
Changes direction while continuing.

### With checkpointing
```
/continue and create checkpoints after each major step
```
Claude creates checkpoints as it progresses.

### Parallel work
```
/continue work on both frontend and backend in parallel
```
Claude orchestrates multiple work streams.