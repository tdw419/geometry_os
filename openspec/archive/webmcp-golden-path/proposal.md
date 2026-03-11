# WebMCP Golden Path Boot Test

## Summary

Create an automated test that proves Linux boots on GPU shader by having an AI agent (via WebMCP) interact with the VM: boot Alpine Linux, type `uname -a`, and verify the output contains `riscv64`.

## Motivation

This is the **definitive test** for Geometry OS. It proves:

1. **GPU-Native RISC-V Execution** - A real Linux kernel runs on WebGPU compute shaders
2. **Timer Interrupts Work** - The scheduler functions (kernel doesn't hang)
3. **Console I/O Works** - Input flows from browser → SBI → kernel, output flows back
4. **AI Control Surface Works** - WebMCP tools can interact with the VM

## Architecture

Use existing WebMCP tools (`hypervisor_status`, `hypervisor_input`, `hypervisor_read_text`, `hypervisor_frame`) to create a test script that runs in the browser console:

```
┌─────────────────┐     ┌──────────────────┐     ┌─────────────────┐
│  Browser Test   │────▶│   WebMCP Bridge  │────▶│  WGPU Hypervisor│
│  (JavaScript)   │     │   (invokeTool)   │     │  (RISC-V GPU)   │
└─────────────────┘     └──────────────────┘     └─────────────────┘
         │                                               │
         │              ┌──────────────────┐             │
         └──────────────│   Alpine Linux   │◀────────────┘
                        │   (GPU Shader)   │
                        └──────────────────┘
```

The test will:
1. Wait for boot completion (shell prompt detection)
2. Send keyboard input (`uname -a\n`)
3. Capture console output
4. Validate the response contains `riscv64`

## Tech Stack

- JavaScript ES modules
- WebMCP Bridge (`invokeWebMCPTool`)
- Existing hypervisor infrastructure
- PixiJS VMMonitorTile for console access

## Files

| File | Purpose |
|------|---------|
| `systems/visual_shell/web/tests/test_golden_path_boot.js` | Core test implementation |
| `systems/visual_shell/web/test_golden_path.html` | Browser UI for running test |
| `systems/visual_shell/web/tests/test_golden_path_node.js` | CI runner with mocks |
| `docs/GOLDEN_PATH_BOOT_TEST.md` | Documentation |

## Success Criteria

- [ ] Browser test runs and validates `riscv64` output
- [ ] Node.js test runs without errors (mocked environment)
- [ ] All test steps pass: hypervisor check → boot wait → input → validate
- [ ] Documentation exists and is accurate

## Related

- Source Plan: `docs/plans/2026-02-18-webmcp-golden-path-boot-test.md`
- Related Specs: `openspec/specs/visual-shell/spec.md`
