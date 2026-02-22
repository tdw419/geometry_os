# design.md

## Initramfs Structure

The Initramfs will be a minimal CPIO archive containing:

```
/
├── bin/
│   ├── busybox      # For shell debugging and coreutils
│   └── infinite_map # Our compositor
├── lib/             # Shared libraries (glibc, libseat, etc.)
├── proc/            # Mount point
├── sys/             # Mount point
├── dev/             # Mount point
└── init             # Introduction script (PID 1)
```

## The /init Script

The `init` script will handle the critical boot steps before handing over control:

1. **Mount VFS**: `mount -t proc`, `mount -t sysfs`, `mount -t devtmpfs`.
2. **Setup Udev**: Start `udevd` to populate `/dev` (crucial for DRM card detection).
3. **Setup Seat**: Start `seatd` if testing without systemd-logind (likely for bare metal).
4. **Launch**: `exec /bin/infinite_map`.

## Dependency Resolution

The builder script will use `ldd` to recursively identify Runtime Dependencies of `infinite_map_rs` and copy them to `/lib`.

## Visual Impact
- **Boot**: Text output on TTY (logging).
- **Success**: Black screen (if rendering unimplemented) or Red Background (if we implement a dumb framebuffer fallback).
- **Failure**: Kernel Panic or Shell drop.
