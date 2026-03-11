# Hypervisor System

> Low-level substrate operations for Geometry OS

## Overview

The Hypervisor system (`systems/hypervisor`) handles low-level substrate operations including holographic substrate flattening, memory profiling, and GPU resource management.

## Features

- **Holographic Substrate Flattening**: Convert 3D visualizations to 2D representations
- **Memory Profiling**: Real-time memory usage tracking and optimization
- **Glyph Rendering**: Hardware-accelerated glyph rendering
- **GeoASM Execution**: Execute self-modifying assembly code

## Holographic Substrate Flattening

### Overview

The holographic flattening system converts 3D visualizations into 2D representations while preserving spatial relationships and depth information.

### Usage

```python
from systems.hypervisor import holographic_flatten

# Flatten 3D point cloud to 2D
points_3d = [
    (0.0, 0.0, 0.0),
    (1.0, 0.0, 0.0),
    (0.0, 1.0, 0.0),
    (0.0, 0.0, 1.0)
]

points_2d = holographic_flatten(points_3d)
# Returns 2D coordinates with depth preserved
```

### Algorithm

The flattening algorithm uses a holographic projection that:

1. **Preserves Spatial Relationships**: Points that are close in 3D remain close in 2D
2. **Encodes Depth**: Uses color/intensity to represent depth
3. **Maintains Connectivity**: Edges and connections are preserved
4. **Optimizes for Visibility**: Reduces occlusion

### Parameters

```python
def holographic_flatten(
    points: List[Tuple[float, float, float]],
    projection_type: str = "perspective",
    depth_encoding: str = "intensity",
    preserve_topology: bool = True
) -> List[Tuple[float, float, float]]:
    """
    Flatten 3D points to 2D holographic representation.
    
    Args:
        points: List of (x, y, z) coordinates
        projection_type: "perspective" or "orthographic"
        depth_encoding: "intensity", "color", or "size"
        preserve_topology: Maintain spatial relationships
        
    Returns:
        List of (x, y, depth) coordinates
    """
```

### Projection Types

| Type | Description | Use Case |
|------|-------------|----------|
| `perspective` | Standard perspective projection | General visualization |
| `orthographic` | Parallel projection | Technical drawings |
| `stereographic` | Dual-view for VR | 3D displays |
| `holographic` | Multi-angle encoding | True holographic displays |

### Depth Encoding

| Encoding | Description | Range |
|----------|-------------|-------|
| `intensity` | Brightness varies with depth | 0.0-1.0 |
| `color` | Color gradient (blue=close, red=far) | RGB |
| `size` | Point size varies with depth | 1-10 pixels |
| `alpha` | Transparency varies with depth | 0.0-1.0 |

### Example: Visualizing Memory Regions

```python
from systems.hypervisor import holographic_flatten

# 3D memory layout (x=address, y=size, z=access_frequency)
memory_blocks = [
    (0x0000, 1024, 0.8),   # High-frequency access
    (0x1000, 512, 0.3),    # Low-frequency access
    (0x2000, 2048, 0.9),   # Very high frequency
    (0x4000, 4096, 0.1),   # Rarely accessed
]

# Flatten to 2D for visualization
flat_view = holographic_flatten(
    memory_blocks,
    projection_type="perspective",
    depth_encoding="color",  # Color encodes access frequency
    preserve_topology=True
)

# Render to visual shell
for x, y, depth in flat_view:
    color = depth_to_color(depth)
    visual_shell.draw_point(x, y, color=color)
```

## Memory Profiling

### Overview

The memory profiler provides real-time tracking of memory usage across all Geometry OS components.

### Basic Usage

```python
from systems.hypervisor.memory_profiler import MemoryProfiler

# Initialize profiler
profiler = MemoryProfiler()

# Start profiling
profiler.start()

# Your code here
run_evolution_daemon()

# Get memory statistics
stats = profiler.get_stats()
print(f"Peak memory: {stats.peak_mb} MB")
print(f"Current memory: {stats.current_mb} MB")

# Stop profiling
profiler.stop()
```

### Memory Statistics

```python
@dataclass
class MemoryStats:
    """Memory usage statistics."""
    
    current_mb: float          # Current memory usage
    peak_mb: float             # Peak memory usage
    allocated_mb: float        # Total allocated
    freed_mb: float            # Total freed
    gc_collections: int        # Garbage collection count
    fragmentation: float       # Memory fragmentation (0-1)
    leaks_detected: int        # Number of potential leaks
```

### Component Tracking

Track memory for specific components:

```python
profiler = MemoryProfiler()

# Track evolution daemon memory
profiler.track_component("evolution_daemon")

# Track visual shell memory
profiler.track_component("visual_shell")

# Get component-specific stats
evolution_stats = profiler.get_component_stats("evolution_daemon")
print(f"Evolution daemon: {evolution_stats.current_mb} MB")

# Get all component stats
all_stats = profiler.get_all_component_stats()
for component, stats in all_stats.items():
    print(f"{component}: {stats.current_mb} MB")
```

### Memory Leak Detection

```python
profiler = MemoryProfiler()
profiler.enable_leak_detection(threshold_mb=10.0)

# Run your code
for _ in range(100):
    run_evolution_cycle()

# Check for leaks
leaks = profiler.detect_leaks()
for leak in leaks:
    print(f"Potential leak: {leak.component}")
    print(f"  Growth rate: {leak.growth_rate_mb_per_cycle} MB/cycle")
    print(f"  Location: {leak.allocation_site}")
```

### Memory Optimization

```python
# Get optimization recommendations
recommendations = profiler.get_optimization_recommendations()

for rec in recommendations:
    print(f"Component: {rec.component}")
    print(f"  Current: {rec.current_mb} MB")
    print(f"  Recommended: {rec.recommended_mb} MB")
    print(f"  Savings: {rec.savings_mb} MB")
    print(f"  Action: {rec.action}")
```

### Real-Time Monitoring

```python
profiler = MemoryProfiler()

# Enable real-time monitoring
profiler.enable_realtime_monitoring(
    interval_seconds=1.0,
    callback=lambda stats: print(f"Memory: {stats.current_mb} MB")
)

# Or use with visual shell
profiler.enable_visual_monitoring(visual_shell)
```

### Memory Alerts

```python
def on_memory_warning(stats):
    print(f"⚠️ Memory usage high: {stats.current_mb} MB")
    print(f"Peak: {stats.peak_mb} MB")

def on_memory_critical(stats):
    print(f"🚨 Memory critical: {stats.current_mb} MB")
    print("Taking corrective action...")
    trigger_garbage_collection()

profiler = MemoryProfiler()
profiler.set_alert_thresholds(
    warning_mb=400,    # Warn at 400 MB
    critical_mb=450    # Critical at 450 MB
)
profiler.on_warning(on_memory_warning)
profiler.on_critical(on_memory_critical)
```

### Profiling Decorators

```python
from systems.hypervisor.memory_profiler import profile_memory

@profile_memory
def run_evolution_cycle():
    """Automatically profile this function's memory usage."""
    # Evolution code
    pass

# Results logged automatically
# [PROFILE] run_evolution_cycle: 12.5 MB allocated, 10.2 MB freed, 2.3 MB net
```

### Memory Snapshots

```python
profiler = MemoryProfiler()

# Take snapshot
snapshot1 = profiler.take_snapshot()

# Run some code
run_operations()

# Take another snapshot
snapshot2 = profiler.take_snapshot()

# Compare snapshots
diff = profiler.compare_snapshots(snapshot1, snapshot2)
print(f"Memory delta: {diff.delta_mb} MB")
print(f"New allocations: {diff.new_allocations}")
print(f"Freed memory: {diff.freed_allocations}")
```

### Integration with Visual Shell

```python
from systems.visual_shell import VisualShell
from systems.hypervisor.memory_profiler import MemoryProfiler

visual_shell = VisualShell()
profiler = MemoryProfiler()

# Enable memory visualization
profiler.enable_visualization(visual_shell)

# Memory usage now shown in visual shell
# - Heap size as colored regions
# - Allocation hotspots as bright spots
# - Memory leaks as growing regions
```

## GPU Resource Management

### GPU Memory Tracking

```python
from systems.hypervisor.memory_profiler import GPUMemoryProfiler

gpu_profiler = GPUMemoryProfiler()

# Get GPU memory stats
gpu_stats = gpu_profiler.get_stats()
print(f"GPU Memory: {gpu_stats.used_mb} / {gpu_stats.total_mb} MB")
print(f"Utilization: {gpu_stats.utilization_percent}%")

# Track GPU memory per component
gpu_profiler.track_component("pixel_brain")
gpu_profiler.track_component("visual_shell")
```

### GPU Resource Allocation

```python
from systems.hypervisor import GPUResourceManager

gpu_manager = GPUResourceManager()

# Allocate GPU memory for a component
allocation = gpu_manager.allocate(
    component="pixel_brain",
    size_mb=256,
    priority="high"
)

# Check allocation
print(f"Allocated: {allocation.size_mb} MB")
print(f"GPU Address: {allocation.gpu_address}")

# Free when done
gpu_manager.free(allocation)
```

## Performance Optimization

### Memory Pooling

```python
from systems.hypervisor import MemoryPool

# Create memory pool
pool = MemoryPool(
    block_size_mb=16,
    initial_blocks=10,
    max_blocks=100
)

# Allocate from pool (faster than system allocation)
block = pool.allocate()
use_memory(block)
pool.release(block)  # Return to pool
```

### Lazy Loading

```python
from systems.hypervisor import LazyLoader

# Lazy load heavy components
brain_loader = LazyLoader(
    load_func=lambda: PixelBrain("large_model.rts.png"),
    unload_after_seconds=300  # Unload after 5 min idle
)

# Component loaded on first access
brain = brain_loader.get()
result = brain.infer("test")

# After 5 minutes of no access, memory freed
```

### Memory-Mapped Files

```python
from systems.hypervisor import MemoryMappedFile

# Map large file without loading into memory
mm_file = MemoryMappedFile("large_brain.rts.png")

# Access as if in memory, but actually on disk
data = mm_file.read(offset=0, size=1024)

# Changes written to disk automatically
mm_file.write(offset=0, data=new_data)
```

## Rust Components

The hypervisor includes Rust components for high-performance operations:

### Building Rust Components

```bash
cd systems/hypervisor
cargo build --release
```

### Using Rust from Python

```python
from systems.hypervisor import rust_holographic_flatten

# Use optimized Rust implementation
points_2d = rust_holographic_flatten(points_3d)
# 10x faster than Python version
```

## Troubleshooting

### High Memory Usage

```python
# Diagnose memory issues
from systems.hypervisor.memory_profiler import MemoryProfiler

profiler = MemoryProfiler()
profiler.start()

# Run your code
run_operations()

# Get detailed breakdown
breakdown = profiler.get_memory_breakdown()
for category, size in breakdown.items():
    print(f"{category}: {size} MB")

# Get recommendations
recs = profiler.get_optimization_recommendations()
for rec in recs:
    print(f"Optimize {rec.component}: {rec.action}")
```

### Memory Leaks

```python
# Detect and locate memory leaks
profiler = MemoryProfiler()
profiler.enable_leak_detection()

# Run code suspected of leaking
for _ in range(1000):
    suspicious_function()

# Get leak report
leaks = profiler.get_leak_report()
for leak in leaks:
    print(f"Leak detected in {leak.function}")
    print(f"  Stack trace: {leak.stack_trace}")
    print(f"  Size: {leak.size_mb} MB")
```

### Slow Flattening

```python
# Use optimized settings for large datasets
points_2d = holographic_flatten(
    large_point_cloud,
    projection_type="orthographic",  # Faster than perspective
    preserve_topology=False,         # Skip topology preservation
    use_rust_backend=True            # Use Rust implementation
)
```

## Configuration

```yaml
# config.yaml
hypervisor:
  memory_profiler:
    enabled: true
    interval_seconds: 1.0
    warning_threshold_mb: 400
    critical_threshold_mb: 450
    leak_detection: true
    
  holographic:
    projection_type: perspective
    depth_encoding: color
    preserve_topology: true
    use_rust_backend: true
    
  gpu:
    enabled: true
    memory_limit_mb: 1024
    allocation_strategy: pooled
```

## API Reference

### MemoryProfiler

```python
class MemoryProfiler:
    """Real-time memory profiling."""
    
    def start(self) -> None:
        """Start profiling."""
        
    def stop(self) -> None:
        """Stop profiling."""
        
    def get_stats(self) -> MemoryStats:
        """Get current memory statistics."""
        
    def track_component(self, name: str) -> None:
        """Track memory for a specific component."""
        
    def get_component_stats(self, name: str) -> MemoryStats:
        """Get memory stats for a component."""
        
    def enable_leak_detection(self, threshold_mb: float = 10.0) -> None:
        """Enable automatic leak detection."""
        
    def detect_leaks(self) -> List[MemoryLeak]:
        """Detect potential memory leaks."""
        
    def take_snapshot(self) -> MemorySnapshot:
        """Take a memory snapshot."""
        
    def compare_snapshots(
        self, 
        snap1: MemorySnapshot, 
        snap2: MemorySnapshot
    ) -> SnapshotDiff:
        """Compare two memory snapshots."""
```

### holographic_flatten

```python
def holographic_flatten(
    points: List[Tuple[float, float, float]],
    projection_type: str = "perspective",
    depth_encoding: str = "intensity",
    preserve_topology: bool = True,
    use_rust_backend: bool = False
) -> List[Tuple[float, float, float]]:
    """
    Flatten 3D points to 2D holographic representation.
    
    Args:
        points: List of (x, y, z) coordinates
        projection_type: "perspective", "orthographic", "stereographic", or "holographic"
        depth_encoding: "intensity", "color", "size", or "alpha"
        preserve_topology: Maintain spatial relationships
        use_rust_backend: Use optimized Rust implementation
        
    Returns:
        List of (x, y, depth) coordinates
    """
```

## See Also

- [Memory Optimization Report](../MEMORY_OPTIMIZATION_REPORT.md)
- [Visual Shell Documentation](VISUAL_SHELL.md)
- [Performance Profiling](PROFILING.md)
- [GPU Architecture](GPU_OS_ARCHITECTURE.md)

---

*Last Updated: 2026-03-11*
*Version: 1.0.0*
