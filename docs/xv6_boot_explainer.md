# How xv6 Boots on Geometry OS

This document explains the full boot chain — from the Rust interpreter process on Linux
to the xv6 `$` shell prompt running user programs with Sv32 page tables and S-mode
privilege separation.

---

## Overview

```
┌─────────────────────────────────────────────────────────────────────┐
│  Linux Host                                                         │
│  ┌──────────────────────────────────────────────────────────────┐   │
│  │  geos_native_boot.rs             Rust interpreter loop       │   │
│  │  ┌──────────────────────────────────────────────────────────┐│   │
│  │  │  GuestMemory (128MB RAM at 0x80000000)                   ││   │
│  │  │  ┌──────────────────────────────────────────────────────┐││   │
│  │  │  │  geos_native.elf loaded at 0x80000000                │││   │
│  │  │  │  ┌─────────────┐ ┌──────────────┐ ┌───────────────┐ │││   │
│  │  │  │  │ geos_sys.S  │ │ geos_stubs.c │ │ xv6 portable  │ │││   │
│  │  │  │  │ _entry      │ │ ecall wrappers│ │ bio.c, fs.c,  │ │││   │
│  │  │  │  │ stvec_handle│ │ allocproc     │ │ sysfile.c,    │ │││   │
│  │  │  │  │ sv32_enter  │ │ scheduler     │ │ syscall.c,    │ │││   │
│  │  │  │  │ swtch       │ │ kexec, kfork  │ │ pipe.c, ...   │ │││   │
│  │  │  │  │             │ │ console.c     │ │ (unmodified)  │ │││   │
│  │  │  │  └─────────────┘ └──────────────┘ └───────────────┘ │││   │
│  │  │  │                                                     │││   │
│  │  │  │  ┌──────────────────────────────────────────────────┐││   │
│  │  │  │  │  disk.img  (xv6 filesystem image in GuestMemory) │││   │
│  │  │  │  │  /sh  /ls  /cat  /init  /tinycalc  ...          │││   │
│  │  │  │  └──────────────────────────────────────────────────┘││   │
│  │  │  └──────────────────────────────────────────────────────┘│   │
│  │  └──────────────────────────────────────────────────────────┘   │
│  └──────────────────────────────────────────────────────────────────┘
```

Key design principle: **Zero xv6 kernel files were modified.** Every xv6 C file
(`bio.c`, `fs.c`, `pipe.c`, `syscall.c`, `sysfile.c`, `sysproc.c`, `file.c`,
`log.c`, `string.c`, `console.c`) compiles as-is from the unmodified xv6-rv32
source tree. The GeOS port layer replaces only hardware-dependent functions
via thin ecall wrappers.

---

## Layer 0: The Rust Host (`geos_native_boot.rs`)

```
src/bin/geos_native_boot.rs
```

The entry point is a standard Rust binary that:

1. **Reads the ELF** — loads `native/build/geos_native.elf` from disk
2. **Creates a VM instance** — 128MB of RAM starting at physical address `0x80000000`
3. **Loads the ELF** — `load_auto()` parses the ELF32 and copies segments into GuestMemory
4. **Sets the CPU state**:
   - `vm.cpu.pc = entry_point`
   - `vm.cpu.privilege = Privilege::Machine` (starts in M-mode)
5. **Runs the step loop**: each iteration:
   - Reads pending stdin and forwards bytes to `vm.bus.uart.receive_byte()`
   - Calls `vm.step()` — executes one RISC-V instruction via the interpreter
   - After each step, drains `vm.bus.sbi.console_output` to stdout
   - Handles faults, ebreak, shutdown

The step loop is the bridge between Linux and xv6:
- **stdin → UART**: Characters you type are pushed into the interpreter's UART rx buffer
- **SBI → stdout**: Every `SBI_CONSOLE_PUTCHAR` ecall is handled by the Rust SBI handler,
  which appends the character to `console_output`. The boot binary drains this buffer
  and prints it to stdout.

---

## Layer 1: The Build System (`native/Makefile`)

Compiles unmodified xv6 portable C files with GeOS ecall stubs into a single
ELF32 binary (`geos_native.elf`).

**Native port objects** (in `native/`):
```
geos_sys.o       — assembly: _entry, ecall wrappers, stvec_handler, sv32_enter_user
geos_stubs.o     — C: hardware abstraction, scheduler, page tables, kexec/kfork
geos_main.o      — C: entry point, FS validation, ELF loader → Sv32 → S-mode
fb.o             — C: framebuffer device (/fb) for pixel drawing
swtch.o          — assembly: context switch (save/restore callee-saved regs)
console.o        — C: custom console (polling getchar ecall, no UART interrupts)
```

**xv6 portable objects** (from `conductor/tracks/xv6-rv32/kernel/`, compiled unmodified):
```
bio.o            — buffer cache
fs.o             — filesystem (inode, dir, path operations)
file.o           — file descriptor table
pipe.o           — pipe implementation
log.o            — journaling log
sysfile.o        — file-related syscalls (open, read, write, close...)
sysproc.o        — process-related syscalls (fork, exit, wait...)
syscall.o        — syscall dispatch table
string.o         — memcmp, strncmp, safestrcpy, etc.
spinlock.o       — spinlock implementation
sleeplock.o      — sleep lock
console.o        — UART console (uses ecall-based putchar)
```

**Linker script** (`geos_native.ld`):
```
Entry:    _entry
Base:     0x80000000
Sections: .text → .rodata → .data → .bss → .stack (16KB at _stack_top)
```

The 16KB stack sits just after BSS. The `_stack_top` symbol marks its end,
used by `_entry` and by `stvec_handler` as the S-mode kernel stack (via `sscratch`).

---

## Layer 2: ELF Entry in M-mode (`geos_sys.S: _entry`)

```
_entry:
  1. Set sp = _stack_top - 0x4000  (16KB kernel stack with 16KB margin)
  2. Zero BSS section (bss_start..bss_end, 4 bytes at a time)
  3. Set tp = 0  (hart ID / thread pointer)
  4. Call geos_main()
  5. If geos_main returns, ecall a7=8 (SHUTDOWN), then infinite loop
```

The CPU starts in M-mode (set by the Rust host: `vm.cpu.privilege = Privilege::Machine`).
Everything runs in M-mode initially — the same physical address space, no page tables
enabled yet.

---

## Layer 3: C Initialization (`geos_main.c: geos_main()`)

After `_entry` jumps to `geos_main()`:

```c
geos_main():
  fileinit();     // Initialize file descriptor table
  consoleinit();  // Register consoleread/consolewrite in devsw[]
  fbinit();       // Register framebuffer device

  fs_validation();      // Verify the filesystem works
  load_and_run_elf("/sh");  // Load /sh with Sv32 page tables → S-mode
  // never returns
```

### fs_validation()

This is the boot-time filesystem smoke test that proves the port is correct:

```
1. binit()      → Initialize buffer cache (unmodified xv6 bio.c)
2. iinit()      → Initialize inode table (unmodified xv6 fs.c)
3. fsinit(1)    → Read superblock, init journal (unmodified xv6 fs.c)
4. namei("/")   → Look up root directory
5. print_dirent → Walk directory entries, print inum and name
6. namei("/sh") → Verify known files exist, read first 32 bytes
   namei("/ls")     to confirm content is correct
   namei("/cat")
   namei("/init")
```

Every file operation (bread/bwrite, readi, namei, ilock/iunlock) goes through
the unmodified xv6 buffer cache and filesystem code. The only hardware hit is
`virtio_disk_rw()` in `geos_stubs.c`, which issues a `DISK_READ`/`DISK_WRITE`
ecall for each 512-byte half-block.

---

## Layer 4: Hardware Abstraction (`geos_stubs.c`)

This is the **port layer** — replaces every hardware-dependent call in xv6
with a thin ecall wrapper. Everything here is custom for GeOS; nothing from
xv6's `kernel/` was changed.

### ecall wrappers (from `geos_sys.S`, called by `geos_stubs.c`)

| ecall # | Name | Arguments | Returns | Description |
|---------|------|-----------|---------|-------------|
| 0x01    | SBI_CONSOLE_PUTCHAR | a0=char | — | Write character to host stdout |
| 0x02    | SBI_CONSOLE_GETCHAR | — | char or -1 | Read character from host stdin (non-blocking) |
| 0x100   | MALLOC | a0=size | address | Allocate 4096-byte page, zeroed |
| 0x101   | FREE | a0=address | — | Free a page |
| 0x200   | DISK_READ | a0=block_no, a1=buf | — | Read 512-byte sector into GuestMemory |
| 0x201   | DISK_WRITE | a0=block_no, a1=buf | — | Write 512-byte sector from GuestMemory |
| 8       | SHUTDOWN | — | — | Halt the interpreter |
| 0x10    | SBI_EXT_TIME | a6=0x54494D45 | — | Timer functions |

Each assembly wrapper is 2 instructions:
```asm
putchar:
    li a7, 0x01       # ecall number
    ecall              # trap to interpreter's SBI handler
    ret
```

### Hardware stubs (no-op or trivial)

These are functions that xv6's portable code expects but don't need real hardware
on GeOS (since the interpreter handles everything):

```c
void uartinit(void)     { }           // No real UART
void kvminit(void)      { }           // Page tables set up manually
void kvminithart(void)  { }           // satp set by scheduler
void procinit(void)     { }           // ptable[] initialized statically
void trapinit(void)     { }           // stvec set by scheduler_init
void trapinithart(void) { }           // Not needed
void plicinit(void)     { }           // No PLIC
void plicinithart(void) { }           // No PLIC
void virtio_disk_init(void) { }       // Disk is a memory blob
void timerinit(void)    { }           // Timer via ecall
```

### Page table stubs (flat address space)

During M-mode boot (before `load_and_run_elf` sets up Sv32), the kernel runs
in a flat identity-mapped address space. These stubs let xv6's code think it has
page tables, but they do nothing:

```c
pagetable_t uvmcreate(void)        { return 0; }
uint        walkaddr(pagetable_t pt, uint va) { return va; }
int         mappages(...)          { return 0; }
void        uvmunmap(...)          { }
```

### Console output

```c
void uartputc(int c)      { putchar(c); }     // ecall 0x01
void uartputc_sync(int c) { putchar(c); }
void uartwrite(char *buf, int n) { ... }      // loop over putchar
```

The `printf` implementation in `geos_stubs.c` also uses `putchar` directly
(not through the UART device), so boot messages work before the console is
initialized.

### Memory allocator

```c
void *kalloc(void) { return kalloc_impl(); }   // ecall 0x100 — returns 4KB page
void  kfree(void *pa) { if (pa) kfree_impl(pa); }  // ecall 0x101
```

### Disk I/O (virtio_disk_rw)

xv6 uses 1024-byte blocks (`BSIZE`). GeOS uses 512-byte sectors.

```c
virtio_disk_rw(struct buf *b, int write):
  for write:  disk_write_impl(b->blockno * 2, b->data)        // sector 0
              disk_write_impl(b->blockno * 2 + 1, b->data+512) // sector 1
  for read:   disk_read_impl(b->blockno * 2, b->data)
              disk_read_impl(b->blockno * 2 + 1, b->data+512)
```

### copyin/copyout

Since the port runs in M-mode (flat address space), there's no user/kernel
separation during boot. `copyout` and `copyin` are simple `memmove` calls.

---

## Layer 5: The xv6 Filesystem Boot

The filesystem lives in `disk.img` — a pre-built xv6 filesystem image that's
embedded in GuestMemory as a raw byte array (`virtio_blk.disk`).

The boot uses **unmodified xv6 filesystem code** from `conductor/tracks/xv6-rv32/kernel/`:

1. **`binit()`** — initializes the buffer cache (linked list of `struct buf`)
2. **`iinit()`** — initializes the inode table
3. **`fsinit(1)`** — reads the superblock, validates `sb.magic == FS_MAGIC`,
   initializes the journal log
4. **`namei("/")`** — walks the filesystem tree from root down to find an inode.
   This calls `iget()` (reads inode from disk via `bread`), then follows directory
   entries via `readi()`. Every disk read goes through `bwrite()` → `virtio_disk_rw()`
   → `disk_read_impl()` ecall → Rust SBI handler reads `virtio_blk.disk[...]`.
5. **`namei("/sh")`**, `/ls`, `/cat`, `/init` — looks up known user binaries

The Rust SBI handler serves disk reads directly from the in-memory disk image:

```rust
// src/riscv/sbi.rs
0x200 /* DISK_READ */ => {
    let block_no = a0 as u64;
    let buf_addr = a1 as u64;
    let offset = block_no * 512;
    // Copy 512 bytes from virtio_blk.disk[offset..offset+512]
    // to GuestMemory at buf_addr
    for i in 0..512 {
        let val = virtio_blk.disk[(offset + i) as usize];
        mem.write_byte(buf_addr + i, val);
    }
}
```

---

## Layer 6: ELF Loader with Sv32 Page Tables (`geos_main.c: load_and_run_elf`)

After filesystem validation passes, `geos_main()` calls `load_and_run_elf("/sh")`.

This is the critical transition — **from flat M-mode to Sv32 U-mode execution**.

### Step-by-step:

**1. Open the ELF file:**
```c
struct inode *ip = namei("/sh");  // Look up /sh in the xv6 filesystem
ilock(ip);                         // Lock the inode
```

**2. Read ELF32 header and validate:**
```c
struct elf32_hdr hdr;
readi(ip, 0, &hdr, 0, sizeof(hdr));
// Check: magic == 0x464C457F, ident[0] == 1 (32-bit), machine == EM_RISCV
```

**3. Create root page table (Sv32 two-level):**
```c
pagetable_t root_pt = alloc_pgtbl();   // kalloc + zero 1024 PTEs (4KB)
```

Sv32 page table structure:
```
Root Level 1 (1024 PTEs, 4KB)
  ├── idx1=0..511:  0x00000000..0x7FFFFFFF  (user space)
  │   Each PTE → Level 2 table (1024 PTEs)
  │     Each leaf PTE → 4KB page
  └── idx1=512..1023: 0x80000000..0xFFFFFFFF  (kernel/S-mode space)
```

**4. Identity-map kernel region:**
```c
for (va = 0x80000000; va < 0x80600000; va += PGSIZE)
    sv32_map_page(root_pt, va, va, R|W|X|V);
```
Maps the kernel's physical address range (6MB) to the same virtual addresses.
This lets S-mode code run from the same addresses it used in M-mode.

**5. Identity-map framebuffer MMIO:**
```c
for (va = 0x60000000; va < 0x60042000; va += PGSIZE)
    sv32_map_page(root_pt, va, va, R|W|U|V);
```
Maps the framebuffer so user programs can write pixels directly.

**6. Load PT_LOAD segments:**
```c
for each PT_LOAD segment:
    // Page-align the virtual address range
    seg_start = ph.vaddr & ~0xFFF
    seg_end = (ph.vaddr + ph.memsz + 0xFFF) & ~0xFFF
    
    for each page in the range:
        pa = kalloc()          // Allocate physical page (via ecall 0x100)
        zero(pa)              // Zero the page
        readi(ip, pa, ...)    // Read segment data from disk into page
        sv32_map_page(root_pt, va, pa, R|W|X|U|V)  // Map va→pa via Sv32
```

**7. Allocate and map user stack (32 pages = 128KB):**
```c
stack_top   = 0x7FFFF000   // Just below the 2GB boundary
stack_base  = stack_top - 32 * 4096
for va in range(stack_base, stack_top):
    pa = kalloc()
    zero(pa)
    sv32_map_page(root_pt, va, pa, R|W|U|V)
```

The stack is at the top of user address space (below kernel at 0x80000000).

---

## Layer 7: Privilege Transition (`geos_sys.S: sv32_enter_user`)

After page tables are ready, `load_and_run_elf` calls `run_elf_sv32()` which:

1. **Creates the first process** — allocates a `struct proc` in `ptable[]`,
   sets `pagetable`, `sz`, `trapframe` (epc=entry, sp=stack_top)
2. **Sets up the kernel stack frame** — `swtch` will restore from here:
   - `context.ra` = `child_trampoline`
   - `context.sp` = pointer to saved trapframe on kernel stack
   - `tf[10]` = `entry - 4` (sepc minus 4, because stvec_restore adds 4)
3. **Makes process RUNNABLE**
4. **Initializes scheduler** — allocates scheduler stack, sets up stvec,
   delegates ecalls
5. **Calls `enter_scheduler_smode(sched_sp)`**

### `enter_scheduler_smode:` (geos_sys.S)

This is the M-mode → S-mode drop:

```asm
enter_scheduler_smode:
    // Set mstatus.MPP = S-mode (01 binary for bits 12-11)
    // Set SUM = 1 (S-mode can access U-mode pages for trap handling)
    csrr t0, mstatus
    // ... mask and set bits ...
    csrw mstatus, t0

    // Set mepc = scheduler_entry
    la t0, scheduler_entry
    csrw mepc, t0

    // Set sp = scheduler stack
    mv sp, a0

    // Drop to S-mode!
    mret
```

After `mret`:
- **Privilege drops** from Machine to Supervisor
- **mepc** → PC (`scheduler_entry`)
- **Page tables NOT active yet** — satp is 0 but Sv32 isn't enabled.
  The scheduler runs in bare S-mode initially.

### `scheduler_entry` → `scheduler()`

The scheduler loop (run in S-mode):

```c
scheduler():
    for (;;) {
        for each process in ptable[]:
            if process.state == RUNNABLE:
                // Install page table
                satp_val = 0x80000000 | (root_pa >> 12)  // SV32 mode bit
                w_satp(satp_val)
                sfence_vma()

                process.state = RUNNING
                cpu->proc = &process
                swtch(&sched_ctx, &process.context)
    }
```

When the scheduler switches to the first process, `swtch` restores:
- **ra** → `child_trampoline`
- **sp** → the kernel stack frame

### `child_trampoline` → `stvec_restore`:

```asm
child_trampoline:
    li a0, 0                  # Child's fork return value = 0
stvec_restore:
    sw a0, 4(sp)              # Store return value in saved a0 slot
    # ... restore all saved registers from the stack frame ...
    lw t0, 40(sp)             # Saved sepc
    addi t0, t0, 4            # sepc += 4 (skip the ecall instruction)
    csrw sepc, t0             # Set sepc
    # ... restore sp from sscratch swap ...
    sret                      # Return to U-mode!
```

`sret`:
- **Privilege drops** from Supervisor to User
- **sepc** → PC (the user program's entry point)
- **Sv32 page tables active** — `satp` was set by the scheduler before `swtch`
- **sscratch** holds the kernel stack pointer (so stvec_handler can swap on trap)

---

## Layer 8: The S-mode Trap Handler (`stvec_handler`)

When a user program executes `ecall`, the delegated ecall (medeleg[8]=1) traps
to S-mode. `stvec_handler` runs:

```asm
stvec_handler:
    csrrw sp, sscratch, sp    // Swap: sp = kernel stack, sscratch = user sp
    addi sp, sp, -128         // Allocate trapframe space
    sw ra,   0(sp)            // Save ra
    sw a0,   4(sp)            // Save a0 (return value slot)
    ...
    csrr t0, sepc
    sw t0,  40(sp)            // Save sepc (so stvec_restore can adjust it)
    ...
    // Call handle_syscall(tf, sysno, arg0, arg1, ..., arg5)
    mv a0, sp
    lw a1, 32(sp)             // syscall number (from a7)
    ...
    call handle_syscall
    // handle_syscall returns the return value in a0
    j stvec_restore           // Restore registers and sret
```

### `handle_syscall` (geos_stubs.c)

```c
handle_syscall(uint32 *tf, int sysno, int arg0, ...):
    saved_tf = tf;
    p->trapframe->a7 = sysno;    // Set syscall number in trapframe
    p->trapframe->a0 = arg0;     // Set arguments
    ...

    syscall();                     // Call unmodified xv6 syscall dispatcher!

    if (exec_pending) {           // After kexec, override sepc
        exec_pending = 0;
        tf[10] = p->trapframe->epc - 4;  // stvec_restore adds 4 → entry
    }

    return p->trapframe->a0;     // Return value goes to stvec_handler
```

The call to `syscall()` goes to the **unmodified xv6 syscall dispatcher**
from `conductor/tracks/xv6-rv32/kernel/syscall.c`. This dispatcher reads
`p->trapframe->a7` and calls the appropriate handler:

| Syscall # | Name | Handler |
|-----------|------|---------|
| 1 | fork | `kfork()` in geos_stubs.c |
| 2 | exit | `kexit()` |
| 3 | wait | `kwait()` |
| 4 | pipe | unmodified xv6 pipe.c (via `sysfile.c`) |
| 5 | read | unmodified xv6 `sysfile.c` → `fileread` |
| 6 | kill | `kkill()` stub |
| 7 | exec | `kexec()` in geos_stubs.c |
| 8 | fstat | unmodified xv6 `sysfile.c` |
| 9 | getpid | unmodified xv6 `sysproc.c` |
| 10 | sbrk | `growproc()` in geos_stubs.c |
| 11 | sleep | unmodified xv6 `sysproc.c` |
| 12 | uptime | stub |
| 13 | open | unmodified xv6 `sysfile.c` |
| 14 | write | unmodified → `filewrite` → consolewrite / pipewrite |
| 15 | mknod | unmodified xv6 `sysfile.c` |
| 16 | unlink | unmodified xv6 `sysfile.c` |
| 17 | link | unmodified xv6 `sysfile.c` |
| 18 | mkdir | unmodified xv6 `sysfile.c` |
| 19 | close | unmodified xv6 `sysfile.c` |

The key insight: **`syscall()`, `sysfile.c`, `sysproc.c`, `pipe.c`, `file.c`,
`console.c` are all unmodified** — they call `argraw()`, `argaddr()`, `argstr()`,
`copyin()`, `copyout()`, which are provided by geos_stubs.c.

---

## Layer 9: The SBI Handler in Rust (`src/riscv/sbi.rs`)

When the interpreter encounters an `ecall` instruction in M-mode or S-mode,
`system.rs` reads the registers and calls `bus.sbi.handle_ecall(...)`:

```rust
// src/riscv/cpu/system.rs (simplified)
fn step(&mut self, bus: &mut Bus) -> StepResult {
    // ... fetch and decode instruction ...
    if opcode == ECALL {
        let a7 = self.x[17];  // ecall number
        let a0 = self.x[10];
        let a1 = self.x[11];
        // ...
        let result = bus.sbi.handle_ecall(a7, a6, a0, a1, a2, a3, a4, a5,
                                           &mut bus.uart, &mut bus.clint,
                                           &mut bus.mem, &mut bus.virtio_blk);
        // If handled (result.is_some()), set a0 = result
        // If not handled, trigger trap delegation
    }
}
```

The SBI handler dispatches by `a7` (ecall number):

| ecall (a7) | Handler |
|------------|---------|
| 0x01 (SBI_CONSOLE_PUTCHAR) | Append char to `console_output` buffer (drained by the Rust host loop) |
| 0x02 (SBI_CONSOLE_GETCHAR) | Read from `uart.rx_buf` (filled by host stdin forwarding) |
| 0x100 (MALLOC) | Pop from `free_pages` stack or advance `next_alloc_addr`; zero the page |
| 0x101 (FREE) | Push address onto `free_pages` stack |
| 0x200 (DISK_READ) | Copy 512 bytes from `virtio_blk.disk[block_no * 512]` to GuestMemory at `buf_addr` |
| 0x201 (DISK_WRITE) | Copy 512 bytes from GuestMemory to `virtio_blk.disk`, mark dirty, save |
| 8 (SHUTDOWN) | Return `StepResult::Shutdown` |

---

## Layer 10: The Host Bridge (stdin/stdout)

The Rust host binary provides the I/O bridge between your terminal and xv6:

```
Your terminal             geos_native_boot.rs              xv6 (in interpreter)
                         
stdin ──────→ read non-blocking ──→ uart.receive_byte() ──→ SBI_GETCHAR ecall
                                                                         ↑
                                                               console.c polls
                                                               getchar_impl()
                                                               
                                                     SBI_PUTCHAR ecall
                                                             ↓
             print!() ←── drain console_output ←─── sbi.console_output.push()
                 ↓
           Your terminal sees the $ prompt
```

The stdin forwarding:
```rust
// In the step loop:
loop {
    match stdin_reader.read(&mut stdin_buf) {
        Ok(n)  => for &b in &stdin_buf[..n] {
            vm.bus.uart.receive_byte(b);
        },
        Err(WouldBlock) => break,
    }
}
```

The console output drainage:
```rust
if !vm.bus.sbi.console_output.is_empty() {
    let out: Vec<u8> = vm.bus.sbi.console_output.drain(..).collect();
    print!("{}", String::from_utf8_lossy(&out));
    std::io::stdout().flush().ok();
}
```

---

## Summary: The Full Boot Sequence

```
Step  | Privilege | Code                     | What happens
──────┼───────────┼──────────────────────────┼────────────────────────────
  1   | M-mode    | Rust host                | Load ELF, create VM, set PC=entry
  2   | M-mode    | _entry                   | Set sp, zero BSS, call geos_main
  3   | M-mode    | geos_main                | Init filesystem subsystems
  4   | M-mode    | fs_validation            | Read superblock, walk root dir
  5   | M-mode    | load_and_run_elf("/sh")  | Create Sv32 pagetables
  6   | M-mode    | load_and_run_elf         | Alloc pages, load ELF segments
  7   | M-mode    | load_and_run_elf         | Map kernel + framebuffer identity
  8   | M-mode    | run_elf_sv32             | Alloc process, set trapframe
  9   | M-mode    | enter_scheduler_smode    | Set MPP=S-mode, mepc=scheduler
 10   | S-mode    | mret → scheduler_entry   | Drop to S-mode (bare satp=0)
 11   | S-mode    | scheduler()              | Find RUNNABLE, set satp, swtch
 12   | S-mode    | swtch → child_trampoline | Restore context, set sepc=entry-4
 13   | U-mode    | sret → /sh entry         | Execute /sh with Sv32!
 14   | U-mode    | /sh: ecall (fork/exec)   | Trap to stvec_handler (medeleg[8])
 15   | S-mode    | stvec_handler            | Save regs, call syscall()
 16   | S-mode    | syscall → kexec/kfork    | Unmodified xv6 dispatcher
 17   | S-mode    | handle_syscall returns   | stvec_restore → sret back to U-mode
 18   | U-mode    | $ prompt                 | Shell waiting for input
```

The instruction count from boot to `$` prompt is approximately **1-2 million**
instructions (filesystem validation reads ~50 blocks, ELF loader reads /sh header
+ program headers + segment data).

---

## Key Architectural Insight

The entire system has **three privilege levels** running simultaneously:

1. **Machine mode (Rust interpreter)**: The `geos_native_boot.rs` loop runs at
   the host level — it's a Linux process executing xv6 instructions one at a time.
   M-mode ecalls are handled directly by the interpreter's SBI handler.

2. **Supervisor mode (geos_stubs.c)**: After `enter_scheduler_smode` drops to
   S-mode, the kernel code runs at supervisor privilege. It manages page tables
   (satp), handles delegated U-mode ecalls, and schedules processes.

3. **User mode (/sh, /ls, etc.)**: After `sret` from `stvec_restore`, user programs
   run at U-mode with Sv32 page tables active. They can't access kernel memory
   and must use ecalls for syscalls.

The interpreter differentiates them by examining the CPU's privilege level at
each step: M-mode ecalls go to the SBI handler directly; U-mode ecalls with
medeleg[8] set trigger a trap to S-mode instead, which is handled by xv6's own
`stvec_handler` and `syscall()` dispatcher.

---

## Files Referenced

| File | Purpose |
|------|---------|
| `src/bin/geos_native_boot.rs` | Rust host: loads ELF, runs interpreter loop, bridges stdin/stdout |
| `src/riscv/cpu/system.rs` | Interpreter: fetch-decode-execute step loop, ecall dispatch |
| `src/riscv/sbi.rs` | SBI handler: putchar, getchar, malloc, free, disk read/write |
| `native/Makefile` | Build: compiles xv6 + GeOS stubs into `geos_native.elf` |
| `native/geos_native.ld` | Linker script: layout at 0x80000000 with 16KB stack |
| `native/geos_sys.S` | Assembly: _entry, ecall wrappers, stvec_handler, sv32_enter_user, swtch |
| `native/geos_stubs.c` | C port layer: hardware stubs, scheduler, page tables, kexec/kfork, syscall handler |
| `native/geos_main.c` | C init: geos_main, fs_validation, load_and_run_elf with Sv32 |
| `native/console.c` | Custom console: polling getchar ecall instead of UART interrupts |
| `native/swtch.S` | Assembly: context switch (save/restore ra, sp, s0-s11) |
| `native/fb.c` | Framebuffer device: /fb for pixel drawing from user programs |
| `conductor/tracks/xv6-rv32/kernel/*.c` | Unmodified xv6: bio.c, fs.c, pipe.c, syscall.c, sysfile.c, sysproc.c, file.c, etc. |
