"""Tests for health monitor."""

import pytest
import asyncio
from datetime import datetime, timedelta

from ai_project_management.agents.team.health_monitor import (
    HealthMonitor,
    HealthStatus,
    HealthCheckResult,
    AgentHeartbeat,
)


class TestHealthCheckResult:
    """Tests for HealthCheckResult dataclass."""

    def test_health_check_result_creation(self):
        """Test creating a health check result."""
        result = HealthCheckResult(
            status=HealthStatus.HEALTHY,
            component="test_component",
            message="All systems operational",
        )

        assert result.status == HealthStatus.HEALTHY
        assert result.component == "test_component"
        assert result.message == "All systems operational"
        assert result.details == {}
        assert result.response_time_ms == 0.0

    def test_health_check_result_to_dict(self):
        """Test converting health check result to dictionary."""
        result = HealthCheckResult(
            status=HealthStatus.HEALTHY,
            component="test",
            message="OK",
            details={"key": "value"},
            response_time_ms=50.0,
        )

        result_dict = result.to_dict()

        assert result_dict["status"] == "healthy"
        assert result_dict["component"] == "test"
        assert result_dict["details"] == {"key": "value"}
        assert result_dict["response_time_ms"] == 50.0


class TestAgentHeartbeat:
    """Tests for AgentHeartbeat dataclass."""

    def test_heartbeat_creation(self):
        """Test creating a heartbeat."""
        heartbeat = AgentHeartbeat(
            agent_id="test_agent",
            timestamp=datetime.utcnow(),
            status=HealthStatus.HEALTHY,
            load=0.5,
            memory_usage_mb=512.0,
            active_tasks=3,
        )

        assert heartbeat.agent_id == "test_agent"
        assert heartbeat.status == HealthStatus.HEALTHY
        assert heartbeat.load == 0.5
        assert heartbeat.memory_usage_mb == 512.0
        assert heartbeat.active_tasks == 3


class TestHealthMonitor:
    """Tests for HealthMonitor."""

    @pytest.mark.asyncio
    async def test_start_stop(self):
        """Test starting and stopping the monitor."""
        monitor = HealthMonitor(check_interval=0.1)

        await monitor.start()
        assert monitor._running is True

        await monitor.stop()
        assert monitor._running is False

    @pytest.mark.asyncio
    async def test_register_health_check(self):
        """Test registering a health check."""
        monitor = HealthMonitor()

        def check():
            return HealthCheckResult(
                status=HealthStatus.HEALTHY,
                component="test",
                message="OK",
            )

        unregister = monitor.register_health_check("test_component", check)

        assert "test_component" in monitor._health_checks

        unregister()
        assert "test_component" not in monitor._health_checks

    @pytest.mark.asyncio
    async def test_health_check_execution(self):
        """Test that health checks are executed."""
        monitor = HealthMonitor(check_interval=0.1)

        executed = []

        def check():
            executed.append(True)
            return HealthCheckResult(
                status=HealthStatus.HEALTHY,
                component="test",
                message="OK",
            )

        monitor.register_health_check("test", check)
        await monitor.start()
        await asyncio.sleep(0.2)
        await monitor.stop()

        assert len(executed) >= 1

    @pytest.mark.asyncio
    async def test_async_health_check(self):
        """Test async health check function."""
        monitor = HealthMonitor()

        async def check():
            await asyncio.sleep(0.01)
            return HealthCheckResult(
                status=HealthStatus.HEALTHY,
                component="test",
                message="OK",
            )

        monitor.register_health_check("test", check)
        await monitor._run_health_checks()

        history = monitor.get_health_history("test")
        assert len(history) == 1

    @pytest.mark.asyncio
    async def test_health_check_failure(self):
        """Test handling of failed health checks."""
        monitor = HealthMonitor()

        def check():
            raise ValueError("Check failed")

        monitor.register_health_check("failing", check)
        await monitor._run_health_checks()

        history = monitor.get_health_history("failing")
        assert len(history) == 1
        assert history[0].status == HealthStatus.UNKNOWN

    @pytest.mark.asyncio
    async def test_register_heartbeat(self):
        """Test registering a heartbeat."""
        monitor = HealthMonitor()

        heartbeat = AgentHeartbeat(
            agent_id="test_agent",
            timestamp=datetime.utcnow(),
            status=HealthStatus.HEALTHY,
        )

        monitor.register_heartbeat(heartbeat)

        assert monitor.get_heartbeat_status("test_agent") == heartbeat

    @pytest.mark.asyncio
    async def test_stale_heartbeat_detection(self):
        """Test detection of stale heartbeats."""
        monitor = HealthMonitor(heartbeat_timeout=1.0)

        # Register old heartbeat
        old_heartbeat = AgentHeartbeat(
            agent_id="test_agent",
            timestamp=datetime.utcnow() - timedelta(seconds=5),
            status=HealthStatus.HEALTHY,
        )
        monitor.register_heartbeat(old_heartbeat)

        alerts_triggered = []

        def alert_handler(result):
            alerts_triggered.append(result)

        monitor.on_alert(alert_handler)
        await monitor._check_heartbeats()

        # Should trigger alert for stale heartbeat
        assert len(alerts_triggered) == 1
        assert alerts_triggered[0].component == "test_agent"

    @pytest.mark.asyncio
    async def test_alert_handler(self):
        """Test alert handler registration."""
        monitor = HealthMonitor()

        alerts_received = []

        def handler(result):
            alerts_received.append(result)

        monitor.on_alert(handler)

        # Trigger alert manually
        result = HealthCheckResult(
            status=HealthStatus.UNHEALTHY,
            component="test",
            message="Failed",
        )
        await monitor._trigger_alerts(result)

        assert len(alerts_received) == 1
        assert alerts_received[0] == result

    @pytest.mark.asyncio
    async def test_alert_handler_exception(self):
        """Test handling of alert handler exceptions."""
        monitor = HealthMonitor()

        def bad_handler(result):
            raise ValueError("Handler error")

        def good_handler(result):
            pass

        monitor.on_alert(bad_handler)
        monitor.on_alert(good_handler)

        result = HealthCheckResult(
            status=HealthStatus.UNHEALTHY,
            component="test",
            message="Failed",
        )
        await monitor._trigger_alerts(result)

        # Should not raise exception

    def test_get_health_status_no_data(self):
        """Test getting health status with no data."""
        monitor = HealthMonitor()

        status = monitor.get_health_status()

        assert status == HealthStatus.UNKNOWN

    @pytest.mark.asyncio
    async def test_get_health_status_with_component(self):
        """Test getting health status for specific component."""
        monitor = HealthMonitor()

        result = HealthCheckResult(
            status=HealthStatus.HEALTHY,
            component="test",
            message="OK",
        )
        await monitor._record_health_result("test", result)

        status = monitor.get_health_status("test")

        assert status == HealthStatus.HEALTHY

    @pytest.mark.asyncio
    async def test_get_overall_health_status(self):
        """Test getting overall health status."""
        monitor = HealthMonitor()

        # Add various statuses
        for status, component in [
            (HealthStatus.HEALTHY, "comp1"),
            (HealthStatus.HEALTHY, "comp2"),
            (HealthStatus.DEGRADED, "comp3"),
        ]:
            result = HealthCheckResult(
                status=status,
                component=component,
                message="",
            )
            await monitor._record_health_result(component, result)

        overall_status = monitor.get_health_status()

        # Should return DEGRADED (worst status)
        assert overall_status == HealthStatus.DEGRADED

    @pytest.mark.asyncio
    async def test_get_health_history(self):
        """Test getting health history."""
        monitor = HealthMonitor()

        for i in range(5):
            result = HealthCheckResult(
                status=HealthStatus.HEALTHY,
                component="test",
                message=f"Check {i}",
            )
            await monitor._record_health_result("test", result)

        history = monitor.get_health_history("test")

        assert len(history) == 5

    @pytest.mark.asyncio
    async def test_get_health_history_limit(self):
        """Test history limit."""
        monitor = HealthMonitor(health_history_limit=3)

        for i in range(10):
            result = HealthCheckResult(
                status=HealthStatus.HEALTHY,
                component="test",
                message=f"Check {i}",
            )
            await monitor._record_health_result("test", result)

        history = monitor.get_health_history("test")

        # Should only keep last 3
        assert len(history) == 3

    @pytest.mark.asyncio
    async def test_get_component_health_summary(self):
        """Test getting component health summary."""
        monitor = HealthMonitor()

        result = HealthCheckResult(
            status=HealthStatus.HEALTHY,
            component="test",
            message="OK",
            response_time_ms=50.0,
        )
        await monitor._record_health_result("test", result)

        summary = monitor.get_component_health_summary()

        assert "test" in summary
        assert summary["test"]["status"] == "healthy"
        assert summary["test"]["response_time_ms"] == 50.0

    @pytest.mark.asyncio
    async def test_get_all_heartbeats(self):
        """Test getting all heartbeats."""
        monitor = HealthMonitor()

        heartbeat1 = AgentHeartbeat(
            agent_id="agent1",
            timestamp=datetime.utcnow(),
            status=HealthStatus.HEALTHY,
        )
        heartbeat2 = AgentHeartbeat(
            agent_id="agent2",
            timestamp=datetime.utcnow(),
            status=HealthStatus.DEGRADED,
        )

        monitor.register_heartbeat(heartbeat1)
        monitor.register_heartbeat(heartbeat2)

        all_heartbeats = monitor.get_all_heartbeats()

        assert len(all_heartbeats) == 2
        assert "agent1" in all_heartbeats
        assert "agent2" in all_heartbeats

    @pytest.mark.asyncio
    async def test_get_statistics(self):
        """Test getting monitor statistics."""
        monitor = HealthMonitor()

        # Add some data
        result = HealthCheckResult(
            status=HealthStatus.HEALTHY,
            component="test",
            message="OK",
        )
        await monitor._record_health_result("test", result)

        stats = monitor.get_statistics()

        assert "overall_status" in stats
        assert "components_monitored" in stats
        assert stats["overall_status"] == "healthy"
