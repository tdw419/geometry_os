# Fix NVIDIA GPU Driver Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Enable NVIDIA GPU driver for CUDA access so Florence-2 can achieve <100ms latency.

**Architecture:** Rebuild DKMS kernel modules, update initramfs, reboot, and verify driver loading. If standard approach fails, investigate Secure Boot or kernel compatibility issues.

**Tech Stack:** NVIDIA Driver 590-open, DKMS, Linux kernel 6.17.0-14-generic, CUDA 12.0

---

## Current Status

| Item | Status |
|------|--------|
| GPU Hardware | ✅ Detected: NVIDIA Corporation Device 2c58 |
| Driver Package | ✅ Installed: nvidia-driver-590-open 590.48.01 |
| DKMS Modules | ⚠️ Built but not loaded |
| nvidia-smi | ❌ Fails: "couldn't communicate with driver" |
| PyTorch CUDA | ❌ torch.cuda.is_available() = False |
| Last Action | DKMS rebuild + initramfs update completed |

---

## Task 1: Reboot System

**Goal:** Load the newly built NVIDIA kernel modules.

**Step 1: Reboot the system**

```bash
sudo reboot
```

**Step 2: After reboot, verify nvidia-smi works**

Run: `nvidia-smi`
Expected: GPU information displayed (name, memory, driver version)

---

## Task 2: Verify NVIDIA Driver Loaded

**Files:**
- Verify: `/proc/driver/nvidia/version`
- Verify: `lsmod | grep nvidia`

**Step 1: Check nvidia-smi**

Run: `nvidia-smi`
Expected: Output showing GPU details

**Step 2: Check kernel modules loaded**

Run: `lsmod | grep nvidia`
Expected:
```
nvidia               XXXXXXX  X
nvidia_modeset       XXXXXX   X
nvidia_uvm           XXXXXX   X
nvidia_drm           XXXXXX   X
```

**Step 3: Check driver version file**

Run: `cat /proc/driver/nvidia/version`
Expected: "NVRM version: NVIDIA UNIX x86_64 Kernel Module..."

**Step 4: If all pass, commit status**

N/A - This is verification only

---

## Task 3: Verify PyTorch CUDA Access

**Files:**
- Test: Python command

**Step 1: Test PyTorch CUDA availability**

Run:
```bash
python3 -c "import torch; print(f'CUDA available: {torch.cuda.is_available()}'); print(f'CUDA version: {torch.version.cuda}'); print(f'Device count: {torch.cuda.device_count()}'); print(f'Device name: {torch.cuda.get_device_name(0) if torch.cuda.is_available() else \"N/A\"}')"
```
Expected:
```
CUDA available: True
CUDA version: 12.8
Device count: 1
Device name: NVIDIA GeForce RTX ...
```

**Step 2: If CUDA not available, diagnose**

Run:
```bash
python3 -c "import torch; print(torch.cuda.get_arch_list())"
```
Expected: List of CUDA architectures including sm_90 or similar

---

## Task 4: Run Florence-2 Performance Test

**Files:**
- Run: `test_florence_real.py`

**Step 1: Run the Florence-2 test script**

Run:
```bash
python3 test_florence_real.py 2>&1
```
Expected: Latency <1000ms for phrase grounding (was ~3000ms on CPU)

**Step 2: Compare CPU vs GPU latency**

| Task | CPU (before) | GPU (target) |
|------|--------------|--------------|
| Phrase Grounding | ~3000ms | <100ms |
| Full Pipeline | ~5000ms | <200ms |

**Step 3: If latency is acceptable, commit verification**

N/A - This is verification only

---

## Task 5: Troubleshoot If Driver Still Fails

**Conditions:** Only execute if Task 1-2 fails after reboot.

**Step 1: Check Secure Boot status**

Run: `mokutil --sb-state`
Expected: "SecureBoot disabled" or similar

If Secure Boot is enabled:
```bash
# Option A: Disable in BIOS (recommended)
# Option B: Sign the kernel module (advanced)
```

**Step 2: Check kernel module exists**

Run:
```bash
ls -la /lib/modules/$(uname -r)/kernel/drivers/video/nvidia/
```
Expected: nvidia.ko, nvidia-modeset.ko, etc.

**Step 3: Try manual module load**

Run:
```bash
sudo modprobe nvidia
```
Expected: No error output

**Step 4: Check dmesg for errors**

Run:
```bash
sudo dmesg | grep -i nvidia | tail -20
```
Expected: No errors about module loading failures

**Step 5: If module not found, rebuild DKMS**

Run:
```bash
sudo dkms remove nvidia/590.48.01 --all
sudo dkms install nvidia/590.48.01
sudo update-initramfs -u
```
Expected: "DKMS: install completed" for kernel 6.17.0-14-generic

---

## Task 6: Alternative - Use Closed Driver

**Conditions:** Only execute if open driver consistently fails.

**Step 1: Remove open driver**

Run:
```bash
sudo apt remove -y nvidia-driver-590-open nvidia-dkms-590-open
```

**Step 2: Install proprietary driver**

Run:
```bash
sudo apt install -y nvidia-driver-590
```
Expected: Package installation completes

**Step 3: Rebuild and reboot**

Run:
```bash
sudo dkms install nvidia/590.48.01
sudo update-initramfs -u
sudo reboot
```

---

## Success Criteria

1. `nvidia-smi` shows GPU information
2. `lsmod | grep nvidia` shows nvidia modules loaded
3. `torch.cuda.is_available()` returns `True`
4. Florence-2 phrase grounding latency <100ms on GPU

---

## Rollback Plan

If all driver attempts fail:

1. Fall back to CPU-only inference (already working)
2. Document ~3s latency as acceptable for MVP
3. Create separate task to investigate GPU access in future session
4. Vision system remains functional with MockFlorenceModel for testing

---

## Notes

- The system has an RTX 5090 or similar (Device 2c58)
- PyTorch was compiled for CUDA 12.8
- CUDA Toolkit 12.0 is installed (nvcc)
- Driver 590.48.01 was installed via apt
- DKMS rebuild completed successfully
- Only a reboot is needed for modules to load
