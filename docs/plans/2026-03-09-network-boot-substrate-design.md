# Network Boot Substrate Design

> **Status:** Approved
> **Date:** 2026-03-09
> **Phase:** Distributed Neural Organism

## Overview

Enable Geometry OS nodes to discover each other on the local network and share tectonic state, creating a unified "Neural Metropolis" across multiple machines.

## Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                        LAN Network                           │
│                                                              │
│   ┌─────────┐      UDP:7331       ┌─────────┐               │
│   │ Node A  │◄───────────────────►│ Node B  │               │
│   │ (peer)  │      TCP:8080       │ (peer)  │               │
│   └────┬────┘◄───────────────────►└────┬────┘               │
│        │                              │                      │
│        │         ┌─────────┐          │                      │
│        └────────►│ Node C  │◄─────────┘                      │
│                  │ (peer)  │                                 │
│                  └─────────┘                                 │
└─────────────────────────────────────────────────────────────┘
```

## Components

### 1. MeshBroadcaster (UDP Discovery)

**Port:** 7331
**Protocol:** UDP broadcast
**Interval:** 5 seconds

```python
@dataclass
class NodeBeacon:
    """UDP announcement payload."""
    node_id: str           # UUID for this node
    hostname: str          # Human-readable name
    bounds: Tuple[int, int, int, int]  # (x, y, width, height) tectonic bounds
    orb_count: int         # Number of orbs hosted
    timestamp: float       # Beacon time

class MeshBroadcaster:
    """UDP peer discovery on port 7331."""

    BEACON_PORT = 7331
    BEACON_INTERVAL = 5.0  # seconds

    def __init__(self, node_id: str, bounds: Tuple[int, int, int, int]):
        self.node_id = node_id
        self.bounds = bounds
        self.sock: socket.socket = None
        self.running = False

    async def start(self) -> None:
        """Bind UDP socket, start beacon loop."""

    async def broadcast_beacon(self, orb_count: int) -> None:
        """Send HELLO to 255.255.255.255:7331."""

    async def listen(self) -> AsyncIterator[NodeBeacon]:
        """Yield beacons from other nodes."""

    def stop(self) -> None:
        """Close socket."""
```

**Beacon Format (JSON over UDP):**
```json
{
  "type": "HELLO",
  "node_id": "a1b2c3d4",
  "hostname": "geometry-os-laptop",
  "bounds": [0, 0, 4096, 4096],
  "orb_count": 847,
  "timestamp": 1709900000.0
}
```

### 2. PeerRegistry (State Tracking)

**Timeout:** 30 seconds (peer removed if no heartbeat)

```python
@dataclass
class Peer:
    """Known remote node."""
    beacon: NodeBeacon
    websocket: Optional[websockets.WebSocketClientProtocol] = None
    last_heartbeat: float = 0.0
    sync_active: bool = False

class PeerRegistry:
    """Tracks known peers and their state."""

    PEER_TIMEOUT = 30.0  # seconds

    def __init__(self):
        self.peers: Dict[str, Peer] = {}

    def update_from_beacon(self, beacon: NodeBeacon) -> None:
        """Add/update peer from beacon."""

    def remove_stale(self) -> List[str]:
        """Remove peers with no heartbeat for 30s, return removed IDs."""

    def get_active_peers(self) -> List[Peer]:
        """Return peers with active WebSocket connections."""
```

### 3. TectonicSync (State Synchronization)

**Port:** 8080
**Protocol:** WebSocket (full-duplex)
**Scope:** Orb positions and ripple events only

```python
class TectonicSync:
    """Streams orb/ripple data to/from peers via WebSocket."""

    SYNC_PORT = 8080

    async def connect_to_peer(self, peer: Peer) -> None:
        """Establish WebSocket connection to peer's sync port."""

    async def broadcast_orb_update(self, orb_path: str,
                                    pos: Tuple[float, float]) -> None:
        """Send orb position to all connected peers."""

    async def broadcast_ripple(self, epicenter: Tuple[float, float],
                                energy: float, event_type: str) -> None:
        """Send ripple event to all peers."""

    async def listen_for_updates(self) -> AsyncIterator[Dict]:
        """Yield incoming sync messages from peers."""
```

**Sync Message Formats:**
```json
{"type": "ORB_UPDATE", "path": "systems/core.py", "pos": [128.5, 256.0], "node_id": "a1b2c3d4"}
{"type": "RIPPLE", "epicenter": [128.5, 256.0], "energy": 0.8, "event": "modify"}
{"type": "HEARTBEAT", "node_id": "a1b2c3d4", "orb_count": 847}
```

## Data Flow

### Node Startup
1. Generate `node_id` (UUID4)
2. Start `MeshBroadcaster` on UDP:7331
3. Start `TectonicSync` server on TCP:8080
4. Begin broadcasting beacons every 5s
5. Listen for incoming beacons, add to `PeerRegistry`

### Peer Discovery
1. Receive beacon from unknown node
2. Add to `PeerRegistry`
3. Establish WebSocket connection to peer's TCP:8080
4. Send initial orb snapshot
5. Begin streaming updates

### Tectonic Sync
1. Local file event → `TectonicPhysics` → ripple
2. `TectonicSync.broadcast_ripple()` to all active peers
3. Remote peers receive, add ripple to their `GravityEngine`
4. Ripple visible on all nodes simultaneously

### Peer Timeout
1. No beacon/heartbeat for 30s
2. `PeerRegistry.remove_stale()` drops peer
3. Close WebSocket connection
4. Remove peer's orbs from local tectonic map

## Files to Create

| File | Purpose |
|------|---------|
| `systems/network_boot/mesh_broadcaster.py` | UDP discovery |
| `systems/network_boot/peer_registry.py` | Peer state tracking |
| `systems/network_boot/tectonic_sync.py` | WebSocket sync |
| `systems/network_boot/__init__.py` | Module exports |
| `tests/test_mesh_broadcaster.py` | Discovery tests |
| `tests/test_peer_registry.py` | Registry tests |
| `tests/test_tectonic_sync.py` | Sync tests |

## Success Criteria

- [ ] Nodes discover each other via UDP broadcast
- [ ] Peer registry tracks active/inactive nodes
- [ ] Orb positions sync across all connected peers
- [ ] Ripples propagate to all nodes in real-time
- [ ] Stale peers (30s timeout) are removed cleanly
- [ ] Visual distinction between local vs remote orbs

## Future Enhancements

- Encrypted WebSocket (wss://)
- Cross-subnet discovery via rendezvous server
- libp2p integration for NAT traversal
- Shared PixelBrain weights (collective learning)
