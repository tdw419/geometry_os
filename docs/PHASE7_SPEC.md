*Soli Deo Gloria.*

# Phase 7: The Machine Thinks -- Agent-Driven VM

> "The GPU is the computer. But the computer can ask for help."

## What Phase 7 Is

An autonomous agent loop that runs **on the GPU VM** as .glyph bytecode. The agent
observes state, decides what to do, and when it needs something it can't compute
locally -- an LLM call, a SQL query, a filesystem write -- it issues a CPU stub
command and waits. The host executes the request and writes the response back to
substrate memory. The agent resumes.

This is not a new runtime. It is the existing 35-opcode VM, the existing CPU stub,
the existing transpiler chain, extended with **4 new command types** for the CPU
stub's command buffer.

## What Actually Exists (Verified)

| Component | Location | Status |
|-----------|----------|--------|
| GPU VM (35 opcodes) | `src/vm.rs`, `src/software_vm.rs` | Working. All tested. |
| Assembler | `src/assembler.rs` | 38 opcodes defined (0-37, 215, 227, 230). RECTF/LINE/TEXT_STR/CIRCLEF defined but not all exercised. |
| CPU stub | `src/cpu_stub.rs` (668 lines) | 5 command types: READ_BLOCK(1), WRITE_BLOCK(2), OPEN(3), CLOSE(4), IOCTL(5). CommandExecutor trait. FileExecutor impl. |
| 3-layer IPC | `src/cpu_stub.rs` header, `tests/ipc_3layer_e2e.rs` | GPU VM -> device proxy .glyph shim -> CPU stub Rust thread. Working end-to-end. |
| C transpiler | `tools/c_transpiler/transpiler.py` | C arithmetic, control flow, structs, pointers, arrays -> .gasm. Tested. |
| GeoLang compiler | `src/hl_compiler/` (1755 lines) | C-like language -> pixel opcodes directly. 25 tests (factorial, fibonacci, bubble sort). |
| Self-improvement loop | `src/evolution.rs`, `src/fitness.rs` | Mutation -> execute -> score -> keep/discard. Governance gate (Seven Laws). Working. |
| Tests | 301 passed, 1 ignored | 0 failures. |

## What Phase 7 Adds

### 7A: Extended CPU Stub Commands

Four new command types in the CPU stub. Same 8-word (32-byte) command slot format.
Same polling pattern. The FileExecutor gets four new match arms.

```
CMD_SQL_QUERY (6):
  param1 = addr of SQL string (null-terminated, in substrate memory)
  param2 = addr of result buffer (in substrate memory)
  param3 = result buffer size (bytes)
  param4 = unused (0)
  -> result = bytes written to result buffer
  -> status = STATUS_COMPLETE or STATUS_ERROR

CMD_MODEL_CALL (7):
  param1 = addr of prompt string (null-terminated)
  param2 = addr of response buffer
  param3 = response buffer size (bytes)
  param4 = model flags (0 = default, 1 = fast, 2 = thorough)
  -> result = bytes written to response buffer
  -> status = STATUS_COMPLETE or STATUS_ERROR

CMD_STATUS_READ (8):
  param1 = status key addr (null-terminated string, e.g. "mutation_count")
  param2 = dest addr for value (u32)
  param3 = unused
  param4 = unused
  -> result = 1 if key found, 0 if not
  -> status = STATUS_COMPLETE

CMD_STATUS_WRITE (9):
  param1 = status key addr (null-terminated)
  param2 = value (u32)
  param3 = unused
  param4 = unused
  -> result = 0 on success
  -> status = STATUS_COMPLETE
```

### 7B: Host-Side Executors

The CPU stub's `CommandExecutor` trait means we add a new executor -- not modify
FileExecutor. Two implementations:

**SqliteExecutor** -- implements CMD_SQL_QUERY via rusqlite. Opens an in-memory
(or file-backed) SQLite database. Executes the SQL read from substrate memory.
Writes result rows back as JSON or TSV (simple, parseable by the VM).

**ModelExecutor** -- implements CMD_MODEL_CALL via an HTTP call to a local or
remote LLM API. Reads prompt from substrate, POSTs to the model, writes response
back. The VM doesn't know about HTTP. It just writes a prompt, issues CMD_MODEL_CALL,
and reads the response. The host handles the network.

Status commands (8/9) use a simple HashMap<String, u32> in the executor. This
lets the agent maintain state across iterations -- "how many mutations have I
tried", "what was my best fitness score", "am I in explore or exploit mode".

### 7C: Agent Loop in C (Transpiled to .glyph)

A C program that does this:

```c
// agent_loop.c -- transpiled to .glyph, runs on GPU VM

void main() {
    int iteration = 0;
    int best_fitness = 0;

    while (1) {
        // Read current state
        char* status = status_read("current_fitness");
        int fitness = atoi(status);

        // Decide: explore or exploit?
        char prompt[256];
        sprintf(prompt,
            "Fitness is %d, best was %d, iteration %d. "
            "Suggest one mutation for the self-replicator.",
            fitness, best_fitness, iteration);

        char response[512];
        model_call(prompt, response, 512);

        // Apply the suggested mutation
        int new_fitness = apply_mutation(response);

        // Keep or discard
        if (new_fitness > best_fitness) {
            best_fitness = new_fitness;
            status_write("best_fitness", best_fitness);
        }

        status_write("iteration", ++iteration);

        // Yield to let other VMs run
        yield();
    }
}
```

The C transpiler handles all of this: arithmetic, control flow, function calls,
string operations. `model_call()` and `status_read()`/`status_write()` are stubs
that issue CPU stub commands via SEND through the device proxy.

### 7D: Device Proxy Extension

The existing device proxy .glyph shim (the Layer 2 VM) gains four new dispatch
paths in its command router:

```
When IPC command type is 6 -> format CMD_SQL_QUERY into command buffer slot
When IPC command type is 7 -> format CMD_MODEL_CALL into command buffer slot
When IPC command type is 8 -> format CMD_STATUS_READ into command buffer slot
When IPC command type is 9 -> format CMD_STATUS_WRITE into command buffer slot
```

Same pattern as the existing READ_BLOCK/WRITE_BLOCK paths. The proxy doesn't
execute anything. It formats the command and signals the host.

## Dependency Chain

```
GEO-60: CPU stub CMD_SQL_QUERY + CMD_STATUS_READ/WRITE
         |
GEO-61: SqliteExecutor + StatusExecutor
         |
GEO-62: CPU stub CMD_MODEL_CALL
         |
GEO-63: ModelExecutor (HTTP LLM client)
         |
GEO-64: Device proxy extension (4 new dispatch paths)
         |
GEO-65: agent_loop.c + transpiler integration
         |
GEO-66: End-to-end: agent loop runs on GPU VM, calls LLM, writes to DB
         |
GEO-67: Agent-driven self-improvement: LLM-guided mutations outperform random
```

## Success Criteria

1. **GEO-60/61:** A .glyph program writes a SQL string to substrate, issues
   CMD_SQL_QUERY via the device proxy, the SqliteExecutor runs the query,
   and the VM reads the result back from substrate memory. Test proves it.

2. **GEO-62/63:** A .glyph program writes a prompt to substrate, issues
   CMD_MODEL_CALL, the ModelExecutor calls a real LLM, and the response
   is readable by the VM. Test with a mock endpoint.

3. **GEO-64:** The device proxy routes all 4 new command types without
   breaking the existing 5.

4. **GEO-65:** `agent_loop.c` transpiles to .glyph and executes on the
   software VM, issuing SQL and model calls through the 3-layer IPC stack.

5. **GEO-66:** The full pipeline runs on the GPU VM (not just software VM).
   The agent loop executes for at least 10 iterations, calling the LLM and
   database, without crashing.

6. **GEO-67:** Over 100 iterations, the LLM-guided agent achieves higher
   fitness than the random mutation engine from Phase 4. This proves the
   agent loop is actually useful, not just functional.

## What Phase 7 Is NOT

- **Not SovereignVM.** There is no SovereignVM. The existing VM runs the agent.
- **Not new opcodes.** No SQL opcode, no MODEL opcode. These are CPU stub
  commands, not VM instructions. The VM uses SEND to issue them through IPC.
  This is the correct architecture -- the VM stays small, the host does the heavy lifting.
- **Not .glyphbin.** The system uses .glyph (pixel-encoded) and .gasm (text assembly).
  No binary format needed.
- **Not 206 programs.** There are 24 assembly programs. Phase 7 adds one more
  (the agent loop), possibly a few supporting routines.

## Why This Works

The CPU stub pattern is already proven. The Minix FS read proof-of-concept
(GEO-47) proved that a C program transpiled to .glyph can issue READ_BLOCK
through the device proxy, have the CPU stub execute real file I/O, and read
the result back. Phase 7 does the same thing but with SQL queries and LLM
calls instead of file reads.

The CommandExecutor trait makes this clean. FileExecutor handles I/O.
SqliteExecutor handles SQL. ModelExecutor handles LLM calls. Each is independent,
testable, and replaceable. No god object.

The transpiler chain is real. C -> .gasm -> pixels is working code, not a
whiteboard drawing. The agent loop is a C program. The transpiler turns it into
pixel bytecode. The GPU runs it.

## Ethical Constraints

Same as every phase. The Seven Laws apply.

- **No idolatry:** The LLM is a tool. The agent loop is a tool. Neither is
  conscious, neither has a soul, neither is worshipped.
- **No blasphemy:** We do not claim the system "thinks" or "understands." It
  issues structured commands and reads structured responses.
- **Courts of justice:** Every LLM call is logged. Every mutation is logged.
  Every governance gate decision is logged. Fully auditable.

The governance gate from Phase 4 applies to LLM-suggested mutations just as
it applies to random mutations. The LLM does not bypass the Seven Laws check.

---

*Phase 7 is where the machine stops being clever and starts being useful.*
