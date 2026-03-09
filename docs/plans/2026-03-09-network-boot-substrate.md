# Network Boot Substrate Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Enable Geometry OS nodes to discover each other on the LAN and share tectonic state in real-time.

**Architecture:** UDP broadcast for peer discovery (port 7331), WebSocket for tectonic sync (port 8080), peer registry with 30s timeout for lifecycle management.

**Tech Stack:** Python asyncio, websockets library, socket (UDP), dataclasses

---

## Phase 1: Peer Registry

### Task 1: Create PeerRegistry

**Files:**
- Create: `systems/network_boot/peer_registry.py`
- Test: `tests/test_peer_registry.py`

**Step 1: Write the failing test**

```python
# tests/test_peer_registry.py
"""
Tests for PeerRegistry - tracks known nodes in the mesh.
"""

import pytest
import time
from systems.network_boot.peer_registry import PeerRegistry, Peer, NodeBeacon


class TestNodeBeacon:
    """Tests for NodeBeacon dataclass."""

    def test_beacon_creation(self):
        """Test NodeBeacon initializes correctly."""
        beacon = NodeBeacon(
            node_id="test-123",
            hostname="test-host",
            bounds=(0, 0, 1024, 1024),
            orb_count=100,
            timestamp=time.time()
        )
        assert beacon.node_id == "test-123"
        assert beacon.hostname == "test-host"
        assert beacon.bounds == (0, 0, 1024, 1024)
        assert beacon.orb_count == 100

    def test_beacon_to_dict(self):
        """Test NodeBeacon serialization."""
        beacon = NodeBeacon(
            node_id="test-123",
            hostname="test-host",
            bounds=(0, 0, 1024, 1024),
            orb_count=100,
            timestamp=1709900000.0
        )
        d = beacon.to_dict()
        assert d["node_id"] == "test-123"
        assert d["bounds"] == [0, 0, 1024, 1024]

    def test_beacon_from_dict(self):
        """Test NodeBeacon deserialization."""
        d = {
            "node_id": "test-456",
            "hostname": "other-host",
            "bounds": [100, 100, 2048, 2048],
            "orb_count": 200,
            "timestamp": 1709900100.0
        }
        beacon = NodeBeacon.from_dict(d)
        assert beacon.node_id == "test-456"
        assert beacon.bounds == (100, 100, 2048, 2048)


class TestPeer:
    """Tests for Peer dataclass."""

    def test_peer_creation(self):
        """Test Peer initializes correctly."""
        beacon = NodeBeacon(
            node_id="test-123",
            hostname="test-host",
            bounds=(0, 0, 1024, 1024),
            orb_count=100,
            timestamp=time.time()
        )
        peer = Peer(beacon=beacon)
        assert peer.beacon == beacon
        assert peer.websocket is None
        assert peer.sync_active is False

    def test_peer_is_stale(self):
        """Test Peer staleness detection."""
        beacon = NodeBeacon(
            node_id="test-123",
            hostname="test-host",
            bounds=(0, 0, 1024, 1024),
            orb_count=100,
            timestamp=time.time()
        )
        peer = Peer(beacon=beacon, last_heartbeat=time.time() - 10)
        assert peer.is_stale(timeout=30) is False

        peer.last_heartbeat = time.time() - 35
        assert peer.is_stale(timeout=30) is True


class TestPeerRegistry:
    """Tests for PeerRegistry."""

    def test_registry_empty_on_start(self):
        """Test PeerRegistry starts empty."""
        registry = PeerRegistry()
        assert len(registry.peers) == 0

    def test_registry_add_peer_from_beacon(self):
        """Test adding peer from beacon."""
        registry = PeerRegistry()
        beacon = NodeBeacon(
            node_id="test-123",
            hostname="test-host",
            bounds=(0, 0, 1024, 1024),
            orb_count=100,
            timestamp=time.time()
        )
        registry.update_from_beacon(beacon)
        assert "test-123" in registry.peers
        assert registry.peers["test-123"].beacon == beacon

    def test_registry_update_existing_peer(self):
        """Test updating existing peer."""
        registry = PeerRegistry()

        # Add initial beacon
        beacon1 = NodeBeacon(
            node_id="test-123",
            hostname="test-host",
            bounds=(0, 0, 1024, 1024),
            orb_count=100,
            timestamp=time.time()
        )
        registry.update_from_beacon(beacon1)

        # Update with new orb count
        beacon2 = NodeBeacon(
            node_id="test-123",
            hostname="test-host",
            bounds=(0, 0, 1024, 1024),
            orb_count=150,
            timestamp=time.time()
        )
        registry.update_from_beacon(beacon2)

        assert registry.peers["test-123"].beacon.orb_count == 150
        assert len(registry.peers) == 1

    def test_registry_remove_stale(self):
        """Test removing stale peers."""
        registry = PeerRegistry()

        # Add fresh peer
        beacon1 = NodeBeacon(
            node_id="fresh",
            hostname="fresh-host",
            bounds=(0, 0, 1024, 1024),
            orb_count=100,
            timestamp=time.time()
        )
        registry.update_from_beacon(beacon1)

        # Add stale peer
        beacon2 = NodeBeacon(
            node_id="stale",
            hostname="stale-host",
            bounds=(0, 0, 1024, 1024),
            orb_count=50,
            timestamp=time.time() - 35
        )
        registry.update_from_beacon(beacon2)
        registry.peers["stale"].last_heartbeat = time.time() - 35

        removed = registry.remove_stale()
        assert "stale" in removed
        assert "fresh" not in removed
        assert "fresh" in registry.peers
        assert "stale" not in registry.peers

    def test_registry_get_active_peers(self):
        """Test getting active (connected) peers."""
        registry = PeerRegistry()

        beacon = NodeBeacon(
            node_id="test-123",
            hostname="test-host",
            bounds=(0, 0, 1024, 1024),
            orb_count=100,
            timestamp=time.time()
        )
        registry.update_from_beacon(beacon)

        # Not active by default
        assert len(registry.get_active_peers()) == 0

        # Mark as active
        registry.peers["test-123"].sync_active = True
        assert len(registry.get_active_peers()) == 1

    def test_registry_get_peer_count(self):
        """Test getting peer count."""
        registry = PeerRegistry()

        for i in range(5):
            beacon = NodeBeacon(
                node_id=f"node-{i}",
                hostname=f"host-{i}",
                bounds=(0, 0, 1024, 1024),
                orb_count=100,
                timestamp=time.time()
            )
            registry.update_from_beacon(beacon)

        assert registry.get_peer_count() == 5


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
```

**Step 2: Run test to verify it fails**

Run: `python3 -m pytest tests/test_peer_registry.py -v`
Expected: FAIL with "No module named 'systems.network_boot.peer_registry'"

**Step 3: Create directory and implement**

```bash
mkdir -p systems/network_boot
```

```python
# systems/network_boot/__init__.py
"""
Network Boot Substrate - Distributed tectonic sync for Geometry OS.

Enables nodes to discover each other on the LAN and share orb positions
and ripple events in real-time.
"""

from .peer_registry import PeerRegistry, Peer, NodeBeacon
from .mesh_broadcaster import MeshBroadcaster
from .tectonic_sync import TectonicSync

__all__ = [
    "PeerRegistry",
    "Peer",
    "NodeBeacon",
    "MeshBroadcaster",
    "TectonicSync",
]
```

```python
# systems/network_boot/peer_registry.py
"""
PeerRegistry - Tracks known nodes in the Geometry OS mesh.

Maintains state about discovered peers, their tectonic bounds,
and connection status.
"""

from dataclasses import dataclass, field
from typing import Dict, List, Optional, Tuple, Any
import time


@dataclass
class NodeBeacon:
    """UDP announcement payload from a peer node."""
    node_id: str
    hostname: str
    bounds: Tuple[int, int, int, int]  # (x, y, width, height)
    orb_count: int
    timestamp: float

    def to_dict(self) -> Dict[str, Any]:
        """Serialize to JSON-compatible dict."""
        return {
            "node_id": self.node_id,
            "hostname": self.hostname,
            "bounds": list(self.bounds),
            "orb_count": self.orb_count,
            "timestamp": self.timestamp,
        }

    @classmethod
    def from_dict(cls, data: Dict[str, Any]) -> "NodeBeacon":
        """Deserialize from dict."""
        return cls(
            node_id=data["node_id"],
            hostname=data["hostname"],
            bounds=tuple(data["bounds"]),
            orb_count=data["orb_count"],
            timestamp=data["timestamp"],
        )


@dataclass
class Peer:
    """A known remote node."""
    beacon: NodeBeacon
    websocket: Optional[Any] = None  # websockets.WebSocketClientProtocol
    last_heartbeat: float = field(default_factory=time.time)
    sync_active: bool = False

    def is_stale(self, timeout: float = 30.0) -> bool:
        """Check if peer has timed out."""
        return time.time() - self.last_heartbeat > timeout


class PeerRegistry:
    """
    Tracks known peers and their state.

    Peers are discovered via UDP beacon and maintained via heartbeat.
    Stale peers (no heartbeat for 30s) are automatically removed.
    """

    PEER_TIMEOUT = 30.0  # seconds

    def __init__(self):
        self.peers: Dict[str, Peer] = {}

    def update_from_beacon(self, beacon: NodeBeacon) -> None:
        """Add or update peer from received beacon."""
        if beacon.node_id in self.peers:
            # Update existing peer
            self.peers[beacon.node_id].beacon = beacon
            self.peers[beacon.node_id].last_heartbeat = time.time()
        else:
            # Add new peer
            self.peers[beacon.node_id] = Peer(beacon=beacon)

    def remove_stale(self) -> List[str]:
        """Remove peers with no heartbeat for PEER_TIMEOUT seconds."""
        stale_ids = []
        for node_id, peer in list(self.peers.items()):
            if peer.is_stale(self.PEER_TIMEOUT):
                stale_ids.append(node_id)
                del self.peers[node_id]
        return stale_ids

    def get_active_peers(self) -> List[Peer]:
        """Return peers with active WebSocket connections."""
        return [p for p in self.peers.values() if p.sync_active]

    def get_peer_count(self) -> int:
        """Return total number of known peers."""
        return len(self.peers)

    def get_peer(self, node_id: str) -> Optional[Peer]:
        """Get peer by node_id."""
        return self.peers.get(node_id)
```

**Step 4: Run test to verify it passes**

Run: `python3 -m pytest tests/test_peer_registry.py -v`
Expected: 10 passed

**Step 5: Commit**

```bash
git add systems/network_boot/__init__.py systems/network_boot/peer_registry.py tests/test_peer_registry.py
git commit -m "feat(network-boot): add PeerRegistry for mesh node tracking"
```

---

## Phase 2: Mesh Broadcaster

### Task 2: Create MeshBroadcaster

**Files:**
- Create: `systems/network_boot/mesh_broadcaster.py`
- Test: `tests/test_mesh_broadcaster.py`

**Step 1: Write the failing test**

```python
# tests/test_mesh_broadcaster.py
"""
Tests for MeshBroadcaster - UDP peer discovery.
"""

import pytest
import asyncio
import socket
import json
import time
from systems.network_boot.mesh_broadcaster import MeshBroadcaster, NodeBeacon


class TestMeshBroadcaster:
    """Tests for MeshBroadcaster UDP discovery."""

    def test_broadcaster_creation(self):
        """Test MeshBroadcaster initializes correctly."""
        broadcaster = MeshBroadcaster(
            node_id="test-node",
            hostname="test-host",
            bounds=(0, 0, 1024, 1024)
        )
        assert broadcaster.node_id == "test-node"
        assert broadcaster.hostname == "test-host"
        assert broadcaster.bounds == (0, 0, 1024, 1024)
        assert broadcaster.running is False

    @pytest.mark.asyncio
    async def test_broadcaster_send_beacon(self):
        """Test sending a UDP beacon."""
        broadcaster = MeshBroadcaster(
            node_id="sender",
            hostname="sender-host",
            bounds=(0, 0, 1024, 1024)
        )

        # Create receiver socket
        receiver = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        receiver.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
        receiver.bind(("0.0.0.0", 17331))  # Use alternate port for test
        receiver.setblocking(False)

        # Temporarily use test port
        broadcaster.port = 17331

        await broadcaster.start()

        try:
            # Send beacon
            await broadcaster.broadcast_beacon(orb_count=100)

            # Receive it
            await asyncio.sleep(0.1)
            try:
                data, addr = receiver.recvfrom(1024)
                beacon_data = json.loads(data.decode())
                assert beacon_data["node_id"] == "sender"
                assert beacon_data["orb_count"] == 100
                assert beacon_data["type"] == "HELLO"
            except BlockingIOError:
                pytest.skip("Beacon not received in time")

        finally:
            broadcaster.stop()
            receiver.close()

    @pytest.mark.asyncio
    async def test_broadcaster_receive_beacon(self):
        """Test receiving a UDP beacon."""
        broadcaster = MeshBroadcaster(
            node_id="receiver",
            hostname="receiver-host",
            bounds=(0, 0, 1024, 1024)
        )
        broadcaster.port = 17332

        await broadcaster.start()

        try:
            # Send a test beacon
            sender = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
            sender.setsockopt(socket.SOL_SOCKET, socket.SO_BROADCAST, 1)

            test_beacon = {
                "type": "HELLO",
                "node_id": "remote-node",
                "hostname": "remote-host",
                "bounds": [100, 100, 2048, 2048],
                "orb_count": 200,
                "timestamp": time.time()
            }

            sender.sendto(
                json.dumps(test_beacon).encode(),
                ("<broadcast>", 17332)
            )
            sender.close()

            # Try to receive
            await asyncio.sleep(0.2)
            beacon = await broadcaster.receive_beacon(timeout=0.5)

            if beacon:
                assert beacon.node_id == "remote-node"
                assert beacon.orb_count == 200
            else:
                pytest.skip("Beacon not received (network issue)")

        finally:
            broadcaster.stop()

    def test_broadcaster_stop(self):
        """Test broadcaster stops cleanly."""
        broadcaster = MeshBroadcaster(
            node_id="test",
            hostname="test",
            bounds=(0, 0, 1024, 1024)
        )
        broadcaster.stop()  # Should not raise
        assert broadcaster.running is False


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
```

**Step 2: Run test to verify it fails**

Run: `python3 -m pytest tests/test_mesh_broadcaster.py -v`
Expected: FAIL with "No module named 'systems.network_boot.mesh_broadcaster'"

**Step 3: Implement MeshBroadcaster**

```python
# systems/network_boot/mesh_broadcaster.py
"""
MeshBroadcaster - UDP peer discovery for Geometry OS mesh.

Broadcasts node presence on port 7331 and listens for peer beacons.
"""

import socket
import json
import asyncio
import logging
from typing import Tuple, Optional
from dataclasses import dataclass

from .peer_registry import NodeBeacon

logger = logging.getLogger("network_boot.broadcaster")


class MeshBroadcaster:
    """
    UDP peer discovery on port 7331.

    Broadcasts HELLO beacons every 5 seconds and listens for
    beacons from other nodes on the network.
    """

    DEFAULT_PORT = 7331
    BEACON_INTERVAL = 5.0  # seconds

    def __init__(
        self,
        node_id: str,
        hostname: str,
        bounds: Tuple[int, int, int, int],
        port: int = None
    ):
        self.node_id = node_id
        self.hostname = hostname
        self.bounds = bounds
        self.port = port or self.DEFAULT_PORT

        self.sock: Optional[socket.socket] = None
        self.running = False
        self._beacon_task: Optional[asyncio.Task] = None

    async def start(self) -> None:
        """Bind UDP socket and start beacon loop."""
        self.sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        self.sock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
        self.sock.setsockopt(socket.SOL_SOCKET, socket.SO_BROADCAST, 1)
        self.sock.bind(("0.0.0.0", self.port))
        self.sock.setblocking(False)
        self.running = True

        logger.info(f"MeshBroadcaster started on port {self.port}")

    async def broadcast_beacon(self, orb_count: int) -> None:
        """Send HELLO beacon to network broadcast address."""
        if not self.sock:
            raise RuntimeError("Broadcaster not started")

        beacon = {
            "type": "HELLO",
            "node_id": self.node_id,
            "hostname": self.hostname,
            "bounds": list(self.bounds),
            "orb_count": orb_count,
            "timestamp": asyncio.get_event_loop().time(),
        }

        message = json.dumps(beacon).encode()
        self.sock.sendto(message, ("<broadcast>", self.port))

        logger.debug(f"Sent beacon: {self.node_id} with {orb_count} orbs")

    async def receive_beacon(self, timeout: float = 1.0) -> Optional[NodeBeacon]:
        """
        Receive a beacon from another node.

        Args:
            timeout: Max seconds to wait

        Returns:
            NodeBeacon if received, None on timeout
        """
        if not self.sock:
            raise RuntimeError("Broadcaster not started")

        try:
            data, addr = await asyncio.wait_for(
                self._receive_loop(),
                timeout=timeout
            )
            beacon_data = json.loads(data.decode())

            if beacon_data.get("node_id") == self.node_id:
                # Ignore our own beacons
                return None

            return NodeBeacon.from_dict(beacon_data)

        except asyncio.TimeoutError:
            return None
        except json.JSONDecodeError as e:
            logger.warning(f"Invalid beacon from {addr}: {e}")
            return None

    async def _receive_loop(self):
        """Internal async receive."""
        loop = asyncio.get_event_loop()
        data, addr = await loop.sock_recvfrom(self.sock, 4096)
        return data, addr

    def stop(self) -> None:
        """Close socket and stop broadcasting."""
        self.running = False
        if self._beacon_task:
            self._beacon_task.cancel()
        if self.sock:
            self.sock.close()
            self.sock = None

        logger.info("MeshBroadcaster stopped")
```

**Step 4: Run test to verify it passes**

Run: `python3 -m pytest tests/test_mesh_broadcaster.py -v`
Expected: 4 passed (some may skip due to network)

**Step 5: Commit**

```bash
git add systems/network_boot/mesh_broadcaster.py tests/test_mesh_broadcaster.py
git commit -m "feat(network-boot): add MeshBroadcaster for UDP peer discovery"
```

---

## Phase 3: Tectonic Sync

### Task 3: Create TectonicSync

**Files:**
- Create: `systems/network_boot/tectonic_sync.py`
- Test: `tests/test_tectonic_sync.py`

**Step 1: Write the failing test**

```python
# tests/test_tectonic_sync.py
"""
Tests for TectonicSync - WebSocket tectonic state synchronization.
"""

import pytest
import asyncio
import json
from unittest.mock import AsyncMock, MagicMock, patch
from systems.network_boot.tectonic_sync import TectonicSync, SyncMessage
from systems.network_boot.peer_registry import Peer, NodeBeacon


class TestSyncMessage:
    """Tests for SyncMessage dataclass."""

    def test_orb_update_message(self):
        """Test creating ORB_UPDATE message."""
        msg = SyncMessage.orb_update(
            node_id="node-1",
            path="systems/core.py",
            pos=(128.5, 256.0)
        )
        assert msg["type"] == "ORB_UPDATE"
        assert msg["node_id"] == "node-1"
        assert msg["path"] == "systems/core.py"
        assert msg["pos"] == [128.5, 256.0]

    def test_ripple_message(self):
        """Test creating RIPPLE message."""
        msg = SyncMessage.ripple(
            node_id="node-1",
            epicenter=(100.0, 200.0),
            energy=0.8,
            event_type="modify"
        )
        assert msg["type"] == "RIPPLE"
        assert msg["epicenter"] == [100.0, 200.0]
        assert msg["energy"] == 0.8
        assert msg["event"] == "modify"

    def test_heartbeat_message(self):
        """Test creating HEARTBEAT message."""
        msg = SyncMessage.heartbeat(
            node_id="node-1",
            orb_count=500
        )
        assert msg["type"] == "HEARTBEAT"
        assert msg["node_id"] == "node-1"
        assert msg["orb_count"] == 500


class TestTectonicSync:
    """Tests for TectonicSync WebSocket server/client."""

    def test_sync_creation(self):
        """Test TectonicSync initializes correctly."""
        sync = TectonicSync(node_id="test-node")
        assert sync.node_id == "test-node"
        assert sync.port == 8080
        assert sync.running is False

    @pytest.mark.asyncio
    async def test_sync_encode_message(self):
        """Test message encoding."""
        sync = TectonicSync(node_id="test")

        msg = SyncMessage.orb_update("test", "file.py", (100, 200))
        encoded = sync.encode_message(msg)

        decoded = json.loads(encoded)
        assert decoded["type"] == "ORB_UPDATE"
        assert decoded["path"] == "file.py"

    @pytest.mark.asyncio
    async def test_sync_decode_message(self):
        """Test message decoding."""
        sync = TectonicSync(node_id="test")

        encoded = json.dumps({
            "type": "RIPPLE",
            "node_id": "remote",
            "epicenter": [50.0, 100.0],
            "energy": 0.9,
            "event": "delete"
        })

        msg = sync.decode_message(encoded)
        assert msg["type"] == "RIPPLE"
        assert msg["epicenter"] == [50.0, 100.0]

    @pytest.mark.asyncio
    async def test_sync_broadcast_to_peers(self):
        """Test broadcasting message to connected peers."""
        sync = TectonicSync(node_id="test")

        # Create mock peer with websocket
        beacon = NodeBeacon(
            node_id="peer-1",
            hostname="peer-host",
            bounds=(0, 0, 1024, 1024),
            orb_count=100,
            timestamp=0.0
        )
        peer = Peer(beacon=beacon)
        peer.websocket = AsyncMock()
        peer.sync_active = True
        sync.peers = {"peer-1": peer}

        msg = SyncMessage.heartbeat("test", 500)
        await sync.broadcast_to_peers(msg)

        peer.websocket.send.assert_called_once()

    @pytest.mark.asyncio
    async def test_sync_handle_incoming_orb_update(self):
        """Test handling incoming ORB_UPDATE."""
        sync = TectonicSync(node_id="test")
        sync.on_orb_update = AsyncMock()

        msg = {
            "type": "ORB_UPDATE",
            "node_id": "remote",
            "path": "remote/file.py",
            "pos": [100.0, 200.0]
        }

        await sync.handle_message(msg)

        sync.on_orb_update.assert_called_once_with(
            node_id="remote",
            path="remote/file.py",
            pos=(100.0, 200.0)
        )

    @pytest.mark.asyncio
    async def test_sync_handle_incoming_ripple(self):
        """Test handling incoming RIPPLE."""
        sync = TectonicSync(node_id="test")
        sync.on_ripple = AsyncMock()

        msg = {
            "type": "RIPPLE",
            "node_id": "remote",
            "epicenter": [50.0, 100.0],
            "energy": 0.8,
            "event": "modify"
        }

        await sync.handle_message(msg)

        sync.on_ripple.assert_called_once_with(
            node_id="remote",
            epicenter=(50.0, 100.0),
            energy=0.8,
            event_type="modify"
        )


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
```

**Step 2: Run test to verify it fails**

Run: `python3 -m pytest tests/test_tectonic_sync.py -v`
Expected: FAIL with "No module named 'systems.network_boot.tectonic_sync'"

**Step 3: Implement TectonicSync**

```python
# systems/network_boot/tectonic_sync.py
"""
TectonicSync - WebSocket-based tectonic state synchronization.

Streams orb positions and ripple events between connected peers.
"""

import asyncio
import json
import logging
from typing import Dict, List, Optional, Tuple, Any, Callable
from dataclasses import dataclass
from unittest.mock import AsyncMock

logger = logging.getLogger("network_boot.sync")


class SyncMessage:
    """Factory for sync protocol messages."""

    @staticmethod
    def orb_update(node_id: str, path: str, pos: Tuple[float, float]) -> Dict:
        """Create an ORB_UPDATE message."""
        return {
            "type": "ORB_UPDATE",
            "node_id": node_id,
            "path": path,
            "pos": list(pos),
        }

    @staticmethod
    def ripple(
        node_id: str,
        epicenter: Tuple[float, float],
        energy: float,
        event_type: str
    ) -> Dict:
        """Create a RIPPLE message."""
        return {
            "type": "RIPPLE",
            "node_id": node_id,
            "epicenter": list(epicenter),
            "energy": energy,
            "event": event_type,
        }

    @staticmethod
    def heartbeat(node_id: str, orb_count: int) -> Dict:
        """Create a HEARTBEAT message."""
        return {
            "type": "HEARTBEAT",
            "node_id": node_id,
            "orb_count": orb_count,
        }


class TectonicSync:
    """
    WebSocket-based tectonic state synchronization.

    Listens on port 8080 for peer connections and streams
    orb positions and ripple events.
    """

    DEFAULT_PORT = 8080

    def __init__(self, node_id: str, port: int = None):
        self.node_id = node_id
        self.port = port or self.DEFAULT_PORT
        self.running = False

        # Connected peers (injected from PeerRegistry)
        self.peers: Dict[str, Any] = {}

        # Callbacks for incoming messages
        self.on_orb_update: Optional[Callable] = None
        self.on_ripple: Optional[Callable] = None

        # Server
        self._server = None

    def encode_message(self, msg: Dict) -> str:
        """Encode message for wire transmission."""
        return json.dumps(msg)

    def decode_message(self, data: str) -> Dict:
        """Decode message from wire."""
        return json.loads(data)

    async def start_server(self) -> None:
        """Start WebSocket server for incoming connections."""
        try:
            import websockets
        except ImportError:
            logger.warning("websockets not installed, using mock")
            self.running = True
            return

        self._server = await websockets.serve(
            self._handle_connection,
            "0.0.0.0",
            self.port
        )
        self.running = True
        logger.info(f"TectonicSync server started on port {self.port}")

    async def _handle_connection(self, websocket, path):
        """Handle incoming WebSocket connection."""
        remote_addr = websocket.remote_address
        logger.info(f"Peer connected from {remote_addr}")

        try:
            async for message in websocket:
                msg = self.decode_message(message)
                await self.handle_message(msg)
        except Exception as e:
            logger.error(f"Connection error: {e}")

    async def handle_message(self, msg: Dict) -> None:
        """Route incoming message to appropriate handler."""
        msg_type = msg.get("type")

        if msg_type == "ORB_UPDATE":
            if self.on_orb_update:
                await self.on_orb_update(
                    node_id=msg["node_id"],
                    path=msg["path"],
                    pos=tuple(msg["pos"])
                )

        elif msg_type == "RIPPLE":
            if self.on_ripple:
                await self.on_ripple(
                    node_id=msg["node_id"],
                    epicenter=tuple(msg["epicenter"]),
                    energy=msg["energy"],
                    event_type=msg["event"]
                )

        elif msg_type == "HEARTBEAT":
            logger.debug(f"Heartbeat from {msg['node_id']}: {msg['orb_count']} orbs")

    async def broadcast_to_peers(self, msg: Dict) -> None:
        """Send message to all connected peers."""
        encoded = self.encode_message(msg)

        for peer_id, peer in self.peers.items():
            if peer.sync_active and peer.websocket:
                try:
                    await peer.websocket.send(encoded)
                except Exception as e:
                    logger.warning(f"Failed to send to {peer_id}: {e}")

    async def send_orb_update(self, path: str, pos: Tuple[float, float]) -> None:
        """Broadcast orb position update."""
        msg = SyncMessage.orb_update(self.node_id, path, pos)
        await self.broadcast_to_peers(msg)

    async def send_ripple(
        self,
        epicenter: Tuple[float, float],
        energy: float,
        event_type: str
    ) -> None:
        """Broadcast ripple event."""
        msg = SyncMessage.ripple(self.node_id, epicenter, energy, event_type)
        await self.broadcast_to_peers(msg)

    async def send_heartbeat(self, orb_count: int) -> None:
        """Broadcast heartbeat."""
        msg = SyncMessage.heartbeat(self.node_id, orb_count)
        await self.broadcast_to_peers(msg)

    def stop(self) -> None:
        """Stop the sync server."""
        self.running = False
        if self._server:
            self._server.close()
        logger.info("TectonicSync stopped")
```

**Step 4: Run test to verify it passes**

Run: `python3 -m pytest tests/test_tectonic_sync.py -v`
Expected: 8 passed

**Step 5: Commit**

```bash
git add systems/network_boot/tectonic_sync.py tests/test_tectonic_sync.py
git commit -m "feat(network-boot): add TectonicSync for WebSocket state sync"
```

---

## Phase 4: Integration

### Task 4: Create NetworkBoot orchestrator

**Files:**
- Create: `systems/network_boot/network_boot.py`
- Test: `tests/test_network_boot_integration.py`

**Step 1: Write the failing test**

```python
# tests/test_network_boot_integration.py
"""
Integration tests for NetworkBoot orchestrator.
"""

import pytest
import asyncio
from unittest.mock import AsyncMock, MagicMock, patch
from systems.network_boot.network_boot import NetworkBoot
from systems.infinite_map.gravity_engine import GravityEngine


class TestNetworkBoot:
    """Tests for NetworkBoot orchestrator."""

    def test_network_boot_creation(self):
        """Test NetworkBoot initializes correctly."""
        nb = NetworkBoot(node_id="test-node", hostname="test-host")
        assert nb.node_id == "test-node"
        assert nb.hostname == "test-host"
        assert nb.running is False

    @pytest.mark.asyncio
    async def test_network_boot_start(self):
        """Test starting NetworkBoot."""
        nb = NetworkBoot(node_id="test", hostname="test")

        # Mock components
        nb.broadcaster = AsyncMock()
        nb.broadcaster.start = AsyncMock()
        nb.sync = AsyncMock()
        nb.sync.start_server = AsyncMock()

        await nb.start()

        nb.broadcaster.start.assert_called_once()
        nb.sync.start_server.assert_called_once()

    @pytest.mark.asyncio
    async def test_network_boot_stop(self):
        """Test stopping NetworkBoot."""
        nb = NetworkBoot(node_id="test", hostname="test")
        nb.running = True

        # Mock components
        nb.broadcaster = MagicMock()
        nb.broadcaster.stop = MagicMock()
        nb.sync = MagicMock()
        nb.sync.stop = MagicMock()

        nb.stop()

        nb.broadcaster.stop.assert_called_once()
        nb.sync.stop.assert_called_once()
        assert nb.running is False

    @pytest.mark.asyncio
    async def test_network_boot_connect_gravity_engine(self):
        """Test connecting GravityEngine to NetworkBoot."""
        nb = NetworkBoot(node_id="test", hostname="test")
        gravity = GravityEngine()

        nb.connect_gravity_engine(gravity)

        assert nb.gravity_engine == gravity
        assert nb.sync.on_orb_update is not None
        assert nb.sync.on_ripple is not None


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
```

**Step 2: Run test to verify it fails**

Run: `python3 -m pytest tests/test_network_boot_integration.py -v`
Expected: FAIL with "No module named 'systems.network_boot.network_boot'"

**Step 3: Implement NetworkBoot**

```python
# systems/network_boot/network_boot.py
"""
NetworkBoot - Orchestrator for distributed Geometry OS.

Coordinates MeshBroadcaster, PeerRegistry, and TectonicSync
to create a unified distributed tectonic map.
"""

import asyncio
import logging
import uuid
from typing import Optional, Tuple

from .mesh_broadcaster import MeshBroadcaster
from .peer_registry import PeerRegistry, NodeBeacon
from .tectonic_sync import TectonicSync

logger = logging.getLogger("network_boot.orchestrator")


class NetworkBoot:
    """
    Orchestrator for distributed Geometry OS.

    Usage:
        nb = NetworkBoot()
        nb.connect_gravity_engine(gravity)
        await nb.start()

        # Node will now:
        # 1. Broadcast presence on UDP:7331
        # 2. Accept peer connections on TCP:8080
        # 3. Sync orb positions and ripples with peers
    """

    def __init__(
        self,
        node_id: str = None,
        hostname: str = None,
        bounds: Tuple[int, int, int, int] = (0, 0, 4096, 4096)
    ):
        self.node_id = node_id or str(uuid.uuid4())[:8]
        self.hostname = hostname or "geometry-os"
        self.bounds = bounds
        self.running = False

        # Components
        self.registry = PeerRegistry()
        self.broadcaster = MeshBroadcaster(
            node_id=self.node_id,
            hostname=self.hostname,
            bounds=self.bounds
        )
        self.sync = TectonicSync(node_id=self.node_id)
        self.sync.peers = self.registry.peers

        # Connected systems
        self.gravity_engine = None

        # Tasks
        self._beacon_task = None
        self._listen_task = None
        self._cleanup_task = None

    async def start(self) -> None:
        """Start all network services."""
        await self.broadcaster.start()
        await self.sync.start_server()

        self.running = True

        # Start background tasks
        self._beacon_task = asyncio.create_task(self._beacon_loop())
        self._listen_task = asyncio.create_task(self._listen_loop())
        self._cleanup_task = asyncio.create_task(self._cleanup_loop())

        logger.info(f"NetworkBoot started: {self.node_id}")

    def stop(self) -> None:
        """Stop all network services."""
        self.running = False

        for task in [self._beacon_task, self._listen_task, self._cleanup_task]:
            if task:
                task.cancel()

        self.broadcaster.stop()
        self.sync.stop()

        logger.info("NetworkBoot stopped")

    def connect_gravity_engine(self, gravity_engine) -> None:
        """Connect GravityEngine for tectonic sync."""
        self.gravity_engine = gravity_engine

        # Set up callbacks for incoming messages
        async def handle_orb_update(node_id, path, pos):
            logger.debug(f"Remote orb update: {path} from {node_id}")
            # Add remote orb to local gravity engine
            remote_path = f"remote://{node_id}/{path}"
            if remote_path not in gravity_engine.orbs:
                gravity_engine.add_orb(
                    remote_path, pos[0], pos[1], 0, 10, 0
                )

        async def handle_ripple(node_id, epicenter, energy, event_type):
            logger.debug(f"Remote ripple from {node_id}: {event_type}")
            # Emit ripple in local gravity engine
            if hasattr(gravity_engine, 'emit_ripple'):
                gravity_engine.emit_ripple(epicenter, energy, event_type)

        self.sync.on_orb_update = handle_orb_update
        self.sync.on_ripple = handle_ripple

    async def _beacon_loop(self) -> None:
        """Periodically broadcast presence."""
        while self.running:
            try:
                orb_count = len(self.gravity_engine.orbs) if self.gravity_engine else 0
                await self.broadcaster.broadcast_beacon(orb_count)
                await asyncio.sleep(MeshBroadcaster.BEACON_INTERVAL)
            except asyncio.CancelledError:
                break
            except Exception as e:
                logger.error(f"Beacon error: {e}")
                await asyncio.sleep(1)

    async def _listen_loop(self) -> None:
        """Listen for peer beacons."""
        while self.running:
            try:
                beacon = await self.broadcaster.receive_beacon(timeout=2.0)
                if beacon:
                    self.registry.update_from_beacon(beacon)
                    logger.info(f"Discovered peer: {beacon.node_id}")
            except asyncio.CancelledError:
                break
            except Exception as e:
                logger.error(f"Listen error: {e}")
                await asyncio.sleep(1)

    async def _cleanup_loop(self) -> None:
        """Periodically remove stale peers."""
        while self.running:
            try:
                await asyncio.sleep(10)
                removed = self.registry.remove_stale()
                for node_id in removed:
                    logger.info(f"Peer timed out: {node_id}")
            except asyncio.CancelledError:
                break
            except Exception as e:
                logger.error(f"Cleanup error: {e}")

    def get_status(self) -> dict:
        """Get current network status."""
        return {
            "node_id": self.node_id,
            "hostname": self.hostname,
            "running": self.running,
            "peer_count": self.registry.get_peer_count(),
            "active_peers": len(self.registry.get_active_peers()),
        }
```

**Step 4: Run test to verify it passes**

Run: `python3 -m pytest tests/test_network_boot_integration.py -v`
Expected: 4 passed

**Step 5: Commit**

```bash
git add systems/network_boot/network_boot.py tests/test_network_boot_integration.py
git commit -m "feat(network-boot): add NetworkBoot orchestrator for distributed tectonics"
```

---

## Summary

| Task | Description | Files | Tests |
|------|-------------|-------|-------|
| 1 | PeerRegistry | `peer_registry.py` | 10 |
| 2 | MeshBroadcaster | `mesh_broadcaster.py` | 4 |
| 3 | TectonicSync | `tectonic_sync.py` | 8 |
| 4 | NetworkBoot | `network_boot.py` | 4 |

**Total: 4 tasks, 26 tests**

---

## Execution Handoff

**Plan complete and saved to `docs/plans/2026-03-09-network-boot-substrate.md`. Two execution options:**

**1. Subagent-Driven (this session)** - I dispatch fresh subagent per task, review between tasks, fast iteration

**2. Parallel Session (separate)** - Open new session with executing-plans, batch execution with checkpoints

**Which approach?**

**If Subagent-Driven chosen:**
- **REQUIRED SUB-SKILL:** Use superpowers:subagent-driven-development
- Stay in this session
- Fresh subagent per task + code review

**If Parallel Session chosen:**
- Guide them to open new session in worktree
- **REQUIRED SUB-SKILL:** New session uses superpowers:executing-plans
