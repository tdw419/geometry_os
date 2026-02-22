# Fix Nvidia Gpu Driver

## Summary

Enable NVIDIA GPU driver for CUDA access so Florence-2 can achieve <100ms latency.

## Motivation

This change implements the architecture described below, enabling spec-driven development
and verification of the implementation.

## Architecture

Rebuild DKMS kernel modules, update initramfs, reboot, and verify driver loading. If standard approach fails, investigate Secure Boot or kernel compatibility issues.

## Tech Stack

NVIDIA Driver 590-open, DKMS, Linux kernel 6.17.0-14-generic, CUDA 12.0

## Files

| File | Purpose |
|------|---------|
| (See tasks.md for detailed file list) | |

## Success Criteria

- [ ] All tasks in tasks.md are completed
- [ ] Tests pass
- [ ] Documentation updated

## Related

- Source Plan: `docs/plans/2026-02-17-fix-nvidia-gpu-driver.md`
