#!/usr/bin/env python3
"""
Continuous Profiling Daemon for Geometry OS

Monitors performance over time by periodically running benchmarks
and storing historical data for trend analysis.

Features:
- Periodic benchmark execution
- Historical data storage
- Trend analysis and anomaly detection
- Alert generation for significant changes

Usage:
    python scripts/profiling/continuous_profiler.py --interval 300
    python scripts/profiling/continuous_profiler.py --once
    python scripts/profiling/continuous_profiler.py --analyze
"""

import argparse
import json
import signal
import sqlite3
import statistics
import time
from dataclasses import dataclass
from datetime import datetime, timedelta
from pathlib import Path
from typing import Dict, List, Optional, Any

PROJECT_ROOT = Path(__file__).parent.parent.parent
PROFILING_DIR = PROJECT_ROOT / "profiling_results"
HISTORY_DB = PROFILING_DIR / "performance_history.db"


@dataclass
class PerformanceRecord:
    """A single performance measurement record"""
    timestamp: str
    benchmark: str
    metric: str
    value: float
    unit: str
    metadata: Dict[str, Any]


class PerformanceHistory:
    """SQLite-based performance history storage"""

    def __init__(self, db_path: Path = HISTORY_DB):
        db_path.parent.mkdir(parents=True, exist_ok=True)
        self.conn = sqlite3.connect(str(db_path))
        self._init_db()

    def _init_db(self):
        """Initialize database schema"""
        self.conn.execute('''
            CREATE TABLE IF NOT EXISTS performance_records (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                timestamp TEXT NOT NULL,
                benchmark TEXT NOT NULL,
                metric TEXT NOT NULL,
                value REAL NOT NULL,
                unit TEXT,
                metadata TEXT
            )
        ''')
        self.conn.execute('''
            CREATE INDEX IF NOT EXISTS idx_benchmark_metric
            ON performance_records(benchmark, metric)
        ''')
        self.conn.execute('''
            CREATE INDEX IF NOT EXISTS idx_timestamp
            ON performance_records(timestamp)
        ''')
        self.conn.commit()

    def record(self, record: PerformanceRecord):
        """Store a performance record"""
        self.conn.execute('''
            INSERT INTO performance_records
            (timestamp, benchmark, metric, value, unit, metadata)
            VALUES (?, ?, ?, ?, ?, ?)
        ''', (
            record.timestamp,
            record.benchmark,
            record.metric,
            record.value,
            record.unit,
            json.dumps(record.metadata)
        ))
        self.conn.commit()

    def get_recent(
        self,
        benchmark: str,
        metric: str,
        hours: int = 24
    ) -> List[Dict[str, Any]]:
        """Get recent records for a benchmark/metric"""
        cutoff = (datetime.now() - timedelta(hours=hours)).isoformat()
        cursor = self.conn.execute('''
            SELECT timestamp, value, metadata
            FROM performance_records
            WHERE benchmark = ? AND metric = ? AND timestamp > ?
            ORDER BY timestamp DESC
        ''', (benchmark, metric, cutoff))

        return [
            {"timestamp": row[0], "value": row[1], "metadata": json.loads(row[2]) if row[2] else {}}
            for row in cursor.fetchall()
        ]

    def get_all_for_analysis(
        self,
        benchmark: str,
        metric: str,
        days: int = 7
    ) -> List[Dict[str, Any]]:
        """Get all records for trend analysis"""
        cutoff = (datetime.now() - timedelta(days=days)).isoformat()
        cursor = self.conn.execute('''
            SELECT timestamp, value
            FROM performance_records
            WHERE benchmark = ? AND metric = ? AND timestamp > ?
            ORDER BY timestamp ASC
        ''', (benchmark, metric, cutoff))

        return [{"timestamp": row[0], "value": row[1]} for row in cursor.fetchall()]

    def cleanup_old(self, days: int = 30):
        """Remove records older than specified days"""
        cutoff = (datetime.now() - timedelta(days=days)).isoformat()
        self.conn.execute(
            'DELETE FROM performance_records WHERE timestamp < ?',
            (cutoff,)
        )
        self.conn.commit()

    def close(self):
        """Close database connection"""
        self.conn.close()


class TrendAnalyzer:
    """Analyze performance trends and detect anomalies"""

    def __init__(self, history: PerformanceHistory):
        self.history = history

    def analyze_trend(
        self,
        benchmark: str,
        metric: str,
        days: int = 7
    ) -> Dict[str, Any]:
        """Analyze performance trend"""
        records = self.history.get_all_for_analysis(benchmark, metric, days)

        if len(records) < 3:
            return {
                "status": "insufficient_data",
                "record_count": len(records)
            }

        values = [r['value'] for r in records]

        # Calculate statistics
        mean = statistics.mean(values)
        stdev = statistics.stdev(values) if len(values) > 1 else 0

        # Linear regression for trend
        n = len(values)
        x = list(range(n))
        x_mean = sum(x) / n
        y_mean = mean

        numerator = sum((x[i] - x_mean) * (values[i] - y_mean) for i in range(n))
        denominator = sum((x[i] - x_mean) ** 2 for i in range(n))

        slope = numerator / denominator if denominator != 0 else 0

        # Determine trend direction
        if abs(slope) < 0.001:
            trend = "stable"
        elif slope > 0:
            trend = "degrading"  # Higher values = slower
        else:
            trend = "improving"  # Lower values = faster

        # Detect anomalies (values > 2 stdev from mean)
        anomalies = [
            records[i] for i in range(n)
            if abs(values[i] - mean) > 2 * stdev
        ]

        return {
            "status": "analyzed",
            "record_count": len(records),
            "mean": mean,
            "stdev": stdev,
            "min": min(values),
            "max": max(values),
            "slope": slope,
            "trend": trend,
            "anomaly_count": len(anomalies),
            "anomalies": anomalies[:5]  # First 5 anomalies
        }

    def detect_regressions(
        self,
        benchmark: str,
        metric: str,
        current_value: float,
        threshold_stdev: float = 2.0
    ) -> Optional[Dict[str, Any]]:
        """Detect if current value is a regression"""
        records = self.history.get_all_for_analysis(benchmark, metric, days=7)

        if len(records) < 5:
            return None

        values = [r['value'] for r in records]
        mean = statistics.mean(values)
        stdev = statistics.stdev(values)

        if stdev == 0:
            return None

        z_score = (current_value - mean) / stdev

        if z_score > threshold_stdev:
            return {
                "type": "regression",
                "current_value": current_value,
                "mean": mean,
                "stdev": stdev,
                "z_score": z_score,
                "severity": "high" if z_score > 3 else "medium"
            }
        elif z_score < -threshold_stdev:
            return {
                "type": "improvement",
                "current_value": current_value,
                "mean": mean,
                "stdev": stdev,
                "z_score": z_score
            }

        return None


class ContinuousProfiler:
    """Main continuous profiling controller"""

    def __init__(
        self,
        interval_seconds: int = 300,
        verbose: bool = False
    ):
        self.interval = interval_seconds
        self.verbose = verbose
        self.history = PerformanceHistory()
        self.analyzer = TrendAnalyzer(self.history)
        self.running = True

        # Handle shutdown signals
        signal.signal(signal.SIGINT, self._shutdown)
        signal.signal(signal.SIGTERM, self._shutdown)

    def _shutdown(self, signum, frame):
        """Handle shutdown signal"""
        print("\nShutting down continuous profiler...")
        self.running = False

    def log(self, message: str):
        """Log message with timestamp"""
        if self.verbose:
            print(f"[{datetime.now().isoformat()}] {message}")

    def run_benchmarks(self) -> Dict[str, Any]:
        """Run benchmarks and return results"""
        import subprocess

        cmd = ["python3", "benchmarks/comprehensive_benchmark.py"]

        try:
            result = subprocess.run(
                cmd,
                capture_output=True,
                text=True,
                timeout=300,
                cwd=str(PROJECT_ROOT)
            )

            # Find output file
            for line in result.stdout.split('\n'):
                if 'Results saved to:' in line:
                    output_file = line.split('Results saved to:')[-1].strip()
                    if Path(output_file).exists():
                        with open(output_file) as f:
                            return json.load(f)

            return {"error": "Could not find benchmark output"}

        except subprocess.TimeoutExpired:
            return {"error": "Benchmark timeout"}
        except Exception as e:
            return {"error": str(e)}

    def store_results(self, results: Dict[str, Any]):
        """Store benchmark results in history"""
        timestamp = results.get('timestamp', datetime.now().isoformat())

        for result in results.get('results', []):
            benchmark = result['name']

            for metric_name, value in result.get('metrics', {}).items():
                if isinstance(value, dict) and 'mean' in value:
                    record = PerformanceRecord(
                        timestamp=timestamp,
                        benchmark=benchmark,
                        metric=metric_name,
                        value=value['mean'],
                        unit='ms',
                        metadata={'status': result.get('status')}
                    )
                    self.history.record(record)
                    self.log(f"Recorded: {benchmark}/{metric_name} = {value['mean']:.6f}ms")

    def check_trends(self) -> List[Dict[str, Any]]:
        """Check trends for all known benchmarks"""
        alerts = []

        # Get list of benchmarks we have data for
        cursor = self.history.conn.execute(
            'SELECT DISTINCT benchmark, metric FROM performance_records'
        )

        for row in cursor.fetchall():
            benchmark, metric = row
            trend = self.analyzer.analyze_trend(benchmark, metric)

            if trend.get('trend') == 'degrading' and trend.get('slope', 0) > 0.01:
                alerts.append({
                    "type": "trend_alert",
                    "benchmark": benchmark,
                    "metric": metric,
                    "trend": trend
                })

        return alerts

    def run_once(self):
        """Run profiling once"""
        self.log("Running benchmarks...")
        results = self.run_benchmarks()

        if "error" in results:
            print(f"Error: {results['error']}")
            return

        self.store_results(results)

        # Check for trends
        alerts = self.check_trends()
        if alerts:
            print("\n⚠️  Performance Alerts:")
            for alert in alerts:
                print(f"  {alert['benchmark']}/{alert['metric']}: {alert['trend']['trend']}")

        print("\nProfiling complete.")

    def run_continuous(self):
        """Run continuous profiling loop"""
        print(f"Starting continuous profiler (interval: {self.interval}s)")
        print("Press Ctrl+C to stop\n")

        while self.running:
            try:
                self.log("Running benchmarks...")
                results = self.run_benchmarks()

                if "error" not in results:
                    self.store_results(results)

                    # Check trends
                    alerts = self.check_trends()
                    if alerts:
                        for alert in alerts:
                            self.log(f"ALERT: {alert['benchmark']}/{alert['metric']} - {alert['trend']['trend']}")

                # Cleanup old records
                self.history.cleanup_old(days=30)

                # Wait for next interval
                for _ in range(self.interval):
                    if not self.running:
                        break
                    time.sleep(1)

            except Exception as e:
                self.log(f"Error: {e}")
                time.sleep(60)  # Wait before retrying

        self.history.close()
        print("Continuous profiler stopped.")

    def analyze(self, days: int = 7):
        """Analyze historical data and print report"""
        print(f"\nPerformance Trend Analysis (last {days} days)")
        print("=" * 70)

        cursor = self.history.conn.execute(
            'SELECT DISTINCT benchmark, metric FROM performance_records'
        )

        for row in cursor.fetchall():
            benchmark, metric = row
            trend = self.analyzer.analyze_trend(benchmark, metric, days)

            if trend.get('status') == 'insufficient_data':
                continue

            print(f"\n{benchmark} / {metric}")
            print(f"  Records: {trend['record_count']}")
            print(f"  Mean: {trend['mean']:.6f}ms")
            print(f"  StdDev: {trend['stdev']:.6f}ms")
            print(f"  Range: {trend['min']:.6f} - {trend['max']:.6f}ms")

            trend_icon = {"improving": "📉", "stable": "➡️", "degrading": "📈"}
            print(f"  Trend: {trend_icon.get(trend['trend'], '❓')} {trend['trend']}")

            if trend['anomaly_count'] > 0:
                print(f"  Anomalies: {trend['anomaly_count']}")


def main():
    parser = argparse.ArgumentParser(
        description="Continuous Performance Profiling for Geometry OS"
    )
    parser.add_argument(
        "--interval", "-i",
        type=int,
        default=300,
        help="Profiling interval in seconds (default: 300)"
    )
    parser.add_argument(
        "--once",
        action="store_true",
        help="Run profiling once and exit"
    )
    parser.add_argument(
        "--analyze",
        action="store_true",
        help="Analyze historical data and exit"
    )
    parser.add_argument(
        "--days",
        type=int,
        default=7,
        help="Days of history to analyze (default: 7)"
    )
    parser.add_argument(
        "--verbose", "-v",
        action="store_true",
        help="Verbose output"
    )

    args = parser.parse_args()

    profiler = ContinuousProfiler(
        interval_seconds=args.interval,
        verbose=args.verbose
    )

    if args.analyze:
        profiler.analyze(days=args.days)
    elif args.once:
        profiler.run_once()
    else:
        profiler.run_continuous()


if __name__ == "__main__":
    main()
