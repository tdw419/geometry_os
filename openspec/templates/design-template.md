# {TITLE} -- Technical Design

## Architecture Overview
<!-- How does this fit into the existing system? Reference CONSTITUTION.md constraints. -->

```
{ASCII diagram or directory structure showing the change}
```

## Component Changes

### {Component 1}
- **What:** {description of change}
- **Files:** {paths}
- **Approach:** {implementation strategy}

### {Component 2}
- **What:** ...
- **Files:** ...
- **Approach:** ...

## Data Model
<!-- Any new types, structs, or data flows. Skip if N/A. -->

```rust
// Key types or interfaces
```

## API / Interface Changes
<!-- New functions, changed signatures, new CLI commands. Skip if N/A. -->

## Test Strategy
<!-- How will we verify this works? Map to acceptance criteria from proposal. -->

| Acceptance Criterion | Test Approach |
|---------------------|---------------|
| {criterion from proposal} | {unit test / integration test / manual check} |

## Migration / Backward Compatibility
<!-- Does this break anything existing? How do we handle the transition? -->

## Performance Considerations
<!-- GPU constraints? Memory budget? Shader dispatch implications? -->

## Alternatives Considered
<!-- What else did we look at and why did we reject it? -->

| Alternative | Why Rejected |
|-------------|--------------|
| {option} | {reason} |

---
_Template v2 -- derived from spec-kit patterns, compatible with OpenSpec/AIPM checkbox format._
