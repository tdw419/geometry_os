# WebMCP Golden Path Boot Test - Tasks

## 1. Core Test Implementation

- [ ] 1.1 Create test runner skeleton at `systems/visual_shell/web/tests/test_golden_path_boot.js`
  - Define `GoldenPathBootTest` class
  - Add results tracking object
  - Add `run()` method with 4-step flow
  - Add `reportResults()` method

- [ ] 1.2 Implement hypervisor check (step1_checkHypervisor)
  - Check WebMCP bridge exists
  - Call `hypervisor_status` tool
  - Fallback to direct hypervisor reference

- [ ] 1.3 Implement boot completion wait (step2_waitForBoot)
  - Poll for shell prompt indicators (`login:`, `# `, `$ `)
  - 45-second timeout
  - Use `getConsoleOutput()` helper

- [ ] 1.4 Implement command input (step3_sendCommand)
  - Send `uname -a\n` via WebMCP `hypervisor_input`
  - Fallback to direct `injectInput` method
  - Fallback to SBI handler queue

- [ ] 1.5 Implement output validation (step4_validateOutput)
  - Check output contains `riscv64`
  - Check output contains `linux` and `alpine`
  - Set `results.outputValid` flag

- [ ] 1.6 Add browser runner convenience function
  - `window.runGoldenPathTest()`
  - Export `GoldenPathBootTest` class

## 2. Test UI

- [ ] 2.1 Create HTML test page at `systems/visual_shell/web/test_golden_path.html`
  - Boot Alpine Linux button
  - Run Golden Path Test button
  - Status output area
  - PixiJS canvas for VM display

- [ ] 2.2 Wire hypervisor initialization
  - Create `WGPULinuxHypervisor` instance
  - Create `VMMonitorTile` for console output
  - Load kernel from `linux_kernel.rts.png`

## 3. CI Support

- [ ] 3.1 Create Node.js runner at `systems/visual_shell/web/tests/test_golden_path_node.js`
  - Mock browser globals (`window`, etc.)
  - Mock WebMCP tool responses
  - Run test and report results

## 4. Documentation

- [ ] 4.1 Create documentation at `docs/GOLDEN_PATH_BOOT_TEST.md`
  - What it proves section
  - Running instructions (browser, console, Node.js)
  - Expected output example
  - Troubleshooting section

## 5. Verification

- [ ] 5.1 Verify browser test runs successfully
- [ ] 5.2 Verify Node.js test runs without errors
- [ ] 5.3 Verify all files exist and are syntactically correct
