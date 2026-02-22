# Webmcp Phase C Devtools Mcp

## Summary

Install and configure chrome-devtools-mcp to allow AI coding assistants to inspect, debug, and verify the Visual Shell in real-time — "TDD for AI" on the PixiJS render loop.

## Motivation

This change implements the architecture described below, enabling spec-driven development
and verification of the implementation.

## Architecture

Install @anthropic-ai/chrome-devtools-mcp (or @ChromeDevTools/chrome-devtools-mcp) as an MCP server. Configure it to connect to Chrome with remote debugging enabled. AI assistants can then inspect DOM, capture screenshots, read console logs, and interact with the Visual Shell programmatically.

## Tech Stack

Node.js, MCP (Model Context Protocol), Chrome DevTools Protocol (CDP), Puppeteer

## Files

| File | Purpose |
|------|---------|
| (See tasks.md for detailed file list) | |

## Success Criteria

- [ ] All tasks in tasks.md are completed
- [ ] Tests pass
- [ ] Documentation updated

## Related

- Source Plan: `docs/plans/2026-02-13-webmcp-phase-c-devtools-mcp.md`
