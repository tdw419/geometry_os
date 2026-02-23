# ASCII Exposed Computing Manifesto

**Version 1.0** | **February 2026**

---

## Preamble

For forty years, software systems have hidden their state behind binary walls, graphical interfaces, and proprietary serialization formats. This opacity served human users well—but the era of AI co-working demands a new paradigm.

AI agents perceive the world through tokens, not photons. They cannot click buttons or read pixel-rendered text. Every time an AI must invoke a specialized tool to read system state, we pay a cost in latency, complexity, and brittleness. What if perception were free?

**ASCII Exposed Computing** is a design framework where every meaningful system state is exposed as readable ASCII text by default. Not as an afterthought. Not as a debug endpoint. As the primary interface.

**Key concept: Zero-cost perception.**
When state is ASCII, reading becomes a single token stream. No parsing libraries. No API clients. No schema negotiation. Just `cat`, `grep`, and `diff`—tools that have worked for fifty years and will work for fifty more.

This manifesto defines the principles, patterns, and contracts for building systems that speak fluently to both human and AI audiences simultaneously. It is not a library or framework, but a philosophy—one that traces its lineage through Plan 9's "everything is a file," UNIX's `/proc` filesystem, and the Twelve-Factor App methodology.

The goal: Systems where understanding is a `cat` away, debugging is a `diff` away, and automation is a `grep` away.
