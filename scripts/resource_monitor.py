#!/usr/bin/env python3
"""
Resource Monitor for Geometry OS

Monitors system resources during extended periods of usage to detect
resource leaks or inefficiencies.

Usage:
    python scripts/resource_monitor.py --pid 12345 --duration 3600 --interval 60
    python scripts/resource_monitor.py --command "python evolution_daemon_v8.py" --duration 1800
"""

import argparse
import gc
import os
import subprocess
import sys
import time
import tracemalloc
from dataclasses import dataclass, field
from datetime import datetime
from pathlib import Path
from typing import Optional

# Add project root to path
PROJECT_ROOT = Path(__file__).parent.parent
sys.path.insert(0, str(PROJECT_ROOT))

try:
    import psutil
    HAS_PSUTIL = True
except ImportError:
    HAS_PSUTIL = False
    print("Warning: psutil not installed. Install with: pip install psutil")


@dataclass
class ResourceSnapshot:
    """Snapshot of resource usage at a point in time."""
    timestamp: float
    cpu_percent: float
    memory_rss_mb: float
    memory_vms_mb: float
    memory_percent: float
    file_descriptors: int
    threads: int
    tracemalloc_current_mb: float = 0.0
    tracemalloc_peak_mb: float = 0.0


@dataclass
class ResourceReport:
    """Report of resource usage over time."""
    start_time: float
    end_time: float = 0.0
    snapshots: list[ResourceSnapshot] = field(default_factory=list)
    
    @property
    def duration_seconds(self) -> float:
        return self.end_time - self.start_time
    
    @property
    def memory_growth_mb(self) -> float:
        if len(self.snapshots) < 2:
            return 0.0
        return self.snapshots[-1].memory_rss_mb - self.snapshots[0].memory_rss_mb
    
    @property
    def fd_growth(self) -> int:
        if len(self.snapshots) < 2:
            return 0
        return self.snapshots[-1].file_descriptors - self.snapshots[0].file_descriptors
    
    @property
    def avg_cpu_percent(self) -> float:
        if not self.snapshots:
            return 0.0
        return sum(s.cpu_percent for s in self.snapshots) / len(self.snapshots)
    
    def to_dict(self) -> dict:
        return {
            "start_time": datetime.fromtimestamp(self.start_time).isoformat(),
            "end_time": datetime.fromtimestamp(self.end_time).isoformat(),
            "duration_seconds": self.duration_seconds,
            "snapshot_count": len(self.snapshots),
            "memory_growth_mb": self.memory_growth_mb,
            "fd_growth": self.fd_growth,
            "avg_cpu_percent": self.avg_cpu_percent,
            "final_memory_mb": self.snapshots[-1].memory_rss_mb if self.snapshots else 0,
            "final_fds": self.snapshots[-1].file_descriptors if self.snapshots else 0,
        }


class ResourceMonitor:
    """Monitor resource usage of a process."""
    
    # Thresholds for warnings
    MEMORY_GROWTH_WARNING_MB = 100  # Warn if memory grows by more than 100MB
    MEMORY_GROWTH_CRITICAL_MB = 500  # Critical if memory grows by more than 500MB
    FD_GROWTH_WARNING = 50  # Warn if file descriptors grow by more than 50
    FD_GROWTH_CRITICAL = 200  # Critical if file descriptors grow by more than 200
    
    def __init__(
        self,
        pid: Optional[int] = None,
        use_tracemalloc: bool = True
    ):
        self.pid = pid or os.getpid()
        self.use_tracemalloc = use_tracemalloc and pid is None  # Only works for current process
        self.process: Optional[psutil.Process] = None
        self.report = ResourceReport(start_time=time.time())
        
        if HAS_PSUTIL:
            try:
                self.process = psutil.Process(self.pid)
            except psutil.NoSuchProcess:
                raise ValueError(f"Process {pid} not found")
        
        if self.use_tracemalloc:
            tracemalloc.start()
    
    def take_snapshot(self) -> ResourceSnapshot:
        """Take a snapshot of current resource usage."""
        snapshot = ResourceSnapshot(
            timestamp=time.time(),
            cpu_percent=0.0,
            memory_rss_mb=0.0,
            memory_vms_mb=0.0,
            memory_percent=0.0,
            file_descriptors=0,
            threads=0,
        )
        
        if self.process:
            try:
                with self.process.oneshot():
                    snapshot.cpu_percent = self.process.cpu_percent()
                    mem_info = self.process.memory_info()
                    snapshot.memory_rss_mb = mem_info.rss / (1024 * 1024)
                    snapshot.memory_vms_mb = mem_info.vms / (1024 * 1024)
                    snapshot.memory_percent = self.process.memory_percent()
                    
                    # File descriptors (Unix only)
                    if hasattr(self.process, 'num_fds'):
                        snapshot.file_descriptors = self.process.num_fds()
                    else:
                        # Fallback: count /proc/PID/fd on Linux
                        try:
                            fd_dir = f"/proc/{self.pid}/fd"
                            if os.path.exists(fd_dir):
                                snapshot.file_descriptors = len(os.listdir(fd_dir))
                        except Exception:
                            pass
                    
                    snapshot.threads = self.process.num_threads()
                    
            except (psutil.NoSuchProcess, psutil.AccessDenied):
                pass
        
        if self.use_tracemalloc and tracemalloc.is_tracing():
            current, peak = tracemalloc.get_traced_memory()
            snapshot.tracemalloc_current_mb = current / (1024 * 1024)
            snapshot.tracemalloc_peak_mb = peak / (1024 * 1024)
        
        return snapshot
    
    def check_for_issues(self, snapshot: ResourceSnapshot) -> list[str]:
        """Check for resource issues and return warnings."""
        issues = []
        
        if len(self.report.snapshots) > 0:
            first = self.report.snapshots[0]
            
            # Memory growth check
            memory_growth = snapshot.memory_rss_mb - first.memory_rss_mb
            if memory_growth > self.MEMORY_GROWTH_CRITICAL_MB:
                issues.append(f"CRITICAL: Memory grew by {memory_growth:.1f}MB")
            elif memory_growth > self.MEMORY_GROWTH_WARNING_MB:
                issues.append(f"WARNING: Memory grew by {memory_growth:.1f}MB")
            
            # File descriptor growth check
            fd_growth = snapshot.file_descriptors - first.file_descriptors
            if fd_growth > self.FD_GROWTH_CRITICAL:
                issues.append(f"CRITICAL: File descriptors grew by {fd_growth}")
            elif fd_growth > self.FD_GROWTH_WARNING:
                issues.append(f"WARNING: File descriptors grew by {fd_growth}")
        
        return issues
    
    def monitor(
        self,
        duration_seconds: float,
        interval_seconds: float = 60,
        verbose: bool = True
    ) -> ResourceReport:
        """
        Monitor resources for a specified duration.
        
        Args:
            duration_seconds: How long to monitor
            interval_seconds: How often to take snapshots
            verbose: Print progress updates
        
        Returns:
            ResourceReport with all snapshots
        """
        self.report = ResourceReport(start_time=time.time())
        end_time = self.report.start_time + duration_seconds
        iteration = 0
        
        if verbose:
            print(f"Monitoring PID {self.pid} for {duration_seconds}s (interval: {interval_seconds}s)")
            print("-" * 80)
        
        while time.time() < end_time:
            snapshot = self.take_snapshot()
            self.report.snapshots.append(snapshot)
            
            issues = self.check_for_issues(snapshot)
            
            if verbose:
                elapsed = snapshot.timestamp - self.report.start_time
                status = (
                    f"[{iteration:4d}] "
                    f"CPU: {snapshot.cpu_percent:5.1f}% | "
                    f"RSS: {snapshot.memory_rss_mb:7.1f}MB | "
                    f"FDs: {snapshot.file_descriptors:4d} | "
                    f"Threads: {snapshot.threads:3d}"
                )
                
                if self.use_tracemalloc:
                    status += f" | Traced: {snapshot.tracemalloc_current_mb:7.1f}MB"
                
                print(status)
                
                for issue in issues:
                    print(f"  >>> {issue}")
            
            iteration += 1
            
            # Sleep until next interval
            next_snapshot = self.report.start_time + (iteration * interval_seconds)
            sleep_time = next_snapshot - time.time()
            if sleep_time > 0:
                time.sleep(min(sleep_time, interval_seconds))
        
        self.report.end_time = time.time()
        
        if self.use_tracemalloc:
            tracemalloc.stop()
        
        return self.report
    
    def get_summary(self) -> str:
        """Get a summary of the monitoring session."""
        if not self.report.snapshots:
            return "No snapshots taken"
        
        lines = [
            "=" * 60,
            "RESOURCE MONITORING SUMMARY",
            "=" * 60,
            f"Duration: {self.report.duration_seconds:.1f}s",
            f"Snapshots: {len(self.report.snapshots)}",
            f"Average CPU: {self.report.avg_cpu_percent:.1f}%",
            f"Memory Growth: {self.report.memory_growth_mb:+.1f}MB",
            f"FD Growth: {self.report.fd_growth:+d}",
            f"Final Memory: {self.report.snapshots[-1].memory_rss_mb:.1f}MB",
            f"Final FDs: {self.report.snapshots[-1].file_descriptors}",
            "=" * 60,
        ]
        
        # Assessment
        if self.report.memory_growth_mb > self.MEMORY_GROWTH_CRITICAL_MB:
            lines.append("ASSESSMENT: CRITICAL - Significant memory leak detected!")
        elif self.report.memory_growth_mb > self.MEMORY_GROWTH_WARNING_MB:
            lines.append("ASSESSMENT: WARNING - Possible memory leak")
        elif self.report.fd_growth > self.FD_GROWTH_CRITICAL:
            lines.append("ASSESSMENT: CRITICAL - File descriptor leak detected!")
        elif self.report.fd_growth > self.FD_GROWTH_WARNING:
            lines.append("ASSESSMENT: WARNING - Possible file descriptor leak")
        else:
            lines.append("ASSESSMENT: OK - No significant resource leaks detected")
        
        return "\n".join(lines)


def monitor_command(
    command: str,
    duration_seconds: float,
    interval_seconds: float = 60
) -> ResourceReport:
    """Monitor a command by running it in a subprocess."""
    print(f"Starting command: {command}")
    
    # Start the process
    proc = subprocess.Popen(
        command,
        shell=True,
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE
    )
    
    try:
        # Give it a moment to start
        time.sleep(2)
        
        # Monitor the process
        monitor = ResourceMonitor(pid=proc.pid, use_tracemalloc=False)
        report = monitor.monitor(
            duration_seconds=duration_seconds,
            interval_seconds=interval_seconds,
            verbose=True
        )
        
        return report
    
    finally:
        # Clean up the process
        if proc.poll() is None:
            print("\nTerminating monitored process...")
            proc.terminate()
            try:
                proc.wait(timeout=10)
            except subprocess.TimeoutExpired:
                proc.kill()


def main():
    parser = argparse.ArgumentParser(
        description="Monitor resource usage for Geometry OS processes"
    )
    
    group = parser.add_mutually_exclusive_group(required=True)
    group.add_argument(
        "--pid", "-p",
        type=int,
        help="Process ID to monitor"
    )
    group.add_argument(
        "--command", "-c",
        type=str,
        help="Command to run and monitor"
    )
    group.add_argument(
        "--self",
        action="store_true",
        help="Monitor the current Python process (for testing)"
    )
    
    parser.add_argument(
        "--duration", "-d",
        type=float,
        default=300,
        help="Duration to monitor in seconds (default: 300)"
    )
    parser.add_argument(
        "--interval", "-i",
        type=float,
        default=10,
        help="Snapshot interval in seconds (default: 10)"
    )
    parser.add_argument(
        "--output", "-o",
        type=str,
        help="Output file for JSON report"
    )
    parser.add_argument(
        "--no-tracemalloc",
        action="store_true",
        help="Disable tracemalloc (for monitoring external processes)"
    )
    
    args = parser.parse_args()
    
    if not HAS_PSUTIL:
        print("Error: psutil is required. Install with: pip install psutil")
        sys.exit(1)
    
    if args.command:
        report = monitor_command(
            args.command,
            args.duration,
            args.interval
        )
    elif args.self:
        # Self-monitoring mode (for testing)
        monitor = ResourceMonitor(use_tracemalloc=not args.no_tracemalloc)
        
        # Simulate some work
        def simulate_work():
            data = []
            for i in range(int(args.duration / args.interval)):
                # Simulate memory allocation
                data.append([0] * 10000)
                time.sleep(args.interval)
        
        import threading
        work_thread = threading.Thread(target=simulate_work)
        work_thread.start()
        
        report = monitor.monitor(
            args.duration,
            args.interval,
            verbose=True
        )
        
        work_thread.join()
    else:
        # Monitor existing process
        monitor = ResourceMonitor(
            pid=args.pid,
            use_tracemalloc=False
        )
        report = monitor.monitor(
            args.duration,
            args.interval,
            verbose=True
        )
    
    print("\n" + monitor.get_summary())
    
    if args.output:
        import json
        with open(args.output, 'w') as f:
            json.dump(report.to_dict(), f, indent=2)
        print(f"\nReport saved to: {args.output}")


if __name__ == "__main__":
    main()
