"""
ROI Analyzer for Ghost Self-Aware OS
Quantifies operational ROI and tracks performance metrics
"""

import json
import os
import time
from typing import Dict, Any, List
from datetime import datetime

class ROIAnalyzer:
    """
    Analyzes and quantifies the Return on Investment (ROI) of the Ghost OS
    Tracks operational metrics, developer productivity, and system performance
    """

    def __init__(self, ghost_daemon=None):
        self.ghost_daemon = ghost_daemon
        self.metrics_history = []
        self.baseline_metrics = None
        self.roi_reports = []

        # Load historical data if available
        self._load_historical_data()

    def _load_historical_data(self):
        """Load historical metrics from file"""
        try:
            if os.path.exists('roi_metrics.json'):
                with open('roi_metrics.json', 'r') as f:
                    self.metrics_history = json.load(f)
        except Exception as e:
            self._log(f"Failed to load historical data: {str(e)}", "warning")

    def _save_historical_data(self):
        """Save current metrics to file"""
        try:
            with open('roi_metrics.json', 'w') as f:
                json.dump(self.metrics_history, f, indent=2)
        except Exception as e:
            self._log(f"Failed to save historical data: {str(e)}", "warning")

    def set_baseline_metrics(self, metrics: Dict[str, Any]):
        """
        Set baseline metrics for comparison

        Args:
            metrics: Dictionary of baseline metrics
        """
        self.baseline_metrics = metrics
        self._log("📊 Baseline metrics established")

    def track_metrics(self, metrics: Dict[str, Any]):
        """
        Track current metrics and add to history

        Args:
            metrics: Dictionary of current metrics
        """
        timestamped_metrics = {
            'timestamp': datetime.now().isoformat(),
            **metrics
        }
        self.metrics_history.append(timestamped_metrics)
        self._save_historical_data()
        self._log(f"📈 Metrics tracked: {len(self.metrics_history)} total entries")

    def calculate_roi(self) -> Dict[str, Any]:
        """
        Calculate comprehensive ROI analysis

        Returns:
            ROI analysis dictionary
        """
        if not self.baseline_metrics or len(self.metrics_history) < 2:
            return {
                'status': 'insufficient_data',
                'message': 'Need baseline metrics and at least 2 data points',
                'recommendation': 'Run system operations and track metrics first'
            }

        # Get most recent metrics
        current_metrics = self.metrics_history[-1]

        roi_analysis = {
            'analysis_timestamp': datetime.now().isoformat(),
            'period_covered': {
                'start': self.metrics_history[0]['timestamp'],
                'end': current_metrics['timestamp']
            },
            'data_points': len(self.metrics_history),
            'metrics': {}
        }

        # Calculate improvements for each metric
        for metric_name, current_value in current_metrics.items():
            if metric_name == 'timestamp':
                continue

            if metric_name in self.baseline_metrics:
                baseline_value = self.baseline_metrics[metric_name]

                if isinstance(current_value, (int, float)) and isinstance(baseline_value, (int, float)):
                    improvement = current_value - baseline_value
                    improvement_pct = (improvement / baseline_value) * 100 if baseline_value != 0 else 0

                    roi_analysis['metrics'][metric_name] = {
                        'baseline': baseline_value,
                        'current': current_value,
                        'improvement': improvement,
                        'improvement_pct': improvement_pct,
                        'direction': 'positive' if improvement > 0 else 'negative'
                    }

        # Calculate overall ROI
        roi_analysis['overall_roi'] = self._calculate_overall_roi(roi_analysis['metrics'])

        # Add to reports
        self.roi_reports.append(roi_analysis)
        self._save_roi_report(roi_analysis)

        return roi_analysis

    def _calculate_overall_roi(self, metrics: Dict) -> Dict[str, Any]:
        """
        Calculate overall ROI based on individual metrics

        Args:
            metrics: Dictionary of metric improvements

        Returns:
            Overall ROI dictionary
        """
        # Weight different metrics based on importance
        weights = {
            'developer_productivity': 0.4,
            'system_reliability': 0.3,
            'operational_efficiency': 0.2,
            'cost_reduction': 0.1
        }

        weighted_score = 0
        total_weight = 0

        for metric_name, metric_data in metrics.items():
            # Map metric names to weight categories
            if 'productivity' in metric_name.lower():
                weight = weights['developer_productivity']
            elif 'reliability' in metric_name.lower() or 'uptime' in metric_name.lower():
                weight = weights['system_reliability']
            elif 'efficiency' in metric_name.lower() or 'performance' in metric_name.lower():
                weight = weights['operational_efficiency']
            elif 'cost' in metric_name.lower() or 'savings' in metric_name.lower():
                weight = weights['cost_reduction']
            else:
                weight = 0.05  # Default weight

            # Calculate contribution (positive improvements only)
            if metric_data['improvement_pct'] > 0:
                weighted_score += metric_data['improvement_pct'] * weight
                total_weight += weight

        # Calculate overall ROI score
        overall_score = weighted_score / total_weight if total_weight > 0 else 0

        return {
            'weighted_roi_score': overall_score,
            'interpretation': self._interpret_roi_score(overall_score),
            'valuation_impact': self._calculate_valuation_impact(overall_score)
        }

    def _interpret_roi_score(self, score: float) -> str:
        """
        Interpret the ROI score

        Args:
            score: ROI score

        Returns:
            Interpretation string
        """
        if score > 50:
            return "Exceptional ROI - System demonstrates transformative value"
        elif score > 25:
            return "Strong ROI - Significant operational improvements achieved"
        elif score > 10:
            return "Good ROI - Measurable benefits realized"
        elif score > 0:
            return "Positive ROI - System provides value"
        else:
            return "Needs improvement - ROI not yet demonstrated"

    def _calculate_valuation_impact(self, score: float) -> Dict[str, Any]:
        """
        Calculate potential valuation impact based on ROI score

        Args:
            score: ROI score

        Returns:
            Valuation impact dictionary
        """
        # Base valuation increase factors
        if score > 50:
            valuation_factor = 10.0  # 10x increase
            justification = "Transformative technology with exceptional ROI"
        elif score > 25:
            valuation_factor = 5.0  # 5x increase
            justification = "Significant operational improvements with strong ROI"
        elif score > 10:
            valuation_factor = 3.0  # 3x increase
            justification = "Proven value with good ROI"
        elif score > 0:
            valuation_factor = 1.5  # 1.5x increase
            justification = "Positive ROI demonstrates system value"
        else:
            valuation_factor = 1.0  # No increase
            justification = "ROI not yet sufficient for valuation increase"

        return {
            'valuation_factor': valuation_factor,
            'justification': justification,
            'commercial_potential': "High" if score > 25 else "Medium" if score > 10 else "Developing"
        }

    def generate_roi_report(self) -> str:
        """
        Generate a human-readable ROI report

        Returns:
            Formatted ROI report string
        """
        if not self.roi_reports:
            return "No ROI reports available. Please calculate ROI first."

        latest_report = self.roi_reports[-1]

        report = []
        report.append("=" * 60)
        report.append("GHOST SELF-AWARE OS - ROI ANALYSIS REPORT")
        report.append("=" * 60)
        report.append(f"Generated: {latest_report['analysis_timestamp']}")
        report.append(f"Period: {latest_report['period_covered']['start']} to {latest_report['period_covered']['end']}")
        report.append(f"Data Points: {latest_report['data_points']}")
        report.append("")

        if latest_report.get('status') == 'insufficient_data':
            report.append("STATUS: INSUFFICIENT DATA")
            report.append(latest_report['message'])
            report.append(f"Recommendation: {latest_report['recommendation']}")
            return "\n".join(report)

        report.append("METRIC IMPROVEMENTS:")
        report.append("-" * 60)

        for metric_name, metric_data in latest_report['metrics'].items():
            report.append(f"{metric_name.upper():<25} {metric_data['improvement_pct']:+.1f}%")
            report.append(f"  Baseline: {metric_data['baseline']:.2f} | Current: {metric_data['current']:.2f}")
            report.append(f"  Direction: {metric_data['direction']}")

        report.append("")
        report.append("OVERALL ROI ANALYSIS:")
        report.append("-" * 60)
        report.append(f"Weighted ROI Score: {latest_report['overall_roi']['weighted_roi_score']:.1f}%")
        report.append(f"Interpretation: {latest_report['overall_roi']['interpretation']}")
        report.append("")
        report.append("VALUATION IMPACT:")
        report.append("-" * 60)
        report.append(f"Valuation Factor: {latest_report['overall_roi']['valuation_impact']['valuation_factor']}x")
        report.append(f"Justification: {latest_report['overall_roi']['valuation_impact']['justification']}")
        report.append(f"Commercial Potential: {latest_report['overall_roi']['valuation_impact']['commercial_potential']}")

        return "\n".join(report)

    def _save_roi_report(self, report: Dict):
        """Save ROI report to file"""
        try:
            report_id = f"roi_report_{datetime.now().strftime('%Y%m%d_%H%M%S')}.json"
            with open(report_id, 'w') as f:
                json.dump(report, f, indent=2)
            self._log(f"📄 ROI report saved: {report_id}")
        except Exception as e:
            self._log(f"Failed to save ROI report: {str(e)}", "warning")

    def get_performance_trends(self) -> Dict[str, Any]:
        """
        Analyze performance trends over time

        Returns:
            Trends analysis dictionary
        """
        if len(self.metrics_history) < 3:
            return {
                'status': 'insufficient_data',
                'message': 'Need at least 3 data points for trend analysis'
            }

        trends = {
            'status': 'analyzed',
            'period': {
                'start': self.metrics_history[0]['timestamp'],
                'end': self.metrics_history[-1]['timestamp']
            },
            'metrics': {},
            'overall_trend': 'stable'
        }

        # Analyze trends for each metric
        for metric_name in self.metrics_history[0].keys():
            if metric_name == 'timestamp':
                continue

            # Collect all values for this metric
            values = []
            for entry in self.metrics_history:
                if metric_name in entry:
                    values.append(entry[metric_name])

            if len(values) >= 3 and all(isinstance(v, (int, float)) for v in values):
                # Simple trend analysis
                start_val = values[0]
                end_val = values[-1]
                change = end_val - start_val
                change_pct = (change / start_val) * 100 if start_val != 0 else 0

                # Determine trend direction
                if change_pct > 5:
                    trend = 'improving'
                elif change_pct < -5:
                    trend = 'declining'
                else:
                    trend = 'stable'

                trends['metrics'][metric_name] = {
                    'start_value': start_val,
                    'end_value': end_val,
                    'change': change,
                    'change_pct': change_pct,
                    'trend': trend
                }

                # Update overall trend
                if trend == 'improving':
                    trends['overall_trend'] = 'improving'
                elif trend == 'declining' and trends['overall_trend'] != 'improving':
                    trends['overall_trend'] = 'declining'

        return trends

    def _log(self, message: str, level: str = "info"):
        """Log a message"""
        timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        log_entry = f"[{timestamp}] [{level.upper()}] {message}"

        print(log_entry)

        # Also log to file
        try:
            with open("roi_analyzer.log", "a") as f:
                f.write(log_entry + "\n")
        except:
            pass

        # Log to daemon if available
        if self.ghost_daemon:
            self.ghost_daemon.log(f"[ROI Analyzer] {message}", level)

# Integration with Ghost Daemon
class GhostDaemonROIIntegration:
    """
    Integration class for ROI Analyzer with Ghost Daemon
    """

    def __init__(self, ghost_daemon):
        self.ghost_daemon = ghost_daemon
        self.roi_analyzer = ROIAnalyzer(ghost_daemon)

    def track_operation(self, operation_type: str, metrics: Dict[str, Any]):
        """
        Track an operation and its metrics

        Args:
            operation_type: Type of operation
            metrics: Performance metrics
        """
        # Add operation type to metrics
        metrics['operation_type'] = operation_type

        self.roi_analyzer.track_metrics(metrics)
        self._log(f"📊 Tracked {operation_type} operation")

    def calculate_and_report_roi(self) -> Dict[str, Any]:
        """
        Calculate ROI and generate report

        Returns:
            ROI analysis result
        """
        result = self.roi_analyzer.calculate_roi()

        if result.get('status') != 'insufficient_data':
            report = self.roi_analyzer.generate_roi_report()
            print("\n" + report)

        return result

    def _log(self, message: str, level: str = "info"):
        """Log a message"""
        self.ghost_daemon.log(f"[ROI Integration] {message}", level)

if __name__ == "__main__":
    print("💰 ROI Analyzer for Ghost Self-Aware OS")
    print("📊 Tracks operational metrics and quantifies return on investment")
    print("📈 Demonstrates the commercial value of self-aware systems")