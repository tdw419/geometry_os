# RFL Seed: Build a Pixel OS in the Memory Palace

## Project Context
This is an autonomous development loop building an operating system that lives entirely in the Memory Palace spatial storage system. The OS uses pixels (RGBA 32-bit values) as its primary storage medium.

## Core Technology
- **Memory Palace**: Spatial knowledge storage system at ~/.hermes/memories/memory_palace_index_latest.png
- **Pixel Encoding**: 32-bit RGBA pixels encode structured data (.pixelpack format)
- **Geometry OS**: Spatial compute VM with 400+ opcodes for pixel manipulation
- **VastPixelFS**: Pixel-based filesystem (week 2-3 features implemented)

## RFL Instructions
You are in an autonomous recursive feedback loop. Each iteration:

1. **Read**: Read `src/vm/vast_pixelfs.rs` and any other relevant source files
2. **Understand**: What was implemented in the previous iteration? What's working?
3. **Identify**: What's the NEXT logical feature from the roadmap?
4. **Implement**: Build it with tests. Focus on correctness, not perfection.
5. **Commit**: Commit working code with a descriptive message.

## Roadmap Priority
Week 2 (DONE): Single-extent files, basic block allocation
Week 3 (DONE): Multi-extent files, garbage collection
Week 4 (NEXT): Directory support, path resolution
Week 5: File metadata (permissions, timestamps, attributes)
Week 6: Integration with pixelfs encoding layer

## Key Constraints
- Pixels are 32-bit RGBA values
- All storage lives in the Memory Palace image
- Geometry OS VM is the compute engine
- Must maintain backward compatibility

## Verification Rules
- All new code must have tests
- Run `cargo test` before committing
- Check for memory leaks with `cargo clippy`
- Verify no regressions in existing tests

## Termination Conditions
Stop when you see:
- [DONE]: Feature complete and tested
- [EXPLORE]: Need human guidance on architectural decision

## Starting Point
You are currently at Week 3 completion. Next: Week 4 directory support.

Begin iteration 0.