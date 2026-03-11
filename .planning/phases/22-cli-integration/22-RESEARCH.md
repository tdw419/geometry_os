# Phase 22: CLI Integration - Research

**Researched:** 2026-03-09
**Domain:** Python CLI development, verification pipeline composition
**Confidence:** HIGH

## Summary

This phase integrates all existing verification components (StructureVerifier, ConsistencyVerifier, SegmentIntegrityChecker, SignatureVerifier) into a unified CLI command `pixelrts verify`. The verification infrastructure is already well-designed with a composable VerificationStep pattern, VerificationContext for lazy loading, and VerificationResult with built-in CLI formatting.

The existing `pixelrts_cli.py` uses argparse for CLI parsing and already has click available as an optional dependency for colored output. The project standard is to use argparse with subparsers, which is already established.

**Primary recommendation:** Add a `verify` subcommand to the existing argparse-based CLI that composes all verifiers, uses the existing `VerificationResult.format_cli()` method for output, and follows established exit code patterns from other commands.

## Standard Stack

The established libraries/tools for this domain:

### Core
| Library | Version | Purpose | Why Standard |
|---------|---------|---------|--------------|
| argparse | stdlib | CLI argument parsing | Already used in pixelrts_cli.py, no new dependencies |
| pathlib | stdlib | Path handling | Already used throughout codebase |
| sys.exit | stdlib | Exit codes | Standard POSIX convention |

### Supporting
| Library | Version | Purpose | When to Use |
|---------|---------|---------|-------------|
| click (optional) | 8.x | Colored output | Already available via HAS_CLICK pattern in codebase |
| json | stdlib | JSON output | For --json flag output |

### Alternatives Considered
| Instead of | Could Use | Tradeoff |
|------------|-----------|----------|
| argparse | typer/click | Would require refactoring entire CLI; current argparse setup works well |
| Custom output formatter | rich library | Overkill for simple pass/fail output; existing format_cli() is sufficient |

**Installation:**
No new dependencies required - all needed libraries are already in the project.

## Architecture Patterns

### Recommended Project Structure
```
systems/pixel_compiler/
  verification/
    __init__.py              # Exports all verifiers + result types
    base.py                  # VerificationStep ABC
    result.py                # VerificationStatus, StepResult, VerificationResult
    context.py               # VerificationContext for lazy loading
    structure_verifier.py    # Phase 19-01
    consistency_verifier.py  # Phase 19-02
    segment_integrity_checker.py  # Phase 20-01
    signature_verifier.py    # Phase 21-01
    file_signer.py           # Phase 21-02
  pixelrts_cli.py            # Add cmd_verify() function here
```

### Pattern 1: Verification Pipeline Composition
**What:** Chain all verifiers in sequence, collecting results
**When to use:** Always - this is the unified verification entry point
**Example:**
```python
# Source: Based on existing verification/__init__.py and result.py patterns
from systems.pixel_compiler.verification import (
    VerificationContext,
    VerificationResult,
    VerificationStatus,
    StepResult,
    StructureVerifier,
    ConsistencyVerifier,
    SegmentIntegrityChecker,
    SignatureVerifier,
)
from datetime import datetime
from pathlib import Path

def verify_file(file_path: Path, verbose: bool = False) -> VerificationResult:
    """Run all verification steps on a file."""
    context = VerificationContext(file_path)
    steps = [
        StructureVerifier(),
        ConsistencyVerifier(),
        SegmentIntegrityChecker(),
        SignatureVerifier(),
    ]

    results = []
    for step in steps:
        result = step.verify(context)
        results.append(result)

    # Determine overall status
    has_fail = any(s.status == VerificationStatus.FAIL for s in results)
    has_warning = any(s.status == VerificationStatus.WARNING for s in results)

    if has_fail:
        overall = VerificationStatus.FAIL
    elif has_warning:
        overall = VerificationStatus.WARNING
    else:
        overall = VerificationStatus.PASS

    return VerificationResult(
        overall_status=overall,
        steps=results,
        file_path=str(file_path),
        timestamp=datetime.now()
    )
```

### Pattern 2: CLI Command Handler (argparse)
**What:** Follow existing cmd_* pattern from pixelrts_cli.py
**When to use:** Adding the verify subcommand
**Example:**
```python
# Source: Based on existing pixelrts_cli.py cmd_* patterns
def cmd_verify(args):
    """Handle verify command - Verify .rts.png file integrity."""
    from pathlib import Path
    from systems.pixel_compiler.verification import VerificationContext

    input_path = Path(args.input)

    # Validate input exists
    if not input_path.exists():
        print(f"Error: Input file not found: {args.input}", file=sys.stderr)
        return 1

    if not input_path.is_file():
        print(f"Error: Input path is not a file: {args.input}", file=sys.stderr)
        return 1

    try:
        # Run verification
        result = verify_file(input_path, verbose=args.verbose)

        # Output format
        if args.json:
            print(result.to_json(indent=2))
        else:
            print(result.format_cli(verbose=args.verbose))

        # Return appropriate exit code
        if result.overall_status == VerificationStatus.FAIL:
            return 1
        elif result.overall_status == VerificationStatus.WARNING:
            return 0  # Warnings still pass for CI/CD
        return 0

    except Exception as e:
        print(f"Error: {e}", file=sys.stderr)
        if args.verbose:
            import traceback
            traceback.print_exc()
        return 1
```

### Pattern 3: Subparser Registration
**What:** Add verify subcommand to main argparse setup
**When to use:** In main() function of pixelrts_cli.py
**Example:**
```python
# Source: Based on existing pixelrts_cli.py subparser patterns
# Verify command
verify_parser = subparsers.add_parser('verify', help='Verify .rts.png file integrity')
verify_parser.add_argument('input', help='Input .rts.png file path')
verify_parser.add_argument('--json', action='store_true',
                          help='Output results in JSON format')
verify_parser.add_argument('-v', '--verbose', action='store_true',
                          help='Show detailed step-by-step verification')
```

### Anti-Patterns to Avoid
- **Re-implementing format_cli():** The VerificationResult class already has format_cli(verbose) - use it
- **Skipping SKIP status handling:** Some verifiers return SKIP (unsigned file, no hash) - this should not cause failure
- **Exit code 2 for validation errors:** Use 1 for all failures, 2 is conventionally for command-line usage errors (argparse handles those)

## Don't Hand-Roll

Problems that look simple but have existing solutions:

| Problem | Don't Build | Use Instead | Why |
|---------|-------------|-------------|-----|
| CLI output formatting | Custom print statements | VerificationResult.format_cli() | Already implemented, handles verbose/summary modes |
| JSON serialization | Manual dict construction | VerificationResult.to_json() | Already implemented with proper structure |
| Result aggregation | Custom list processing | VerificationResult with steps list | Built-in pass/fail/warning counting |
| Lazy file loading | Eager loading all data | VerificationContext | Provides lazy PNG/metadata/image access |

**Key insight:** The verification infrastructure (Phases 19-21) was designed with CLI integration in mind - reuse everything.

## Common Pitfalls

### Pitfall 1: Ignoring SKIP Status
**What goes wrong:** Treating SKIP as failure causes false negatives for unsigned files
**Why it happens:** Developers assume all non-PASS is FAIL
**How to avoid:** Only FAIL status should cause exit code 1; SKIP and WARNING are acceptable
**Warning signs:** Unsigned files failing verification when they should pass

### Pitfall 2: Exit Code Misuse
**What goes wrong:** Using non-standard exit codes breaks CI/CD pipelines
**Why it happens:** Not following POSIX conventions
**How to avoid:**
- 0 = success (PASS or WARNING)
- 1 = failure (FAIL)
- Let argparse handle usage errors (returns 2 automatically)
**Warning signs:** CI pipelines reporting "command not found" instead of "verification failed"

### Pitfall 3: Eager Loading All Data
**What goes wrong:** Loading entire file into memory before verification
**Why it happens:** Not using VerificationContext properly
**How to avoid:** Always use VerificationContext which provides lazy loading
**Warning signs:** Memory issues with large files, slow startup

### Pitfall 4: Output Format Confusion
**What goes wrong:** Human-readable output in --json mode or vice versa
**Why it happens:** Not checking the flag before formatting
**How to avoid:** Check args.json first, then choose format_cli() vs to_json()
**Warning signs:** JSON parsers failing on human output, humans seeing raw JSON

## Code Examples

### Complete cmd_verify Implementation
```python
# Source: Synthesized from existing codebase patterns
def cmd_verify(args):
    """Handle verify command - Verify .rts.png file integrity and authenticity."""
    from pathlib import Path
    from datetime import datetime
    from systems.pixel_compiler.verification import (
        VerificationContext,
        VerificationResult,
        VerificationStatus,
        StructureVerifier,
        ConsistencyVerifier,
        SegmentIntegrityChecker,
        SignatureVerifier,
    )

    input_path = Path(args.input)

    # Validate input
    if not input_path.exists():
        print(f"Error: Input file not found: {args.input}", file=sys.stderr)
        return 1

    if not input_path.is_file():
        print(f"Error: Input path is not a file: {args.input}", file=sys.stderr)
        return 1

    if args.verbose:
        print(f"[*] Verifying: {input_path}")

    try:
        # Create context and verifiers
        context = VerificationContext(input_path)
        verifiers = [
            StructureVerifier(),
            ConsistencyVerifier(),
            SegmentIntegrityChecker(),
            SignatureVerifier(),
        ]

        # Run all verifiers
        results = []
        for verifier in verifiers:
            if args.verbose:
                print(f"  Running: {verifier.name}...")
            result = verifier.verify(context)
            results.append(result)

        # Determine overall status
        has_fail = any(s.status == VerificationStatus.FAIL for s in results)
        has_warning = any(s.status == VerificationStatus.WARNING for s in results)

        if has_fail:
            overall = VerificationStatus.FAIL
        elif has_warning:
            overall = VerificationStatus.WARNING
        else:
            overall = VerificationStatus.PASS

        # Build result
        verification_result = VerificationResult(
            overall_status=overall,
            steps=results,
            file_path=str(input_path),
            timestamp=datetime.now()
        )

        # Output
        if args.json:
            print(verification_result.to_json(indent=2))
        else:
            print(verification_result.format_cli(verbose=args.verbose))

        # Exit code: 0 for PASS/WARNING, 1 for FAIL
        return 0 if overall != VerificationStatus.FAIL else 1

    except Exception as e:
        print(f"Error during verification: {e}", file=sys.stderr)
        if args.verbose:
            import traceback
            traceback.print_exc()
        return 1
```

### Subparser Registration
```python
# Add to main() in pixelrts_cli.py, around line 2342

# Verify command
verify_parser = subparsers.add_parser(
    'verify',
    help='Verify .rts.png file integrity and authenticity',
    description='Runs all verification checks: structure, hash consistency, segment integrity, and signature.'
)
verify_parser.add_argument('input', help='Input .rts.png file to verify')
verify_parser.add_argument('--json', action='store_true',
                          help='Output results in JSON format for machine parsing')
verify_parser.add_argument('-v', '--verbose', action='store_true',
                          help='Show detailed step-by-step verification output')
```

### Command Dispatch
```python
# Add to command dispatch section in main(), around line 2940

elif args.command == 'verify':
    return cmd_verify(args)
```

## State of the Art

| Old Approach | Current Approach | When Changed | Impact |
|--------------|------------------|--------------|--------|
| Manual verification scripts | Composable VerificationStep pattern | Phase 19 | Reusable, testable verifiers |
| Eager file loading | Lazy VerificationContext | Phase 19 | Efficient memory usage |
| Custom output formatting | Built-in format_cli() and to_json() | Phase 19 | Consistent output |

**Deprecated/outdated:**
- Standalone verification scripts: Use the unified `pixelrts verify` command

## Open Questions

1. **Should verification stop on first failure?**
   - What we know: Current pattern runs all verifiers regardless of failures
   - What's unclear: User preference for fail-fast vs complete report
   - Recommendation: Run all verifiers (current pattern) - users want complete picture

2. **Should --verbose show timing information?**
   - What we know: StepResult has duration_ms field
   - What's unclear: Whether to include in verbose output
   - Recommendation: Include in verbose mode, useful for performance debugging

## Sources

### Primary (HIGH confidence)
- `systems/pixel_compiler/verification/__init__.py` - Exports and module structure
- `systems/pixel_compiler/verification/result.py` - VerificationResult.format_cli() and to_json()
- `systems/pixel_compiler/verification/context.py` - Lazy loading pattern
- `systems/pixel_compiler/verification/base.py` - VerificationStep ABC
- `systems/pixel_compiler/pixelrts_cli.py` - Existing CLI patterns, argparse structure
- Click documentation (https://click.palletsprojects.com/en/8.1.x/) - For reference on CLI patterns

### Secondary (MEDIUM confidence)
- Existing cmd_* patterns in pixelrts_cli.py - Established conventions
- POSIX exit code conventions - Standard practice for CLI tools

### Tertiary (LOW confidence)
- None required - all information from codebase

## Metadata

**Confidence breakdown:**
- Standard stack: HIGH - All components already in codebase, no new dependencies
- Architecture: HIGH - Existing patterns are well-established and documented
- Pitfalls: HIGH - Based on actual codebase patterns and POSIX standards

**Research date:** 2026-03-09
**Valid until:** 30 days - stable patterns, unlikely to change
