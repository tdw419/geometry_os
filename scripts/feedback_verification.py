#!/usr/bin/env python3
"""
Feedback System Verification Script

This script monitors the feedback collection system over a sprint
and evaluates its effectiveness.

Usage:
    python scripts/feedback_verification.py --start-sprint "Sprint 42"
    python scripts/feedback_verification.py --status
    python scripts/feedback_verification.py --end-sprint
    python scripts/feedback_verification.py --simulate
"""

import argparse
import json
import sys
import time
from datetime import datetime
from pathlib import Path

# Add project root to path
PROJECT_ROOT = Path(__file__).parent.parent
sys.path.insert(0, str(PROJECT_ROOT))


def start_sprint(sprint_name: str):
    """Start tracking a new sprint."""
    from systems.feedback.integration import create_feedback_system

    system = create_feedback_system()
    system.start_sprint(sprint_name)

    print(f"✅ Started sprint: {sprint_name}")
    print(f"   Started at: {datetime.utcnow().isoformat()}")
    print(f"   Data directory: {system.config.storage_path}")

    # Save sprint info
    sprint_file = system.config.storage_path / "current_sprint.json"
    with open(sprint_file, "w") as f:
        json.dump({
            "name": sprint_name,
            "start_time": datetime.utcnow().isoformat(),
        }, f)

    system.shutdown()


def get_status():
    """Get current sprint status."""
    from systems.feedback.integration import create_feedback_system

    system = create_feedback_system()

    # Check for active sprint
    sprint_file = system.config.storage_path / "current_sprint.json"
    if sprint_file.exists():
        with open(sprint_file) as f:
            sprint_info = json.load(f)

        # Restore sprint tracking
        from datetime import datetime
        system._sprint_start = datetime.fromisoformat(sprint_info["start_time"])
        system._sprint_name = sprint_info["name"]

    status = system.get_sprint_status()

    print("\n" + "=" * 60)
    print("📊 FEEDBACK SYSTEM STATUS")
    print("=" * 60)

    if status.get("sprint_active"):
        print(f"\n🏃 Active Sprint: {status['sprint_name']}")
        print(f"   Started: {status['sprint_start']}")
        print(f"   Duration: {status['duration_hours']:.2f} hours")
        print(f"   Feedback entries: {status['feedback_count']}")
        print(f"   Events tracked: {status['event_count']}")
        print(f"   Unresolved issues: {status['unresolved_issues']}")
    else:
        print("\n⚠️  No active sprint")

    # Get overall stats
    dashboard = system.get_dashboard_data()

    print("\n📈 OVERALL METRICS")
    print("-" * 40)
    print(f"   Total feedback: {dashboard['overview']['total_feedback']}")
    print(f"   Total events: {dashboard['overview']['total_events']}")
    print(f"   Active insights: {dashboard['overview']['active_insights']}")

    if dashboard.get('feedback_stats'):
        stats = dashboard['feedback_stats']
        if stats.get('average_rating'):
            print(f"   Average rating: {stats['average_rating']:.2f}")

    if dashboard.get('metrics'):
        metrics = dashboard['metrics']
        if metrics.get('nps', {}).get('nps') is not None:
            print(f"   NPS: {metrics['nps']['nps']}")
        if metrics.get('sus', {}).get('sus') is not None:
            print(f"   SUS: {metrics['sus']['sus']} ({metrics['sus']['grade']})")

    if dashboard.get('sentiment'):
        sentiment = dashboard['sentiment']
        print(f"\n💭 SENTIMENT")
        print(f"   Distribution: {sentiment.get('distribution', {})}")
        if sentiment.get('average_score'):
            print(f"   Average score: {sentiment['average_score']:.2f}")

    print("\n" + "=" * 60)

    system.shutdown()


def end_sprint():
    """End the current sprint and generate report."""
    from systems.feedback.integration import create_feedback_system

    system = create_feedback_system()

    # Check for active sprint
    sprint_file = system.config.storage_path / "current_sprint.json"
    if not sprint_file.exists():
        print("❌ No active sprint found")
        return

    with open(sprint_file) as f:
        sprint_info = json.load(f)

    # Restore sprint tracking
    system._sprint_start = datetime.fromisoformat(sprint_info["start_time"])
    system._sprint_name = sprint_info["name"]

    print(f"\n🏁 Ending sprint: {system._sprint_name}")
    print("   Generating report...")

    report = system.end_sprint()

    # Clear sprint file
    sprint_file.unlink()

    print("\n" + "=" * 60)
    print("📋 SPRINT REPORT")
    print("=" * 60)

    print(f"\n   Sprint: {report['sprint_name']}")
    print(f"   Duration: {report['duration_hours']:.2f} hours")

    print(f"\n📊 FEEDBACK SUMMARY")
    print(f"   Total entries: {report['feedback_summary']['total']}")
    print(f"   Unresolved: {report['feedback_summary']['unresolved']}")

    if report['feedback_summary'].get('by_type'):
        print("   By type:")
        for t, c in report['feedback_summary']['by_type'].items():
            print(f"      - {t}: {c}")

    print(f"\n💡 INSIGHTS GENERATED: {len(report['insights'])}")
    for insight in report['insights'][:5]:
        print(f"   [{insight['priority']}] {insight['title']}")

    if len(report['insights']) > 5:
        print(f"   ... and {len(report['insights']) - 5} more")

    print(f"\n📈 METRICS")
    metrics = report.get('metrics', {}).get('metrics', {})
    if metrics.get('nps', {}).get('nps') is not None:
        print(f"   NPS: {metrics['nps']['nps']}")
    if metrics.get('sus', {}).get('sus') is not None:
        print(f"   SUS: {metrics['sus']['sus']} ({metrics['sus']['grade']})")
    if metrics.get('error_rate', {}).get('error_rate'):
        print(f"   Error rate: {metrics['error_rate']['error_rate'] * 100:.1f}%")

    print(f"\n📁 Report saved to: {system.config.storage_path}")

    # Print effectiveness evaluation
    print("\n" + "=" * 60)
    print("✅ EFFECTIVENESS EVALUATION")
    print("=" * 60)

    total_feedback = report['feedback_summary']['total']
    insights = len(report['insights'])

    if total_feedback >= 10:
        print("   ✅ Good feedback volume (>= 10 entries)")
    else:
        print(f"   ⚠️  Low feedback volume ({total_feedback} entries)")

    if insights >= 3:
        print("   ✅ Sufficient insights generated (>= 3)")
    else:
        print(f"   ⚠️  Few insights generated ({insights})")

    unresolved = report['feedback_summary'].get('unresolved', 0)
    if unresolved == 0:
        print("   ✅ All issues resolved")
    elif unresolved <= 3:
        print(f"   ⚠️  Some unresolved issues ({unresolved})")
    else:
        print(f"   ❌ Many unresolved issues ({unresolved})")

    system.shutdown()


def simulate_activity():
    """Simulate feedback activity for testing."""
    from systems.feedback.integration import create_feedback_system

    print("\n🎭 Simulating feedback activity...\n")

    system = create_feedback_system()
    system.start_sprint("simulation_test")

    # Simulate ratings
    print("   Submitting ratings...")
    ratings = [5, 4, 5, 3, 4, 2, 5, 4, 3, 4]
    for r in ratings:
        system.submit_rating(r, component=f"component_{r % 3}")
        time.sleep(0.1)

    # Simulate comments
    print("   Submitting comments...")
    comments = [
        "Great interface!",
        "Would love dark mode support",
        "Performance could be better",
        "Very intuitive design",
        "Confusing navigation",
    ]
    for c in comments:
        system.submit_comment(c)
        time.sleep(0.1)

    # Simulate bug reports
    print("   Submitting bug reports...")
    system.submit_bug_report(
        description="Crash on export",
        component="export",
        severity="high",
    )
    system.submit_bug_report(
        description="Button misaligned",
        component="ui",
        severity="low",
    )

    # Simulate interactions
    print("   Tracking interactions...")
    from systems.feedback.tracker import EventType
    for i in range(20):
        system.track_event(
            event_type=EventType.CLICK if i % 2 == 0 else EventType.FEATURE_USE,
            component=f"comp_{i % 4}",
            data={"index": i},
        )
        time.sleep(0.05)

    # Generate report
    print("\n   Generating sprint report...\n")
    report = system.end_sprint()

    print("✅ Simulation complete!")
    print(f"   - Feedback entries: {report['feedback_summary']['total']}")
    print(f"   - Insights: {len(report['insights'])}")

    system.shutdown()


def export_dashboard():
    """Export dashboard data."""
    from systems.feedback.integration import create_feedback_system

    system = create_feedback_system()
    output_path = system.export_dashboard()

    print(f"✅ Dashboard exported to: {output_path}")

    system.shutdown()


def main():
    parser = argparse.ArgumentParser(
        description="Feedback System Verification Tool",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
    Start a sprint:
        python scripts/feedback_verification.py --start-sprint "Sprint 42"

    Check status:
        python scripts/feedback_verification.py --status

    End sprint:
        python scripts/feedback_verification.py --end-sprint

    Simulate activity:
        python scripts/feedback_verification.py --simulate

    Export dashboard:
        python scripts/feedback_verification.py --export
        """,
    )

    parser.add_argument(
        "--start-sprint",
        metavar="NAME",
        help="Start a new sprint with the given name",
    )
    parser.add_argument(
        "--status",
        action="store_true",
        help="Show current sprint status",
    )
    parser.add_argument(
        "--end-sprint",
        action="store_true",
        help="End the current sprint and generate report",
    )
    parser.add_argument(
        "--simulate",
        action="store_true",
        help="Simulate feedback activity for testing",
    )
    parser.add_argument(
        "--export",
        action="store_true",
        help="Export dashboard data to JSON",
    )

    args = parser.parse_args()

    if args.start_sprint:
        start_sprint(args.start_sprint)
    elif args.status:
        get_status()
    elif args.end_sprint:
        end_sprint()
    elif args.simulate:
        simulate_activity()
    elif args.export:
        export_dashboard()
    else:
        parser.print_help()


if __name__ == "__main__":
    main()
