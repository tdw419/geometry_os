---
name: golden-path-boot-test
description: Verifies the full RISC-V GPU boot stack by booting Alpine Linux, executing 'uname -a', and capturing the output. Use this skill when you need to provide concrete, end-to-end proof that the shader, interrupts, and console I/O are working correctly in the browser.
category: testing
---

# Golden Path Boot Test

This skill provides a structured workflow to verify the most critical capability of Geometry OS: booting a real Linux kernel on the GPU.

## Prerequisites

- `linux_kernel.rts.png` must be present in the project root.
- A browser environment capable of running WebGPU.
- `WGPULinuxHypervisor` and related JS modules must be functional.

## Execution Workflow

1. **Launch the Browser Shell**: Open `systems/visual_shell/web/index.html`.
2. **Observe the Boot Process**:
    - The `VMMonitorTile` labeled "WEBGPU BOOT: Alpine Linux" should appear.
    - Monitor the browser console (F12) for `[SBI] Timer set` and `[Hypervisor] Timer interrupt firing`.
    - Wait for the Alpine Linux login prompt or shell to appear in the tile.
3. **Interactive Verification**:
    - Click the VM Monitor tile to focus input.
    - Type `uname -a` and press Enter.
4. **Capture the Proof**:
    - Verify the output: `Linux alpine ... riscv64`.
    - Capture a screenshot or copy the console logs showing the successful command execution.

## Troubleshooting

- **No output in VM Monitor**: Check if the MMIO mapping for the console is correct in `wgpu_linux_hypervisor.js`.
- **Keyboard input fails**: Ensure `onCharacter` is properly wired from `WGPUInputHandler` to `SBIHandler`.
- **Boot hangs**: Verify that `cycleCount` is incrementing and triggering interrupts in the hypervisor loop.
