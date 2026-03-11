# Phase 7.2: Initramfs Builder

## Goal
Implement a robust Initramfs generation pipeline to package `infinite_map_rs` as a standalone bootable operating system artifact.

## Context
Phase 7.1 has established the DRM/KMS backend infrastructure. While pixel rendering via GBM is pending complex API resolution, the system is ready for "Process Level" verification on bare metal. We need to verify that `infinite_map_rs` can:
1. Boot as PID 1.
2. Initialize the Session (LibSeat).
3. Detect Hardware (Udev).
4. Enter the main event loop.

## Changes
- **ADD** `systems/infinite_map_rs/scripts/create_initramfs.sh`: A script to bundle the release binary and limited dependencies (libc, libseat, libinput, libudev) into a `initramfs.cpio.gz`.
- **ADD** `systems/infinite_map_rs/scripts/qemu_test.sh`: A convenience script to boot the generated initramfs in QEMU.

## Impact
- **Architecture**: Enables the "Geometry OS" concept where the compositor *is* the init system.
- **Workflow**: Decouples "Infrastructure Testing" from "Rendering Testing". We can fix rendering later, but verify the boot chain now.

## Risk
- **Low**: This is a build tool addition. It does not modify source code.
