# Phase L: Multi-Kernel Orchestration

## Overview

Phase L delivers a complete multi-kernel orchestration system for Geometry OS, enabling coordinated execution across multiple neural kernels with intelligent load balancing, inter-kernel communication, and comprehensive metrics collection.

### Key Capabilities

- **Cluster Management**: Group and manage multiple kernels as a single unit
- **Intelligent Routing**: Multiple strategies for distributing workloads (round-robin, least-loaded, capability-based, random)
- **Load Balancing**: Weighted load distribution based on CPU, memory, queue depth, and error rate
- **Inter-Kernel Communication**: Event-driven message bus for kernel-to-kernel communication
- **Metrics Collection**: Comprehensive metrics aggregation across all kernels
- **Dynamic Scaling**: Add/remove kernels from running clusters

## Components

| Component | File | Purpose |
|-----------|------|---------|
| `OrchestrationTools` | `orchestration_tools.py` | High-level API for managing kernel clusters via WebMCP |
| `KernelCluster` | `cluster.py` | Manages a group of kernels as a unit |
| `OrchestrationEngine` | `orchestration.py` | Orchestrates workload distribution with routing strategies |
| `InterKernelBus` | `inter_kernel_bus.py` | Message bus for kernel-to-kernel communication |
| `LoadBalancer` | `load_balancer.py` | Balances load across kernel instances |
| `ClusterMetricsCollector` | `cluster_metrics.py` | Aggregates metrics across kernels |
| `ClusterStatus` | `cluster.py` | Enum for cluster state (INITIALIZING, RUNNING, SCALING, STOPPED, ERROR) |
| `RoutingStrategy` | `orchestration.py` | Enum for routing strategies |
| `BusTopic` | `inter_kernel_bus.py` | Enum for message topics (EVENTS, METRICS, CONTROL, DATA) |
| `BusMessage` | `inter_kernel_bus.py` | Data class for messages on the bus |
| `KernelLoad` | `load_balancer.py` | Load metrics for a kernel |
| `LoadBalancerConfig` | `load_balancer.py` | Configuration for load balancer weights |
| `ClusterConfig` | `cluster.py` | Configuration for kernel cluster |
| `OrchestrationConfig` | `orchestration.py` | Configuration for orchestration engine |
| `OrchestrationMetrics` | `orchestration.py` | Metrics for orchestration engine |
| `ClusterMetrics` | `cluster_metrics.py` | Aggregated metrics for a cluster |
| `KernelMetricsSnapshot` | `cluster_metrics.py` | Point-in-time metrics for a kernel |

## Quick Start

### Creating an Orchestration Tools Instance

```python
from systems.kernel import OrchestrationTools

tools = OrchestrationTools()
```

### Creating a Cluster

```python
# Create a cluster with 3 kernels
result = await tools.create_cluster(
    name="compute",
    kernel_count=3
)

# Result: {"success": True, "cluster_name": "compute", "kernel_count": 3}

# Create a cluster with custom configuration
result = await tools.create_cluster(
    name="compute",
    kernel_count=5,
    config={
        "min_kernels": 2,
        "max_kernels": 10,
        "auto_scale": True,
        "scale_up_threshold": 0.8,
        "scale_down_threshold": 0.2
    }
)
```

### Dispatching Requests

```python
# Dispatch a request to a cluster
result = await tools.dispatch(
    cluster="compute",
    request={
        "type": "READ",
        "address": 0x1000,
        "size": 256
    }
)

# Result: {"success": True, "kernel": "worker-1", "result": {...}}
```

### Getting Metrics

```python
# Get cluster metrics
metrics = await tools.get_metrics("compute")

# Result:
# {
#     "success": True,
#     "metrics": {
#         "cluster_name": "compute",
#         "kernel_count": 3,
#         "total_dispatches": 150,
#         "total_errors": 2,
#         "avg_latency_ms": 5.2,
#         "avg_cpu": 0.45,
#         "avg_memory": 0.32
#     }
# }
```

### Listing Clusters

```python
# List all clusters
clusters = await tools.list_clusters()

# Result: {"clusters": [...], "count": 1}
```

### Scaling Clusters

```python
# Scale a cluster to more kernels
result = await tools.scale_cluster(
    cluster="compute",
    target_count=5
)

# Result: {"success": True, "cluster": "compute", "previous_count": 3, "new_count": 5}
```

### Destroying Clusters

```python
# Destroy a cluster
result = await tools.destroy_cluster("compute")

# Result: {"success": True, "cluster_name": "compute"}
```

## Routing Strategies

The `OrchestrationEngine` supports multiple routing strategies for distributing workloads:

| Strategy | Description |
|----------|-------------|
| `ROUND_ROBIN` | Rotate through available kernels in order |
| `LEAST_LOADED` | Select kernel with the lowest load (fewest dispatches) |
| `CAPABILITY_BASED` | Match request to kernel capabilities (reserved) |
| `RANDOM` | Random selection from available kernels |
| `PRIMARY_FALLBACK` | Use primary kernel, fallback on error |

### Using Routing Strategies

```python
from systems.kernel import (
    OrchestrationEngine,
    OrchestrationConfig,
    RoutingStrategy
)

# Create engine with least-loaded strategy
config = OrchestrationConfig(
    strategy=RoutingStrategy.LEAST_LOADED,
    max_concurrent=100,
    timeout_ms=5000,
    retry_count=2,
    enable_failover=True
)

engine = OrchestrationEngine(config=config)
```

## Inter-Kernel Communication

The `InterKernelBus` enables kernels to communicate via messages using topics.

### Topics

| Topic | Purpose |
|-------|---------|
| `BusTopic.EVENTS` | Event notifications |
| `BusTopic.METRICS` | Performance metrics |
| `BusTopic.CONTROL` | Control commands |
| `BusTopic.DATA` | Data exchange |

### Example: Setting Up the Bus

```python
from systems.kernel import InterKernelBus, BusTopic, BusMessage

# Create the bus
bus = InterKernelBus()

# Define message handlers
async def kernel1_handler(message: BusMessage):
    print(f"Kernel 1 received: {message.payload}")

async def metrics_handler(message: BusMessage):
    print(f"Metrics: {message.payload}")

# Register kernels
bus.register("kernel-1", kernel1_handler)
bus.register("kernel-2", kernel1_handler)

# Subscribe to topics
bus.subscribe("kernel-1", BusTopic.METRICS, metrics_handler)
bus.subscribe("kernel-2", BusTopic.METRICS, metrics_handler)
```

### Example: Publishing Messages

```python
# Publish an event
await bus.publish(BusMessage(
    from_kernel="kernel-1",
    topic=BusTopic.EVENTS,
    payload={"event": "ready", "timestamp": 1234567890}
))

# Send direct message
await bus.send_direct(
    from_kernel="kernel-1",
    to_kernel="kernel-2",
    payload={"request": "data", "key": "value"}
)
```

### Example: Getting Bus Statistics

```python
stats = bus.get_stats()

# Result:
# {
#     "registered_kernels": 2,
#     "subscriptions": {
#         "events": 0,
#         "metrics": 2,
#         "control": 0,
#         "data": 0
#     }
# }
```

## Load Balancing

The `LoadBalancer` uses weighted metrics to intelligently distribute load across kernels.

### Load Metrics

| Metric | Range | Weight (default) |
|--------|-------|------------------|
| CPU | 0.0 - 1.0 | 0.4 |
| Memory | 0.0 - 1.0 | 0.3 |
| Queue Depth | 0 - 100 | 0.2 |
| Error Rate | 0.0 - 1.0 | 0.1 |

### Example: Using LoadBalancer

```python
from systems.kernel import LoadBalancer, LoadBalancerConfig

# Create with custom weights
config = LoadBalancerConfig(
    cpu_weight=0.5,
    memory_weight=0.2,
    queue_weight=0.2,
    error_weight=0.1,
    max_latency_ms=1000.0,
    health_threshold=0.8
)

balancer = LoadBalancer(config)

# Register kernels
balancer.register("kernel-1")
balancer.register("kernel-2")
balancer.register("kernel-3")

# Update load metrics
balancer.update_load("kernel-1", cpu=0.5, memory=0.3, queue_depth=10)
balancer.update_load("kernel-2", cpu=0.7, memory=0.5, queue_depth=25)
balancer.update_load("kernel-3", cpu=0.3, memory=0.2, queue_depth=5)

# Select best kernel
kernel = balancer.select_kernel()  # Returns "kernel-3" (lowest load)
```

### Example: Getting Load Summary

```python
summary = balancer.get_summary()

# Result:
# {
#     "kernels": 3,
#     "avg_load": 0.45,
#     "max_load": 0.72,
#     "min_load": 0.28
# }
```

## Metrics

The `ClusterMetricsCollector` provides comprehensive metrics aggregation.

### Example: Using Metrics Collector

```python
from systems.kernel import ClusterMetricsCollector

# Create collector
collector = ClusterMetricsCollector(cluster_name="compute")

# Record metrics
collector.record("kernel-1", "cpu", 0.5)
collector.record("kernel-1", "memory", 0.3)
collector.increment("kernel-1", "dispatches")
collector.increment("kernel-1", "dispatches")

collector.record("kernel-2", "cpu", 0.4)
collector.record("kernel-2", "memory", 0.2)
collector.increment("kernel-2", "dispatches")

# Get individual metric
value = collector.get("kernel-1", "cpu")  # Returns 0.5

# Aggregate across kernels
total_dispatches = collector.aggregate("dispatches")  # Returns 3

# Get cluster summary
summary = collector.get_cluster_summary()

# Result: ClusterMetrics(
#     cluster_name="compute",
#     kernel_count=2,
#     total_dispatches=3,
#     total_errors=0,
#     avg_latency_ms=0.0,
#     avg_cpu=0.45,
#     avg_memory=0.25
# )

# Convert to dict
summary_dict = summary.to_dict()
```

### Example: Prometheus Export

```python
# Export metrics in Prometheus format
prometheus = collector.export_prometheus()

# Result:
# kernel_cpu{kernel="kernel-1"} 0.5
# kernel_memory{kernel="kernel-1"} 0.3
# kernel_dispatches{kernel="kernel-1"} 2
# kernel_cpu{kernel="kernel-2"} 0.4
# kernel_memory{kernel="kernel-2"} 0.2
# kernel_dispatches{kernel="kernel-2"} 1
```

### Example: Snapshotting

```python
# Get a snapshot for a specific kernel
snapshot = collector.get_snapshot("kernel-1")

# Result: KernelMetricsSnapshot(
#     kernel_name="kernel-1",
#     timestamp=1234567890.123,
#     metrics={"cpu": 0.5, "memory": 0.3, "dispatches": 2}
# )
```

## Complete Example

```python
import asyncio
from systems.kernel import (
    OrchestrationTools,
    InterKernelBus,
    BusTopic,
    BusMessage,
    ClusterMetricsCollector,
)

async def main():
    # Create orchestration tools
    tools = OrchestrationTools()

    # Create a compute cluster
    await tools.create_cluster("compute", kernel_count=3)

    # Set up inter-kernel communication
    bus = InterKernelBus()

    # Define a message handler
    async def compute_handler(message: BusMessage):
        print(f"Received: {message.payload}")
        # Forward to cluster
        await tools.dispatch("compute", message.payload)

    # Register kernels on bus
    for i in range(3):
        bus.register(f"worker-{i}", compute_handler)
        bus.subscribe(f"worker-{i}", BusTopic.DATA, compute_handler)

    # Publish a computation request
    await bus.publish(BusMessage(
        from_kernel="client",
        topic=BusTopic.DATA,
        payload={"type": "COMPUTE", "data": [1, 2, 3, 4, 5]}
    ))

    # Get cluster metrics
    metrics = await tools.get_metrics("compute")
    print(f"Cluster metrics: {metrics}")

    # List clusters
    clusters = await tools.list_clusters()
    print(f"Clusters: {clusters}")

    # Clean up
    await tools.destroy_cluster("compute")

if __name__ == "__main__":
    asyncio.run(main())
```

## API Reference

### OrchestrationTools

```python
class OrchestrationTools:
    async def create_cluster(
        self,
        name: str,
        kernel_count: int = 1,
        config: Optional[Dict[str, Any]] = None
    ) -> Dict[str, Any]

    async def destroy_cluster(self, name: str) -> Dict[str, Any]
    async def list_clusters(self) -> Dict[str, Any]
    async def dispatch(self, cluster: str, request: Dict[str, Any]) -> Dict[str, Any]
    async def get_metrics(self, cluster: str) -> Dict[str, Any]
    async def scale_cluster(self, cluster: str, target_count: int) -> Dict[str, Any]
```

### InterKernelBus

```python
class InterKernelBus:
    def register(self, kernel_name: str, handler: MessageHandler)
    def unregister(self, kernel_name: str)
    def subscribe(self, kernel_name: str, topic: BusTopic, handler: MessageHandler)
    def unsubscribe(self, kernel_name: str, topic: BusTopic)
    async def publish(self, message: BusMessage)
    async def send_direct(self, from_kernel: str, to_kernel: str, payload: Dict[str, Any])
    def get_stats(self) -> Dict[str, Any]
```

### LoadBalancer

```python
class LoadBalancer:
    def __init__(self, config: Optional[LoadBalancerConfig] = None)
    def register(self, name: str)
    def unregister(self, name: str)
    def update_load(self, name: str, cpu, memory, queue_depth, latency_ms, error_rate)
    def get_load(self, name: str) -> Optional[KernelLoad]
    def select_kernel(self, exclude: Optional[List[str]] = None) -> Optional[str]
    def get_summary(self) -> Dict[str, Any]
```

### ClusterMetricsCollector

```python
class ClusterMetricsCollector:
    def __init__(self, cluster_name: str = "default")
    def record(self, kernel_name: str, metric_name: str, value: Any)
    def increment(self, kernel_name: str, metric_name: str, amount: int = 1)
    def get(self, kernel_name: str, metric_name: str) -> Optional[Any]
    def aggregate(self, metric_name: str) -> Any
    def average(self, metric_name: str) -> float
    def get_snapshot(self, kernel_name: str) -> KernelMetricsSnapshot
    def get_cluster_summary(self) -> ClusterMetrics
    def export_prometheus(self) -> str
    def reset(self)
```

## Testing

Run the Phase L test suite:

```bash
python -m pytest systems/kernel/tests/test_cluster.py -v
python -m pytest systems/kernel/tests/test_inter_kernel_bus.py -v
python -m pytest systems/kernel/tests/test_load_balancer.py -v
python -m pytest systems/kernel/tests/test_cluster_metrics.py -v
python -m pytest systems/kernel/tests/test_orchestration.py -v
python -m pytest systems/kernel/tests/test_orchestration_integration.py -v
```

## Related Documentation

- [Unified Neural Kernel Interface](/docs/NEURAL_KERNEL_INTERFACE.md) - Base kernel API
- [Kernel Registry](/docs/KERNEL_REGISTRY.md) - Kernel registration and hot-swapping
- [WebMCP Integration](/docs/WEBMCP_INTEGRATION.md) - AI-powered orchestration
