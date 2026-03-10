# Phase 48: Multi-Agent Tectonic Negotiation Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Enable autonomous swarm agents to negotiate spatial resources on the Infinite Map through GeoASM-mediated tectonic proposals, bidding, and conflict resolution.

**Architecture:** Agents submit spatial claims via the TectonicNegotiator, which runs a 3-phase auction (claim, bid, settle) using force-directed physics from TectonicEngine. Winning claims are compiled to GeoASM programs and dispatched to the Visual Shell for execution.

**Tech Stack:** Python (negotiation engine), asyncio (multi-agent coordination), GeoASM (spatial programs), WebMCP (agent bridge), TectonicEngine (physics)

---

## Core Concepts

### Tectonic Negotiation Protocol

```
Agent A wants tile (42, 17) for new Code Palace
       │
       ▼
┌─────────────────────────────────────────────────────────────┐
│ 1. CLAIM: Agent submits TectonicClaim(tile, purpose, bid)  │
│ 2. BID: Other agents can counter-bid within 500ms window   │
│ 3. SETTLE: TectonicEngine resolves via force calculation   │
└─────────────────────────────────────────────────────────────┘
       │
       ▼
Winner receives GeoASM program to execute spatial shift
```

### Force-Based Resolution

```
F_claim = bid_amount × semantic_weight
F_counter = counter_bid × competing_weight
F_anchor = distance_from_district_center × 0.1

Settlement:
  If F_claim > F_counter + F_anchor:
    Claim APPROVED → Generate GeoASM migration program
  Else:
    Claim REJECTED → Agent may escalate or relocate
```

### GeoASM Spatial Opcodes (Extended)

| Opcode | Name | Args | Description |
|--------|------|------|-------------|
| 0xE0 | CLAIM | R1, R2 | Claim tile at (R1, R2) |
| 0xE1 | BID | R3 | Bid amount for active claim |
| 0xE2 | YIELD | - | Withdraw from negotiation |
| 0xE3 | MIGRATE | R1, R2, R3, R4 | Move entity from (R1,R2) to (R3,R4) |
| 0xE4 | ANCHOR | R1, R2 | Anchor to tile (prevent migration) |
| 0xE5 | SETTLE | - | Force settlement of pending claims |

---

## Task 1: Tectonic Claim Data Structures

**Files:**
- Create: `systems/swarm/tectonic_claim.py`
- Test: `tests/test_tectonic_claim.py`

**Step 1: Write the failing test**

Create `tests/test_tectonic_claim.py`:

```python
"""Tests for Tectonic Claim data structures."""
import pytest
import time


class TestTectonicClaim:
    """Test the claim data structure for spatial negotiation."""

    def test_create_claim(self):
        """Can create a basic tectonic claim."""
        from systems.swarm.tectonic_claim import TectonicClaim

        claim = TectonicClaim(
            agent_id="agent_001",
            tile_x=42,
            tile_y=17,
            purpose="code_palace",
            bid=100.0
        )

        assert claim.agent_id == "agent_001"
        assert claim.tile_x == 42
        assert claim.tile_y == 17
        assert claim.purpose == "code_palace"
        assert claim.bid == 100.0
        assert claim.status == "pending"

    def test_claim_expires(self):
        """Claims have expiration time."""
        from systems.swarm.tectonic_claim import TectonicClaim

        claim = TectonicClaim(
            agent_id="agent_001",
            tile_x=0,
            tile_y=0,
            purpose="test",
            bid=50.0,
            ttl_seconds=0.1  # 100ms
        )

        assert not claim.is_expired()

        time.sleep(0.15)
        assert claim.is_expired()

    def test_claim_force_calculation(self):
        """Claims calculate force based on bid and semantic weight."""
        from systems.swarm.tectonic_claim import TectonicClaim

        claim = TectonicClaim(
            agent_id="agent_001",
            tile_x=100,
            tile_y=100,
            purpose="code_palace",
            bid=100.0,
            semantic_weight=1.5
        )

        force = claim.calculate_force()
        assert force == 150.0  # 100 * 1.5

    def test_counter_bid(self):
        """Can add counter-bids to a claim."""
        from systems.swarm.tectonic_claim import TectonicClaim

        claim = TectonicClaim(
            agent_id="agent_001",
            tile_x=42,
            tile_y=17,
            purpose="code_palace",
            bid=100.0
        )

        claim.add_counter_bid("agent_002", 150.0)

        assert len(claim.counter_bids) == 1
        assert claim.get_highest_counter_bid() == 150.0

    def test_claim_to_geoasm(self):
        """Claim can generate GeoASM program for execution."""
        from systems.swarm.tectonic_claim import TectonicClaim

        claim = TectonicClaim(
            agent_id="agent_001",
            tile_x=42,
            tile_y=17,
            purpose="code_palace",
            bid=100.0
        )

        program = claim.to_geoasm_program()
        assert "MIGRATE" in program or "CLAIM" in program


class TestTectonicSettlement:
    """Test settlement results."""

    def test_settlement_result(self):
        """Settlement result contains winner and program."""
        from systems.swarm.tectonic_claim import TectonicSettlement

        settlement = TectonicSettlement(
            claim_id="claim_001",
            winner_id="agent_001",
            winning_bid=150.0,
            geoasm_program="CLAIM R42, R17",
            status="approved"
        )

        assert settlement.winner_id == "agent_001"
        assert settlement.status == "approved"
```

**Step 2: Run test to verify it fails**

```bash
pytest tests/test_tectonic_claim.py -v
```

Expected: FAIL - module not found

**Step 3: Create TectonicClaim**

Create `systems/swarm/tectonic_claim.py`:

```python
"""
Tectonic Claim - Data structures for spatial negotiation.

Agents submit claims for tiles, which can be countered by other agents.
Claims are resolved through force-based settlement.
"""

import time
import uuid
from dataclasses import dataclass, field
from typing import Dict, List, Optional, Any
from enum import Enum


class ClaimStatus(Enum):
    """Status of a tectonic claim."""
    PENDING = "pending"
    CONTESTED = "contested"
    APPROVED = "approved"
    REJECTED = "rejected"
    EXPIRED = "expired"


@dataclass
class CounterBid:
    """A counter-bid from another agent."""
    agent_id: str
    bid: float
    timestamp: float = field(default_factory=time.time)


@dataclass
class TectonicClaim:
    """
    A claim for spatial territory on the Infinite Map.

    Agents submit claims when they want to occupy or modify a tile.
    Other agents can counter-bid, and the claim is resolved through
    force-based settlement.
    """
    agent_id: str
    tile_x: int
    tile_y: int
    purpose: str
    bid: float
    semantic_weight: float = 1.0
    ttl_seconds: float = 0.5  # 500ms bidding window
    claim_id: str = field(default_factory=lambda: str(uuid.uuid4())[:8])
    status: ClaimStatus = ClaimStatus.PENDING
    counter_bids: List[CounterBid] = field(default_factory=list)
    created_at: float = field(default_factory=time.time)

    def is_expired(self) -> bool:
        """Check if claim bidding window has expired."""
        return time.time() - self.created_at > self.ttl_seconds

    def calculate_force(self) -> float:
        """
        Calculate the force of this claim.

        Force = bid × semantic_weight
        Higher force = stronger claim.
        """
        return self.bid * self.semantic_weight

    def add_counter_bid(self, agent_id: str, bid: float) -> None:
        """Add a counter-bid from another agent."""
        if agent_id == self.agent_id:
            raise ValueError("Agent cannot counter-bid their own claim")

        self.counter_bids.append(CounterBid(agent_id=agent_id, bid=bid))
        self.status = ClaimStatus.CONTESTED

    def get_highest_counter_bid(self) -> float:
        """Get the highest counter-bid amount."""
        if not self.counter_bids:
            return 0.0
        return max(cb.bid for cb in self.counter_bids)

    def get_winning_bid(self) -> tuple:
        """Get (agent_id, bid) of the winning bid."""
        highest_counter = max(
            self.counter_bids,
            key=lambda cb: cb.bid,
            default=None
        )

        if highest_counter and highest_counter.bid > self.bid:
            return (highest_counter.agent_id, highest_counter.bid)
        return (self.agent_id, self.bid)

    def to_geoasm_program(self) -> str:
        """
        Generate GeoASM program for this claim.

        Returns a program that can be executed to realize the claim.
        """
        # Using extended spatial opcodes
        return f"""
; Tectonic Claim: {self.claim_id}
; Agent: {self.agent_id}
; Tile: ({self.tile_x}, {self.tile_y})
; Purpose: {self.purpose}

LOAD #{self.tile_x}, R0    ; X coordinate
LOAD #{self.tile_y}, R1    ; Y coordinate
CLAIM R0, R1              ; Claim tile
LOAD #{int(self.bid)}, R2 ; Bid amount
BID R2                    ; Submit bid
"""

    def to_dict(self) -> Dict[str, Any]:
        """Serialize to dictionary."""
        return {
            "claim_id": self.claim_id,
            "agent_id": self.agent_id,
            "tile_x": self.tile_x,
            "tile_y": self.tile_y,
            "purpose": self.purpose,
            "bid": self.bid,
            "semantic_weight": self.semantic_weight,
            "status": self.status.value,
            "force": self.calculate_force(),
            "counter_bids": [
                {"agent_id": cb.agent_id, "bid": cb.bid}
                for cb in self.counter_bids
            ],
            "created_at": self.created_at,
            "expired": self.is_expired()
        }


@dataclass
class TectonicSettlement:
    """
    Result of settling a tectonic claim.

    Contains the winner and the GeoASM program to execute.
    """
    claim_id: str
    winner_id: str
    winning_bid: float
    geoasm_program: str
    status: str  # "approved", "rejected", "contested"
    settlement_force: float = 0.0
    timestamp: float = field(default_factory=time.time)

    def to_dict(self) -> Dict[str, Any]:
        """Serialize to dictionary."""
        return {
            "claim_id": self.claim_id,
            "winner_id": self.winner_id,
            "winning_bid": self.winning_bid,
            "geoasm_program": self.geoasm_program,
            "status": self.status,
            "settlement_force": self.settlement_force,
            "timestamp": self.timestamp
        }
```

**Step 4: Run test to verify it passes**

```bash
pytest tests/test_tectonic_claim.py -v
```

Expected: PASS

**Step 5: Commit**

```bash
git add systems/swarm/tectonic_claim.py tests/test_tectonic_claim.py
git commit -m "feat(swarm): add tectonic claim data structures

- TectonicClaim for spatial territory claims
- Counter-bid support for contested claims
- Force calculation based on bid and semantic weight
- GeoASM program generation for claim execution
- TectonicSettlement for resolution results"
```

---

## Task 2: Tectonic Negotiator Engine

**Files:**
- Create: `systems/swarm/tectonic_negotiator.py`
- Test: `tests/test_tectonic_negotiator.py`

**Step 1: Write the failing test**

Create `tests/test_tectonic_negotiator.py`:

```python
"""Tests for Tectonic Negotiator Engine."""
import pytest
import asyncio


class TestTectonicNegotiator:
    """Test the negotiation engine for spatial claims."""

    @pytest.fixture
    def negotiator(self):
        """Create a TectonicNegotiator instance."""
        from systems.swarm.tectonic_negotiator import TectonicNegotiator
        return TectonicNegotiator()

    def test_negotiator_exists(self, negotiator):
        """Negotiator can be instantiated."""
        assert negotiator is not None

    def test_submit_claim(self, negotiator):
        """Can submit a tectonic claim."""
        from systems.swarm.tectonic_claim import TectonicClaim

        claim = TectonicClaim(
            agent_id="agent_001",
            tile_x=42,
            tile_y=17,
            purpose="code_palace",
            bid=100.0
        )

        claim_id = negotiator.submit_claim(claim)
        assert claim_id is not None
        assert len(negotiator.pending_claims) == 1

    def test_counter_bid(self, negotiator):
        """Can submit counter-bid on pending claim."""
        from systems.swarm.tectonic_claim import TectonicClaim

        claim = TectonicClaim(
            agent_id="agent_001",
            tile_x=42,
            tile_y=17,
            purpose="code_palace",
            bid=100.0,
            ttl_seconds=10.0  # Long enough to test
        )

        claim_id = negotiator.submit_claim(claim)
        success = negotiator.counter_bid(claim_id, "agent_002", 150.0)

        assert success
        pending = negotiator.get_claim(claim_id)
        assert pending.status.value == "contested"

    def test_settle_uncontested_claim(self, negotiator):
        """Uncontested claims are approved."""
        from systems.swarm.tectonic_claim import TectonicClaim

        claim = TectonicClaim(
            agent_id="agent_001",
            tile_x=42,
            tile_y=17,
            purpose="code_palace",
            bid=100.0,
            ttl_seconds=0.0  # Expired immediately
        )

        claim_id = negotiator.submit_claim(claim)
        settlement = negotiator.settle(claim_id)

        assert settlement.status == "approved"
        assert settlement.winner_id == "agent_001"

    def test_settle_contested_claim(self, negotiator):
        """Contested claims go to highest bidder."""
        from systems.swarm.tectonic_claim import TectonicClaim

        claim = TectonicClaim(
            agent_id="agent_001",
            tile_x=42,
            tile_y=17,
            purpose="code_palace",
            bid=100.0,
            ttl_seconds=0.0
        )

        claim_id = negotiator.submit_claim(claim)
        negotiator.counter_bid(claim_id, "agent_002", 200.0)
        settlement = negotiator.settle(claim_id)

        assert settlement.status == "approved"
        assert settlement.winner_id == "agent_002"
        assert settlement.winning_bid == 200.0

    def test_settlement_generates_geoasm(self, negotiator):
        """Settlement includes GeoASM program for execution."""
        from systems.swarm.tectonic_claim import TectonicClaim

        claim = TectonicClaim(
            agent_id="agent_001",
            tile_x=42,
            tile_y=17,
            purpose="code_palace",
            bid=100.0,
            ttl_seconds=0.0
        )

        claim_id = negotiator.submit_claim(claim)
        settlement = negotiator.settle(claim_id)

        assert "CLAIM" in settlement.geoasm_program
        assert "42" in settlement.geoasm_program

    @pytest.mark.asyncio
    async def test_auto_settle_expired_claims(self, negotiator):
        """Negotiator auto-settles expired claims."""
        from systems.swarm.tectonic_claim import TectonicClaim

        claim = TectonicClaim(
            agent_id="agent_001",
            tile_x=42,
            tile_y=17,
            purpose="code_palace",
            bid=100.0,
            ttl_seconds=0.05  # 50ms
        )

        negotiator.submit_claim(claim)
        assert len(negotiator.pending_claims) == 1

        await asyncio.sleep(0.1)
        settled = negotiator.settle_expired()

        assert len(settled) == 1
        assert len(negotiator.pending_claims) == 0
```

**Step 2: Run test to verify it fails**

```bash
pytest tests/test_tectonic_negotiator.py -v
```

Expected: FAIL - module not found

**Step 3: Create TectonicNegotiator**

Create `systems/swarm/tectonic_negotiator.py`:

```python
"""
Tectonic Negotiator - Multi-agent spatial negotiation engine.

Manages the lifecycle of tectonic claims:
1. SUBMIT: Agent submits claim for a tile
2. BID: Other agents can counter-bid within TTL window
3. SETTLE: Force-based resolution determines winner
4. EXECUTE: Winner receives GeoASM program to execute
"""

import asyncio
import logging
import time
from typing import Dict, List, Optional
from collections import defaultdict

from systems.swarm.tectonic_claim import (
    TectonicClaim,
    TectonicSettlement,
    ClaimStatus
)

logger = logging.getLogger("swarm.tectonic_negotiator")


class TectonicNegotiator:
    """
    Negotiation engine for spatial claims on the Infinite Map.

    Manages bidding windows, force calculation, and settlement.
    """

    def __init__(self, settlement_callback=None):
        """
        Initialize negotiator.

        Args:
            settlement_callback: Optional async callback(settlement) when claims settle
        """
        self.pending_claims: Dict[str, TectonicClaim] = {}
        self.settlement_history: List[TectonicSettlement] = []
        self.settlement_callback = settlement_callback

        # Track claims by tile for conflict detection
        self._tile_claims: Dict[tuple, List[str]] = defaultdict(list)

    def submit_claim(self, claim: TectonicClaim) -> str:
        """
        Submit a new tectonic claim.

        Args:
            claim: The claim to submit

        Returns:
            claim_id for tracking
        """
        # Check for conflicting pending claims
        tile_key = (claim.tile_x, claim.tile_y)
        conflicting = self._tile_claims[tile_key]

        if conflicting:
            # Auto-counter-bid existing claims
            for existing_id in conflicting:
                existing = self.pending_claims.get(existing_id)
                if existing and not existing.is_expired():
                    # New claim acts as counter-bid to existing
                    existing.add_counter_bid(claim.agent_id, claim.bid)

        # Register claim
        self.pending_claims[claim.claim_id] = claim
        self._tile_claims[tile_key].append(claim.claim_id)

        logger.info(f"Claim submitted: {claim.claim_id} by {claim.agent_id} for ({claim.tile_x}, {claim.tile_y})")

        return claim.claim_id

    def counter_bid(self, claim_id: str, agent_id: str, bid: float) -> bool:
        """
        Submit a counter-bid on a pending claim.

        Args:
            claim_id: ID of claim to counter
            agent_id: ID of countering agent
            bid: Counter-bid amount

        Returns:
            True if counter-bid accepted
        """
        claim = self.pending_claims.get(claim_id)
        if not claim:
            logger.warning(f"Counter-bid on unknown claim: {claim_id}")
            return False

        if claim.is_expired():
            logger.warning(f"Counter-bid on expired claim: {claim_id}")
            return False

        try:
            claim.add_counter_bid(agent_id, bid)
            logger.info(f"Counter-bid: {agent_id} bids {bid} on {claim_id}")
            return True
        except ValueError as e:
            logger.warning(f"Counter-bid rejected: {e}")
            return False

    def get_claim(self, claim_id: str) -> Optional[TectonicClaim]:
        """Get a pending claim by ID."""
        return self.pending_claims.get(claim_id)

    def settle(self, claim_id: str) -> Optional[TectonicSettlement]:
        """
        Settle a claim through force-based resolution.

        Args:
            claim_id: ID of claim to settle

        Returns:
            TectonicSettlement with winner and program
        """
        claim = self.pending_claims.get(claim_id)
        if not claim:
            return None

        # Get winning bid
        winner_id, winning_bid = claim.get_winning_bid()

        # Calculate settlement force
        settlement_force = winning_bid * claim.semantic_weight

        # Generate GeoASM program for winner
        program = self._generate_settlement_program(claim, winner_id, winning_bid)

        # Create settlement
        settlement = TectonicSettlement(
            claim_id=claim_id,
            winner_id=winner_id,
            winning_bid=winning_bid,
            geoasm_program=program,
            status="approved",
            settlement_force=settlement_force
        )

        # Update claim status
        claim.status = ClaimStatus.APPROVED if winner_id == claim.agent_id else ClaimStatus.REJECTED

        # Move to history
        self.settlement_history.append(settlement)
        del self.pending_claims[claim_id]

        # Clean up tile tracking
        tile_key = (claim.tile_x, claim.tile_y)
        if claim_id in self._tile_claims[tile_key]:
            self._tile_claims[tile_key].remove(claim_id)

        logger.info(f"Claim settled: {claim_id} → {winner_id} (bid: {winning_bid})")

        # Notify callback if set
        if self.settlement_callback:
            asyncio.create_task(self.settlement_callback(settlement))

        return settlement

    async def settle_expired(self) -> List[TectonicSettlement]:
        """
        Settle all expired claims.

        Returns:
            List of settlements for expired claims
        """
        expired_ids = [
            claim_id for claim_id, claim in self.pending_claims.items()
            if claim.is_expired()
        ]

        settlements = []
        for claim_id in expired_ids:
            settlement = self.settle(claim_id)
            if settlement:
                settlements.append(settlement)

        return settlements

    def _generate_settlement_program(
        self,
        claim: TectonicClaim,
        winner_id: str,
        winning_bid: float
    ) -> str:
        """Generate GeoASM program to execute settlement."""
        return f"""
; Tectonic Settlement: {claim.claim_id}
; Winner: {winner_id}
; Tile: ({claim.tile_x}, {claim.tile_y})
; Winning Bid: {winning_bid}

; Load coordinates
LOAD #{claim.tile_x}, R0    ; X coordinate
LOAD #{claim.tile_y}, R1    ; Y coordinate

; Execute claim
CLAIM R0, R1
LOAD #{int(winning_bid)}, R2
BID R2

; Migrate entity to claimed tile
; (placeholder - actual migration depends on entity type)
MIGRATE R0, R1, R0, R1

; Anchor to prevent drift
ANCHOR R0, R1

; Emit visual feedback
THOUGHT_PULSE R2
"""

    def get_pending_for_tile(self, tile_x: int, tile_y: int) -> List[TectonicClaim]:
        """Get all pending claims for a specific tile."""
        tile_key = (tile_x, tile_y)
        claim_ids = self._tile_claims.get(tile_key, [])
        return [
            self.pending_claims[cid]
            for cid in claim_ids
            if cid in self.pending_claims
        ]

    def get_stats(self) -> dict:
        """Get negotiation statistics."""
        return {
            "pending_claims": len(self.pending_claims),
            "settled_claims": len(self.settlement_history),
            "contested_claims": sum(
                1 for c in self.pending_claims.values()
                if c.status == ClaimStatus.CONTESTED
            ),
            "total_counter_bids": sum(
                len(c.counter_bids) for c in self.pending_claims.values()
            )
        }
```

**Step 4: Run test to verify it passes**

```bash
pytest tests/test_tectonic_negotiator.py -v
```

Expected: PASS

**Step 5: Commit**

```bash
git add systems/swarm/tectonic_negotiator.py tests/test_tectonic_negotiator.py
git commit -m "feat(swarm): add tectonic negotiator engine

- Submit/counter-bid/settle workflow
- Force-based resolution for contested claims
- Auto-settlement of expired claims
- GeoASM program generation for settlements
- Tile-based conflict tracking"
```

---

## Task 3: Tectonic Agent Integration

**Files:**
- Create: `systems/swarm/tectonic_agent.py`
- Test: `tests/test_tectonic_agent.py`

**Step 1: Write the failing test**

Create `tests/test_tectonic_agent.py`:

```python
"""Tests for Tectonic Agent base class."""
import pytest
import asyncio


class TestTectonicAgent:
    """Test agents that can negotiate spatial territory."""

    @pytest.fixture
    def agent(self):
        """Create a test tectonic agent."""
        from systems.swarm.tectonic_agent import TectonicAgent
        return TectonicAgent(
            agent_id="test_agent_001",
            agent_type="colonizer"
        )

    def test_agent_exists(self, agent):
        """Agent can be instantiated."""
        assert agent is not None
        assert agent.agent_id == "test_agent_001"

    def test_agent_has_budget(self, agent):
        """Agent has spatial budget for bidding."""
        assert agent.spatial_budget > 0

    def test_claim_tile(self, agent):
        """Agent can claim a tile."""
        from systems.swarm.tectonic_claim import TectonicClaim

        claim = agent.claim_tile(42, 17, purpose="outpost", bid=50.0)

        assert claim is not None
        assert claim.tile_x == 42
        assert claim.tile_y == 17
        assert claim.agent_id == agent.agent_id

    def test_counter_bid(self, agent):
        """Agent can counter-bid on claims."""
        from systems.swarm.tectonic_claim import TectonicClaim

        # Another agent's claim
        other_claim = TectonicClaim(
            agent_id="other_agent",
            tile_x=42,
            tile_y=17,
            purpose="base",
            bid=100.0,
            ttl_seconds=10.0
        )

        success = agent.counter_bid(other_claim, 150.0)
        assert success
        assert agent.spatial_budget < 1000  # Budget deducted

    def test_budget_deduction(self, agent):
        """Bids deduct from agent's spatial budget."""
        initial_budget = agent.spatial_budget

        agent.claim_tile(42, 17, purpose="test", bid=100.0)

        assert agent.spatial_budget == initial_budget - 100.0

    def test_budget_replenish(self, agent):
        """Budget replenishes over time."""
        initial_budget = agent.spatial_budget
        agent.spatial_budget = 0

        agent.replenish_budget(amount=50.0)

        assert agent.spatial_budget == 50.0

    def test_agent_priorities(self, agent):
        """Agent has priority weights for different purposes."""
        weights = agent.get_priority_weights()

        assert "expansion" in weights
        assert "defense" in weights
        assert "resource" in weights

    @pytest.mark.asyncio
    async def test_negotiate_for_territory(self, agent):
        """Agent can run negotiation cycle."""
        from systems.swarm.tectonic_negotiator import TectonicNegotiator

        negotiator = TectonicNegotiator()

        # Agent wants to expand
        result = await agent.negotiate_for_territory(
            negotiator=negotiator,
            target_tile=(100, 100),
            purpose="expansion"
        )

        # Should have submitted a claim
        assert result is not None
```

**Step 2: Run test to verify it fails**

```bash
pytest tests/test_tectonic_agent.py -v
```

Expected: FAIL - module not found

**Step 3: Create TectonicAgent**

Create `systems/swarm/tectonic_agent.py`:

```python
"""
Tectonic Agent - Base class for agents with spatial negotiation.

Extends SwarmLLMAgent with tectonic capabilities:
- Spatial budget management
- Claim submission and counter-bidding
- Territory negotiation strategies
"""

import asyncio
import logging
from dataclasses import dataclass, field
from typing import Dict, Optional, Any, TYPE_CHECKING

from systems.swarm.tectonic_claim import TectonicClaim

if TYPE_CHECKING:
    from systems.swarm.tectonic_negotiator import TectonicNegotiator

logger = logging.getLogger("swarm.tectonic_agent")


@dataclass
class AgentPriorities:
    """Priority weights for different spatial purposes."""
    expansion: float = 1.0
    defense: float = 1.5
    resource: float = 1.2
    communication: float = 0.8
    storage: float = 0.6


class TectonicAgent:
    """
    Agent capable of negotiating spatial territory.

    Manages spatial budget and coordinates with TectonicNegotiator
    to claim, defend, and trade territory on the Infinite Map.
    """

    def __init__(
        self,
        agent_id: str,
        agent_type: str = "colonizer",
        initial_budget: float = 1000.0,
        priorities: Optional[AgentPriorities] = None
    ):
        """
        Initialize tectonic agent.

        Args:
            agent_id: Unique identifier
            agent_type: Type of agent (colonizer, defender, trader)
            initial_budget: Starting spatial budget
            priorities: Custom priority weights
        """
        self.agent_id = agent_id
        self.agent_type = agent_type
        self.spatial_budget = initial_budget
        self.priorities = priorities or AgentPriorities()

        # Track owned territory
        self.owned_tiles: set = set()

        # Track pending claims
        self._pending_claims: Dict[str, TectonicClaim] = {}

    def claim_tile(
        self,
        tile_x: int,
        tile_y: int,
        purpose: str,
        bid: Optional[float] = None
    ) -> Optional[TectonicClaim]:
        """
        Create a claim for a tile.

        Args:
            tile_x: X coordinate
            tile_y: Y coordinate
            purpose: Purpose of claim (affects priority)
            bid: Optional explicit bid (default: calculated from budget)

        Returns:
            TectonicClaim if budget allows, None otherwise
        """
        # Calculate bid if not specified
        if bid is None:
            priority_weight = self._get_priority_weight(purpose)
            bid = min(
                self.spatial_budget * 0.1,  # Max 10% of budget per claim
                100.0 * priority_weight
            )

        # Check budget
        if bid > self.spatial_budget:
            logger.warning(f"Agent {self.agent_id} lacks budget for bid: {bid} > {self.spatial_budget}")
            return None

        # Create claim
        claim = TectonicClaim(
            agent_id=self.agent_id,
            tile_x=tile_x,
            tile_y=tile_y,
            purpose=purpose,
            bid=bid,
            semantic_weight=self._get_priority_weight(purpose)
        )

        # Deduct budget
        self.spatial_budget -= bid
        self._pending_claims[claim.claim_id] = claim

        logger.info(f"Agent {self.agent_id} claims ({tile_x}, {tile_y}) for {purpose} @ {bid}")

        return claim

    def counter_bid(
        self,
        claim: TectonicClaim,
        bid: Optional[float] = None
    ) -> bool:
        """
        Submit counter-bid on another agent's claim.

        Args:
            claim: The claim to counter
            bid: Optional explicit bid

        Returns:
            True if counter-bid submitted
        """
        if bid is None:
            # Calculate competitive bid
            priority_weight = self._get_priority_weight(claim.purpose)
            bid = min(
                claim.bid * 1.5,  # 50% over asking
                self.spatial_budget
            )

        if bid > self.spatial_budget:
            logger.warning(f"Agent {self.agent_id} lacks budget for counter-bid: {bid}")
            return False

        claim.add_counter_bid(self.agent_id, bid)
        self.spatial_budget -= bid

        logger.info(f"Agent {self.agent_id} counter-bids {bid} on {claim.claim_id}")
        return True

    def replenish_budget(self, amount: float) -> None:
        """Add to spatial budget."""
        self.spatial_budget += amount
        logger.debug(f"Agent {self.agent_id} budget replenished: +{amount} → {self.spatial_budget}")

    def _get_priority_weight(self, purpose: str) -> float:
        """Get semantic weight for a purpose."""
        purpose_map = {
            "expansion": self.priorities.expansion,
            "defense": self.priorities.defense,
            "resource": self.priorities.resource,
            "communication": self.priorities.communication,
            "storage": self.priorities.storage,
        }
        return purpose_map.get(purpose, 1.0)

    def get_priority_weights(self) -> Dict[str, float]:
        """Get all priority weights."""
        return {
            "expansion": self.priorities.expansion,
            "defense": self.priorities.defense,
            "resource": self.priorities.resource,
            "communication": self.priorities.communication,
            "storage": self.priorities.storage,
        }

    async def negotiate_for_territory(
        self,
        negotiator: "TectonicNegotiator",
        target_tile: tuple,
        purpose: str
    ) -> Optional[TectonicClaim]:
        """
        Run negotiation cycle for a target tile.

        Args:
            negotiator: The TectonicNegotiator to use
            target_tile: (x, y) tuple of target
            purpose: Purpose for claiming

        Returns:
            Settled claim if successful
        """
        tile_x, tile_y = target_tile

        # Create and submit claim
        claim = self.claim_tile(tile_x, tile_y, purpose)
        if not claim:
            return None

        negotiator.submit_claim(claim)

        # Wait for bidding window
        await asyncio.sleep(claim.ttl_seconds)

        # Settle
        settlement = negotiator.settle(claim.claim_id)

        if settlement and settlement.winner_id == self.agent_id:
            self.owned_tiles.add(target_tile)
            return claim

        return None

    def to_dict(self) -> Dict[str, Any]:
        """Serialize agent state."""
        return {
            "agent_id": self.agent_id,
            "agent_type": self.agent_type,
            "spatial_budget": self.spatial_budget,
            "owned_tiles": list(self.owned_tiles),
            "priorities": self.get_priority_weights()
        }
```

**Step 4: Run test to verify it passes**

```bash
pytest tests/test_tectonic_agent.py -v
```

Expected: PASS

**Step 5: Commit**

```bash
git add systems/swarm/tectonic_agent.py tests/test_tectonic_agent.py
git commit -m "feat(swarm): add tectonic agent base class

- Spatial budget management for bidding
- Priority weights for different purposes
- Claim submission and counter-bidding
- Territory ownership tracking
- Async negotiation cycle"
```

---

## Task 4: WebMCP Bridge for Negotiation

**Files:**
- Create: `systems/visual_shell/web/tectonic_bridge.py`
- Test: `tests/test_tectonic_bridge.py`

**Step 1: Write the failing test**

Create `tests/test_tectonic_bridge.py`:

```python
"""Tests for Tectonic WebMCP Bridge."""
import pytest


class TestTectonicBridge:
    """Test WebMCP bridge for tectonic negotiation."""

    @pytest.fixture
    def bridge(self):
        """Create TectonicBridge instance."""
        from systems.visual_shell.web.tectonic_bridge import TectonicBridge
        return TectonicBridge()

    def test_bridge_exists(self, bridge):
        """Bridge can be instantiated."""
        assert bridge is not None

    def test_handle_claim_request(self, bridge):
        """Bridge handles claim requests from WebMCP."""
        request = {
            "action": "claim",
            "agent_id": "agent_001",
            "tile_x": 42,
            "tile_y": 17,
            "purpose": "outpost",
            "bid": 100.0
        }

        response = bridge.handle_request(request)

        assert response["success"]
        assert "claim_id" in response

    def test_handle_counter_bid(self, bridge):
        """Bridge handles counter-bid requests."""
        # First submit a claim
        claim_request = {
            "action": "claim",
            "agent_id": "agent_001",
            "tile_x": 42,
            "tile_y": 17,
            "purpose": "outpost",
            "bid": 100.0,
            "ttl_seconds": 10.0
        }
        claim_response = bridge.handle_request(claim_request)
        claim_id = claim_response["claim_id"]

        # Then counter-bid
        counter_request = {
            "action": "counter_bid",
            "claim_id": claim_id,
            "agent_id": "agent_002",
            "bid": 150.0
        }

        response = bridge.handle_request(counter_request)
        assert response["success"]

    def test_handle_settle(self, bridge):
        """Bridge handles settlement requests."""
        # Submit claim that expires immediately
        claim_request = {
            "action": "claim",
            "agent_id": "agent_001",
            "tile_x": 42,
            "tile_y": 17,
            "purpose": "outpost",
            "bid": 100.0,
            "ttl_seconds": 0.0
        }
        claim_response = bridge.handle_request(claim_request)
        claim_id = claim_response["claim_id"]

        # Settle
        settle_request = {
            "action": "settle",
            "claim_id": claim_id
        }

        response = bridge.handle_request(settle_request)
        assert response["success"]
        assert response["winner_id"] == "agent_001"
        assert "geoasm_program" in response

    def test_handle_get_stats(self, bridge):
        """Bridge returns negotiation stats."""
        request = {
            "action": "get_stats"
        }

        response = bridge.handle_request(request)
        assert response["success"]
        assert "pending_claims" in response
        assert "settled_claims" in response

    def test_get_webmcp_tools(self, bridge):
        """Bridge exposes WebMCP tool definitions."""
        tools = bridge.get_webmcp_tools()

        assert isinstance(tools, list)
        assert any(t["name"] == "tectonic_claim" for t in tools)
        assert any(t["name"] == "tectonic_counter_bid" for t in tools)
        assert any(t["name"] == "tectonic_settle" for t in tools)
```

**Step 2: Run test to verify it fails**

```bash
pytest tests/test_tectonic_bridge.py -v
```

Expected: FAIL - module not found

**Step 3: Create TectonicBridge**

Create `systems/visual_shell/web/tectonic_bridge.py`:

```python
"""
Tectonic Bridge - WebMCP interface for spatial negotiation.

Exposes tectonic negotiation tools to web-based AI agents:
- tectonic_claim: Submit a claim for a tile
- tectonic_counter_bid: Counter-bid on a pending claim
- tectonic_settle: Force settlement of a claim
- tectonic_get_stats: Get negotiation statistics
"""

import logging
from typing import Dict, Any, List

from systems.swarm.tectonic_negotiator import TectonicNegotiator
from systems.swarm.tectonic_claim import TectonicClaim

logger = logging.getLogger("web.tectonic_bridge")


class TectonicBridge:
    """
    WebMCP bridge for tectonic negotiation.

    Handles requests from web agents and routes them
    to the TectonicNegotiator.
    """

    def __init__(self):
        """Initialize bridge with negotiator."""
        self.negotiator = TectonicNegotiator()

    def handle_request(self, request: Dict[str, Any]) -> Dict[str, Any]:
        """
        Handle a tectonic request from WebMCP.

        Args:
            request: Request dict with action and parameters

        Returns:
            Response dict with success status and result
        """
        action = request.get("action", "")

        try:
            if action == "claim":
                return self._handle_claim(request)
            elif action == "counter_bid":
                return self._handle_counter_bid(request)
            elif action == "settle":
                return self._handle_settle(request)
            elif action == "settle_expired":
                return self._handle_settle_expired(request)
            elif action == "get_stats":
                return self._handle_get_stats(request)
            elif action == "get_pending":
                return self._handle_get_pending(request)
            else:
                return {
                    "success": False,
                    "error": f"Unknown action: {action}"
                }
        except Exception as e:
            logger.exception(f"Error handling tectonic request: {e}")
            return {
                "success": False,
                "error": str(e)
            }

    def _handle_claim(self, request: Dict[str, Any]) -> Dict[str, Any]:
        """Handle claim submission."""
        claim = TectonicClaim(
            agent_id=request["agent_id"],
            tile_x=request["tile_x"],
            tile_y=request["tile_y"],
            purpose=request.get("purpose", "general"),
            bid=request.get("bid", 100.0),
            ttl_seconds=request.get("ttl_seconds", 0.5)
        )

        claim_id = self.negotiator.submit_claim(claim)

        return {
            "success": True,
            "claim_id": claim_id,
            "tile": (claim.tile_x, claim.tile_y),
            "status": claim.status.value
        }

    def _handle_counter_bid(self, request: Dict[str, Any]) -> Dict[str, Any]:
        """Handle counter-bid submission."""
        success = self.negotiator.counter_bid(
            claim_id=request["claim_id"],
            agent_id=request["agent_id"],
            bid=request["bid"]
        )

        return {
            "success": success,
            "claim_id": request["claim_id"]
        }

    def _handle_settle(self, request: Dict[str, Any]) -> Dict[str, Any]:
        """Handle settlement request."""
        settlement = self.negotiator.settle(request["claim_id"])

        if not settlement:
            return {
                "success": False,
                "error": "Claim not found or already settled"
            }

        return {
            "success": True,
            "claim_id": settlement.claim_id,
            "winner_id": settlement.winner_id,
            "winning_bid": settlement.winning_bid,
            "geoasm_program": settlement.geoasm_program,
            "status": settlement.status
        }

    def _handle_settle_expired(self, request: Dict[str, Any]) -> Dict[str, Any]:
        """Settle all expired claims."""
        # This should be async but for sync bridge we do it synchronously
        settlements = []
        expired_ids = [
            cid for cid, claim in self.negotiator.pending_claims.items()
            if claim.is_expired()
        ]

        for claim_id in expired_ids:
            settlement = self.negotiator.settle(claim_id)
            if settlement:
                settlements.append(settlement.to_dict())

        return {
            "success": True,
            "settled_count": len(settlements),
            "settlements": settlements
        }

    def _handle_get_stats(self, request: Dict[str, Any]) -> Dict[str, Any]:
        """Get negotiation statistics."""
        stats = self.negotiator.get_stats()
        return {
            "success": True,
            **stats
        }

    def _handle_get_pending(self, request: Dict[str, Any]) -> Dict[str, Any]:
        """Get pending claims for a tile or agent."""
        tile_x = request.get("tile_x")
        tile_y = request.get("tile_y")
        agent_id = request.get("agent_id")

        if tile_x is not None and tile_y is not None:
            claims = self.negotiator.get_pending_for_tile(tile_x, tile_y)
        elif agent_id:
            claims = [
                c for c in self.negotiator.pending_claims.values()
                if c.agent_id == agent_id
            ]
        else:
            claims = list(self.negotiator.pending_claims.values())

        return {
            "success": True,
            "claims": [c.to_dict() for c in claims],
            "count": len(claims)
        }

    def get_webmcp_tools(self) -> List[Dict[str, Any]]:
        """
        Get WebMCP tool definitions for tectonic negotiation.

        Returns:
            List of tool definitions
        """
        return [
            {
                "name": "tectonic_claim",
                "description": "Submit a claim for a tile on the Infinite Map",
                "parameters": {
                    "type": "object",
                    "properties": {
                        "tile_x": {"type": "integer", "description": "X coordinate"},
                        "tile_y": {"type": "integer", "description": "Y coordinate"},
                        "purpose": {"type": "string", "description": "Purpose of claim"},
                        "bid": {"type": "number", "description": "Bid amount"}
                    },
                    "required": ["tile_x", "tile_y"]
                }
            },
            {
                "name": "tectonic_counter_bid",
                "description": "Submit a counter-bid on a pending claim",
                "parameters": {
                    "type": "object",
                    "properties": {
                        "claim_id": {"type": "string", "description": "ID of claim to counter"},
                        "bid": {"type": "number", "description": "Counter-bid amount"}
                    },
                    "required": ["claim_id", "bid"]
                }
            },
            {
                "name": "tectonic_settle",
                "description": "Force settlement of a pending claim",
                "parameters": {
                    "type": "object",
                    "properties": {
                        "claim_id": {"type": "string", "description": "ID of claim to settle"}
                    },
                    "required": ["claim_id"]
                }
            },
            {
                "name": "tectonic_get_stats",
                "description": "Get negotiation statistics",
                "parameters": {
                    "type": "object",
                    "properties": {}
                }
            },
            {
                "name": "tectonic_get_pending",
                "description": "Get pending claims for a tile or agent",
                "parameters": {
                    "type": "object",
                    "properties": {
                        "tile_x": {"type": "integer", "description": "X coordinate (optional)"},
                        "tile_y": {"type": "integer", "description": "Y coordinate (optional)"},
                        "agent_id": {"type": "string", "description": "Agent ID (optional)"}
                    }
                }
            }
        ]
```

**Step 4: Run test to verify it passes**

```bash
pytest tests/test_tectonic_bridge.py -v
```

Expected: PASS

**Step 5: Commit**

```bash
git add systems/visual_shell/web/tectonic_bridge.py tests/test_tectonic_bridge.py
git commit -m "feat(web): add tectonic WebMCP bridge

- 5 WebMCP tools for spatial negotiation
- claim, counter_bid, settle, get_stats, get_pending
- Integration with TectonicNegotiator
- Tool definitions for AI agent discovery"
```

---

## Task 5: Integration Test

**Files:**
- Create: `tests/test_tectonic_e2e.py`

**Step 1: Write the end-to-end test**

Create `tests/test_tectonic_e2e.py`:

```python
"""End-to-end tests for Multi-Agent Tectonic Negotiation."""
import pytest
import asyncio


class TestTectonicE2E:
    """Test complete negotiation workflows."""

    @pytest.mark.asyncio
    async def test_two_agents_one_tile(self):
        """Two agents compete for the same tile."""
        from systems.swarm.tectonic_agent import TectonicAgent
        from systems.swarm.tectonic_negotiator import TectonicNegotiator

        negotiator = TectonicNegotiator()

        agent1 = TectonicAgent("agent_001", initial_budget=500.0)
        agent2 = TectonicAgent("agent_002", initial_budget=600.0)

        # Agent 1 claims first
        claim1 = agent1.claim_tile(42, 17, purpose="base", bid=100.0)
        negotiator.submit_claim(claim1)

        # Agent 2 counter-bids
        agent2.counter_bid(claim1, 150.0)

        # Wait for expiry
        await asyncio.sleep(claim1.ttl_seconds + 0.1)

        # Settle
        settlement = negotiator.settle(claim1.claim_id)

        assert settlement.winner_id == "agent_002"  # Higher bid wins
        assert settlement.winning_bid == 150.0

    @pytest.mark.asyncio
    async def test_agent_negotiation_cycle(self):
        """Agent runs full negotiation cycle."""
        from systems.swarm.tectonic_agent import TectonicAgent
        from systems.swarm.tectonic_negotiator import TectonicNegotiator

        negotiator = TectonicNegotiator()
        agent = TectonicAgent("agent_001", initial_budget=1000.0)

        result = await agent.negotiate_for_territory(
            negotiator=negotiator,
            target_tile=(100, 100),
            purpose="expansion"
        )

        assert result is not None
        assert (100, 100) in agent.owned_tiles

    def test_bridge_e2e(self):
        """Full workflow through WebMCP bridge."""
        from systems.visual_shell.web.tectonic_bridge import TectonicBridge

        bridge = TectonicBridge()

        # Agent 1 claims
        claim_resp = bridge.handle_request({
            "action": "claim",
            "agent_id": "agent_001",
            "tile_x": 50,
            "tile_y": 50,
            "purpose": "outpost",
            "bid": 100.0,
            "ttl_seconds": 0.0  # Immediate expiry
        })
        assert claim_resp["success"]
        claim_id = claim_resp["claim_id"]

        # Settle
        settle_resp = bridge.handle_request({
            "action": "settle",
            "claim_id": claim_id
        })
        assert settle_resp["success"]
        assert settle_resp["winner_id"] == "agent_001"
        assert "CLAIM" in settle_resp["geoasm_program"]

        # Verify stats
        stats_resp = bridge.handle_request({"action": "get_stats"})
        assert stats_resp["settled_claims"] == 1

    @pytest.mark.asyncio
    async def test_multi_agent_auction(self):
        """Multiple agents bid on same tile."""
        from systems.swarm.tectonic_agent import TectonicAgent
        from systems.swarm.tectonic_negotiator import TectonicNegotiator

        negotiator = TectonicNegotiator()

        agents = [
            TectonicAgent(f"agent_{i:03d}", initial_budget=1000.0)
            for i in range(5)
        ]

        # First agent claims
        claim = agents[0].claim_tile(42, 17, purpose="contested", bid=50.0)
        negotiator.submit_claim(claim)

        # Others counter-bid
        for i, agent in enumerate(agents[1:], 1):
            agent.counter_bid(claim, bid=50.0 + i * 25.0)

        # Settle
        await asyncio.sleep(claim.ttl_seconds + 0.1)
        settlement = negotiator.settle(claim.claim_id)

        # Last agent (agent_004) should win with bid 150
        assert settlement.winner_id == "agent_004"
        assert settlement.winning_bid == 150.0
```

**Step 2: Run test to verify it passes**

```bash
pytest tests/test_tectonic_e2e.py -v
```

Expected: PASS

**Step 3: Commit**

```bash
git add tests/test_tectonic_e2e.py
git commit -m "test(tectonic): add end-to-end negotiation tests

- Two agents competing for same tile
- Full agent negotiation cycle
- Bridge workflow test
- Multi-agent auction simulation"
```

---

## Summary

This plan implements **Phase 48: Multi-Agent Tectonic Negotiation**:

| Task | Component | Purpose |
|------|-----------|---------|
| 1 | TectonicClaim | Data structures for claims and settlements |
| 2 | TectonicNegotiator | Bidding engine with force-based resolution |
| 3 | TectonicAgent | Agent base class with spatial budget |
| 4 | TectonicBridge | WebMCP interface for web agents |
| 5 | E2E Tests | Full workflow validation |

**Key Innovation:**
- Agents negotiate territory through bidding
- Force-based resolution using TectonicEngine physics
- GeoASM programs generated for settlement execution
- WebMCP tools enable AI agents to participate

**Extended Opcodes:**
- 0xE0-0xE5 for spatial negotiation operations

**Total: 5 tasks, ~25 bite-sized steps**
