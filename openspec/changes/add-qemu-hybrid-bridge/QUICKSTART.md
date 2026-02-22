# QEMU Hybrid Bridge - Quick Start Guide

**Status**: Post-Approval Implementation Guide  
**Phase**: 36  
**Prerequisites**: Proposal approved, Phase 35 (Synaptic Map) stable

---

## 🚀 Phase 1: Shared Memory Bridge (Weeks 1-3)

### Day 1: Project Setup

```bash
# Create directory structure
cd /home/jericho/zion/projects/geometry_os/geometry_os
mkdir -p systems/qemu_bridge/{tests,tcg_plugin,symbols}
mkdir -p systems/infinite_map_rs/src/qemu

# Download Alpine Linux base image
cd systems/qemu_bridge
wget https://dl-cdn.alpinelinux.org/alpine/v3.19/releases/x86_64/alpine-virt-3.19.0-x86_64.iso
```

### Day 2-3: QEMU Launcher

**File**: `systems/qemu_bridge/qemu_launcher.py`

```python
#!/usr/bin/env python3
"""
QEMU VM Launcher with Shared Memory Backend
Spawns Alpine Linux with /dev/shm memory backend for zero-copy access.
"""

import subprocess
import os
import json
from pathlib import Path

class QEMULauncher:
    def __init__(self, vm_id: str, ram_mb: int = 64):
        self.vm_id = vm_id
        self.ram_mb = ram_mb
        self.shm_path = f"/dev/shm/qemu_ram_{vm_id}"
        self.qmp_socket = f"/tmp/qemu_qmp_{vm_id}.sock"
        
    def launch(self, disk_image: str):
        """Launch QEMU VM with shared memory backend."""
        
        # Clean up existing shared memory
        if os.path.exists(self.shm_path):
            os.remove(self.shm_path)
            
        cmd = [
            "qemu-system-x86_64",
            "-enable-kvm",  # Use KVM if available (optional)
            "-m", str(self.ram_mb),
            
            # Shared memory backend
            "-object", f"memory-backend-file,id=pc.ram,size={self.ram_mb}M,mem-path={self.shm_path},share=on",
            "-machine", "memory-backend=pc.ram",
            
            # Disk
            "-drive", f"file={disk_image},format=qcow2",
            
            # QMP socket
            "-qmp", f"unix:{self.qmp_socket},server,nowait",
            
            # VNC for framebuffer (reuse Phase 10 infrastructure)
            "-vnc", ":0",
            
            # Serial console
            "-serial", "stdio",
            
            # No GUI
            "-nographic",
        ]
        
        print(f"Launching QEMU VM: {self.vm_id}")
        print(f"Shared memory: {self.shm_path}")
        print(f"QMP socket: {self.qmp_socket}")
        
        subprocess.Popen(cmd)

if __name__ == "__main__":
    launcher = QEMULauncher("vm1", ram_mb=64)
    launcher.launch("alpine.qcow2")
```

**Test**:
```bash
python3 systems/qemu_bridge/qemu_launcher.py
# Verify /dev/shm/qemu_ram_vm1 exists
ls -lh /dev/shm/qemu_ram_vm1
```

### Day 4-7: Rust Memory Bridge

**File**: `systems/infinite_map_rs/src/qemu/memory_bridge.rs`

```rust
use memmap2::{Mmap, MmapOptions};
use std::fs::OpenOptions;
use std::io;
use std::sync::atomic::{AtomicU64, Ordering};

pub struct SharedMemoryBridge {
    mmap: Mmap,
    vm_id: String,
    size: usize,
    checksum: AtomicU64,
}

impl SharedMemoryBridge {
    pub fn new(vm_id: &str) -> Result<Self, io::Error> {
        let path = format!("/dev/shm/qemu_ram_{}", vm_id);
        
        let file = OpenOptions::new()
            .read(true)
            .open(&path)?;
        
        let mmap = unsafe { MmapOptions::new().map(&file)? };
        let size = mmap.len();
        
        println!("Mapped QEMU VM '{}' RAM: {} bytes", vm_id, size);
        
        Ok(Self {
            mmap,
            vm_id: vm_id.to_string(),
            size,
            checksum: AtomicU64::new(0),
        })
    }
    
    pub fn read_physical(&self, addr: u64, len: usize) -> Result<&[u8], io::Error> {
        let start = addr as usize;
        let end = start + len;
        
        if end > self.size {
            return Err(io::Error::new(
                io::ErrorKind::InvalidInput,
                format!("Address range {:#x}..{:#x} exceeds RAM size {:#x}", start, end, self.size)
            ));
        }
        
        Ok(&self.mmap[start..end])
    }
    
    pub fn snapshot(&self) -> Vec<u8> {
        self.mmap.to_vec()
    }
    
    pub fn size(&self) -> usize {
        self.size
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    
    #[test]
    fn test_bridge_creation() {
        // Requires running QEMU VM
        if let Ok(bridge) = SharedMemoryBridge::new("vm1") {
            assert!(bridge.size() > 0);
            println!("Bridge size: {} bytes", bridge.size());
        }
    }
    
    #[test]
    fn test_read_physical() {
        if let Ok(bridge) = SharedMemoryBridge::new("vm1") {
            let data = bridge.read_physical(0, 256).unwrap();
            assert_eq!(data.len(), 256);
            println!("First 16 bytes: {:02x?}", &data[..16]);
        }
    }
}
```

**Add to** `systems/infinite_map_rs/Cargo.toml`:
```toml
[dependencies]
memmap2 = "0.9"
```

**File**: `systems/infinite_map_rs/src/qemu/mod.rs`
```rust
pub mod memory_bridge;

pub use memory_bridge::SharedMemoryBridge;
```

**Update** `systems/infinite_map_rs/src/lib.rs`:
```rust
pub mod qemu;
```

**Test**:
```bash
cd systems/infinite_map_rs
cargo test qemu::memory_bridge::tests --nocapture
```

### Day 8-10: QMP Integration

**File**: `systems/qemu_bridge/qmp_client.py`

```python
import socket
import json

class QMPClient:
    def __init__(self, socket_path: str):
        self.socket_path = socket_path
        self.sock = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
        self.sock.connect(socket_path)
        
        # Read QMP greeting
        greeting = self._read_response()
        print(f"QMP connected: {greeting['QMP']['version']}")
        
        # Enter command mode
        self._execute("qmp_capabilities")
        
    def _read_response(self) -> dict:
        data = b""
        while True:
            chunk = self.sock.recv(4096)
            data += chunk
            if b'\n' in chunk:
                break
        return json.loads(data.decode())
    
    def _execute(self, command: str, **kwargs) -> dict:
        cmd = {"execute": command, "arguments": kwargs}
        self.sock.send(json.dumps(cmd).encode() + b'\n')
        return self._read_response()
    
    def query_memdev(self) -> dict:
        return self._execute("query-memdev")
    
    def query_status(self) -> str:
        result = self._execute("query-status")
        return result['return']['status']
    
    def get_shared_memory_path(self) -> str:
        memdev = self.query_memdev()
        for dev in memdev['return']:
            if 'mem-path' in dev:
                return dev['mem-path']
        return None

if __name__ == "__main__":
    client = QMPClient("/tmp/qemu_qmp_vm1.sock")
    print(f"VM Status: {client.query_status()}")
    print(f"Shared Memory: {client.get_shared_memory_path()}")
```

### Day 11-15: Integration Test

**File**: `systems/qemu_bridge/tests/test_memory_bridge.py`

```python
#!/usr/bin/env python3
import subprocess
import time
import os
import sys

# Add parent directory to path
sys.path.insert(0, os.path.dirname(os.path.dirname(__file__)))

from qemu_launcher import QEMULauncher
from qmp_client import QMPClient

def test_full_pipeline():
    """End-to-end test: Launch VM → Connect bridge → Read RAM."""
    
    # 1. Launch QEMU VM
    launcher = QEMULauncher("test_vm", ram_mb=64)
    launcher.launch("alpine.qcow2")
    
    # Wait for VM to boot
    time.sleep(5)
    
    # 2. Connect QMP
    qmp = QMPClient("/tmp/qemu_qmp_test_vm.sock")
    assert qmp.query_status() == "running"
    
    shm_path = qmp.get_shared_memory_path()
    assert shm_path == "/dev/shm/qemu_ram_test_vm"
    assert os.path.exists(shm_path)
    
    # 3. Test Rust bridge (via cargo test)
    result = subprocess.run(
        ["cargo", "test", "qemu::memory_bridge::tests", "--", "--nocapture"],
        cwd="../infinite_map_rs",
        capture_output=True,
        text=True
    )
    
    print(result.stdout)
    assert result.returncode == 0
    
    print("✅ Full pipeline test passed!")

if __name__ == "__main__":
    test_full_pipeline()
```

**Run**:
```bash
cd systems/qemu_bridge/tests
python3 test_memory_bridge.py
```

### Day 16-21: Performance Benchmarks

**File**: `systems/qemu_bridge/tests/benchmark_latency.py`

```python
import time
import mmap
import os

def benchmark_mmap_latency(shm_path: str, iterations: int = 1000):
    """Measure latency of reading 64MB via mmap."""
    
    with open(shm_path, 'rb') as f:
        mm = mmap.mmap(f.fileno(), 0, access=mmap.ACCESS_READ)
        
        latencies = []
        for _ in range(iterations):
            start = time.perf_counter()
            data = mm[:]  # Read entire 64MB
            end = time.perf_counter()
            latencies.append((end - start) * 1000)  # Convert to ms
        
        mm.close()
    
    print(f"Latency Statistics (ms):")
    print(f"  Median: {sorted(latencies)[len(latencies)//2]:.3f}")
    print(f"  Mean: {sum(latencies)/len(latencies):.3f}")
    print(f"  Min: {min(latencies):.3f}")
    print(f"  Max: {max(latencies):.3f}")
    print(f"  99th percentile: {sorted(latencies)[int(len(latencies)*0.99)]:.3f}")

if __name__ == "__main__":
    benchmark_mmap_latency("/dev/shm/qemu_ram_vm1")
```

**Expected Output**:
```
Latency Statistics (ms):
  Median: 0.850
  Mean: 0.920
  Min: 0.720
  Max: 2.100
  99th percentile: 1.500
```

**Success Criteria**: Median <1ms ✅

---

## 📊 Phase 1 Completion Checklist

- [ ] QEMU VM boots with shared memory backend
- [ ] `/dev/shm/qemu_ram_vm1` file exists and is readable
- [ ] Rust `SharedMemoryBridge` successfully maps the file
- [ ] `read_physical()` returns correct guest RAM bytes
- [ ] QMP client can query VM status and memory backend
- [ ] Integration test passes (VM launch → bridge → read)
- [ ] Latency benchmark: median <1ms
- [ ] Throughput benchmark: >960 MB/s (64MB @ 60 Hz)
- [ ] Documentation updated in `systems/qemu_bridge/README.md`

---

## 🎯 Phase 2 Preview: Hilbert Visualizer

**Next Steps** (Weeks 4-7):
1. Implement Skilling algorithm in WGSL
2. Create compute pipeline for Hilbert transform
3. Integrate with existing Glass RAM renderer
4. Add 3D camera controls
5. Achieve 60 FPS visualization target

**Key Files to Create**:
- `systems/infinite_map_rs/src/shaders/hilbert_transform.wgsl`
- `systems/infinite_map_rs/src/qemu/hilbert_visualizer.rs`
- `systems/infinite_map_rs/src/shaders/volume_render.wgsl`

---

## 🔧 Troubleshooting

### Issue: `/dev/shm/qemu_ram_vm1` not created
**Solution**: Verify QEMU command includes:
```bash
-object memory-backend-file,id=pc.ram,size=64M,mem-path=/dev/shm/qemu_ram_vm1,share=on
-machine memory-backend=pc.ram
```

### Issue: Permission denied on `/dev/shm`
**Solution**: Ensure user has read/write access:
```bash
sudo chmod 666 /dev/shm/qemu_ram_vm1
```

### Issue: Rust test fails to find shared memory
**Solution**: Ensure QEMU VM is running before running tests:
```bash
ps aux | grep qemu
```

### Issue: Latency >5ms
**Solution**: Check system load, disable swap, use SSD for `/dev/shm`:
```bash
sudo swapoff -a
df -h /dev/shm  # Should be tmpfs (RAM-backed)
```

---

## 📚 Resources

### Documentation
- QEMU Memory Backend: https://www.qemu.org/docs/master/devel/memory.html
- memmap2 Crate: https://docs.rs/memmap2/latest/memmap2/
- QMP Protocol: https://wiki.qemu.org/Documentation/QMP

### Related Phases
- Phase 10 (qemu.rts): VNC framebuffer extraction
- Phase 33 (Glass RAM): Hilbert mapping substrate
- Phase 35 (Synaptic Map): LLM semantic queries

---

**Status**: Ready to begin Phase 1 implementation  
**Estimated Time**: 3 weeks  
**Team**: 1 developer  
**Dependencies**: QEMU 9.0.x, Rust 1.75+, Alpine Linux ISO
