# Phase 9 Plan 1: Resource Allocator Summary

## One-Liner

Unique VNC port and socket path allocation for multi-container boot with thread-safe tracking and release.

---

## Metadata

```yaml
phase: 09-core-multi-boot-infrastructure
plan: 01
subsystem: boot
tags: [resource-allocation, multi-boot, vnc, threading, sockets]
completed: 2026-03-09
duration: 8 min
```

## Dependency Graph

```yaml
requires: []
provides:
  - Unique VNC port allocation (5900-5999 range)
  - Unique socket path generation
  - Thread-safe resource management
  - Port release and reuse tracking
affects:
  - 09-02: MultiBootManager will use ResourceAllocator
  - 09-03: Container tracking will depend on allocation
```

## Tech Stack

```yaml
added:
  - threading.Lock (thread-safe allocation)
  - uuid.uuid5 (deterministic ID generation)
patterns:
  - Resource pool pattern
  - Thread-safe singleton state
```

## Key Files

```yaml
created:
  - systems/pixel_compiler/boot/resource_allocator.py (292 lines)
  - tests/unit/test_resource_allocator.py (382 lines)
modified:
  - systems/pixel_compiler/boot/__init__.py (added exports)
```

## Tasks Completed

| Task | Description | Status |
|------|-------------|--------|
| 1 | Create ResourceAllocator class | ✅ Complete |
| 2 | Create comprehensive unit tests | ✅ Complete |
| 3 | Export ResourceAllocator from boot package | ✅ Complete |

## Implementation Details

### ResourceAllocator Class

**Location:** `systems/pixel_compiler/boot/resource_allocator.py`

Core class providing:
- VNC port allocation from range 5900-5999 (100 ports)
- Unique socket path generation: `/tmp/pixelrts-{id}-{serial|monitor}.sock`
- Thread-safe operations via `threading.Lock`
- Deterministic allocation via UUID5 for reproducibility
- Port release and reuse tracking

**Key Methods:**
- `allocate(name: str) -> AllocatedResources` - Allocate resources for container
- `release(resources: AllocatedResources) -> None` - Release resources for reuse
- `get_allocated_count() -> int` - Get current allocation count
- `get_available_count() -> int` - Get available port count
- `clear_all() -> None` - Reset all allocations

**Error Handling:**
- `ResourceExhaustedError` - When no VNC ports available
- `InvalidNameError` - When container name validation fails

### AllocatedResources Dataclass

Container for allocated resources:
- `vnc_port: int` - VNC display port (5900-5999)
- `serial_socket: Path` - Serial console socket path
- `monitor_socket: Path` - QEMU monitor socket path
- `container_id: str` - Unique 8-char container ID
- `container_name: str` - Original container name

### Test Coverage

**Location:** `tests/unit/test_resource_allocator.py`

23 test cases covering:
- Basic allocation (unique ports, socket paths)
- Collision prevention (no duplicate ports)
- Release and reuse (port recycling)
- Port exhaustion handling
- Thread safety (concurrent allocation/release)
- Invalid name validation
- clear_all functionality
- Edge cases (sequential ports, reuse order)

**Test Results:** All 23 tests passing

## Verification

### Success Criteria Met

1. ✅ `ResourceAllocator.allocate("test.rts.png")` returns vnc_port >= 5900
2. ✅ Two allocations return different ports
3. ✅ After release, port can be reallocated
4. ✅ All 23 tests pass

### Manual Verification

```python
from systems.pixel_compiler.boot import ResourceAllocator

allocator = ResourceAllocator()
r1 = allocator.allocate("alpine.rts.png")
r2 = allocator.allocate("ubuntu.rts.png")

assert r1.vnc_port != r2.vnc_port  # No collision
assert r1.vnc_port == 5900  # First allocation
assert r2.vnc_port == 5901  # Sequential

allocator.release(r1)
r3 = allocator.allocate("debian.rts.png")
# r3 gets released port 5900
```

## Decisions Made

1. **VNC Port Range (5900-5999)**
   - Standard VNC port convention (5900 + display number)
   - 100 ports supports up to 100 concurrent containers
   - Sufficient for expected use case

2. **Thread-Safe Design**
   - `threading.Lock` protects all state mutations
   - Enables safe concurrent allocation from multiple threads
   - Required for asyncio subprocess orchestration

3. **Deterministic IDs via UUID5**
   - Same container name always gets same ID
   - Useful for debugging and logging
   - Not used for uniqueness (ports provide that)

4. **Port Reuse After Release**
   - Released ports go to reuse pool
   - New allocations prefer released ports
   - Prevents unnecessary port exhaustion

5. **Socket Path Pattern**
   - `/tmp/pixelrts-{id}-{type}.sock`
   - Separate serial and monitor sockets
   - Human-readable with container ID

## Deviations from Plan

None - plan executed exactly as written.

## Next Phase Readiness

### Blockers

None.

### Concerns

None.

### Recommendations for Next Plan

1. **09-02 MultiBootManager**
   - Use ResourceAllocator for container allocation
   - Integrate with BootBridge for per-container boot
   - Track container lifecycle with allocated resources

2. **Socket Path Cleanup**
   - Consider automatic socket file cleanup on release
   - Or document that caller is responsible

3. **Port Configuration**
   - Future: allow custom port ranges via config
   - Current hardcoded range sufficient for MVP

## Metrics

- **Lines of Code:** 292 (implementation) + 382 (tests) = 674 total
- **Test Coverage:** 23 tests, 100% pass rate
- **Files Modified:** 3
- **Execution Time:** ~8 minutes

## Git Commits

```
85fe04d - feat(09-01): export ResourceAllocator from boot package
05aee41 - test(09-01): add comprehensive ResourceAllocator unit tests
73339be - feat(09-01): create ResourceAllocator class
```

---

*Summary generated: 2026-03-09*
*Plan: 09-01-PLAN.md*
