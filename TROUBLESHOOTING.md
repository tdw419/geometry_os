# Troubleshooting Guide

> Comprehensive troubleshooting guide for Geometry OS

## Table of Contents

- [Quick Diagnostics](#quick-diagnostics)
- [Installation Issues](#installation-issues)
- [Runtime Errors](#runtime-errors)
- [Performance Issues](#performance-issues)
- [GPU/WebGPU Issues](#gpuwebgpu-issues)
- [Evolution Daemon Issues](#evolution-daemon-issues)
- [Visual Shell Issues](#visual-shell-issues)
- [Network/Distributed Issues](#networkdistributed-issues)
- [Memory Issues](#memory-issues)
- [Localization Issues](#localization-issues)
- [Testing Issues](#testing-issues)
- [Build Issues](#build-issues)
- [Rust Components](#rust-components)

---

## Quick Diagnostics

### System Health Check

```bash
# Check overall system status
python3 geometry_os_cli.py status

# Run diagnostic tests
make test-unit

# Check GPU availability
python3 -c "import torch; print(f'CUDA available: {torch.cuda.is_available()}')"

# Verify environment variables
env | grep -E "LM_STUDIO|DISTRICT|TECTONIC"
```

### Log Locations

| Component | Log Location |
|-----------|--------------|
| Evolution Daemon | `/tmp/evolution_daemon.log` |
| Visual Shell | Browser console + `/tmp/visual_shell.log` |
| Pixel Brain | `/tmp/pixel_brain.log` |
| System | `geometry_os.log` |

---

## Installation Issues

### Missing Dependencies

**Problem**: `ModuleNotFoundError: No module named 'xxx'`

**Solution**:
```bash
# Install Python dependencies
pip install -r requirements.txt

# For development dependencies
pip install -r requirements-dev.txt
```

### Smithay Dependencies (Rust Compositor)

**Problem**: Build fails with missing DRM/KMS libraries

**Solution**:
```bash
# Ubuntu/Debian
sudo apt-get install libseat-dev libudev-dev libinput-dev libdrm-dev

# Fedora/RHEL
sudo dnf install libseat-devel libudev-devel libinput-devel libdrm-devel

# Arch Linux
sudo pacman -S libseat libudev libinput libdrm
```

### Rust Version Issues

**Problem**: `error: rustc X.XX.X is not supported`

**Solution**:
```bash
# Update Rust to 1.70+
rustup update stable
rustup default stable
```

---

## Runtime Errors

### LM Studio Connection Failed

**Problem**: `ConnectionError: Cannot connect to LM Studio`

**Solutions**:

1. **Check LM Studio is running**:
   ```bash
   curl http://localhost:1234/v1/models
   ```

2. **Verify environment variable**:
   ```bash
   export LM_STUDIO_URL=http://localhost:1234/v1
   ```

3. **Fallback to heuristic mode**:
   The system will automatically fall back to heuristic logic when LM Studio is unavailable.

### Port Already in Use

**Problem**: `OSError: [Errno 98] Address already in use`

**Solution**:
```bash
# Find process using port
lsof -i :8773  # District server
lsof -i :8772  # Tectonic server
lsof -i :8080  # Visual shell

# Kill process
kill -9 <PID>

# Or change port in .env
export DISTRICT_PORT=8774
export TECTONIC_PORT=8773
```

### Import Errors

**Problem**: `ImportError: cannot import name 'xxx' from 'systems'`

**Solution**:
```bash
# Ensure you're in the project root
cd /path/to/geometry_os

# Rebuild package
pip install -e .

# Or add to PYTHONPATH
export PYTHONPATH="${PYTHONPATH}:$(pwd)"
```

---

## Performance Issues

### Slow Evolution Cycles

**Problem**: Evolution daemon running slowly

**Diagnostics**:
```bash
# Check cycle duration
python3 -c "
from systems.evolution_daemon import EvolutionDaemon
daemon = EvolutionDaemon()
import time
start = time.time()
daemon.run_cycle()
print(f'Cycle time: {time.time() - start:.2f}s')
"
```

**Solutions**:

1. **Reduce mutation complexity**:
   ```python
   # In evolution_daemon config
   max_mutations_per_cycle = 5  # Reduce from default
   ```

2. **Enable parallel processing**:
   ```python
   use_parallel_mutations = True
   ```

3. **Check GPU utilization**:
   ```bash
   nvidia-smi -l 1
   ```

### High Memory Usage

**Problem**: System consuming excessive memory

**Diagnostics**:
```bash
# Run memory profiler
python3 -m memory_profiler systems/evolution_daemon/evolution_daemon_v8.py

# Check memory leak detector
python3 visual-vm/memory_leak_detector.py --check
```

**Solutions**:

1. **Enable periodic GC** (already implemented in v4.0+):
   ```python
   import gc
   gc.collect()  # Manual trigger if needed
   ```

2. **Reduce cache sizes**:
   ```python
   # In pixel_llm config
   max_cache_size = 100  # Reduce from default
   ```

3. **Check for circular references**:
   ```python
   # Use memory leak detector
   from visual_vm.memory_leak_detector import MemoryLeakDetector
   detector = MemoryLeakDetector()
   detector.check_circular_references()
   ```

---

## GPU/WebGPU Issues

### WebGPU Not Available

**Problem**: `WebGPU not supported in this browser`

**Solutions**:

1. **Use supported browser**:
   - Chrome 113+
   - Edge 113+
   - Firefox Nightly (with flag)

2. **Enable WebGPU flags** (Firefox):
   ```
   about:config → dom.webgpu.enabled → true
   ```

3. **Fallback to WebGL2** (automatic in v4.2+)

### CUDA Out of Memory

**Problem**: `RuntimeError: CUDA out of memory`

**Solutions**:

1. **Check VRAM pressure**:
   ```bash
   python3 -c "
   from systems.infinite_map_rs.synapse import VramMonitor
   monitor = VramMonitor()
   print(f'VRAM Pressure: {monitor.get_pressure_level()}')
   print(f'Utilization: {monitor.get_utilization():.1f}%')
   "
   ```

2. **Reduce batch size**:
   ```python
   # In pixel_brain config
   batch_size = 1  # Minimal batch size
   ```

3. **Enable CPU fallback** (automatic with APEX strategy):
   - System automatically falls back to CPU when VRAM > 80%

### SPIR-V Compilation Failed

**Problem**: `SPIR-V compilation error`

**Solution**:
```bash
# Validate SPIR-V binary
spirv-val output.spv

# Check shader stage
spirv-cross --version 450 output.spv
```

---

## Evolution Daemon Issues

### Fracture Detection False Positives

**Problem**: System detecting fractures when none exist

**Solution**:
```python
# Adjust PAS threshold
from systems.evolution_daemon import EvolutionDaemon

daemon = EvolutionDaemon()
daemon.fracture_detector.pas_threshold = 0.3  # Lower from 0.5
```

### Mutation Rollback Failed

**Problem**: `RollbackError: Cannot restore previous state`

**Solutions**:

1. **Check backup exists**:
   ```bash
   ls -la /tmp/evolution_backups/
   ```

2. **Manual rollback**:
   ```python
   from systems.evolution_daemon import EvolutionDaemon
   daemon = EvolutionDaemon()
   daemon.manual_rollback(backup_id="backup_20260311_123456")
   ```

3. **Disable auto-evolution temporarily**:
   ```python
   daemon.disable_auto_evolution()
   ```

### Dreaming Kernel Timeout

**Problem**: `TimeoutError: Simulation exceeded maximum duration`

**Solution**:
```python
# Increase simulation timeout
daemon.dreaming_kernel.timeout = 60.0  # Increase from 30s
```

---

## Visual Shell Issues

### Black Screen on Startup

**Problem**: Visual shell displays black screen

**Diagnostics**:
```bash
# Check browser console for errors
# Open Developer Tools (F12) → Console

# Verify build
ls -la web/assets/
```

**Solutions**:

1. **Clear browser cache**:
   - Ctrl+Shift+Delete → Clear cache

2. **Rebuild assets**:
   ```bash
   python3 core/atlas_gen.py
   make build
   ```

3. **Check WebGL context**:
   ```javascript
   // In browser console
   const canvas = document.createElement('canvas');
   const gl = canvas.getContext('webgl2');
   console.log('WebGL2 supported:', gl !== null);
   ```

### PixiJS Performance Issues

**Problem**: Low FPS in visual shell

**Solutions**:

1. **Enable foveated rendering** (v4.0+):
   ```python
   from systems.visual_shell import VisualShell
   shell = VisualShell()
   shell.enable_foveated_rendering(radius=200)
   ```

2. **Reduce particle count**:
   ```python
   shell.particle_system.max_particles = 1000
   ```

3. **Check GPU performance**:
   ```bash
   # Chrome
   chrome://gpu

   # Firefox
   about:support → Graphics
   ```

### GNB Not Loading

**Problem**: Geometric Native Browser fails to initialize

**Solution**:
```bash
# Check GNB binary exists
ls -la systems/visual_shell/native/gnb

# Build if missing
cd systems/visual_shell/native
make
```

---

## Network/Distributed Issues

### District Server Connection Failed

**Problem**: `WebSocket connection failed`

**Diagnostics**:
```bash
# Check server is running
netstat -tulpn | grep 8773

# Test WebSocket
wscat -c ws://localhost:8773
```

**Solutions**:

1. **Restart district server**:
   ```bash
   python3 geometry_os_cli.py serve --district
   ```

2. **Check firewall**:
   ```bash
   sudo ufw allow 8773/tcp
   ```

### Agent Synchronization Issues

**Problem**: Agents out of sync across nodes

**Solution**:
```bash
# Force synchronization
python3 geometry_os_cli.py agents --sync

# Check mesh event queue
python3 -c "
from systems.cognitive import MeshEventQueue
queue = MeshEventQueue()
print(f'Queue size: {queue.size()}')
print(f'Pending events: {queue.pending()}')
"
```

---

## Memory Issues

### Hilbert Addressing Errors

**Problem**: `HilbertError: Invalid coordinate mapping`

**Solution**:
```python
# Validate coordinates
from systems.native.hilbert import HilbertCurve

curve = HilbertCurve(order=10)
try:
    d = curve.distance_from_coordinates([512, 512])
    coords = curve.coordinates_from_distance(d)
    print(f"Roundtrip: {coords}")
except Exception as e:
    print(f"Invalid coordinates: {e}")
```

### Memory Drift Detection

**Problem**: High semantic drift in KV-cache

**Solution**:
```bash
# Check drift metrics
python3 -c "
from systems.memory_drift import DriftEngine
engine = DriftEngine()
metrics = engine.get_drift_metrics()
print(f'Semantic drift: {metrics.semantic_drift:.3f}')
print(f'Anchor stability: {metrics.anchor_stability:.3f}')
"
```

---

## Localization Issues

### Missing Translations

**Problem**: UI shows translation keys instead of text

**Solution**:
```python
# Check translation exists
from systems.visual_shell.api.i18n import i18n

key = "window.title"
if i18n.has_translation(key):
    print(i18n.get(key))
else:
    print(f"Missing translation: {key}")
```

### UTF-8 Encoding Issues

**Problem**: `UnicodeDecodeError` when loading translations

**Solution**:
```bash
# Verify file encoding
file -i systems/visual_shell/api/i18n/locales/*.json

# Should show: application/json; charset=utf-8
```

### RTL Layout Issues

**Problem**: Right-to-left languages display incorrectly

**Solution**:
```python
# Check RTL detection
from systems.visual_shell.api.i18n import i18n

if i18n.is_rtl("ar"):
    # Apply RTL layout
    layout.direction = "rtl"
    layout.alignment = "right"
```

---

## Testing Issues

### Test Collection Errors

**Problem**: `ERROR collecting tests/`

**Diagnostics**:
```bash
# Verbose collection
pytest --collect-only -v

# Find problematic test
pytest --collect-only 2>&1 | grep ERROR
```

**Solutions**:

1. **Fix import errors**:
   ```bash
   # Check for missing dependencies
   python3 -c "import <module>"
   ```

2. **Skip problematic tests**:
   ```bash
   pytest -k "not problematic_test"
   ```

### Coverage Too Low

**Problem**: Test coverage below 30%

**Solution**:
```bash
# Generate coverage report
pytest --cov=systems --cov-report=html

# Open report
open htmlcov/index.html

# Focus on uncovered files
pytest --cov=systems --cov-report=term-missing
```

---

## Build Issues

### Make Build Fails

**Problem**: `make: *** [build] Error 1`

**Diagnostics**:
```bash
# Verbose build
make build VERBOSE=1

# Check individual components
python3 core/geo_cc.py --check
python3 core/atlas_gen.py --check
```

### Rust Build Fails

**Problem**: `cargo build` fails

**Solutions**:

1. **Update dependencies**:
   ```bash
   cd systems/infinite_map_rs
   cargo update
   ```

2. **Clean build**:
   ```bash
   cargo clean
   cargo build --release
   ```

3. **Check Rust toolchain**:
   ```bash
   rustup show
   rustup override set stable
   ```

---

## Rust Components

### Compositor Won't Start

**Problem**: `infinite_map_rs` fails to launch

**Diagnostics**:
```bash
# Check DRM backend
cd systems/infinite_map_rs
RUST_LOG=debug cargo run -- --backend drm

# Try Winit backend
cargo run -- --backend winit
```

**Solutions**:

1. **Use Winit backend** (no DRM required):
   ```bash
   cargo run -- --backend winit
   ```

2. **Check permissions** (DRM backend):
   ```bash
   # Add user to render group
   sudo usermod -a -G render $USER
   # Log out and back in
   ```

### QEMU Boot Issues

**Problem**: QEMU fails to boot initramfs

**Solution**:
```bash
# Verify initramfs exists
ls -la initramfs-geometry-os.cpio.gz

# Check kernel exists
ls -la /boot/vmlinuz

# Recreate initramfs
bash systems/infinite_map_rs/scripts/create_initramfs.sh
```

---

## Getting Help

### Community Resources

- **GitHub Issues**: https://github.com/tdw419/geometry_os/issues
- **Documentation**: See `docs/` directory
- **AGENTS.md**: Project-specific guidance

### Reporting Bugs

When reporting bugs, include:

1. **System information**:
   ```bash
   uname -a
   python3 --version
   rustc --version
   nvidia-smi  # If applicable
   ```

2. **Error message** (full stack trace)

3. **Steps to reproduce**

4. **Expected vs actual behavior**

### Debug Mode

Enable verbose logging:

```bash
# Python
export GEOMETRY_OS_DEBUG=1
python3 geometry_os_cli.py demo --verbose

# Rust
RUST_LOG=debug cargo run
```

---

*Last Updated: 2026-03-11*
*Version: 4.0.0*
