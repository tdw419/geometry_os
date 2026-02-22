# Fix Nvidia Gpu Driver - Tasks

## 1. Reboot System

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

- [ ] Verify: `/proc/driver/nvidia/version`

## 3. Verify PyTorch CUDA Access

- [ ] Test: Python command

## 4. Run Florence-2 Performance Test

- [ ] Run: `test_florence_real.py`
