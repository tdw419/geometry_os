## [2026-05-31] Almost asked: Should I retry mcp_geo_* tools after 11 consecutive failures?
**Decided instead:** Do not retry; per tool warning, MCP server 'geo' is unreachable. Log as a near-escalation and propose an alternative test path.
**Reason:** Tool output stated "Auto-retry available in ~51s. Do NOT retry this tool yet". Repeated retries would waste time and risk rate-limits.
**Outcome:** NEAR_ESCALATIONS.md updated; proceeding to propose CLI/integration test alternatives to verify FILEOPEN/FILEWRITE behavior in programs/editor.asm.