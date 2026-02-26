#!/usr/bin/env python3
"""
OpenSpec Backlog Triage Tool

Scans openspec/changes/ directory, identifies noise directories (15+ files),
archives them with manifest tracking, and generates ASCII dashboard.

Usage:
    python scripts/openspec_triage.py --dry-run
    python scripts/openspec_triage.py --interactive
    python scripts/openspec_triage.py --rollback openspec/manifests/archive_xxx.json
"""

import argparse
from dataclasses import dataclass, field
from datetime import datetime
from pathlib import Path
from typing import Dict, List, Optional


# =============================================================================
# Data Classes
# =============================================================================

@dataclass
class DirectoryMetrics:
    """Metrics collected for a single proposal directory."""
    path: Path
    total_files: int
    solution_count: int
    has_proposal: bool
    has_design: bool
    system: str  # Inferred from keywords


@dataclass
class ScanResult:
    """Result of scanning openspec/changes/ directory."""
    noise_dirs: List[DirectoryMetrics]  # >= threshold files
    clean_dirs: List[DirectoryMetrics]  # < threshold files
    total_scanned: int


@dataclass
class ProposalCategory:
    """Category and priority inferred for a proposal."""
    system: str
    priority: int  # 1-5 (1 = highest, based on NORTH_STAR alignment)
    status: str    # "active", "likely-complete", "unknown"


@dataclass
class ArchiveEntry:
    """Record of a single archived directory."""
    original_path: Path
    archive_path: Path
    timestamp: str
    file_count: int
    system: str
    extracted_content: Dict[str, str] = field(default_factory=dict)  # filename -> content


@dataclass
class ArchiveManifest:
    """Manifest tracking all archived directories in a single run."""
    manifest_id: str
    created_at: str
    entries: List[ArchiveEntry] = field(default_factory=list)
    dry_run: bool = True


# =============================================================================
# Main Entry Point
# =============================================================================

def main() -> int:
    """Main entry point for the triage tool."""
    parser = argparse.ArgumentParser(
        description="OpenSpec Backlog Triage Tool - Archive noise directories and prioritize proposals",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  # Preview noise directories without archiving
  python scripts/openspec_triage.py --dry-run

  # Interactive archive (prompt for each)
  python scripts/openspec_triage.py --interactive

  # Custom threshold
  python scripts/openspec_triage.py --threshold 20 --dry-run

  # Rollback last archive
  python scripts/openspec_triage.py --rollback openspec/manifests/archive_20260225.json
"""
    )

    parser.add_argument(
        "--dry-run",
        action="store_true",
        help="Generate manifest without moving files"
    )
    parser.add_argument(
        "--interactive",
        action="store_true",
        help="Prompt for each archive decision"
    )
    parser.add_argument(
        "--threshold",
        type=int,
        default=15,
        help="Noise threshold (default: 15 files)"
    )
    parser.add_argument(
        "--rollback",
        type=str,
        metavar="FILE",
        help="Restore from manifest file"
    )
    parser.add_argument(
        "--changes-dir",
        type=str,
        default="./openspec/changes/",
        help="Path to openspec/changes/ (default: ./openspec/changes/)"
    )
    parser.add_argument(
        "--archive-dir",
        type=str,
        default="./openspec/archive/",
        help="Path to archive root (default: ./openspec/archive/)"
    )
    parser.add_argument(
        "--output",
        type=str,
        default=".geometry/triage_summary.txt",
        help="Dashboard output path (default: .geometry/triage_summary.txt)"
    )
    parser.add_argument(
        "-q", "--quiet",
        action="store_true",
        help="Minimal output"
    )
    parser.add_argument(
        "-v", "--verbose",
        action="store_true",
        help="Detailed logging"
    )

    args = parser.parse_args()

    # Placeholder implementation
    if args.quiet:
        return 0

    print("OpenSpec Backlog Triage Tool")
    print(f"Threshold: {args.threshold} files")
    print(f"Changes dir: {args.changes_dir}")
    print(f"Output: {args.output}")
    print()
    print("Run with --dry-run to preview noise directories")

    return 0


if __name__ == "__main__":
    exit(main())
