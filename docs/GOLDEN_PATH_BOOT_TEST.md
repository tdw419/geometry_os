# Golden Path Boot Test

The definitive test that proves Geometry OS works: **Linux boots on a GPU shader and AI can control it.**

## What It Proves

1. **GPU-Native RISC-V Execution** - A real Linux kernel runs on WebGPU compute shaders
2. **Timer Interrupts Work** - The scheduler functions (kernel doesn't hang)
3. **Console I/O Works** - Input flows from browser → SBI → kernel, output flows back
4. **AI Control Surface Works** - WebMCP tools can interact with the VM

## Running the Test

### Browser (Recommended)

1. Start the server:
   ```bash
   python3 -m http.server 8000 --directory systems/visual_shell/web
   ```

2. Open: http://localhost:8000/test_golden_path.html

3. Click "Boot Alpine Linux"

4. W

ait for shell prompt (30-60 seconds)

5. Click "Run Golden Path Test"

6. Verify output contains `riscv64`

### Browser Console

If the boot demo is already running:

```javascript
// Load the test
const script = document.createElement('script');
script.src = 'tests/test_golden_path.js';
document.head.appendChild(script);

// Run the test
await window.runGoldenPathTest()
```

### Node.js (CI)

```bash
cd systems/visual_shell/web
node tests/test_golden_path_node.js
```

## Expected Output

```
========================================
  GOLDEN PATH BOOT TEST
  Proving: Linux boots on GPU + AI controls it
========================================

[Step 1] Checking hypervisor availability...
  Hypervisor ready via WebMCP
[Step 2] Waiting for boot to reach shell prompt...
  Shell prompt detected: "# "
[Step 3] Sending command: uname -a
  Command sent via WebMCP
[Step 4] Validating output for "riscv64"...
  Found pattern: /riscv64/i
  Output contains "riscv64" - GPU RISC-V execution confirmed!

========================================
  TEST RESULTS
========================================
  Hypervisor Ready:
  Boot Completed:
  Input Sent:
  Output Captured:
  Output Valid:
========================================

 GOLDEN PATH COMPLETE
   Linux boots on GPU shader.
   AI controls VM via WebMCP.
   System is fully operational.
```

## Files

| File | Purpose |
|------|---------|
| `tests/test_golden_path_boot.js` | Core test implementation |
| `test_golden_path.html` | Browser UI for running test |
| `tests/test_golden_path_node.js` | CI runner with mocks |

## Troubleshooting

**"Hypervisor not initialized"**
- Ensure WebGPU is enabled in browser
- Check console for WebGPU errors

**"Boot timeout"**
- Kernel may be slow; increase timeout
- Check network tab for kernel loading errors

**"No console output captured"**
- VMMonitorTile may not be created
- Check that consoleText is wired to SBI handler
