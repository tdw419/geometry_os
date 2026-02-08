# Geometry OS Implementation Plans

This directory contains detailed implementation plans for Geometry OS development.

## Phase 1: Critical Fixes & Technical Debt (Weeks 1-2)

### ✅ Ready to Execute

| Plan | Status | Est. Time | Description |
|------|--------|-----------|-------------|
| [2025-02-08-wgsl-i64-fix.md](./2025-02-08-wgsl-i64-fix.md) | Ready | 30-45 min | Fix WGSL shader i64 compatibility to unblock RISC-V GPU VM |
| [2025-02-08-rts-amp-bf16-support.md](./2025-02-08-rts-amp-bf16-support.md) | Ready | 1-2 hours | Add BFloat16 support for Ampere+ GPUs |
| [2025-02-08-rts-amp-lightning-integration.md](./2025-02-08-rts-amp-lightning-integration.md) | Ready | 1-2 hours | Streamline PyTorch Lightning integration |
| [2025-02-08-cuda-compatibility-fix.md](./2025-02-08-cuda-compatibility-fix.md) | Pending | 2-4 hours | Enable GPU tests for RTX 5090/CUDA 12.x |

## Quick Start

### Executing a Plan

Each plan is self-contained and can be executed independently. To execute a plan:

**Option 1: Subagent-Driven (Current Session)**
```bash
# Use the superpowers:subagent-driven-development skill
# This will spawn fresh subagents per task with code review between steps
```

**Option 2: Parallel Session**
```bash
# Open a new session in a dedicated worktree
# Use the superpowers:executing-plans skill
```

### Plan Structure

Each plan follows this structure:
1. **Header** - Goal, architecture, tech stack
2. **Bite-sized tasks** - Each step takes 2-5 minutes
3. **Exact file paths** - No ambiguity
4. **Complete code** - Full implementations in plan
5. **Verification steps** - How to confirm it works

## Execution Order

### Priority 1 (Do First - Unblocking)
1. **WGSL i64 Fix** - Unblocks RISC-V GPU VM execution
2. **CUDA Compatibility** - Enables GPU tests on newer hardware

### Priority 2 (High Impact)
3. **RTS AMP BF16 Support** - Performance improvement for Ampere+
4. **Lightning Integration** - Streamlines training infrastructure

All four tasks can be executed in parallel by different team members.

## Task Creation Guidelines

When creating new plans:
1. Use the `superpowers:writing-plans` skill
2. Save to `docs/plans/YYYY-MM-DD-<feature-name>.md`
3. Follow the established template
4. Include exact file paths from the codebase
5. Break into 2-5 minute steps
6. Include verification commands

## Phase Status

- **Phase 1 (Critical Fixes)**: Plans complete, ready to execute
- **Phase 2 (Feature Completeness)**: Pending planning
- **Phase 3 (Scalability)**: Pending planning
- **Phase 4 (Documentation)**: Ongoing
- **Phase 5 (Future)**: Ideation

## Links

- [Main Roadmap](../ROADMAP.md)
- [GPU Compatibility Guide](../docs/gpu-compatibility.md)
- [RTS AMP BF16 Guide](../systems/pixel_compiler/BF16_GUIDE.md)
- [Lightning Integration Guide](../systems/pixel_compiler/LIGHTNING_GUIDE.md)
