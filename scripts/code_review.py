#!/usr/bin/env python3
"""
Geometry OS Code Review System

Manages scheduled code reviews, tracks adherence, and generates reports.
Usage: python3 scripts/code_review.py --help
"""

import argparse
import json
import os
import subprocess
from dataclasses import dataclass, field, asdict
from datetime import datetime, timedelta
from pathlib import Path
from typing import Optional
import re


# Project root
PROJECT_ROOT = Path(__file__).parent.parent
REVIEWS_DIR = PROJECT_ROOT / ".geometry" / "reviews"
SCHEDULE_FILE = REVIEWS_DIR / "schedule.json"
ADHERENCE_FILE = REVIEWS_DIR / "metrics" / "adherence.json"


@dataclass
class ReviewArea:
    """Definition of a review area."""
    name: str
    paths: list[str]
    schedule: str  # weekly, biweekly, monthly
    day: str  # monday, thursday, first-monday, etc.
    focus: str
    last_review: Optional[str] = None
    next_review: Optional[str] = None


@dataclass
class ReviewResult:
    """Result of a code review."""
    area: str
    date: str
    reviewer: str
    review_type: str
    files_reviewed: int
    lines_changed: int
    critical_issues: int
    important_issues: int
    minor_issues: int
    quality_score: float
    summary: str
    issues: list[dict] = field(default_factory=list)
    recommendations: list[str] = field(default_factory=list)


# Default review areas
DEFAULT_AREAS = {
    "core_systems": ReviewArea(
        name="Core Systems",
        paths=["systems/core/", "evolution_daemon_v8.py", "sisyphus_v4.py"],
        schedule="weekly",
        day="monday",
        focus="Architecture, performance, safety"
    ),
    "visual_shell": ReviewArea(
        name="Visual Shell",
        paths=["systems/visual_shell/", "map_terminal.py", "headless_gui.py"],
        schedule="weekly",
        day="monday",
        focus="Rendering, memory, UX"
    ),
    "pixel_systems": ReviewArea(
        name="Pixel Systems",
        paths=["systems/pixel*", "pixelrts_v2/", "pixel_brain_converter.py"],
        schedule="weekly",
        day="monday",
        focus="Binary handling, WASM, encoding"
    ),
    "testing": ReviewArea(
        name="Testing",
        paths=["tests/", "conftest.py", "run_tests.py"],
        schedule="weekly",
        day="monday",
        focus="Coverage, test quality, fixtures"
    ),
    "rust_components": ReviewArea(
        name="Rust Components",
        paths=["systems/infinite_map_rs/"],
        schedule="biweekly",
        day="thursday",
        focus="Memory safety, idiomatic Rust, performance"
    ),
    "documentation": ReviewArea(
        name="Documentation",
        paths=["*.md", "docs/"],
        schedule="biweekly",
        day="thursday",
        focus="Accuracy, completeness, freshness"
    ),
    "configuration": ReviewArea(
        name="Configuration",
        paths=["*.yaml", "*.toml", "Makefile", ".pre-commit-config.yaml"],
        schedule="biweekly",
        day="thursday",
        focus="Security, consistency, best practices"
    ),
    "security_audit": ReviewArea(
        name="Security Audit",
        paths=["systems/", "scripts/"],
        schedule="monthly",
        day="first-monday",
        focus="Vulnerabilities, OWASP compliance"
    ),
    "performance": ReviewArea(
        name="Performance",
        paths=["benchmarks/", "profiling_results/"],
        schedule="monthly",
        day="first-monday",
        focus="Regression detection, optimization"
    ),
}


def init_reviews_dir():
    """Initialize the reviews directory structure."""
    dirs = [
        REVIEWS_DIR,
        REVIEWS_DIR / "pending",
        REVIEWS_DIR / "completed",
        REVIEWS_DIR / "metrics",
    ]
    for d in dirs:
        d.mkdir(parents=True, exist_ok=True)
    
    # Create initial schedule if not exists
    if not SCHEDULE_FILE.exists():
        schedule = {
            "version": 1,
            "last_updated": datetime.now().strftime("%Y-%m-%d"),
            "areas": {},
        }
        for key, area in DEFAULT_AREAS.items():
            schedule["areas"][key] = {
                "name": area.name,
                "paths": area.paths,
                "schedule": area.schedule,
                "day": area.day,
                "focus": area.focus,
                "last_review": None,
                "next_review": calculate_next_review(area).strftime("%Y-%m-%d"),
            }
        save_schedule(schedule)
        print(f"✓ Created schedule at {SCHEDULE_FILE}")
    
    # Create initial adherence metrics
    if not ADHERENCE_FILE.exists():
        adherence = {
            "version": 1,
            "created": datetime.now().strftime("%Y-%m-%d"),
            "total_reviews": 0,
            "on_time_reviews": 0,
            "overdue_reviews": 0,
            "average_quality_score": 0.0,
            "history": [],
        }
        save_adherence(adherence)
        print(f"✓ Created metrics at {ADHERENCE_FILE}")
    
    print("\n✓ Code review system initialized!")
    print(f"  Reviews directory: {REVIEWS_DIR}")
    print(f"  Run 'python3 scripts/code_review.py --list' to see scheduled reviews")


def calculate_next_review(area: ReviewArea) -> datetime:
    """Calculate the next review date for an area."""
    today = datetime.now()
    
    if area.schedule == "weekly":
        # Next occurrence of the specified day
        days_ahead = ["monday", "tuesday", "wednesday", "thursday", "friday", "saturday", "sunday"].index(area.day.lower()) - today.weekday()
        if days_ahead <= 0:
            days_ahead += 7
        return today + timedelta(days=days_ahead)
    
    elif area.schedule == "biweekly":
        # Next occurrence, 2 weeks out
        days_ahead = ["monday", "tuesday", "wednesday", "thursday", "friday", "saturday", "sunday"].index(area.day.lower()) - today.weekday()
        if days_ahead <= 0:
            days_ahead += 7
        # Alternate weeks
        next_date = today + timedelta(days=days_ahead)
        if (next_date.isocalendar()[1] % 2) == 0:
            next_date += timedelta(weeks=1)
        return next_date
    
    elif area.schedule == "monthly":
        if area.day == "first-monday":
            # First Monday of next month
            if today.month == 12:
                next_month = today.replace(year=today.year + 1, month=1, day=1)
            else:
                next_month = today.replace(month=today.month + 1, day=1)
            # Find first Monday
            days_ahead = (0 - next_month.weekday()) % 7  # Monday is 0
            return next_month + timedelta(days=days_ahead)
    
    return today + timedelta(days=7)


def load_schedule() -> dict:
    """Load the review schedule."""
    if SCHEDULE_FILE.exists():
        return json.loads(SCHEDULE_FILE.read_text())
    return {"version": 1, "last_updated": datetime.now().strftime("%Y-%m-%d"), "areas": {}}


def save_schedule(schedule: dict):
    """Save the review schedule."""
    SCHEDULE_FILE.write_text(json.dumps(schedule, indent=2))


def load_adherence() -> dict:
    """Load adherence metrics."""
    if ADHERENCE_FILE.exists():
        return json.loads(ADHERENCE_FILE.read_text())
    return {"version": 1, "created": datetime.now().strftime("%Y-%m-%d"), "history": []}


def save_adherence(adherence: dict):
    """Save adherence metrics."""
    ADHERENCE_FILE.write_text(json.dumps(adherence, indent=2))


def get_changed_files(base: str = "HEAD~1", head: str = "HEAD") -> list[str]:
    """Get list of changed files between commits."""
    try:
        result = subprocess.run(
            ["git", "diff", "--name-only", base, head],
            capture_output=True,
            text=True,
            cwd=PROJECT_ROOT
        )
        return [f for f in result.stdout.strip().split("\n") if f]
    except Exception:
        return []


def count_lines_changed(files: list[str]) -> int:
    """Count total lines changed in files."""
    total = 0
    for f in files:
        path = PROJECT_ROOT / f
        if path.exists() and path.suffix in [".py", ".rs", ".md", ".yaml", ".toml"]:
            try:
                total += len(path.read_text().splitlines())
            except Exception:
                pass
    return total


def detect_code_smells(paths: list[str]) -> list[dict]:
    """Detect code smells in the given paths."""
    issues = []
    
    # Python and Rust comment patterns
    py_patterns = {
        "todo": (r"# TODO[:\s]*(.+)", "minor"),
        "fixme": (r"# FIXME[:\s]*(.+)", "important"),
        "hack": (r"# HACK[:\s]*(.+)", "important"),
        "xxx": (r"# XXX[:\s]*(.+)", "critical"),
        "deprecated": (r"# DEPRECATED[:\s]*(.+)", "minor"),
    }
    
    rs_patterns = {
        "todo": (r"// TODO[:\s]*(.+)", "minor"),
        "fixme": (r"// FIXME[:\s]*(.+)", "important"),
        "hack": (r"// HACK[:\s]*(.+)", "important"),
        "xxx": (r"// XXX[:\s]*(.+)", "critical"),
        "deprecated": (r"// DEPRECATED[:\s]*(.+)", "minor"),
        "unwrap": (r"\.unwrap\(\)", "important"),  # Potential panic
        "expect": (r"\.expect\(", "minor"),
    }
    
    for path_pattern in paths:
        # Expand glob patterns - handle both directories and file patterns
        import glob
        base_pattern = str(PROJECT_ROOT / path_pattern)
        
        # If it's a directory pattern, search for source files
        if not base_pattern.endswith(('.py', '.rs', '.md', '.yaml', '.toml')):
            if not base_pattern.endswith('/'):
                base_pattern += '/'
            matched_files = glob.glob(base_pattern + "**/*.py", recursive=True)
            matched_files.extend(glob.glob(base_pattern + "**/*.rs", recursive=True))
        else:
            matched_files = glob.glob(base_pattern, recursive=True)
        
        for file_path in matched_files:
            path = Path(file_path)
            if not path.is_file():
                continue
            
            # Select patterns based on file type
            if path.suffix == ".py":
                patterns = py_patterns
            elif path.suffix == ".rs":
                patterns = rs_patterns
            else:
                continue
            
            try:
                lines = path.read_text().splitlines()
                for i, line in enumerate(lines, 1):
                    for smell_name, (pattern, severity) in patterns.items():
                        match = re.search(pattern, line, re.IGNORECASE)
                        if match:
                            msg = match.group(1).strip() if match.lastindex else smell_name
                            issues.append({
                                "type": smell_name,
                                "severity": severity,
                                "file": str(path.relative_to(PROJECT_ROOT)),
                                "line": i,
                                "message": msg,
                            })
            except Exception:
                pass
    
    return issues


def detect_complex_functions(paths: list[str], threshold: int = 20) -> list[dict]:
    """Detect functions that may be too complex."""
    issues = []
    
    for path_pattern in paths:
        import glob
        base_pattern = str(PROJECT_ROOT / path_pattern)
        
        # If it's a directory pattern, search for source files
        if not base_pattern.endswith(('.py', '.rs', '.md', '.yaml', '.toml')):
            if not base_pattern.endswith('/'):
                base_pattern += '/'
            matched_files = glob.glob(base_pattern + "**/*.py", recursive=True)
            matched_files.extend(glob.glob(base_pattern + "**/*.rs", recursive=True))
        else:
            matched_files = glob.glob(base_pattern, recursive=True)
        
        for file_path in matched_files:
            path = Path(file_path)
            if not path.is_file():
                continue
            if path.suffix not in [".py", ".rs"]:
                continue
            
            try:
                content = path.read_text()
                lines = content.splitlines()
                
                if path.suffix == ".py":
                    # Python function detection
                    in_function = False
                    func_name = ""
                    func_start = 0
                    func_lines = 0
                    indent_level = 0
                    
                    for i, line in enumerate(lines, 1):
                        stripped = line.strip()
                        
                        if stripped.startswith("def "):
                            if in_function and func_lines > threshold:
                                issues.append({
                                    "type": "complex_function",
                                    "severity": "minor",
                                    "file": str(path.relative_to(PROJECT_ROOT)),
                                    "line": func_start,
                                    "message": f"Function '{func_name}' has {func_lines} lines (threshold: {threshold})",
                                })
                            
                            in_function = True
                            func_name = stripped[4:].split("(")[0]
                            func_start = i
                            func_lines = 0
                            indent_level = len(line) - len(line.lstrip())
                        
                        elif in_function:
                            if stripped and not stripped.startswith("#"):
                                current_indent = len(line) - len(line.lstrip())
                                if current_indent <= indent_level and not stripped.startswith("def "):
                                    if func_lines > threshold:
                                        issues.append({
                                            "type": "complex_function",
                                            "severity": "minor",
                                            "file": str(path.relative_to(PROJECT_ROOT)),
                                            "line": func_start,
                                            "message": f"Function '{func_name}' has {func_lines} lines (threshold: {threshold})",
                                        })
                                    in_function = False
                                else:
                                    func_lines += 1
                
                elif path.suffix == ".rs":
                    # Rust function detection
                    in_function = False
                    func_name = ""
                    func_start = 0
                    brace_count = 0
                    func_lines = 0
                    
                    for i, line in enumerate(lines, 1):
                        stripped = line.strip()
                        
                        if re.match(r'(pub\s+)?(async\s+)?fn\s+\w+', stripped):
                            if in_function and func_lines > threshold:
                                issues.append({
                                    "type": "complex_function",
                                    "severity": "minor",
                                    "file": str(path.relative_to(PROJECT_ROOT)),
                                    "line": func_start,
                                    "message": f"Function '{func_name}' has {func_lines} lines (threshold: {threshold})",
                                })
                            
                            in_function = True
                            match = re.search(r'fn\s+(\w+)', stripped)
                            func_name = match.group(1) if match else "unknown"
                            func_start = i
                            func_lines = 0
                            brace_count = 0
                        
                        if in_function:
                            brace_count += line.count('{') - line.count('}')
                            func_lines += 1
                            if brace_count <= 0 and '{' in lines[func_start - 1:i]:
                                if func_lines > threshold:
                                    issues.append({
                                        "type": "complex_function",
                                        "severity": "minor",
                                        "file": str(path.relative_to(PROJECT_ROOT)),
                                        "line": func_start,
                                        "message": f"Function '{func_name}' has {func_lines} lines (threshold: {threshold})",
                                    })
                                in_function = False
            except Exception:
                pass
    
    return issues


def detect_large_files(paths: list[str], threshold: int = 500) -> list[dict]:
    """Detect files that may be too large."""
    issues = []
    
    for path_pattern in paths:
        import glob
        base_pattern = str(PROJECT_ROOT / path_pattern)
        
        # If it's a directory pattern, search for source files
        if not base_pattern.endswith(('.py', '.rs', '.md', '.yaml', '.toml')):
            if not base_pattern.endswith('/'):
                base_pattern += '/'
            matched_files = glob.glob(base_pattern + "**/*.py", recursive=True)
            matched_files.extend(glob.glob(base_pattern + "**/*.rs", recursive=True))
        else:
            matched_files = glob.glob(base_pattern, recursive=True)
        
        for file_path in matched_files:
            path = Path(file_path)
            if not path.is_file():
                continue
            if path.suffix not in [".py", ".rs"]:
                continue
            
            try:
                lines = len(path.read_text().splitlines())
                if lines > threshold:
                    issues.append({
                        "type": "large_file",
                        "severity": "minor",
                        "file": str(path.relative_to(PROJECT_ROOT)),
                        "line": 1,
                        "message": f"File has {lines} lines (threshold: {threshold})",
                    })
            except Exception:
                pass
    
    return issues


def run_scheduled_review(area_key: str) -> ReviewResult:
    """Run a scheduled review for an area."""
    schedule = load_schedule()
    
    if area_key not in schedule.get("areas", {}):
        print(f"Error: Unknown area '{area_key}'")
        print(f"Available areas: {', '.join(schedule.get('areas', {}).keys())}")
        return None
    
    area_data = schedule["areas"][area_key]
    area = ReviewArea(
        name=area_data["name"],
        paths=area_data["paths"],
        schedule=area_data["schedule"],
        day=area_data["day"],
        focus=area_data["focus"],
    )
    
    print(f"\n{'='*60}")
    print(f"Code Review: {area.name}")
    print(f"Schedule: {area.schedule} ({area.day})")
    print(f"Focus: {area.focus}")
    print(f"{'='*60}\n")
    
    # Collect files
    import glob
    all_files = []
    for path_pattern in area.paths:
        base_pattern = str(PROJECT_ROOT / path_pattern)
        
        # Ensure trailing separator for directory patterns
        if not base_pattern.endswith(('.py', '.rs', '.md', '.yaml', '.toml')):
            if not base_pattern.endswith('/'):
                base_pattern += '/'
            matched = glob.glob(base_pattern + "**/*.py", recursive=True)
            matched.extend(glob.glob(base_pattern + "**/*.rs", recursive=True))
        else:
            matched = glob.glob(base_pattern, recursive=True)
        
        all_files.extend([str(Path(f).relative_to(PROJECT_ROOT)) for f in matched if Path(f).is_file()])
    
    all_files = list(set(all_files))
    lines_changed = count_lines_changed(all_files)
    
    print(f"Files to review: {len(all_files)}")
    print(f"Total lines: {lines_changed}")
    
    # Run detections
    print("\nRunning code smell detection...")
    smells = detect_code_smells(area.paths)
    
    print("Running complexity analysis...")
    complex_funcs = detect_complex_functions(area.paths)
    
    print("Running file size analysis...")
    large_files = detect_large_files(area.paths)
    
    all_issues = smells + complex_funcs + large_files
    
    critical = [i for i in all_issues if i["severity"] == "critical"]
    important = [i for i in all_issues if i["severity"] == "important"]
    minor = [i for i in all_issues if i["severity"] == "minor"]
    
    # Calculate quality score
    quality_score = 10.0
    quality_score -= len(critical) * 2.0
    quality_score -= len(important) * 0.5
    quality_score -= len(minor) * 0.1
    quality_score = max(1.0, min(10.0, quality_score))
    
    # Generate summary
    summary = f"Reviewed {len(all_files)} files with {lines_changed} total lines. "
    if critical:
        summary += f"Found {len(critical)} critical issues requiring immediate attention. "
    if important:
        summary += f"Found {len(important)} important issues to address. "
    if minor:
        summary += f"Found {len(minor)} minor improvements. "
    if not all_issues:
        summary += "No significant issues found."
    
    result = ReviewResult(
        area=area_key,
        date=datetime.now().strftime("%Y-%m-%d"),
        reviewer="auto",
        review_type="scheduled",
        files_reviewed=len(all_files),
        lines_changed=lines_changed,
        critical_issues=len(critical),
        important_issues=len(important),
        minor_issues=len(minor),
        quality_score=round(quality_score, 1),
        summary=summary,
        issues=all_issues,
        recommendations=[
            f"Address {len(critical)} critical issues immediately" if critical else None,
            f"Review and fix {len(important)} important issues before next release" if important else None,
            f"Consider refactoring {len([i for i in complex_funcs if i['type'] == 'complex_function'])} complex functions" if complex_funcs else None,
            f"Consider splitting {len(large_files)} large files" if large_files else None,
        ],
    )
    result.recommendations = [r for r in result.recommendations if r]
    
    # Save review report
    save_review_report(result)
    
    # Update schedule
    schedule["areas"][area_key]["last_review"] = result.date
    schedule["areas"][area_key]["next_review"] = calculate_next_review(area).strftime("%Y-%m-%d")
    schedule["last_updated"] = datetime.now().strftime("%Y-%m-%d")
    save_schedule(schedule)
    
    # Update adherence
    update_adherence(result, on_time=True)
    
    return result


def save_review_report(result: ReviewResult):
    """Save a review report to file."""
    report_dir = REVIEWS_DIR / "completed"
    report_dir.mkdir(parents=True, exist_ok=True)
    
    timestamp = datetime.now().strftime("%Y%m%d-%H%M%S")
    report_file = report_dir / f"review-{result.area}-{timestamp}.md"
    
    # Format issues by severity
    critical_md = "\n".join([f"- [{i['file']}:{i['line']}] {i['message']}" for i in result.issues if i["severity"] == "critical"])
    important_md = "\n".join([f"- [{i['file']}:{i['line']}] {i['message']}" for i in result.issues if i["severity"] == "important"])
    minor_md = "\n".join([f"- [{i['file']}:{i['line']}] {i['message']}" for i in result.issues if i["severity"] == "minor"])
    
    recommendations_md = "\n".join([f"- {r}" for r in result.recommendations])
    
    report = f"""# Code Review: {result.area.replace('_', ' ').title()}

**Date:** {result.date}
**Reviewer:** {result.reviewer}
**Type:** {result.review_type}

## Scope
- **Files reviewed:** {result.files_reviewed}
- **Lines of code:** {result.lines_changed}

## Summary
{result.summary}

## Issues Found

### Critical ({result.critical_issues})
{critical_md if critical_md else "None"}

### Important ({result.important_issues})
{important_md if important_md else "None"}

### Minor ({result.minor_issues})
{minor_md if minor_md else "None"}

## Recommendations
{recommendations_md if recommendations_md else "None"}

## Metrics
- **Quality Score:** {result.quality_score}/10
- **Critical Issues:** {result.critical_issues}
- **Important Issues:** {result.important_issues}
- **Minor Issues:** {result.minor_issues}

---
*Generated by Geometry OS Code Review System*
"""
    
    report_file.write_text(report)
    print(f"\n✓ Report saved to: {report_file.relative_to(PROJECT_ROOT)}")


def update_adherence(result: ReviewResult, on_time: bool = True):
    """Update adherence metrics after a review."""
    adherence = load_adherence()
    
    adherence["total_reviews"] = adherence.get("total_reviews", 0) + 1
    if on_time:
        adherence["on_time_reviews"] = adherence.get("on_time_reviews", 0) + 1
    else:
        adherence["overdue_reviews"] = adherence.get("overdue_reviews", 0) + 1
    
    # Update average quality score
    total = adherence["total_reviews"]
    current_avg = adherence.get("average_quality_score", 0.0)
    adherence["average_quality_score"] = round(
        (current_avg * (total - 1) + result.quality_score) / total, 2
    )
    
    # Add to history
    adherence["history"].append({
        "area": result.area,
        "date": result.date,
        "on_time": on_time,
        "quality_score": result.quality_score,
    })
    
    save_adherence(adherence)


def print_review_result(result: ReviewResult):
    """Print a formatted review result."""
    print(f"\n{'='*60}")
    print("REVIEW COMPLETE")
    print(f"{'='*60}")
    print(f"\n{result.summary}")
    print(f"\nMetrics:")
    print(f"  Quality Score: {result.quality_score}/10")
    print(f"  Files Reviewed: {result.files_reviewed}")
    print(f"  Lines of Code: {result.lines_changed}")
    print(f"\nIssues:")
    print(f"  Critical:   {result.critical_issues}")
    print(f"  Important:  {result.important_issues}")
    print(f"  Minor:      {result.minor_issues}")
    
    if result.issues:
        print(f"\nTop Issues:")
        for issue in result.issues[:10]:
            severity = issue["severity"].upper()
            print(f"  [{severity:9}] {issue['file']}:{issue['line']} - {issue['message']}")
        if len(result.issues) > 10:
            print(f"  ... and {len(result.issues) - 10} more")
    
    if result.recommendations:
        print(f"\nRecommendations:")
        for r in result.recommendations:
            print(f"  • {r}")


def list_scheduled_reviews():
    """List all scheduled reviews."""
    schedule = load_schedule()
    
    print("\n" + "="*60)
    print("SCHEDULED CODE REVIEWS")
    print("="*60)
    
    areas_by_schedule = {"weekly": [], "biweekly": [], "monthly": []}
    
    for key, area in schedule.get("areas", {}).items():
        areas_by_schedule[area["schedule"]].append((key, area))
    
    for schedule_type in ["weekly", "biweekly", "monthly"]:
        if areas_by_schedule[schedule_type]:
            print(f"\n{schedule_type.upper()}")
            print("-"*40)
            for key, area in areas_by_schedule[schedule_type]:
                status = "✓" if area.get("last_review") else "○"
                last = area.get("last_review", "never")
                next_r = area.get("next_review", "not scheduled")
                print(f"  {status} {area['name']}")
                print(f"      Last: {last}")
                print(f"      Next: {next_r}")
                print(f"      Focus: {area['focus']}")


def check_adherence():
    """Check review adherence and show metrics."""
    schedule = load_schedule()
    adherence = load_adherence()
    
    print("\n" + "="*60)
    print("CODE REVIEW ADHERENCE")
    print("="*60)
    
    # Check for overdue reviews
    today = datetime.now()
    overdue = []
    upcoming = []
    
    for key, area in schedule.get("areas", {}).items():
        if area.get("next_review"):
            next_date = datetime.strptime(area["next_review"], "%Y-%m-%d")
            if next_date < today:
                overdue.append((key, area, next_date))
            elif next_date <= today + timedelta(days=7):
                upcoming.append((key, area, next_date))
    
    print(f"\n📊 Metrics")
    print(f"   Total Reviews: {adherence.get('total_reviews', 0)}")
    print(f"   On-Time: {adherence.get('on_time_reviews', 0)}")
    print(f"   Overdue: {adherence.get('overdue_reviews', 0)}")
    print(f"   Avg Quality Score: {adherence.get('average_quality_score', 0):.1f}/10")
    
    if overdue:
        print(f"\n⚠️  OVERDUE REVIEWS ({len(overdue)})")
        print("-"*40)
        for key, area, date in overdue:
            days_overdue = (today - date).days
            print(f"   {area['name']} - {days_overdue} days overdue")
            print(f"      Run: python3 scripts/code_review.py --scheduled --area {key}")
    
    if upcoming:
        print(f"\n📅 UPCOMING THIS WEEK ({len(upcoming)})")
        print("-"*40)
        for key, area, date in upcoming:
            print(f"   {area['name']} - due {date.strftime('%Y-%m-%d')}")
    
    if not overdue and not upcoming:
        print("\n✓ All reviews are up to date!")
    
    # Calculate adherence percentage
    total = adherence.get("total_reviews", 0)
    on_time = adherence.get("on_time_reviews", 0)
    if total > 0:
        adherence_pct = (on_time / total) * 100
        print(f"\n📈 Adherence Rate: {adherence_pct:.1f}%")


def run_entropy_scan():
    """Run a full entropy scan of the codebase."""
    print("\n" + "="*60)
    print("ENTROPY SCAN")
    print("="*60)
    
    all_paths = ["systems/", "scripts/", "tests/"]
    
    print("\n🔍 Scanning for code smells...")
    smells = detect_code_smells(all_paths)
    
    print("🔍 Scanning for complex functions...")
    complex_funcs = detect_complex_functions(all_paths)
    
    print("🔍 Scanning for large files...")
    large_files = detect_large_files(all_paths)
    
    # Summary
    critical = len([i for i in smells if i["severity"] == "critical"])
    important = len([i for i in smells if i["severity"] == "important"])
    minor = len([i for i in smells if i["severity"] == "minor"])
    
    print(f"\n📊 Scan Results")
    print(f"   TODOs: {len([i for i in smells if i['type'] == 'todo'])}")
    print(f"   FIXMEs: {len([i for i in smells if i['type'] == 'fixme'])}")
    print(f"   HACKs: {len([i for i in smells if i['type'] == 'hack'])}")
    print(f"   XXXs: {len([i for i in smells if i['type'] == 'xxx'])}")
    print(f"   Complex Functions: {len(complex_funcs)}")
    print(f"   Large Files: {len(large_files)}")
    
    total_issues = len(smells) + len(complex_funcs) + len(large_files)
    print(f"\n   Total Issues: {total_issues}")
    
    # Top issues
    all_issues = sorted(smells + complex_funcs + large_files, key=lambda x: {"critical": 0, "important": 1, "minor": 2}[x["severity"]])
    
    if all_issues:
        print(f"\n⚠️  Top 20 Issues:")
        for issue in all_issues[:20]:
            severity = issue["severity"].upper()
            print(f"   [{severity:9}] {issue['file']}:{issue['line']} - {issue['message'][:60]}")
        if len(all_issues) > 20:
            print(f"   ... and {len(all_issues) - 20} more")


def schedule_all_reviews():
    """Schedule initial reviews for all areas."""
    schedule = load_schedule()
    
    print("\n📅 Scheduling initial reviews for all areas...")
    
    for key, area in schedule.get("areas", {}).items():
        if not area.get("last_review"):
            area_obj = ReviewArea(
                name=area["name"],
                paths=area["paths"],
                schedule=area["schedule"],
                day=area["day"],
                focus=area["focus"],
            )
            area["next_review"] = calculate_next_review(area_obj).strftime("%Y-%m-%d")
            print(f"   ✓ {area['name']} - scheduled for {area['next_review']}")
    
    schedule["last_updated"] = datetime.now().strftime("%Y-%m-%d")
    save_schedule(schedule)
    
    print("\n✓ All reviews scheduled!")


def main():
    parser = argparse.ArgumentParser(
        description="Geometry OS Code Review System",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  python3 scripts/code_review.py --init
  python3 scripts/code_review.py --list
  python3 scripts/code_review.py --scheduled --area core_systems
  python3 scripts/code_review.py --adherence
  python3 scripts/code_review.py --entropy
        """
    )
    
    # Commands
    parser.add_argument("--init", action="store_true", help="Initialize the review system")
    parser.add_argument("--list", action="store_true", help="List scheduled reviews")
    parser.add_argument("--adherence", action="store_true", help="Check review adherence")
    parser.add_argument("--entropy", action="store_true", help="Run entropy scan")
    parser.add_argument("--schedule-all", action="store_true", help="Schedule initial reviews for all areas")
    
    # Review options
    parser.add_argument("--scheduled", action="store_true", help="Run scheduled review")
    parser.add_argument("--area", type=str, help="Review area name")
    parser.add_argument("--pre-merge", action="store_true", help="Run pre-merge review")
    parser.add_argument("--base", type=str, default="origin/main", help="Base commit for pre-merge")
    parser.add_argument("--head", type=str, default="HEAD", help="Head commit for pre-merge")
    
    args = parser.parse_args()
    
    if args.init:
        init_reviews_dir()
    elif args.list:
        list_scheduled_reviews()
    elif args.adherence:
        check_adherence()
    elif args.entropy:
        run_entropy_scan()
    elif args.schedule_all:
        schedule_all_reviews()
    elif args.scheduled:
        if not args.area:
            print("Error: --area is required for scheduled review")
            print("Use --list to see available areas")
            return 1
        result = run_scheduled_review(args.area)
        if result:
            print_review_result(result)
    elif args.pre_merge:
        files = get_changed_files(args.base, args.head)
        print(f"\nPre-merge review: {len(files)} changed files")
        print(f"Base: {args.base}")
        print(f"Head: {args.head}")
        print("\nChanged files:")
        for f in files[:20]:
            print(f"  - {f}")
        if len(files) > 20:
            print(f"  ... and {len(files) - 20} more")
    else:
        parser.print_help()
    
    return 0


if __name__ == "__main__":
    exit(main())
