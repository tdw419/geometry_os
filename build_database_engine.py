#!/usr/bin/env python3
"""Build a Key-Value Database Engine using GlyphStratum.

Dependency direction: Higher strata depend on lower strata.
Bottom-up construction:
- SUBSTRATE (0) - Foundation primitives, no dependencies
- MEMORY (1) - Memory structures, depends on SUBSTRATE
- LOGIC (2) - Control flow, depends on MEMORY
- SPEC (3) - Interfaces, depends on LOGIC
- INTENT (4) - Goals, depends on SPEC
"""
import sys
sys.path.insert(0, "/home/jericho/zion/projects/geometry_os/geometry_os/systems/glyph_stratum/agent-harness")

from cli_anything.glyph_stratum.core import (
    Stratum, Opcode, SessionManager, ProgramRenderer
)

OUTPUT_FILE = "/tmp/database_engine.glyph"


def main():
    print("=" * 70)
    print("Building Key-Value Database Engine with GlyphStratum")
    print("Bottom-up construction: SUBSTRATE -> MEMORY -> LOGIC -> SPEC -> INTENT")
    print("=" * 70)
    print()

    session = SessionManager()

    # ============================================================
    # SUBSTRATE STRATUM (0) - Raw operations, primitives
    # No dependencies on other program glyphs
    # ============================================================
    print("SUBSTRATE STRATUM (0) - Defining raw operations...")
    print("-" * 70)

    # U0: Memory copy primitive
    u0 = session.add_glyph(
        stratum=Stratum.SUBSTRATE,
        opcode=Opcode.CALL,
        rationale="memcpy(dst, src, len): Copy bytes from src to dst"
    )
    print(f"  [U0:{u0.index}] memcpy: Copy bytes")

    # U1: Memory compare primitive
    u1 = session.add_glyph(
        stratum=Stratum.SUBSTRATE,
        opcode=Opcode.CALL,
        rationale="memcmp(a, b, len): Compare bytes, return -1/0/1"
    )
    print(f"  [U1:{u1.index}] memcmp: Compare bytes")

    # U2: Checksum primitive
    u2 = session.add_glyph(
        stratum=Stratum.SUBSTRATE,
        opcode=Opcode.CALL,
        rationale="crc32(data, len): Compute 32-bit CRC checksum"
    )
    print(f"  [U2:{u2.index}] crc32: Compute checksum")

    # U3: Atomic increment primitive
    u3 = session.add_glyph(
        stratum=Stratum.SUBSTRATE,
        opcode=Opcode.CALL,
        rationale="atomic_inc(ptr): Thread-safe increment, return old value"
    )
    print(f"  [U3:{u3.index}] atomic_inc: Atomic increment")

    # U4: File open primitive
    u4 = session.add_glyph(
        stratum=Stratum.SUBSTRATE,
        opcode=Opcode.CALL,
        rationale="file_open(path, flags): Open file, return file descriptor"
    )
    print(f"  [U4:{u4.index}] file_open: Open file")

    # U5: File seek primitive
    u5 = session.add_glyph(
        stratum=Stratum.SUBSTRATE,
        opcode=Opcode.CALL,
        rationale="file_seek(fd, offset): Set file position for read/write"
    )
    print(f"  [U5:{u5.index}] file_seek: Set file position")

    # U6: File write primitive
    u6 = session.add_glyph(
        stratum=Stratum.SUBSTRATE,
        opcode=Opcode.CALL,
        rationale="file_write(fd, buf, len): Write bytes to file at current pos"
    )
    print(f"  [U6:{u6.index}] file_write: Write to file")

    # U7: File read primitive
    u7 = session.add_glyph(
        stratum=Stratum.SUBSTRATE,
        opcode=Opcode.CALL,
        rationale="file_read(fd, buf, len): Read bytes from file at current pos"
    )
    print(f"  [U7:{u7.index}] file_read: Read from file")

    # U8: File sync primitive
    u8 = session.add_glyph(
        stratum=Stratum.SUBSTRATE,
        opcode=Opcode.CALL,
        rationale="file_sync(fd): Flush file buffers to disk for durability"
    )
    print(f"  [U8:{u8.index}] file_sync: Flush to disk")

    # U9: Mutex lock primitive
    u9 = session.add_glyph(
        stratum=Stratum.SUBSTRATE,
        opcode=Opcode.CALL,
        rationale="mutex_lock(mutex): Acquire exclusive lock, block if held"
    )
    print(f"  [U9:{u9.index}] mutex_lock: Acquire mutex")

    # U10: Mutex unlock primitive
    u10 = session.add_glyph(
        stratum=Stratum.SUBSTRATE,
        opcode=Opcode.CALL,
        rationale="mutex_unlock(mutex): Release exclusive lock"
    )
    print(f"  [U10:{u10.index}] mutex_unlock: Release mutex")

    # U11: Condition wait primitive
    u11 = session.add_glyph(
        stratum=Stratum.SUBSTRATE,
        opcode=Opcode.CALL,
        rationale="cond_wait(cond, mutex): Block until signaled with mutex held"
    )
    print(f"  [U11:{u11.index}] cond_wait: Wait on condition")

    # U12: Condition signal primitive
    u12 = session.add_glyph(
        stratum=Stratum.SUBSTRATE,
        opcode=Opcode.CALL,
        rationale="cond_signal(cond): Wake one waiting thread"
    )
    print(f"  [U12:{u12.index}] cond_signal: Signal condition")

    # U13: Halt primitive
    u13 = session.add_glyph(
        stratum=Stratum.SUBSTRATE,
        opcode=Opcode.HALT,
        rationale="halt(error_code): Stop execution on unrecoverable error"
    )
    print(f"  [U13:{u13.index}] halt: Stop execution")

    # ============================================================
    # MEMORY STRATUM (1) - Memory allocation, layout, types
    # Depends on SUBSTRATE primitives
    # ============================================================
    print()
    print("MEMORY STRATUM (1) - Defining memory layout...")
    print("-" * 70)

    # M0: Page buffer (4KB)
    m0 = session.add_glyph(
        stratum=Stratum.MEMORY,
        opcode=Opcode.ALLOC,
        rationale="Page buffer: 4096 bytes, header(32B) + data(4064B)",
        dependencies=[u0.index, u6.index, u7.index]  # Uses memcpy, file_write, file_read
    )
    print(f"  [M0:{m0.index}] Page buffer 4KB (uses U0, U6, U7)")

    # M9: Key type
    m9 = session.add_glyph(
        stratum=Stratum.MEMORY,
        opcode=Opcode.TYPE,
        rationale="Key: Variable-length bytes, max 255 bytes, comparable",
        dependencies=[u1.index]  # Uses memcmp for comparison
    )
    print(f"  [M9:{m9.index}] Key type (uses U1)")

    # M10: Value type
    m10 = session.add_glyph(
        stratum=Stratum.MEMORY,
        opcode=Opcode.TYPE,
        rationale="Value: Variable-length bytes, max 4096 bytes per value",
        dependencies=[u0.index]  # Uses memcpy
    )
    print(f"  [M10:{m10.index}] Value type (uses U0)")

    # M11: Page ID type
    m11 = session.add_glyph(
        stratum=Stratum.MEMORY,
        opcode=Opcode.TYPE,
        rationale="PageID: u64, unique identifier combining file_id + page_num",
        dependencies=[u5.index]  # Uses file_seek
    )
    print(f"  [M11:{m11.index}] PageID type (uses U5)")

    # M12: LSN type
    m12 = session.add_glyph(
        stratum=Stratum.MEMORY,
        opcode=Opcode.TYPE,
        rationale="LSN: u64, Log Sequence Number, monotonically increasing",
        dependencies=[u3.index]  # Uses atomic_inc
    )
    print(f"  [M12:{m12.index}] LSN type (uses U3)")

    # M3: WAL Record struct
    m3 = session.add_glyph(
        stratum=Stratum.MEMORY,
        opcode=Opcode.STRUCT,
        rationale="WALRecord: LSN(u64), type(u8), key_len(u16), val_len(u16), checksum(u32)",
        dependencies=[u2.index, m12.index]  # Uses crc32, LSN
    )
    print(f"  [M3:{m3.index}] WALRecord struct (uses U2, M12)")

    # M1: B-Tree Node allocation
    m1 = session.add_glyph(
        stratum=Stratum.MEMORY,
        opcode=Opcode.ALLOC,
        rationale="BTreeNode: max_keys(254), keys array, values array, children array",
        dependencies=[m0.index, m9.index, m10.index]  # Uses Page, Key, Value
    )
    print(f"  [M1:{m1.index}] BTreeNode (uses M0, M9, M10)")

    # M2: WAL buffer
    m2 = session.add_glyph(
        stratum=Stratum.MEMORY,
        opcode=Opcode.ALLOC,
        rationale="WAL buffer: 64KB circular buffer for batching writes",
        dependencies=[m3.index, u6.index, u8.index]  # Uses WALRecord, file_write, file_sync
    )
    print(f"  [M2:{m2.index}] WAL buffer 64KB (uses M3, U6, U8)")

    # M4: Buffer pool frames
    m4 = session.add_glyph(
        stratum=Stratum.MEMORY,
        opcode=Opcode.ALLOC,
        rationale="Buffer frames: 1024 frames x 4KB = 4MB pool",
        dependencies=[m0.index, u0.index]  # Uses Page, memcpy
    )
    print(f"  [M4:{m4.index}] Buffer frames 4MB (uses M0, U0)")

    # M5: LRU list
    m5 = session.add_glyph(
        stratum=Stratum.MEMORY,
        opcode=Opcode.ALLOC,
        rationale="LRU list: Doubly-linked list of page_ids for eviction order",
        dependencies=[m11.index]  # Uses PageID
    )
    print(f"  [M5:{m5.index}] LRU list (uses M11)")

    # M6: Hash table for page lookup
    m6 = session.add_glyph(
        stratum=Stratum.MEMORY,
        opcode=Opcode.ALLOC,
        rationale="Page table: Hash map page_id -> frame_index, 8192 buckets",
        dependencies=[m11.index, m4.index]  # Uses PageID, Buffer frames
    )
    print(f"  [M6:{m6.index}] Page hash table (uses M11, M4)")

    # M8: Lock table
    m8 = session.add_glyph(
        stratum=Stratum.MEMORY,
        opcode=Opcode.ALLOC,
        rationale="Lock table: Resource -> lock_entry map with wait queues",
        dependencies=[u9.index, u10.index, u11.index, u12.index]  # Uses mutex, cond
    )
    print(f"  [M8:{m8.index}] Lock table (uses U9-U12)")

    # M7: Transaction table
    m7 = session.add_glyph(
        stratum=Stratum.MEMORY,
        opcode=Opcode.ALLOC,
        rationale="Txn table: Active transactions map, txn_id -> txn_state",
        dependencies=[m8.index, m12.index]  # Uses Lock table, LSN
    )
    print(f"  [M7:{m7.index}] Transaction table (uses M8, M12)")

    # ============================================================
    # LOGIC STRATUM (2) - Control flow, computation
    # Depends on MEMORY structures
    # ============================================================
    print()
    print("LOGIC STRATUM (2) - Implementing control flow...")
    print("-" * 70)

    # L4: B-tree search
    l4 = session.add_glyph(
        stratum=Stratum.LOGIC,
        opcode=Opcode.LOOP,
        rationale="btree_search(node, key): Binary search in node, recurse to child",
        dependencies=[m1.index, m9.index]  # Uses BTreeNode, Key
    )
    print(f"  [L4:{l4.index}] btree_search (uses M1, M9)")

    # L5: B-tree insert
    l5 = session.add_glyph(
        stratum=Stratum.LOGIC,
        opcode=Opcode.BRANCH,
        rationale="btree_insert: If leaf full, split; propagate split up if needed",
        dependencies=[l4.index, m1.index]  # Uses btree_search, BTreeNode
    )
    print(f"  [L5:{l5.index}] btree_insert (uses L4, M1)")

    # L6: B-tree delete rebalance
    l6 = session.add_glyph(
        stratum=Stratum.LOGIC,
        opcode=Opcode.BRANCH,
        rationale="btree_rebalance: Borrow from sibling or merge on underflow",
        dependencies=[m1.index, l4.index]  # Uses BTreeNode, btree_search
    )
    print(f"  [L6:{l6.index}] btree_rebalance (uses M1, L4)")

    # L7: WAL append
    l7 = session.add_glyph(
        stratum=Stratum.LOGIC,
        opcode=Opcode.CALL,
        rationale="wal_append(op, key, val): Serialize record, compute checksum, fsync",
        dependencies=[m2.index, m3.index, m12.index]  # Uses WAL buffer, WALRecord, LSN
    )
    print(f"  [L7:{l7.index}] wal_append (uses M2, M3, M12)")

    # L8: WAL replay
    l8 = session.add_glyph(
        stratum=Stratum.LOGIC,
        opcode=Opcode.LOOP,
        rationale="wal_replay: Read all records, verify checksums, redo operations",
        dependencies=[m2.index, m3.index, u2.index]  # Uses WAL buffer, WALRecord, crc32
    )
    print(f"  [L8:{l8.index}] wal_replay (uses M2, M3, U2)")

    # L9: Buffer pool get page
    l9 = session.add_glyph(
        stratum=Stratum.LOGIC,
        opcode=Opcode.CALL,
        rationale="buffer_get_page(page_id): Check cache, if miss load from disk, evict LRU",
        dependencies=[m4.index, m5.index, m6.index, u7.index]  # Uses Buffer, LRU, Page table, file_read
    )
    print(f"  [L9:{l9.index}] buffer_get_page (uses M4, M5, M6, U7)")

    # L10: Buffer pool unpin
    l10 = session.add_glyph(
        stratum=Stratum.LOGIC,
        opcode=Opcode.CALL,
        rationale="buffer_unpin(page_id): Decrement pin count, update LRU",
        dependencies=[m4.index, m5.index]  # Uses Buffer frames, LRU
    )
    print(f"  [L10:{l10.index}] buffer_unpin (uses M4, M5)")

    # L14: Acquire lock
    l14 = session.add_glyph(
        stratum=Stratum.LOGIC,
        opcode=Opcode.BRANCH,
        rationale="lock_acquire(resource, mode): Check for conflicts, wait or grant",
        dependencies=[m8.index]  # Uses Lock table
    )
    print(f"  [L14:{l14.index}] lock_acquire (uses M8)")

    # L15: Release lock
    l15 = session.add_glyph(
        stratum=Stratum.LOGIC,
        opcode=Opcode.CALL,
        rationale="lock_release(resource): Remove lock, wake waiting transactions",
        dependencies=[m8.index]  # Uses Lock table
    )
    print(f"  [L15:{l15.index}] lock_release (uses M8)")

    # L16: Page write to disk
    l16 = session.add_glyph(
        stratum=Stratum.LOGIC,
        opcode=Opcode.CALL,
        rationale="page_write(page_id, data): Seek to offset, write 4KB, fsync",
        dependencies=[m0.index, m11.index, u5.index, u6.index, u8.index]  # Uses Page, PageID, file ops
    )
    print(f"  [L16:{l16.index}] page_write (uses M0, M11, U5, U6, U8)")

    # L17: Page read from disk
    l17 = session.add_glyph(
        stratum=Stratum.LOGIC,
        opcode=Opcode.CALL,
        rationale="page_read(page_id): Seek to offset, read 4KB, return data",
        dependencies=[m0.index, m11.index, u5.index, u7.index]  # Uses Page, PageID, file ops
    )
    print(f"  [L17:{l17.index}] page_read (uses M0, M11, U5, U7)")

    # L11: Transaction begin
    l11 = session.add_glyph(
        stratum=Stratum.LOGIC,
        opcode=Opcode.CALL,
        rationale="txn_begin(): Create txn record, assign timestamp, acquire locks",
        dependencies=[m7.index, l14.index, m12.index]  # Uses Txn table, lock_acquire, LSN
    )
    print(f"  [L11:{l11.index}] txn_begin (uses M7, L14, M12)")

    # L12: Transaction commit
    l12 = session.add_glyph(
        stratum=Stratum.LOGIC,
        opcode=Opcode.CALL,
        rationale="txn_commit(): Force WAL flush, release locks, update commit ts",
        dependencies=[m7.index, l7.index, l15.index, m12.index]  # Uses Txn table, wal_append, lock_release, LSN
    )
    print(f"  [L12:{l12.index}] txn_commit (uses M7, L7, L15, M12)")

    # L13: Transaction rollback
    l13 = session.add_glyph(
        stratum=Stratum.LOGIC,
        opcode=Opcode.CALL,
        rationale="txn_rollback(): Undo operations from WAL, release locks",
        dependencies=[m7.index, l8.index, l15.index]  # Uses Txn table, wal_replay, lock_release
    )
    print(f"  [L13:{l13.index}] txn_rollback (uses M7, L8, L15)")

    # L18: Checkpoint
    l18 = session.add_glyph(
        stratum=Stratum.LOGIC,
        opcode=Opcode.CALL,
        rationale="checkpoint(): Flush all dirty pages, write checkpoint WAL record",
        dependencies=[m4.index, l7.index, l16.index]  # Uses Buffer frames, wal_append, page_write
    )
    print(f"  [L18:{l18.index}] checkpoint (uses M4, L7, L16)")

    # L0: GET operation
    l0 = session.add_glyph(
        stratum=Stratum.LOGIC,
        opcode=Opcode.CALL,
        rationale="get(key): Traverse B-tree from root to leaf, return value",
        dependencies=[l4.index, l9.index, l10.index]  # Uses btree_search, buffer_get, buffer_unpin
    )
    print(f"  [L0:{l0.index}] get() (uses L4, L9, L10)")

    # L1: PUT operation
    l1 = session.add_glyph(
        stratum=Stratum.LOGIC,
        opcode=Opcode.CALL,
        rationale="put(key, val): Log to WAL, insert/update in B-tree, split if needed",
        dependencies=[l5.index, l7.index, l9.index, l10.index]  # Uses btree_insert, wal_append, buffer ops
    )
    print(f"  [L1:{l1.index}] put() (uses L5, L7, L9, L10)")

    # L2: DELETE operation
    l2 = session.add_glyph(
        stratum=Stratum.LOGIC,
        opcode=Opcode.CALL,
        rationale="delete(key): Log to WAL, remove from B-tree, merge/rebalance if needed",
        dependencies=[l6.index, l7.index, l9.index, l10.index]  # Uses btree_rebalance, wal_append, buffer ops
    )
    print(f"  [L2:{l2.index}] delete() (uses L6, L7, L9, L10)")

    # L3: SCAN operation
    l3 = session.add_glyph(
        stratum=Stratum.LOGIC,
        opcode=Opcode.CALL,
        rationale="scan(start, end): Range query using in-order B-tree traversal",
        dependencies=[l4.index, l9.index, l10.index]  # Uses btree_search, buffer ops
    )
    print(f"  [L3:{l3.index}] scan() (uses L4, L9, L10)")

    # ============================================================
    # SPEC STRATUM (3) - Interfaces, contracts, APIs
    # Depends on LOGIC implementations
    # ============================================================
    print()
    print("SPEC STRATUM (3) - Defining interfaces and contracts...")
    print("-" * 70)

    # S0: Storage Engine Interface
    s0 = session.add_glyph(
        stratum=Stratum.SPEC,
        opcode=Opcode.MODULE,
        rationale="StorageEngine: Interface for page-based storage with B-tree",
        dependencies=[l16.index, l17.index, l18.index]  # Uses page_write, page_read, checkpoint
    )
    print(f"  [S0:{s0.index}] StorageEngine interface (uses L16, L17, L18)")

    # S1: Page interface
    s1 = session.add_glyph(
        stratum=Stratum.SPEC,
        opcode=Opcode.STRUCT,
        rationale="Page: 4KB fixed-size block with header and data",
        dependencies=[m0.index, s0.index]  # Uses Page buffer, StorageEngine
    )
    print(f"  [S1:{s1.index}] Page struct (uses M0, S0)")

    # S2: B-Tree Node interface
    s2 = session.add_glyph(
        stratum=Stratum.SPEC,
        opcode=Opcode.STRUCT,
        rationale="BTreeNode: Keys array, values array, child pointers",
        dependencies=[m1.index, s1.index]  # Uses BTreeNode, Page
    )
    print(f"  [S2:{s2.index}] BTreeNode struct (uses M1, S1)")

    # S3: WAL interface
    s3 = session.add_glyph(
        stratum=Stratum.SPEC,
        opcode=Opcode.MODULE,
        rationale="WriteAheadLog: append-only log with checksums for durability",
        dependencies=[l7.index, l8.index]  # Uses wal_append, wal_replay
    )
    print(f"  [S3:{s3.index}] WAL module (uses L7, L8)")

    # S4: WAL Record interface
    s4 = session.add_glyph(
        stratum=Stratum.SPEC,
        opcode=Opcode.STRUCT,
        rationale="WALRecord: LSN, operation type, key, value, checksum",
        dependencies=[m3.index, s3.index]  # Uses WALRecord, WAL
    )
    print(f"  [S4:{s4.index}] WALRecord struct (uses M3, S3)")

    # S5: Buffer Pool interface
    s5 = session.add_glyph(
        stratum=Stratum.SPEC,
        opcode=Opcode.MODULE,
        rationale="BufferPool: LRU eviction, pin count, dirty flag",
        dependencies=[l9.index, l10.index]  # Uses buffer_get_page, buffer_unpin
    )
    print(f"  [S5:{s5.index}] BufferPool module (uses L9, L10)")

    # S6: Buffer Frame interface
    s6 = session.add_glyph(
        stratum=Stratum.SPEC,
        opcode=Opcode.STRUCT,
        rationale="BufferFrame: page_id, data, pin_count, is_dirty",
        dependencies=[m4.index, s5.index]  # Uses Buffer frames, BufferPool
    )
    print(f"  [S6:{s6.index}] BufferFrame struct (uses M4, S5)")

    # S7: Transaction Manager interface
    s7 = session.add_glyph(
        stratum=Stratum.SPEC,
        opcode=Opcode.MODULE,
        rationale="TransactionManager: begin, commit, rollback with MVCC",
        dependencies=[l11.index, l12.index, l13.index]  # Uses txn ops
    )
    print(f"  [S7:{s7.index}] TransactionManager (uses L11, L12, L13)")

    # S8: Query API interface
    s8 = session.add_glyph(
        stratum=Stratum.SPEC,
        opcode=Opcode.EXPORT,
        rationale="QueryAPI: get(key), put(key, val), delete(key), scan(range)",
        dependencies=[l0.index, l1.index, l2.index, l3.index]  # Uses query ops
    )
    print(f"  [S8:{s8.index}] QueryAPI (uses L0, L1, L2, L3)")

    # S9: Lock Manager interface
    s9 = session.add_glyph(
        stratum=Stratum.SPEC,
        opcode=Opcode.MODULE,
        rationale="LockManager: Two-phase locking for isolation",
        dependencies=[l14.index, l15.index]  # Uses lock_acquire, lock_release
    )
    print(f"  [S9:{s9.index}] LockManager (uses L14, L15)")

    # ============================================================
    # INTENT STRATUM (4) - Goals, requirements, rationale
    # Depends on SPEC interfaces
    # ============================================================
    print()
    print("INTENT STRATUM (4) - Defining goals and requirements...")
    print("-" * 70)

    # I0: Primary goal - Key-Value Store
    i0 = session.add_glyph(
        stratum=Stratum.INTENT,
        opcode=Opcode.MODULE,
        rationale="Key-Value Database Engine: ACID-compliant storage with B-tree indexing",
        dependencies=[s0.index, s8.index]  # Uses StorageEngine, QueryAPI
    )
    print(f"  [I0:{i0.index}] Primary goal: KV Database Engine (uses S0, S8)")

    # I1: ACID requirement
    i1 = session.add_glyph(
        stratum=Stratum.INTENT,
        opcode=Opcode.STRUCT,
        rationale="ACID Transactions: Atomicity, Consistency, Isolation, Durability",
        dependencies=[s7.index, s9.index, i0.index]  # Uses TransactionManager, LockManager
    )
    print(f"  [I1:{i1.index}] ACID Transactions (uses S7, S9, I0)")

    # I2: Durability requirement - WAL
    i2 = session.add_glyph(
        stratum=Stratum.INTENT,
        opcode=Opcode.STRUCT,
        rationale="Write-Ahead Log: Persist operations before applying to data",
        dependencies=[s3.index, s4.index, i1.index]  # Uses WAL, WALRecord
    )
    print(f"  [I2:{i2.index}] WAL for durability (uses S3, S4, I1)")

    # I3: Query interface requirement
    i3 = session.add_glyph(
        stratum=Stratum.INTENT,
        opcode=Opcode.EXPORT,
        rationale="Query Interface: GET, PUT, DELETE, SCAN operations",
        dependencies=[s8.index, i0.index]  # Uses QueryAPI
    )
    print(f"  [I3:{i3.index}] Query interface (uses S8, I0)")

    # I4: Storage engine requirement
    i4 = session.add_glyph(
        stratum=Stratum.INTENT,
        opcode=Opcode.STRUCT,
        rationale="B-Tree Storage: Ordered key storage with O(log n) operations",
        dependencies=[s0.index, s2.index, i0.index]  # Uses StorageEngine, BTreeNode
    )
    print(f"  [I4:{i4.index}] B-Tree storage (uses S0, S2, I0)")

    # I5: Memory management requirement
    i5 = session.add_glyph(
        stratum=Stratum.INTENT,
        opcode=Opcode.STRUCT,
        rationale="Buffer Pool: LRU page cache with configurable size",
        dependencies=[s5.index, s6.index, i4.index]  # Uses BufferPool, BufferFrame
    )
    print(f"  [I5:{i5.index}] Buffer pool (uses S5, S6, I4)")

    # I6: Disk persistence requirement
    i6 = session.add_glyph(
        stratum=Stratum.INTENT,
        opcode=Opcode.STRUCT,
        rationale="Disk Persistence: Page-based storage with fsync durability",
        dependencies=[s0.index, i2.index, i4.index]  # Uses StorageEngine, WAL, B-Tree
    )
    print(f"  [I6:{i6.index}] Disk persistence (uses S0, I2, I4)")

    # ============================================================
    # SAVE AND RENDER
    # ============================================================
    print()
    print("=" * 70)
    print("Saving and rendering...")
    print("-" * 70)

    session.save(OUTPUT_FILE)
    print(f"Saved to: {OUTPUT_FILE}")

    # Validate
    print()
    print("Validation:")
    errors = session.validate()
    if errors:
        for e in errors:
            print(f"  ERROR: {e}")
    else:
        print("  Program is VALID - all stratum dependencies satisfied!")

    # Render strata view
    print()
    print("=" * 70)
    print("STRATA VIEW")
    print("=" * 70)
    renderer = ProgramRenderer(session.state.registry)
    print(renderer.render_strata_view())

    # Print dependency queries
    print()
    print("=" * 70)
    print("DEPENDENCY QUERIES (Verifying Coherence)")
    print("=" * 70)

    print(f"\nWhat depends on I0 (Primary goal): {session.query_dependents(i0.index)}")
    print(f"What depends on S3 (WAL module): {session.query_dependents(s3.index)}")
    print(f"What I0 (KV Engine) uses: {session.query_dependencies(i0.index)}")
    print(f"What M0 (Page buffer) depends on it: {session.query_dependents(m0.index)}")
    print(f"What U0 (memcpy) is used by: {session.query_dependents(u0.index)}")

    # Summary
    print()
    print("=" * 70)
    print("BUILD COMPLETE")
    print("=" * 70)
    status = session.status()
    print(f"Total glyphs: {status['glyph_count']}")
    print(f"Strata breakdown: {status['strata']}")


if __name__ == "__main__":
    main()
