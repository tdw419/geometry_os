"""
Event Bus

Pub/sub system for agent communication and coordination.
"""

import asyncio
from enum import Enum
from typing import Dict, List, Callable, Optional, Any, Set
from dataclasses import dataclass, field
from datetime import datetime
from collections import defaultdict
import structlog
import json


class EventType(str, Enum):
    """Types of events that can be published."""
    # Agent lifecycle events
    AGENT_REGISTERED = "agent_registered"
    AGENT_UNREGISTERED = "agent_unregistered"
    AGENT_STATUS_CHANGED = "agent_status_changed"
    AGENT_HEARTBEAT = "agent_heartbeat"

    # Task events
    TASK_ASSIGNED = "task_assigned"
    TASK_STARTED = "task_started"
    TASK_COMPLETED = "task_completed"
    TASK_FAILED = "task_failed"
    TASK_CANCELLED = "task_cancelled"

    # System events
    SYSTEM_STARTUP = "system_startup"
    SYSTEM_SHUTDOWN = "system_shutdown"
    SYSTEM_ERROR = "system_error"
    SYSTEM_WARNING = "system_warning"

    # Coordination events
    TEAM_FORMED = "team_formed"
    TEAM_DISBANDED = "team_disbanded"
    WORKFLOW_STARTED = "workflow_started"
    WORKFLOW_COMPLETED = "workflow_completed"

    # Custom events
    CUSTOM = "custom"


@dataclass
class Event:
    """Base event class."""
    type: EventType
    timestamp: datetime = field(default_factory=datetime.utcnow)
    source: Optional[str] = None  # Agent ID that generated the event
    correlation_id: Optional[str] = None  # For tracking related events
    data: Dict[str, Any] = field(default_factory=dict)

    def to_dict(self) -> Dict[str, Any]:
        """Convert event to dictionary."""
        return {
            "type": self.type.value,
            "timestamp": self.timestamp.isoformat(),
            "source": self.source,
            "correlation_id": self.correlation_id,
            "data": self.data,
        }

    def to_json(self) -> str:
        """Convert event to JSON string."""
        return json.dumps(self.to_dict())


@dataclass
class AgentEvent(Event):
    """Event related to an agent."""
    agent_id: str = ""
    agent_type: str = ""
    status: Optional[str] = None


@dataclass
class TaskEvent(Event):
    """Event related to a task."""
    task_id: str = ""
    task_type: str = ""
    agent_id: Optional[str] = None
    success: Optional[bool] = None
    error: Optional[str] = None


@dataclass
class SystemEvent(Event):
    """System-level event."""
    component: str = ""
    severity: str = "info"  # debug, info, warning, error, critical


EventHandler = Callable[[Event], Any]


class EventBus:
    """
    Async event bus for agent communication.

    Provides pub/sub messaging with support for:
    - Topic-based routing
    - Wildcard subscriptions
    - Event filtering
    - Dead letter queue for failed handlers
    - Event history/replay
    """

    def __init__(
        self,
        max_history: int = 1000,
        enable_dead_letter: bool = True,
    ):
        """
        Initialize the event bus.

        Args:
            max_history: Maximum events to keep in history
            enable_dead_letter: Enable dead letter queue for failed events
        """
        self._subscribers: Dict[EventType, List[EventHandler]] = defaultdict(list)
        self._wildcard_subscribers: List[EventHandler] = []
        self._event_history: List[Event] = []
        self._max_history = max_history
        self._dead_letter_queue: List[Event] = []
        self._enable_dead_letter = enable_dead_letter
        self._running = False
        self._lock = asyncio.Lock()
        self.logger = structlog.get_logger(component="event_bus")

        # Statistics
        self._stats = {
            "events_published": 0,
            "events_delivered": 0,
            "events_failed": 0,
            "handlers_executed": 0,
        }

    async def publish(self, event: Event) -> int:
        """
        Publish an event to all subscribers.

        Args:
            event: Event to publish

        Returns:
            Number of handlers notified
        """
        self._stats["events_published"] += 1

        # Add to history
        await self._add_to_history(event)

        # Get subscribers for this event type
        subscribers = list(self._subscribers[event.type])
        subscribers.extend(self._wildcard_subscribers)

        if not subscribers:
            self.logger.debug(
                "No subscribers for event",
                event_type=event.type.value,
            )
            return 0

        # Notify all subscribers
        delivered = 0
        for handler in subscribers:
            try:
                result = handler(event)
                if asyncio.iscoroutine(result):
                    await result
                delivered += 1
                self._stats["handlers_executed"] += 1

            except Exception as e:
                self.logger.error(
                    "Event handler failed",
                    event_type=event.type.value,
                    handler=handler.__name__,
                    error=str(e),
                )
                self._stats["events_failed"] += 1

                if self._enable_dead_letter:
                    await self._add_to_dead_letter(event, handler, str(e))

        self._stats["events_delivered"] += delivered
        return delivered

    def subscribe(
        self,
        event_type: EventType,
        handler: EventHandler,
    ) -> Callable[[], None]:
        """
        Subscribe to an event type.

        Args:
            event_type: Type of event to subscribe to
            handler: Handler function

        Returns:
            Unsubscribe function
        """
        self._subscribers[event_type].append(handler)

        def unsubscribe():
            """Remove the subscription."""
            if handler in self._subscribers[event_type]:
                self._subscribers[event_type].remove(handler)

        return unsubscribe

    def subscribe_wildcard(self, handler: EventHandler) -> Callable[[], None]:
        """
        Subscribe to all events.

        Args:
            handler: Handler function

        Returns:
            Unsubscribe function
        """
        self._wildcard_subscribers.append(handler)

        def unsubscribe():
            """Remove the subscription."""
            if handler in self._wildcard_subscribers:
                self._wildcard_subscribers.remove(handler)

        return unsubscribe

    def subscribe_pattern(
        self,
        pattern: str,
        handler: EventHandler,
    ) -> Callable[[], None]:
        """
        Subscribe to events matching a pattern.

        Pattern syntax:
        - "*" matches all events
        - "agent_*" matches all agent events
        - "task_*" matches all task events

        Args:
            pattern: Event type pattern
            handler: Handler function

        Returns:
            Unsubscribe function
        """
        matched_types = [
            et for et in EventType
            if self._matches_pattern(et.value, pattern)
        ]

        unsubscribe_funcs = []

        for event_type in matched_types:
            unsub = self.subscribe(event_type, handler)
            unsubscribe_funcs.append(unsub)

        def unsubscribe_all():
            """Remove all pattern subscriptions."""
            for unsub in unsubscribe_funcs:
                unsub()

        return unsubscribe_all

    def _matches_pattern(self, value: str, pattern: str) -> bool:
        """Check if a value matches a wildcard pattern."""
        # Simple wildcard matching
        if pattern == "*":
            return True

        if pattern.endswith("*"):
            prefix = pattern[:-1]
            return value.startswith(prefix)

        if pattern.startswith("*"):
            suffix = pattern[1:]
            return value.endswith(suffix)

        return value == pattern

    async def publish_agent_event(
        self,
        event_type: EventType,
        agent_id: str,
        agent_type: str,
        **data,
    ) -> int:
        """
        Convenience method to publish an agent event.

        Args:
            event_type: Type of event
            agent_id: Agent ID
            agent_type: Agent type
            **data: Additional event data

        Returns:
            Number of handlers notified
        """
        event = AgentEvent(
            type=event_type,
            source=agent_id,
            agent_id=agent_id,
            agent_type=agent_type,
            data=data,
        )
        return await self.publish(event)

    async def publish_task_event(
        self,
        event_type: EventType,
        task_id: str,
        task_type: str,
        agent_id: Optional[str] = None,
        **data,
    ) -> int:
        """
        Convenience method to publish a task event.

        Args:
            event_type: Type of event
            task_id: Task ID
            task_type: Task type
            agent_id: Agent handling the task
            **data: Additional event data

        Returns:
            Number of handlers notified
        """
        event = TaskEvent(
            type=event_type,
            source=agent_id,
            task_id=task_id,
            task_type=task_type,
            agent_id=agent_id,
            data=data,
        )
        return await self.publish(event)

    async def publish_system_event(
        self,
        event_type: EventType,
        component: str,
        severity: str = "info",
        **data,
    ) -> int:
        """
        Convenience method to publish a system event.

        Args:
            event_type: Type of event
            component: Component name
            severity: Event severity
            **data: Additional event data

        Returns:
            Number of handlers notified
        """
        event = SystemEvent(
            type=event_type,
            component=component,
            severity=severity,
            data=data,
        )
        return await self.publish(event)

    async def _add_to_history(self, event: Event):
        """Add event to history."""
        async with self._lock:
            self._event_history.append(event)
            if len(self._event_history) > self._max_history:
                self._event_history.pop(0)

    async def _add_to_dead_letter(
        self,
        event: Event,
        handler: EventHandler,
        error: str,
    ):
        """Add failed event to dead letter queue."""
        dead_event = Event(
            type=EventType.SYSTEM_ERROR,
            data={
                "original_event": event.to_dict(),
                "handler": handler.__name__,
                "error": error,
            },
        )
        self._dead_letter_queue.append(dead_event)

    def get_history(
        self,
        event_type: Optional[EventType] = None,
        source: Optional[str] = None,
        limit: int = 100,
    ) -> List[Event]:
        """
        Get events from history.

        Args:
            event_type: Filter by event type
            source: Filter by source agent ID
            limit: Maximum events to return

        Returns:
            List of events
        """
        events = self._event_history

        if event_type:
            events = [e for e in events if e.type == event_type]
        if source:
            events = [e for e in events if e.source == source]

        return events[-limit:]

    def get_dead_letter_queue(self) -> List[Event]:
        """Get events from the dead letter queue."""
        return list(self._dead_letter_queue)

    def clear_dead_letter_queue(self):
        """Clear the dead letter queue."""
        self._dead_letter_queue.clear()

    def get_statistics(self) -> Dict[str, Any]:
        """Get event bus statistics."""
        subscribers_by_type = {
            event_type.value: len(handlers)
            for event_type, handlers in self._subscribers.items()
        }

        return {
            **self._stats,
            "subscriber_count": sum(len(h) for h in self._subscribers.values()),
            "wildcard_subscriber_count": len(self._wildcard_subscribers),
            "history_size": len(self._event_history),
            "dead_letter_queue_size": len(self._dead_letter_queue),
            "subscribers_by_type": subscribers_by_type,
        }

    async def replay_events(
        self,
        event_types: Optional[List[EventType]] = None,
        handler: Optional[EventHandler] = None,
    ):
        """
        Replay historical events.

        Args:
            event_types: Event types to replay (None for all)
            handler: Optional handler to use (None to use current subscribers)
        """
        events = self._event_history

        if event_types:
            events = [e for e in events if e.type in event_types]

        for event in events:
            if handler:
                result = handler(event)
                if asyncio.iscoroutine(result):
                    await result
            else:
                await self.publish(event)

    def clear_history(self):
        """Clear event history."""
        self._event_history.clear()
