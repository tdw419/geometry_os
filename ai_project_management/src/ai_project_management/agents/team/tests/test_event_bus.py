"""Tests for event bus."""

import pytest
import asyncio
from datetime import datetime

from ai_project_management.agents.team.event_bus import (
    EventBus,
    EventType,
    Event,
    AgentEvent,
    TaskEvent,
    SystemEvent,
)


class TestEvent:
    """Tests for Event classes."""

    def test_event_creation(self):
        """Test creating a base event."""
        event = Event(
            type=EventType.SYSTEM_STARTUP,
            source="test_source",
            correlation_id="test_corr_id",
            data={"key": "value"},
        )

        assert event.type == EventType.SYSTEM_STARTUP
        assert event.source == "test_source"
        assert event.correlation_id == "test_corr_id"
        assert event.data == {"key": "value"}

    def test_event_to_dict(self):
        """Test converting event to dictionary."""
        event = Event(
            type=EventType.SYSTEM_STARTUP,
            source="test",
            data={"key": "value"},
        )

        result = event.to_dict()

        assert result["type"] == "system_startup"
        assert result["source"] == "test"
        assert result["data"] == {"key": "value"}
        assert "timestamp" in result

    def test_event_to_json(self):
        """Test converting event to JSON."""
        event = Event(
            type=EventType.SYSTEM_STARTUP,
            data={"message": "test"},
        )

        json_str = event.to_json()

        assert "system_startup" in json_str
        assert "test" in json_str

    def test_agent_event_creation(self):
        """Test creating an agent event."""
        event = AgentEvent(
            type=EventType.AGENT_REGISTERED,
            agent_id="test_agent",
            agent_type="test",
            status="available",
        )

        assert event.agent_id == "test_agent"
        assert event.agent_type == "test"
        assert event.status == "available"

    def test_task_event_creation(self):
        """Test creating a task event."""
        event = TaskEvent(
            type=EventType.TASK_COMPLETED,
            task_id="task_123",
            task_type="test_task",
            agent_id="agent_1",
            success=True,
        )

        assert event.task_id == "task_123"
        assert event.task_type == "test_task"
        assert event.agent_id == "agent_1"
        assert event.success is True

    def test_system_event_creation(self):
        """Test creating a system event."""
        event = SystemEvent(
            type=EventType.SYSTEM_ERROR,
            component="test_component",
            severity="error",
            data={"error": "test error"},
        )

        assert event.component == "test_component"
        assert event.severity == "error"


class TestEventBus:
    """Tests for EventBus."""

    @pytest.mark.asyncio
    async def test_publish_event(self):
        """Test publishing an event."""
        bus = EventBus()

        received = []

        def handler(event):
            received.append(event)

        bus.subscribe(EventType.SYSTEM_STARTUP, handler)

        count = await bus.publish(Event(type=EventType.SYSTEM_STARTUP))

        assert count == 1
        assert len(received) == 1

    @pytest.mark.asyncio
    async def test_subscribe_unsubscribe(self):
        """Test subscribing and unsubscribing."""
        bus = EventBus()

        received = []

        def handler(event):
            received.append(event)

        unsubscribe = bus.subscribe(EventType.SYSTEM_STARTUP, handler)

        await bus.publish(Event(type=EventType.SYSTEM_STARTUP))
        assert len(received) == 1

        unsubscribe()

        await bus.publish(Event(type=EventType.SYSTEM_STARTUP))
        assert len(received) == 1  # No new events

    @pytest.mark.asyncio
    async def test_wildcard_subscription(self):
        """Test wildcard subscription."""
        bus = EventBus()

        received = []

        def handler(event):
            received.append(event.type)

        bus.subscribe_wildcard(handler)

        await bus.publish(Event(type=EventType.SYSTEM_STARTUP))
        await bus.publish(Event(type=EventType.AGENT_REGISTERED))

        assert len(received) == 2
        assert EventType.SYSTEM_STARTUP in received
        assert EventType.AGENT_REGISTERED in received

    @pytest.mark.asyncio
    async def test_subscribe_pattern(self):
        """Test pattern subscription."""
        bus = EventBus()

        received = []

        def handler(event):
            received.append(event.type)

        unsubscribe = bus.subscribe_pattern("agent_*", handler)

        await bus.publish(Event(type=EventType.AGENT_REGISTERED))
        await bus.publish(Event(type=EventType.AGENT_UNREGISTERED))
        await bus.publish(Event(type=EventType.SYSTEM_STARTUP))

        assert len(received) == 2
        assert EventType.AGENT_REGISTERED in received
        assert EventType.AGENT_UNREGISTERED in received

        unsubscribe()

    @pytest.mark.asyncio
    async def test_async_handler(self):
        """Test async event handler."""
        bus = EventBus()

        received = []

        async def handler(event):
            await asyncio.sleep(0.01)
            received.append(event)

        bus.subscribe(EventType.SYSTEM_STARTUP, handler)

        await bus.publish(Event(type=EventType.SYSTEM_STARTUP))

        assert len(received) == 1

    @pytest.mark.asyncio
    async def test_handler_exception(self):
        """Test handler exception handling."""
        bus = EventBus(enable_dead_letter=True)

        def handler(event):
            raise ValueError("Test error")

        bus.subscribe(EventType.SYSTEM_STARTUP, handler)

        await bus.publish(Event(type=EventType.SYSTEM_STARTUP))

        # Should not raise, and event should be in dead letter queue
        dlq = bus.get_dead_letter_queue()
        assert len(dlq) > 0

    @pytest.mark.asyncio
    async def test_publish_agent_event(self):
        """Test convenience method for agent events."""
        bus = EventBus()

        received = []

        def handler(event):
            received.append(event)

        bus.subscribe(EventType.AGENT_REGISTERED, handler)

        count = await bus.publish_agent_event(
            EventType.AGENT_REGISTERED,
            agent_id="test_agent",
            agent_type="test",
            custom_data="value",
        )

        assert count == 1
        assert len(received) == 1
        assert isinstance(received[0], AgentEvent)
        assert received[0].agent_id == "test_agent"

    @pytest.mark.asyncio
    async def test_publish_task_event(self):
        """Test convenience method for task events."""
        bus = EventBus()

        received = []

        def handler(event):
            received.append(event)

        bus.subscribe(EventType.TASK_COMPLETED, handler)

        count = await bus.publish_task_event(
            EventType.TASK_COMPLETED,
            task_id="task_123",
            task_type="test_task",
            success=True,
        )

        assert count == 1
        assert len(received) == 1
        assert isinstance(received[0], TaskEvent)

    @pytest.mark.asyncio
    async def test_publish_system_event(self):
        """Test convenience method for system events."""
        bus = EventBus()

        received = []

        def handler(event):
            received.append(event)

        bus.subscribe(EventType.SYSTEM_ERROR, handler)

        count = await bus.publish_system_event(
            EventType.SYSTEM_ERROR,
            component="test_component",
            severity="error",
        )

        assert count == 1
        assert len(received) == 1
        assert isinstance(received[0], SystemEvent)

    def test_get_history_empty(self):
        """Test getting history when empty."""
        bus = EventBus()

        history = bus.get_history()

        assert history == []

    @pytest.mark.asyncio
    async def test_get_history_with_events(self):
        """Test getting event history."""
        bus = EventBus(max_history=10)

        await bus.publish(Event(type=EventType.SYSTEM_STARTUP))
        await bus.publish(Event(type=EventType.AGENT_REGISTERED))

        history = bus.get_history()

        assert len(history) == 2

    @pytest.mark.asyncio
    async def test_get_history_with_filter(self):
        """Test getting filtered history."""
        bus = EventBus()

        await bus.publish(Event(type=EventType.SYSTEM_STARTUP, source="a"))
        await bus.publish(Event(type=EventType.AGENT_REGISTERED, source="b"))
        await bus.publish(Event(type=EventType.SYSTEM_STARTUP, source="c"))

        startup_events = bus.get_history(event_type=EventType.SYSTEM_STARTUP)
        source_a_events = bus.get_history(source="a")

        assert len(startup_events) == 2
        assert len(source_a_events) == 1

    @pytest.mark.asyncio
    async def test_get_history_limit(self):
        """Test history limit."""
        bus = EventBus(max_history=5)

        for i in range(10):
            await bus.publish(Event(type=EventType.SYSTEM_STARTUP))

        history = bus.get_history(limit=3)

        assert len(history) == 3

    @pytest.mark.asyncio
    async def test_clear_history(self):
        """Test clearing history."""
        bus = EventBus()

        await bus.publish(Event(type=EventType.SYSTEM_STARTUP))

        bus.clear_history()

        history = bus.get_history()

        assert len(history) == 0

    @pytest.mark.asyncio
    async def test_clear_dead_letter_queue(self):
        """Test clearing dead letter queue."""
        bus = EventBus(enable_dead_letter=True)

        def bad_handler(event):
            raise ValueError("Error")

        bus.subscribe(EventType.SYSTEM_STARTUP, bad_handler)
        await bus.publish(Event(type=EventType.SYSTEM_STARTUP))

        assert len(bus.get_dead_letter_queue()) > 0

        bus.clear_dead_letter_queue()

        assert len(bus.get_dead_letter_queue()) == 0

    def test_get_statistics(self):
        """Test getting event bus statistics."""
        bus = EventBus()

        stats = bus.get_statistics()

        assert "events_published" in stats
        assert "subscribers_by_type" in stats
        assert stats["events_published"] == 0

    def test_matches_pattern_exact(self):
        """Test pattern matching with exact match."""
        bus = EventBus()

        assert bus._matches_pattern("test", "test") is True

    def test_matches_pattern_wildcard_end(self):
        """Test pattern matching with wildcard at end."""
        bus = EventBus()

        assert bus._matches_pattern("agent_registered", "agent_*") is True
        assert bus._matches_pattern("system_startup", "agent_*") is False

    def test_matches_pattern_wildcard_start(self):
        """Test pattern matching with wildcard at start."""
        bus = EventBus()

        assert bus._matches_pattern("agent_registered", "*_registered") is True
        assert bus._matches_pattern("agent_registered", "*_unregistered") is False

    def test_matches_pattern_all(self):
        """Test pattern matching with all wildcard."""
        bus = EventBus()

        assert bus._matches_pattern("anything", "*") is True
