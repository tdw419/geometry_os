# Shotcut Track Status

## Goal
Prove "The Screen is the Hard Drive" thesis by automating GUI applications via visual capture.

## Current State

### Stage 1: Alpine Installation ✅ COMPLETE
- **Method**: Serial console automation via `pexpect`
- **Script**: `serial_alpine_install_v3.py`
- **Result**: Fresh Alpine Linux 3.19 installed on 8GB qcow2 disk

### Stage 2: GUI + Shotcut Installation ✅ COMPLETE
- **Boot**: QEMU with QXL VGA + VNC
- **GUI Stack**: Xorg → Openbox → Shotcut
- **Result**: Shotcut running and visible via VNC capture

### Stage 3: Visual HUD ✅ COMPLETE (2026-02-20)
- **Commit**: `11eb1c3c`
- **Components**:
  - `extraction_pipeline.py` - Added `extract_from_base64()` for disk-less analysis
  - `visual_bridge.py` - Added `shotcut_frame` event routing
  - `realtime_feed.py` - HUD broadcast mode with cluster/widget serialization
  - `application.js` - `SHOTCUT_FRAME_UPDATE` event dispatch
  - `visual_debug_overlay.js` - Full HUD panel with bounding box rendering
- **Activation**: **Ctrl+Shift+S** toggles Shotcut Vision HUD
- **Features**: Real-time bounding boxes, cluster labels, AI thoughts, diagnostic pulses

## VM Details

| Property | Value |
|----------|-------|
| Disk | `images/shotcut-fresh.qcow2` (542MB) |
| Memory | 4GB RAM, 2 vCPUs |
| VNC | `:0` (port 5900) |
| SSH | Port 2222 (root/root) |
| Packages | 315 packages (680 MiB) |

## QEMU Command

```bash
qemu-system-x86_64 \
  -m 4096 -smp 2 \
  -drive file=images/shotcut-fresh.qcow2,format=qcow2,if=virtio \
  -vga qxl -vnc :0 \
  -monitor unix:/tmp/qemu-monitor.sock,server,nowait \
  -netdev user,id=net0,hostfwd=tcp::2222-:22 \
  -device virtio-net-pci,netdev=net0 \
  -enable-kvm
```

## Screenshots

- `screenshots/shotcut-running.png` - Shotcut GUI captured via VNC

## Next Steps

1. ~~**Visual Bridge**: Connect VNC capture to See → Decide → Act loop~~ ✅ DONE
2. ~~**Visual HUD**: Real-time AI perception overlay~~ ✅ DONE
3. **Automation**: Control Shotcut programmatically via visual feedback (IN PROGRESS)
4. **Project Creation**: Use visual automation to create/edit video projects
5. **Diff-Detection**: Optimize to only send frames when pixels change

## Keyboard Shortcuts

| Shortcut | Action |
|----------|--------|
| **Ctrl+Shift+V** | Toggle Visual Debug Overlay |
| **Ctrl+Shift+S** | Toggle Shotcut Vision HUD |

## Files

```
shotcut-on-the-map/
├── images/
│   └── shotcut-fresh.qcow2    # Alpine + GUI disk image
├── screenshots/
│   └── shotcut-running.png    # VNC capture of Shotcut
├── serial_alpine_install_v3.py # Stage 1 installer
├── install_gui.sh             # Stage 2 GUI installer
└── STATUS.md                  # This file
```
