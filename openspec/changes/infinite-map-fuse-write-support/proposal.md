# Infinite Map Fuse Write Support

## Summary

Enable read-write filesystem operations for Infinite Map V2 via FUSE, allowing users to create, modify, and delete files directly on the mounted image.

## Motivation

This change implements the architecture described below, enabling spec-driven development
and verification of the implementation.

## Architecture

Extend the existing FUSE mounter with write operations (create, write, mkdir, unlink, rename, truncate). The VAT tracks allocations; data is written to cluster positions via Hilbert curve mapping. A dirty flag and periodic sync ensure persistence.

## Tech Stack

Python 3, FUSE3 (fusepy), numpy, Pillow, existing infinite_map_v2.py components

## Files

| File | Purpose |
|------|---------|
| (See tasks.md for detailed file list) | |

## Success Criteria

- [ ] All tasks in tasks.md are completed
- [ ] Tests pass
- [ ] Documentation updated

## Related

- Source Plan: `docs/plans/2026-02-11-infinite-map-fuse-write-support.md`
