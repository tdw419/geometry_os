# Geometry OS AI Skills Index

> This file auto-loads into AI context. Skills are procedural workflows for common tasks.
> Skills serve dual purposes: AI reference for discovering capabilities, and human documentation synced to WordPress.

## Available Skills

| Skill | Category | Purpose | Location |
|-------|----------|---------|----------|
| golden-path-boot-test | Verification | Verifies the full RISC-V GPU boot stack by booting Alpine Linux, executing 'uname -a', and capturing the output. Use this skill when you need to provide concrete, end-to-end proof that the shader, interrupts, and console I/O are working correctly in the browser. | `.gemini/skills/golden-path-boot-test/SKILL.md` |
| parallel-swarm-production | Coordination | Productionizes agent coordination for real-world tasks within Geometry OS. Use this skill when transforming the multi-agent demo infrastructure into a functional system for tasks like distributed catalog scanning or tectonic optimization. | `.gemini/skills/parallel-swarm-production/SKILL.md` |
| evolution-daemon-control | Operations | Control the Evolution Daemon - start, stop, monitor, and manage autonomous self-improvement cycles. Use this skill when managing the continuous evolution system. | `.gemini/skills/evolution-daemon-control/SKILL.md` |
| visual-shell-debug | Debugging | Debug Visual Shell issues including WebSocket connections, tile rendering, and UI interactions. Use this skill when troubleshooting the visual interface. | `.gemini/skills/visual-shell-debug/SKILL.md` |
| infinite-map-testing | Testing | Test Infinite Map functionality including Hilbert curve navigation, tile loading, and spatial queries. Use this skill when validating map behavior. | `.gemini/skills/infinite-map-testing/SKILL.md` |

## How to Use Skills

1. **Match Context**: Read skill descriptions above to find the relevant skill for your task
2. **Load Skill**: Read the full SKILL.md file from the specified location for detailed workflow
3. **Follow Procedure**: Execute steps in order, adapting as needed for your specific situation
4. **Report Results**: Note any deviations, improvements, or issues encountered

## Skill Categories

- **Verification**: Skills for validating system behavior and functionality
- **Coordination**: Skills for managing multi-agent collaboration and orchestration
- **Operations**: Skills for controlling and monitoring running systems
- **Debugging**: Skills for troubleshooting and diagnosing issues
- **Testing**: Skills for validating specific subsystem behaviors

## Adding New Skills

1. Create directory: `.gemini/skills/<skill-name>/`
2. Add `SKILL.md` with YAML frontmatter containing:
   ```yaml
   ---
   name: skill-name
   description: Brief description of what this skill does and when to use it.
   ---
   ```
3. Document the workflow with clear steps and troubleshooting guidance
4. Run: `./wordpress_zone/manage_wp.sh sync-skills` to sync to WordPress
5. Update this index table with the new skill entry

## Skill File Structure

```
.gemini/skills/
├── <skill-name>/
│   ├── SKILL.md          # Main skill definition (required)
│   ├── scripts/          # Helper scripts (optional)
│   └── templates/        # Template files (optional)
```

## Integration with AI Context

This SKILLS.md file is automatically loaded into AI context. When an AI agent needs to perform a task:

1. It reads this index to discover available skills
2. Matches task requirements to skill descriptions
3. Loads the full SKILL.md for detailed execution steps
4. Follows the procedural workflow with appropriate adaptations
