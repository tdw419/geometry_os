# Nested Virtualization: Ubuntu on QEMU on Alpine on QEMU on Memory Palace

## Vision

A three-layer nested virtualization chain that boots full Ubuntu RISC-V inside
Alpine Linux inside QEMU, with all disk storage backed by the Memory Palace
spatial filesystem. Each layer adds capability — the chain converts raw host
hardware → pixel substrate → VM orchestration → full Linux userspace.

## Architecture Stack

```
┌───────────────────────────────────────────────────────────────┐
│ LAYER 0: HOST (bare metal Ubuntu 24.04, Linux 6.17)           │
│   GPU: NVIDIA RTX 5090 / Network: real / Storage: NVMe        │
│   Runs: geometry_os binary (cargo run)                         │
├───────────────────────────────────────────────────────────────┤
│ LAYER 1: GEOMETRY OS DAEMON                                    │
│   ┌─────────────────────────────────────────────────────────┐  │
│   │  Socket server at /tmp/geo_cmd.sock                      │  │
│   │  Commands: hypervisor_boot, hypervisor_input,            │  │
│   │  hypervisor_console, hypervisor_kill                     │  │
│   │  Accumulates guest output into HYPERVISOR_CONSOLE_BUF    │  │
│   └─────────────────────────────────────────────────────────┘  │
│                     │                                           │
│                     │ QemuBridge::spawn()                        │
│                     ▼                                           │
├───────────────────────────────────────────────────────────────┤
│ LAYER 2: QEMU (on host, spawned by Geometry OS)                 │
│   Binary: qemu-system-riscv64 (system installed)                │
│   Boots: Alpine Linux kernel + initramfs                         │
│   Storage: alpine_disk.img (100MB, VirtIO block)                 │
│   Console: serial (ttyS0), piped stdout to QemuBridge           │
│   Network: user-mode (QEMU built-in NAT)                        │
│   Config: hypervisor_boot arch=riscv64 kernel=<path>             │
│            ram=256M disk=~/.geometry_os/vmfs/alpine_disk.img     │
├───────────────────────────────────────────────────────────────┤
│ LAYER 3: ALPINE LINUX (first guest)                             │
│   OS: Alpine Linux RISC-V                                       │
│   Role: Minimal VM orchestration layer                          │
│   Has: QEMU package installed (apk add qemu-system-riscv64)     │
│   Runs: /init → shell → nested QEMU boot sequence               │
│   Commands run from within Alpine:                               │
│     qemu-system-riscv64 \                                       │
│       -machine virt \                                            │
│       -cpu rv64 \                                                │
│       -m 2G \                                                    │
│       -nographic \                                               │
│       -kernel /path/to/ubuntu-kernel \                           │
│       -drive file=/path/to/ubuntu_disk.img,format=raw,if=virtio  │
├───────────────────────────────────────────────────────────────┤
│ LAYER 4: NESTED QEMU (inside Alpine)                            │
│   Binary: qemu-system-riscv64 (Alpine package)                   │
│   Boots: Ubuntu RISC-V Linux kernel + userspace                  │
│   Storage: ubuntu_disk.img (2GB, VirtIO block)                   │
│   Console: serial (ttyS0)                                        │
├───────────────────────────────────────────────────────────────┤
│ LAYER 5: UBUNTU RISC-V (nested guest)                           │
│   OS: Ubuntu 24.04 LTS RISC-V                                    │
│   Kernel: Linux 6.13.0                                           │
│   Rootfs: ext4 on /dev/vda (ubuntu_disk.img)                     │
│   Userspace: systemd, cloud-init, bash, pip, etc.                │
│   Shell: root@ubuntu-mp:/tmp#  (interactive)                     │
└───────────────────────────────────────────────────────────────┘
         │
         ▼  (all disk images stored here)
┌───────────────────────────────────────────────────────────────┐
│ MEMORY PALACE SPATIAL FILESYSTEM                                │
│   Path: ~/.geometry_os/vmfs/                                    │
│   ├── alpine_disk.img       100MB  Alpine root filesystem      │
│   ├── ubuntu_disk.img        2GB   Ubuntu root filesystem       │
│   ├── ubuntu_rootfs_new.img  2GB   Alternate Ubuntu rootfs      │
│   ├── inner_ring/                 Spatial ring directory         │
│   ├── middle_ring/                Spatial ring directory         │
│   ├── outer_ring/                 Spatial ring directory         │
│   ├── *.rts.png                    Pixel-encoded binary blobs   │
│   └── mnt/                         Mount point bridge           │
│                                                                 │
│   Data is stored as raw disk images and pixel-encoded RTS PNGs  │
│   using the Raw Spatial (RTS) format: each pixel = 32 bits.     │
│   The palace_transport.py tool encodes/decodes between binary   │
│   files and palace PNGs.                                        │
└───────────────────────────────────────────────────────────────┘
```

## Why This Architecture

### Why Not Direct QEMU?

Geometry OS is a spatial computing platform — it renders pixels to a 256x256
framebuffer, processes assembly opcodes, and manages the Memory Palace.
Running QEMU as a direct subprocess (via `QemuBridge::spawn()`) gives GeOS
VM-level orchestration without sacrificing its pixel-native identity. The
QEMU subprocess is a hypervisor extension of GeOS, not a separate system.

### Why Alpine Between Host and Ubuntu?

Alpine (~5MB rootfs) boots in seconds inside QEMU-RISC-V. It acts as a
minimal host OS that can run QEMU natively for the nested layer. This
provides:

- **Isolation**: The host GeOS never directly manages Ubuntu's complexity
- **Flexibility**: Alpine can run any software that's available for RISC-V,
  not just what GeOS bundles
- **Clean boot**: Alpine's init handles QEMU lifecycle, recovery, and
  crash handling through simple shell scripts

### Why Memory Palace Storage?

Every disk image lives under `~/.geometry_os/vmfs/` — the Memory Palace
spatial filesystem. This unifies all VM storage with GeOS's pixel-native
paradigm:

- Disk images are just files on disk, but they can be encoded as RTS pixel
  data for transport/export
- Future: spatial indexing means filesystem contents become part of the
  Memory Palace knowledge graph
- All layers — Alpine, Ubuntu, and their disk images — share the same
  storage substrate

## Control Flow (Socket Commands)

### Starting the Stack

```
# terminal 1: Start Geometry OS daemon
cargo run -- --cli --socket /tmp/geo_cmd.sock --daemon

# terminal 2: Boot layer 2 (QEMU → Alpine)
echo "hypervisor_boot arch=riscv64 \
  kernel=/home/jericho/.geometry_os/fs/linux/rv64/Image \
  ram=256M \
  disk=/home/jericho/.geometry_os/vmfs/alpine_disk.img \
  append=console=ttyS0 root=/dev/vda append=rw" \
  | nc -U /tmp/geo_cmd.sock

# Wait for Alpine to boot to shell prompt...
# Then inside Alpine, manually or via script:
qemu-system-riscv64 \
  -machine virt \
  -cpu rv64 \
  -m 2G \
  -nographic \
  -kernel /path/to/vmlinuz \
  -drive file=/mnt/ubuntu_disk.img,format=raw,if=virtio \
  -append "console=ttyS0 root=/dev/vda rw"
```

### Interacting with the Stack

| Command | Action |
|---------|--------|
| `hypervisor_boot ...` | Spawn first QEMU (Alpine) |
| `hypervisor_input <text>` | Send keystrokes to the running QEMU |
| `hypervisor_console` | Read accumulated guest console output |
| `hypervisor_kill` | Terminate the running QEMU |
| `help` | List all socket commands |

### Console Buffer Architecture

The `hypervisor_console` command reads from `HYPERVISOR_CONSOLE_BUF`, a
thread-safe `Mutex<Vec<String>>` in `src/main.rs`. Every frame of the GeOS
main loop, `QemuBridge::read_output()` drains QEMU's stdout pipe and
appends the raw text to this buffer. When `hypervisor_console` is queried,
the buffer is drained and returned, then cleared for the next poll cycle.

This solved the original bug where the old code drained QEMU's stdout
directly as a one-shot — by the time a socket client queried it, the
stream had already been consumed and lost.

## Key Files

| File | Purpose |
|------|---------|
| `src/main.rs` | GeOS main loop: socket server, frame loop, QEMU polling |
| `src/cli.rs` | Headless CLI mode with Unix socket command handling |
| `src/qemu/bridge.rs` | `QemuBridge` — spawn/manage/read/write QEMU subprocess |
| `src/qemu/config.rs` | `QemuConfig` — parse `key=value` config into QEMU argv |
| `src/assembler/` | GeOS native assembler (400+ opcodes) |
| `ubuntu-monitor.sh` | Cron script: boots Ubuntu, detects crashes, silent on success |
| `palace_transport.py` | Encode/decode binaries to/from Memory Palace RTS PNGs |
| `LINUX_ON_PIXELS_ARCHITECTURE.md` | Older RV32 hypervisor (direct pixel boot, not QEMU-mediated) |
| `UBUNTU_MEMORY_PALACE.md` | Legacy: direct VirtIO block + Memory Palace integration |

## Storage Layout

```
~/.geometry_os/                          # Home-directory global state
├── vmfs/                           # Memory Palace spatial filesystem
│   ├── alpine_disk.img             # 100MB — Alpine root filesystem
│   ├── ubuntu_disk.img             # 2GB — Ubuntu root filesystem
│   ├── ubuntu_rootfs_new.img       # 2GB — Ubuntu alt rootfs
│   ├── inner_ring/                 # Spatial ring 1
│   ├── middle_ring/                # Spatial ring 2
│   ├── outer_ring/                 # Spatial ring 3
│   ├── mnt/                        # Mount bridge
│   └── *.rts.png                   # Pixel-encoded binaries
├── fs/linux/rv64/
│   ├── Image                       # Linux 6.13 RISC-V kernel (22MB)
│   ├── initramfs.cpio.gz           # Alpine initramfs
│   └── build_alpine.sh             # Alpine rootfs builder
│
<project>/.geometry_os/                  # Project-relative (boot diagnostics)
└── boot_loop/                      # Boot diagnostics
    ├── boot_output.txt             # Raw emulator output
    ├── kernel_log.txt              # Extracted kernel messages
    ├── ollama_diagnosis.md         # Ollama crash analysis
    └── status                      # CRASH/SUCCESS/IDLE
```

## Disk Images

| Image | Size | Contents |
|-------|------|----------|
| `alpine_disk.img` | 100 MB | Alpine Linux rootfs — BusyBox, musl, QEMU package, bootstrap scripts |
| `ubuntu_disk.img` | 2 GB | Ubuntu 24.04 RISC-V — systemd, cloud-init, Python3, pip, bash |
| `ubuntu_rootfs_new.img` | 2 GB | Alternate/backup Ubuntu rootfs |

## Boot Sequence (Timeline)

```
T+0s     geometry_os starts
         → binds /tmp/geo_cmd.sock
         → enters main loop (frame polling, QEMU drain)

T+1s     Client sends: hypervisor_boot arch=riscv64 kernel=...
         → QemuBridge::spawn() builds QEMU command
         → QEMU starts: qemu-system-riscv64 -nographic -kernel Image ...

T+2s     QEMU begins firmware boot (OpenSBI)
         → SBI output streamed via serial to QemuBridge stdout pipe

T+3s     Linux kernel starts decompressing
         → Console: "Booting Linux on physical CPU 0x0"

T+5s     Linux mounts rootfs from /dev/vda (alpine_disk.img)
         → Console: "VFS: Mounted root (ext4 filesystem)"

T+7s     Alpine init starts (/sbin/init → /etc/inittab)
         → Console: "Welcome to Alpine Linux"
         → Shell prompt: alpine:~#

T+10s    (manual or script) User runs qemu-system-riscv64 inside Alpine
         → Nested QEMU starts, boots Ubuntu RISC-V

T+15s    Ubuntu kernel starts (inside Alpine's QEMU)
         → Console: "Linux 6.13.0 #1 SMP riscv64"

T+25s    Ubuntu userspace: systemd + cloud-init
         → Console: "Starting Ubuntu 24.04 LTS"

T+30s    Ubuntu shell: root@ubuntu-mp:~#
```

## Debugging the Stack

### Layer 2 (QEMU on host)

Use `hypervisor_console` via the socket to see all Alpine boot output.

### Layer 3 (Alpine)

Once Alpine boots to a shell, send commands with `hypervisor_input`:
```
echo "hypervisor_input uname -a" | nc -U /tmp/geo_cmd.sock
echo "hypervisor_input qemu-system-riscv64 --version" | nc -U /tmp/geo_cmd.sock
```

### Layer 4 (Nested QEMU)

The nested QEMU's console output flows through Alpine's serial port, which
the first QEMU forwards upstream. It appears in `hypervisor_console`
alongside Alpine's own output.

### Common Issues

| Symptom | Likely Cause | Fix |
|---------|-------------|-----|
| `[hypervisor_console: empty]` | Console buffer already drained | Check that QEMU is actually running (hypervisor_boot returned ok). The fix using HYPERVISOR_CONSOLE_BUF should prevent this now. |
| Socket connect refused | geos daemon not running | Start with `cargo run -- --cli --socket /tmp/geo_cmd.sock` |
| "QEMU not found" | qemu-system-riscv64 not installed | `sudo apt install qemu-system-riscv64` |
| Alpine boots but can't find disk | Disk path wrong or image missing | Check `alpine_disk.img` exists at `~/.geometry_os/vmfs/` |
| Nested QEMU fails inside Alpine | Alpine missing QEMU package | Boot Alpine, run `apk add qemu-system-riscv64` |
| Ubuntu kernel panic | Bad disk image or wrong kernel | Verify `ubuntu_disk.img` integrity, check kernel version matches |
| SSH on host port 2222 not connecting | sshd not started in guest | `echo "hypervisor_input systemctl start ssh" \| nc -U /tmp/geo_cmd.sock` |
| VNC connection refused on 5901 | VNC server not started in guest | SSH in: `sshpass -p root ssh -p 2222 root@localhost "vncserver :1 -localhost no -geometry 1280x720 -rfbport 5901"` |

## Desktop Mode

The Ubuntu RISC-V disk can boot as a graphical desktop with Xfce + TigerVNC:

### Quick Start (one-time)

```bash
# Boot via GeOS daemon with SSH forwarding
echo "hypervisor_boot arch=riscv64 kernel=~/.geometry_os/fs/linux/rv64/Image ram=1G \\
  append=root=/dev/vda append=rw \\
  disk=~/.geometry_os/vmfs/ubuntu_disk.img \\
  net=user,hostfwd=tcp::2222-:22,hostfwd=tcp::5901-:5901" | nc -U /tmp/geo_cmd.sock

# Wait ~30s for boot, then SSH in and start VNC
sshpass -p root ssh -p 2222 root@localhost "vncserver :1 -localhost no -rfbport 5901"

# Connect with VNC client
xtigervncviewer -SecurityTypes VncAuth localhost:5901
```

### Auto-start on boot

The VNC server is configured as a systemd service:
```
systemctl enable vncserver@1
systemctl start  vncserver@1
```

### Desktop Info

| Component | Detail |
|-----------|--------|
| Desktop | Xfce 4 (lightweight) |
| VNC Server | TigerVNC on port 5901 (guest) → 5901 (host) |
| SSH | Port 22 (guest) → 2222 (host) |
| Root password | `root` |
| Resolution | 1280x720, 24-bit color |
| VNC password | `root` |
| Disk | 4GB (expanded from 2GB), 2GB free |

### Installation Notes

The desktop was installed via `qemu-riscv64-static` chroot from the host (much faster than
emulated apt). Commands used:

```bash
# From host: mount and chroot
sudo mount -o loop ~/.geometry_os/vmfs/ubuntu_disk.img /mnt/ubuntu_vm
sudo mount -t proc none /mnt/ubuntu_vm/proc
sudo mount -t sysfs none /mnt/ubuntu_vm/sys
sudo mount -o bind /dev /mnt/ubuntu_vm/dev
sudo cp /etc/resolv.conf /mnt/ubuntu_vm/etc/resolv.conf
sudo chroot /mnt/ubuntu_vm /bin/bash
# Inside chroot:
apt-get install -y --no-install-recommends xfce4 xfce4-terminal tigervnc-standalone-server dbus-x11 xfonts-base
# Set up VNC password and xstartup
```

## Future Directions

1. **Automated nested boot**: Script the Alpine → QEMU → Ubuntu chain so
   `hypervisor_boot` can optionally trigger both levels automatically

2. **Spatial disk indexing**: Map the ext4 filesystem inside each disk image
   to Memory Palace spatial coordinates for semantic search across all VMs

3. **Snapshot/rollback**: Use Memory Palace pixel persistence to snapshot
   and restore guest state at any layer

4. **Direct pixel handoff**: Eventually bypass the QEMU nesting entirely by
   booting Linux directly in the GeOS RV32IMAC hypervisor (see
   `LINUX_ON_PIXELS_ARCHITECTURE.md`)
