# MCP Orchestrator Launch Guide

## Overview

This guide provides instructions for launching the MCP Orchestrator to implement the Pixel CPU - PixiJS integration defined in this OpenSpec change.

## Prerequisites

1. **OpenSpec Change Complete**: All documents (proposal, design, tasks, spec) are finalized
2. **MCP Orchestrator Available**: MCP Orchestrator mode is accessible
3. **LM Studio Ready**: LM Studio is configured and running (optional but recommended)
4. **Workspace Ready**: Current workspace is `/home/jericho/zion/projects/geometry_os/geometry_os`

## Launch Instructions

### Step 1: Review OpenSpec Documents

Before launching the orchestrator, review the key documents:

1. **[proposal.md](proposal.md)** - Understand the problem and solution
2. **[design.md](design.md)** - Review the technical architecture
3. **[tasks.md](tasks.md)** - Familiarize yourself with the implementation tasks
4. **[specs/spec.md](specs/spec.md)** - Review the formal specification

### Step 2: Launch MCP Orchestrator

Use the `new_task` tool to launch the MCP Orchestrator:

```javascript
new_task({
    mode: "orchestrator",
    message: `Implement the Pixel CPU - PixiJS integration as defined in the OpenSpec change at openspec/changes/add-pixel-cpu-pixijs-integration/.

Key objectives:
1. Integrate Pixel CPU emulator with PixiJS infinite map
2. Implement memory-mapped I/O for console and framebuffer
3. Create CPU execution loop with cycle budgeting
4. Build visual components (state overlay, framebuffer display, console tile)
5. Implement brick file loading and execution
6. Test and optimize for 60 FPS performance
7. Attempt to boot RISC-V Linux kernel

Follow the tasks defined in openspec/changes/add-pixel-cpu-pixijs-integration/tasks.md in order, respecting dependencies.

Use the design specifications in openspec/changes/add-pixel-cpu-pixijs-integration/design.md and formal requirements in openspec/changes/add-pixel-cpu-pixijs-integration/specs/spec.md.

When code generation is needed, use LM Studio for AI-assisted development.

Report progress regularly and update task completion status.`,
    todos: `[x] Review OpenSpec documents
[-] Phase 1: Foundation
[ ] Phase 2: Framebuffer Integration
[ ] Phase 3: Console I/O
[ ] Phase 4: CPU State Visualization
[ ] Phase 5: Brick File Loading
[ ] Phase 6: InfiniteMap Integration
[ ] Phase 7: Testing & Optimization
[ ] Phase 8: Linux Boot
[ ] Phase 9: Documentation`
})
```

### Step 3: Monitor Progress

The MCP Orchestrator will:

1. **Break down tasks** into manageable subtasks
2. **Coordinate across multiple files** as needed
3. **Use LM Studio** for code generation when appropriate
4. **Track completion status** of each task
5. **Report progress** regularly

### Step 4: Provide Feedback

As the orchestrator works:

- **Review code changes** as they are made
- **Test implementations** when requested
- **Provide feedback** on any issues or concerns
- **Approve or request changes** to implementations

## Task Execution Order

The orchestrator should follow the task order defined in [`tasks.md`](tasks.md):

### Phase 1: Foundation (Week 1)
- Task 1.1: Create PixelCPUIntegration Class
- Task 1.2: Add Memory-Mapped I/O to SimplePixelCPU
- Task 1.3: Implement CPU Execution Loop

### Phase 2: Framebuffer Integration (Week 2)
- Task 2.1: Create Framebuffer Texture
- Task 2.2: Implement Framebuffer Update
- Task 2.3: Optimize Framebuffer Updates

### Phase 3: Console I/O (Week 2)
- Task 3.1: Implement Console Output
- Task 3.2: Create Console Tile
- Task 3.3: Update Console Display

### Phase 4: CPU State Visualization (Week 3)
- Task 4.1: Create CPU State Overlay
- Task 4.2: Update CPU State Display
- Task 4.3: Add Interactive Controls

### Phase 5: Brick File Loading (Week 3)
- Task 5.1: Implement Brick Loading
- Task 5.2: Add Brick File to index.html
- Task 5.3: Create Test Brick File

### Phase 6: InfiniteMap Integration (Week 4)
- Task 6.1: Integrate CPU into InfiniteMap
- Task 6.2: Add UI Controls to InfiniteMap
- Task 6.3: Add Keyboard Shortcuts

### Phase 7: Testing & Optimization (Week 5)
- Task 7.1: Unit Tests
- Task 7.2: Integration Tests
- Task 7.3: Performance Testing
- Task 7.4: Debugging Tools

### Phase 8: Linux Boot (Week 6)
- Task 8.1: Extend Instruction Set
- Task 8.2: Prepare Linux Kernel
- Task 8.3: Boot Linux Kernel
- Task 8.4: Document Linux Boot

### Phase 9: Documentation (Week 6)
- Task 9.1: Write API Documentation
- Task 9.2: Write User Guide
- Task 9.3: Update Project README

## Success Criteria

The orchestrator should consider the implementation complete when:

1. ✅ Pixel CPU executes `.brick` files within infinite map
2. ✅ Framebuffer memory is mapped to PixiJS texture
3. ✅ Console output is displayed on infinite map
4. ✅ CPU state is visualized in real-time
5. ✅ System maintains 60 FPS during execution
6. ✅ Test `.brick` file runs successfully
7. ✅ RISC-V Linux kernel boots (basic output)
8. ✅ All tests pass
9. ✅ Documentation is complete

## Key Files to Create

- `systems/visual_shell/web/pixel_cpu_integration.js` - Main integration class
- `systems/visual_shell/web/test_program.brick` - Test brick file
- `systems/visual_shell/web/tests/pixel_cpu_integration.test.js` - Unit tests
- `systems/visual_shell/web/tests/integration.test.js` - Integration tests
- `systems/visual_shell/web/tests/performance.test.js` - Performance tests
- `systems/visual_shell/web/API.md` - API documentation
- `systems/visual_shell/web/USER_GUIDE.md` - User guide

## Key Files to Modify

- `systems/visual_shell/web/pixel_cpu.js` - Add memory-mapped I/O support
- `systems/visual_shell/web/infinite_map.js` - Integrate CPU execution
- `systems/visual_shell/web/index.html` - Add script loading

## Using LM Studio

When code generation is needed, the orchestrator should:

1. **Identify the code to generate** based on task requirements
2. **Provide context** from the OpenSpec documents
3. **Request code generation** from LM Studio
4. **Review generated code** for correctness
5. **Integrate generated code** into the codebase
6. **Test the implementation** as appropriate

## Troubleshooting

### Issue: Orchestrator gets stuck

**Solution**: 
- Review the current task being worked on
- Check if there are any blocking issues
- Provide guidance or clarification as needed

### Issue: Code generation fails

**Solution**:
- Ensure LM Studio is running and accessible
- Check that the context provided is sufficient
- Try breaking down the task into smaller pieces

### Issue: Performance requirements not met

**Solution**:
- Review the performance targets in the spec
- Identify bottlenecks through profiling
- Apply optimization strategies from the design

### Issue: Tests fail

**Solution**:
- Review test failure messages
- Check implementation against spec requirements
- Debug and fix issues as they arise

## Completion

When all tasks are complete and success criteria are met:

1. **Verify all tests pass**
2. **Confirm 60 FPS performance**
3. **Test Linux kernel boot**
4. **Review documentation completeness**
5. **Update task completion status**
6. **Provide final summary**

## Next Steps After Completion

1. **Deploy to production** (if applicable)
2. **Monitor performance** in real-world usage
3. **Gather user feedback**
4. **Plan future enhancements** (see design.md future enhancements section)

---

**Last Updated**: 2025-01-25  
**Version**: 1.0.0
