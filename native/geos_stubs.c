// geos_stubs.c -- Hardware abstraction layer for xv6 native port on GeOS.
//
// Replaces xv6's hardware-dependent code (UART, page tables, scheduler, disk)
// with thin ecall wrappers into the GeOS RISC-V interpreter's SBI handler.
//
// NOTE: We do NOT include riscv.h or defs.h here — the xv6 .c files
// (bio.c, spinlock.c, etc.) include those themselves. This file only
// provides the implementations of hardware-dependent functions that
// xv6's portable code calls.

#include "types.h"
#include "param.h"

// ── Locally defined types (before headers that need them) ───────────
// riscv.h defines pagetable_t and PGSIZE, but we don't include riscv.h
// because its inline CSR functions conflict with our stubs.
typedef uint32 *pagetable_t;
#define PGSIZE  4096

#include "spinlock.h"
#include "sleeplock.h"
#include "fs.h"      // defines NDIRECT, BSIZE
#include "file.h"    // inode struct, devsw
#include "proc.h"    // needs pagetable_t
#include "buf.h"     // uses BSIZE for data[] member

// ── Forward declarations of functions from xv6 C files we call ─────
extern void acquire(struct spinlock *lk);
extern void release(struct spinlock *lk);
extern int printf(const char *fmt, ...);
extern void set_myproc(struct proc *p);

// ── Forward declarations from geos_sys.S ────────────────────────────
extern void putchar(int c);
extern int getchar_impl(void);
extern void *kalloc_impl(void);
extern void kfree_impl(void *addr);
extern int disk_read_impl(uint blockno, void *buf);
extern int disk_write_impl(uint blockno, void *buf);
extern void shutdown(void) __attribute__((noreturn));
extern char *safestrcpy(char *s, const char *t, int n);

// ── Forward declarations of page table functions (defined below) ───
pagetable_t alloc_pgtbl(void);
int sv32_map_page(pagetable_t root, uint va, uint pa, uint perm);
static inline void w_satp(uint val);
static inline void w_sepc(uint val);
static inline void sfence_vma(void);

// ── Forward declarations of scheduler primitives ───────────────────
void sleep(void *chan, struct spinlock *lk);
void wakeup(void *chan);

// ── Static CPU/Proc for mycpu()/myproc() ───────────────────────────
static struct cpu single_cpu;
static struct proc dummy_proc = {
    .pid = 1,
    .state = RUNNING,
};
static struct trapframe dummy_tf;
static struct proc *current_proc = 0;

struct cpu *
mycpu(void)
{
    return &single_cpu;
}

struct proc *
myproc(void)
{
    if (current_proc)
        return current_proc;
    if (dummy_proc.trapframe == 0)
        dummy_proc.trapframe = &dummy_tf;
    return &dummy_proc;
}

void
set_myproc(struct proc *p)
{
    current_proc = p;
    extern char _stack_top;
    uint32 kstack_top = (p && p->kstack) ? (p->kstack + PGSIZE) : (uint32)&_stack_top;
    asm volatile("csrw sscratch, %0" :: "r"(kstack_top));
    if (p && p->pagetable) {
        uint32 satp_val = 0x80000000 | (((uint32)p->pagetable) >> 12);
        asm volatile("csrw satp, %0" :: "r"(satp_val));
        asm volatile("sfence.vma" ::: "memory");
    }
}

// ── Stub scheduler functions ───────────────────────────────────────

void intr_on(void) { }
void intr_off(void) { }
int  intr_get(void) { return 1; }


// ── Console output ──────────────────────────────────────────────────

void uartputc(int c)     { putchar(c); }
void uartputc_sync(int c){ putchar(c); }
void uartinit(void)      { }

void
uartwrite(char *buf, int n)
{
    for (int i = 0; i < n; i++) {
        putchar(buf[i]);
    }
}

void
procdump(void)
{
    printf("procdump: dummy process trace\n");
}

// ── Memory allocator ────────────────────────────────────────────────

void *
kalloc(void)
{
    void *p = kalloc_impl();
    return p;
}
void kfree(void *pa) { if (pa) kfree_impl(pa); }

// ── Page table stubs (flat address space) ───────────────────────────

pagetable_t uvmcreate(void)        { return alloc_pgtbl(); }
void        kvminit(void)          { }
void        kvminithart(void)      { }
void        uvminit(pagetable_t pt, uchar *src, uint sz) { }
uint        uvmalloc(pagetable_t pt, uint o, uint n, int x) { return n; }
uint64      uvmdealloc(pagetable_t pt, uint32 o, uint32 n) { return n; }
void        freewalk(pagetable_t pt) { }
void        uvmunmap(pagetable_t pt, uint va, uint np, int f) { }
void        uvmclear(pagetable_t pt, uint va) { }
uint        walkaddr(pagetable_t pt, uint va) { return va; }
int         mappages(pagetable_t pt, uint va, uint sz, uint pa, int perm) { return 0; }
uint        kvmpa(uint va) { return va; }

// ── Remaining hardware stubs ───────────────────────────────────────

void procinit(void)          { }
void trapinit(void)          { }
void trapinithart(void)      { }
void plicinit(void)          { }
void plicinithart(void)      { }
int  plic_claim(void)        { return 0; }
void plic_complete(int irq)  { }
void timerinit(void)         { }
void virtio_disk_init(void)  { }

// ── Disk I/O ───────────────────────────────────────────────────────
//
// xv6 uses 1024-byte blocks (BSIZE) but the GeOS ecall uses 512-byte
// sectors.  Each xv6 block maps to two consecutive 512-byte sectors:
//   ecall_sector = xv6_blockno * 2
//   ecall_sector = xv6_blockno * 2 + 1

void
virtio_disk_rw(struct buf *b, int write)
{
    if (write) {
        disk_write_impl(b->blockno * 2, b->data);            // sector 0 → buf[0..512)
        disk_write_impl(b->blockno * 2 + 1, b->data + 512);  // sector 1 → buf[512..1024)
    } else {
        disk_read_impl(b->blockno * 2, b->data);             // buf[0..512) = sector 0
        disk_read_impl(b->blockno * 2 + 1, b->data + 512);   // buf[512..1024) = sector 1
    }
}

// ── printf (bypasses UART, writes directly via putchar ecall) ──────

static void print_str(const char *s) {
    if (!s) { print_str("(null)"); return; }
    while (*s) putchar(*s++);
}

static void print_hex(uint32 n) {
    // Print n as hex without 0x prefix, minimum width, no padding.
    // We skip leading zeros for cleaner output.
    int started = 0;
    for (int i = 28; i >= 0; i -= 4) {
        int d = (n >> i) & 0xF;
        if (d != 0 || started || i == 0) {
            started = 1;
            putchar(d < 10 ? '0' + d : 'a' + d - 10);
        }
    }
}

int
printf(const char *fmt, ...)
{
    __builtin_va_list ap;
    __builtin_va_start(ap, fmt);
    for (const char *p = fmt; *p; p++) {
        if (*p != '%') { putchar(*p); continue; }
        p++;
        switch (*p) {
        case 'd': {
            int val = __builtin_va_arg(ap, int);
            if (val < 0) { putchar('-'); val = -val; }
            char buf[12]; int i = 0;
            if (val == 0) { putchar('0'); break; }
            while (val > 0) { buf[i++] = '0' + (val % 10); val /= 10; }
            while (i > 0) putchar(buf[--i]);
            break;
        }
        case 'x': print_hex(__builtin_va_arg(ap, uint32)); break;
        case 's': print_str(__builtin_va_arg(ap, const char *)); break;
        case 'c': putchar(__builtin_va_arg(ap, int)); break;
        case '%': putchar('%'); break;
        default:  putchar('%'); putchar(*p); break;
        }
    }
    __builtin_va_end(ap);
    return 0;
}

void
panic(char *s)
{
    printf("\nPanic: %s\n", s);
    shutdown();
}

// ── Memory copy for user/kernel ──────────────────────────────────────
// For native port, these are simple copies (no user/kernel separation)
// Local implementations to avoid linking issues

static void *
stub_memmove(void *dst, const void *src, uint n)
{
    const char *s = src;
    char *d = dst;
    if (n == 0)
        return dst;
    if (s < d && s + n > d) {
        s += n;
        d += n;
        while (n-- > 0)
            *--d = *--s;
    } else
        while (n-- > 0)
            *d++ = *s++;
    return dst;
}

// ── Sv32 Page Table constants ──────────────────────────────────────
#define PTE_V      (1 << 0)   // Valid
#define PTE_R      (1 << 1)   // Readable
#define PTE_W      (1 << 2)   // Writable
#define PTE_X      (1 << 3)   // Executable
#define PTE_U      (1 << 4)   // User-accessible
#define PTE_G      (1 << 5)   // Global (skip ASID check)
#define PTE_A      (1 << 6)   // Accessed
#define PTE_D      (1 << 7)   // Dirty

#define PTE_FLAGS(pte)    ((pte) & 0x3FF)
#define PTE_PPN(pte)      (((pte) >> 10) & 0x003FFFFF)
#define MAKE_PTE(ppn, flags)  (((ppn) << 10) | (flags))

int
copyout(pagetable_t pagetable, uint64 dstva, char *src, uint64 len)
{
    // Walk the provided page table to translate dstva → physical, then write.
    // DO NOT read SATP — SATP may point to a different process.
    
    uint32 *pt = (uint32 *)pagetable;
    for (uint64 copied = 0; copied < len; ) {
        uint32 vpn1 = ((dstva + copied) >> 22) & 0x3FF;
        uint32 vpn0 = ((dstva + copied) >> 12) & 0x3FF;
        uint32 off  = (dstva + copied) & 0xFFF;
        uint32 l1 = pt[vpn1];
        if (!(l1 & 1)) return -1;
        uint32 *l2 = (uint32 *)(PTE_PPN(l1) << 12);
        uint32 l2e = l2[vpn0];
        if (!(l2e & 1)) return -1;
        // Also check writable permission (PTE_W is bit 2)
        if (!(l2e & 4)) return -1;
        char *phys = (char *)((PTE_PPN(l2e) << 12) + off);
        uint32 chunk = PGSIZE - off;
        if (chunk > len - copied) chunk = len - copied;
        stub_memmove(phys, src + copied, chunk);
        copied += chunk;
    }
    return 0;
}

// ── copyin / copyout / copyinstr ──

int
copyin(pagetable_t pagetable, char *dst, uint64 srcva, uint64 len)
{
    // Walk the provided page table to translate srcva → physical, then read.
    // DO NOT read SATP — SATP may point to a different process.
    
    uint32 *pt = (uint32 *)pagetable;
    for (uint64 copied = 0; copied < len; ) {
        uint32 vpn1 = ((srcva + copied) >> 22) & 0x3FF;
        uint32 vpn0 = ((srcva + copied) >> 12) & 0x3FF;
        uint32 off  = (srcva + copied) & 0xFFF;
        uint32 l1 = pt[vpn1];
        if (!(l1 & 1)) return -1;
        uint32 *l2 = (uint32 *)(PTE_PPN(l1) << 12);
        uint32 l2e = l2[vpn0];
        if (!(l2e & 1)) return -1;
        char *phys = (char *)((PTE_PPN(l2e) << 12) + off);
        uint32 chunk = PGSIZE - off;
        if (chunk > len - copied) chunk = len - copied;
        stub_memmove(dst + copied, phys, chunk);
        copied += chunk;
    }
    return 0;
}

int
either_copyout(int user_dst, uint64 dst, char *src, uint64 len)
{
    if (user_dst) {
        // User destination: walk page table of current process
        struct proc *p = myproc();
        if (p && p->pagetable)
            return copyout(p->pagetable, dst, src, len);
        return -1;
    }
    // Kernel destination: direct copy
    stub_memmove((void *)dst, src, len);
    return 0;
}

// Saved trapframe pointer for syscall register override during kexec
static uint32 *saved_tf;

// ── Process Table and Scheduler ─────────────────────────────────────

static struct proc ptable[NPROC];
static int next_pid = 1;

// Forward: swtch defined in swtch.S
extern void swtch(struct context *old, struct context *new);

struct proc *
allocproc(void)
{
    for (int i = 0; i < NPROC; i++) {
        if (ptable[i].state == UNUSED) {
            struct proc *p = &ptable[i];
            p->state = USED;
            p->pid = next_pid++;
            p->parent = 0;
            p->chan = 0;
            p->killed = 0;
            p->xstate = 0;
            p->sz = 0;

            // Allocate kernel stack and trapframe
            p->kstack = (uint32)kalloc();
            p->trapframe = (struct trapframe *)kalloc();
            if (!p->kstack || !p->trapframe) {
                p->state = UNUSED;
                return 0;
            }

            // Allocate empty page table for user space
            p->pagetable = alloc_pgtbl();
            if (!p->pagetable) {
                kfree((void *)(uint64)p->kstack);
                kfree(p->trapframe);
                p->state = UNUSED;
                return 0;
            }

            // Identity-map kernel for this process so it can handle S-mode traps
            for (uint va = 0x80000000; va < 0x80600000; va += PGSIZE) {
                if (sv32_map_page(p->pagetable, va, va, PTE_V | PTE_R | PTE_W | PTE_X) != 0) {
                    kfree((void *)(uint64)p->kstack);
                    kfree(p->trapframe);
                    p->state = UNUSED;
                    return 0;
                }
            }

            // Zero trapframe
            uint32 *tf = (uint32 *)p->trapframe;
            for (int j = 0; j < PGSIZE / 4; j++)
                tf[j] = 0;
            p->trapframe->kernel_sp = p->kstack + PGSIZE;

            // Zero open files
            for (int f = 0; f < NOFILE; f++)
                p->ofile[f] = 0;

            // Zero context (will be set by fork or exec)
            extern void *memset(void *, int, uint);
            memset(&p->context, 0, sizeof(p->context));

            p->cwd = 0;
            p->name[0] = 0;
            return p;
        }
    }
    return 0;
}

// exec_pending flag: set by kexec to signal handle_syscall to override sepc
// so that sret jumps to the new program's entry point instead of ecall+4.
static int exec_pending = 0;

// ── Context switch helpers ──────────────────────────────────────────
//
// sched(): save current process context and switch to scheduler.
// Must be called with current process in a non-RUNNING state.
// After sched(), execution continues in scheduler() on the next cycle.
// sched() never returns to where it was called — it returns from
// wherever swtch() loads.

struct context sched_ctx;  // scheduler's saved context
static int sched_active = 0;      // 1 when scheduler is running
static int sched_initialized = 0; // 1 after first sched() call

// Forward declarations
void scheduler(void);

// Scheduler entry point — when a process first yields, swtch loads
// sched_ctx which points here.  The scheduler runs in a loop:
// pick a RUNNABLE process, swtch to it, when it yields pick another.
static void __attribute__((noreturn))
scheduler_entry(void)
{
    for (;;) {
        scheduler();
    }
}

void
sched(void)
{
    struct proc *p = myproc();
    if (p->state == RUNNING)
        panic("sched: running");
    if (p->state == UNUSED)
        panic("sched: unused");

    if (!sched_initialized) {
        // First call: save current process context so the scheduler
        // can resume us later.  Then initialize sched_ctx so swtch
        // enters the scheduler loop.
        sched_initialized = 1;

        // Self-switch to populate p->context with current ra, sp
        // and callee-saved registers.
        swtch(&p->context, &p->context);

        // Now set up sched_ctx so the scheduler runs on the boot
        // process's kernel stack.  When another process yields,
        // swtch loads sched_ctx and ret jumps to scheduler_entry.
        sched_ctx.ra = (uint32)scheduler_entry;
        sched_ctx.sp = p->kstack + PGSIZE - 64;

        // Return to caller (sleep → kwait → geos_main).
        // The next time kwait calls sleep → sched(), sched_initialized
        // is 1 and swtch properly saves p->context and loads sched_ctx.
        return;
    }

    sched_active = 1;
    swtch(&p->context, &sched_ctx);

    // We get here only when scheduler() picks us again
    sched_active = 0;
}

void
yield(void)
{
    struct proc *p = myproc();
    if (p) {
        p->state = RUNNABLE;
        sched();
    }
}

// ── Process termination and waiting ─────────────────────────────────

void
freeproc(struct proc *p)
{
    if (!p || p->state == UNUSED) return;
    if (p->trapframe) { kfree(p->trapframe); p->trapframe = 0; }
    if (p->kstack)    { kfree((void *)(uint64)p->kstack); p->kstack = 0; }
    // Close all open files
    for (int f = 0; f < NOFILE; f++) {
        if (p->ofile[f]) {
            // fileclose from xv6's file.c
            // For now, just drop the reference
            p->ofile[f] = 0;
        }
    }
    p->pagetable = 0;
    p->sz = 0;
    p->state = UNUSED;
}

void
kexit(int status)
{
    struct proc *p = myproc();
    printf("[kexit] pid=%d parent=%p exit=%d\n", p ? p->pid : -1, p ? p->parent : 0, status);

    // Store exit status
    p->xstate = status;

    // Close all open files
    for (int fd = 0; fd < NOFILE; fd++) {
        if (p->ofile[fd]) {
            // fileclose from xv6's file.c
            // For now, just drop the reference
            p->ofile[fd] = 0;
        }
    }

    // Mark as zombie and wake parent
    p->state = ZOMBIE;

    // Wake up the parent if it's waiting
    wakeup(p->parent);

    // Reparent children to init (PID 1)
    for (int i = 0; i < NPROC; i++) {
        if (ptable[i].parent == p) {
            ptable[i].parent = &ptable[0]; // First process acts as init
        }
    }

    // If no parent exists (init exiting), shut down
    if (!p->parent) {
        shutdown();
    }

    // Jump into the scheduler, never to return
    sched();
    panic("zombie exit");
}

int
kwait(uint64 addr)
{
    struct proc *p = myproc();

    for (;;) {
        // Scan through table looking for exited children
        int havekids = 0;
        for (int i = 0; i < NPROC; i++) {
            struct proc *pp = &ptable[i];
            if (pp->parent == p) {
                havekids = 1;
                if (pp->state == ZOMBIE) {
                    // Found one
                    int pid = pp->pid;
                    if (addr != 0) {
                        // Copy exit status to user space
                        uint32 status = pp->xstate;
                        copyout(p->pagetable, addr, (char *)&status, sizeof(status));
                    }
                    freeproc(pp);
                    return pid;
                }
            }
        }

        // No point waiting if we don't have any children
        if (!havekids) {
            return -1;
        }

        // Wait for a child to exit
        sleep(p, 0);  // No lock for simple implementation
    }
}

// ── Scheduler ───────────────────────────────────────────────────────
//
// Picks the next RUNNABLE process and switches to it.
// Called from sched() after a process yields.
// Returns when a process calls sched() again.

void
scheduler(void)
{
    struct proc *p = myproc();
    // If there's a current running process that called sched(),
    // it's already in a non-RUNNING state (SLEEPING, ZOMBIE, or RUNNABLE).
    // We need to pick the next one.

    // Look for any RUNNABLE process (try to give CPU to a different one first)
    for (int pass = 0; pass < 2; pass++) {
        for (int i = 0; i < NPROC; i++) {
            if (ptable[i].state == RUNNABLE) {
                if (pass == 0 && p == &ptable[i])
                    continue; // skip current on first pass — prefer others
                ptable[i].state = RUNNING;
                set_myproc(&ptable[i]);
                sched_active = 0;
                swtch(&sched_ctx, &ptable[i].context);
                // When we return here, this process has been switched away
                set_myproc(p);  // restore previous process
                sched_active = 1;
            }
        }
    }
    // If no other process was RUNNABLE, re-enter the current one
    if (p && p->state == RUNNABLE) {
        p->state = RUNNING;
        set_myproc(p);
        sched_active = 0;
        swtch(&sched_ctx, &p->context);
        set_myproc(0);
        sched_active = 1;
    }
    // Fallback: spin
}

// ── sleep/wakeup stubs (simple — the real scheduler will use these) ─

// Forward declarations
void sleep(void *chan, struct spinlock *lk);
void wakeup(void *chan);

void
sleep(void *chan, struct spinlock *lk)
{
    struct proc *p = myproc();

    // Mark process as sleeping and release any lock
    p->chan = chan;
    p->state = SLEEPING;

    // Invoke scheduler to switch to another process
    sched();

    // When we wake up, reacquire lock if provided
    if (lk) {
        acquire(lk);
    }
}

void
wakeup(void *chan)
{
    // Wake up all processes sleeping on chan
    for (int i = 0; i < NPROC; i++) {
        struct proc *p = &ptable[i];
        if (p->state == SLEEPING && p->chan == chan) {
            p->state = RUNNABLE;
        }
    }
}

// ── Page table copy for fork ────────────────────────────────────────
//
// uvmcopy(): walk the parent's Sv32 page tables, allocate new pages for
// the child, copy content, and map in the child's page table.
// Does NOT copy the kernel identity map (that's set up in exec).

int
uvmcopy(pagetable_t old, pagetable_t new, uint sz)
{
    for (int idx1 = 0; idx1 < 1024; idx1++) {
        uint l1_pte = old[idx1];
        if ((l1_pte & PTE_V) == 0) continue;
        
        uint l2_pa = PTE_PPN(l1_pte) << 12;
        pagetable_t l2 = (pagetable_t)(uint64)l2_pa;
        
        for (int idx0 = 0; idx0 < 1024; idx0++) {
            uint pte = l2[idx0];
            if ((pte & PTE_V) == 0) continue;
            if ((pte & PTE_U) == 0) continue; // Only copy User pages
            
            uint va = (idx1 << 22) | (idx0 << 12);
            uint pa = PTE_PPN(pte) << 12;
            uint flags = PTE_FLAGS(pte);
            
            void *new_pa = kalloc();
            if (!new_pa) return -1;
            
            uint32 *src = (uint32 *)(uint64)pa;
            uint32 *dst = (uint32 *)new_pa;
            for (int b = 0; b < PGSIZE / 4; b++)
                dst[b] = src[b];
                
            if (sv32_map_page(new, va, (uint)new_pa, flags) != 0) {
                kfree(new_pa);
                return -1;
            }
        }
    }
    return 0;
}

// ── Fork implementation ─────────────────────────────────────────────

// Forward declaration of assembly helper
extern void sret_to_user(struct trapframe *tf);

// Entry point for child process when scheduler switches to it.
// Called via swtch() restoring child's context.ra = child_entry.
// The child's stack is kstack+PGSIZE (4KB page allocated in allocproc).
// Restores user registers from trapframe and srets to user-space.
void
child_entry(void)
{
    struct proc *p = myproc();
    if (p) {
        p->state = RUNNING;
    }
    // sret to user-space using trapframe register state
    if (p && p->trapframe) {
        sret_to_user(p->trapframe);
    }
    // Should never reach here
    for (;;);
}

int
kfork(void)
{
    // Allocate a new process
    struct proc *np = allocproc();
    if (!np) {
        return -1;
    }

    struct proc *p = myproc();

    // Copy user memory from parent to child using Sv32 page tables
    if (uvmcopy(p->pagetable, np->pagetable, p->sz) < 0) {
        freeproc(np);
        np->state = UNUSED;
        return -1;
    }
    np->sz = p->sz;

    // Also copy kernel identity mapping (0x80000000..0x80600000) to child's page table
    // so the child can access kernel memory in S-mode via Sv32 page tables
    for (uint va = 0x80000000; va < 0x80600000; va += PGSIZE) {
        if (sv32_map_page(np->pagetable, va, va, PTE_V | PTE_R | PTE_W | PTE_X) != 0) {
            freeproc(np);
            np->state = UNUSED;
            return -1;
        }
    }

    // Copy saved user registers (trapframe)
    uint32 *parent_tf = (uint32 *)p->trapframe;
    uint32 *child_tf = (uint32 *)np->trapframe;
    for (int i = 0; i < PGSIZE / 4; i++)
        child_tf[i] = parent_tf[i];

    // Cause fork to return 0 in the child (trapframe->a0 offset 56)
    child_tf[56 / 4] = 0;

    // Restore child's own kernel stack pointer in trapframe
    np->trapframe->kernel_sp = np->kstack + PGSIZE;

    // Copy open file descriptors with proper refcounting via filedup()
    extern struct file* filedup(struct file*);
    for (int f = 0; f < NOFILE; f++) {
        struct file *fp = p->ofile[f];
        np->ofile[f] = fp ? filedup(fp) : 0;
    }
    np->cwd = p->cwd;

    // Copy process name
    safestrcpy(np->name, p->name, sizeof(np->name));

    // Set parent relationship
    np->parent = p;

    // Set child's context to start executing child_entry
    // When scheduler() calls swtch(&sched_ctx, &np->context),
    // swtch restores ra=child_entry and ret jumps there.
    np->context.ra = (uint32)child_entry;
    np->context.sp = np->kstack + PGSIZE;

    // Mark child as runnable
    np->state = RUNNABLE;

    return np->pid;
}

int
kexec(char *path, char **argv)
{
    // ── Forward declarations of xv6 FS functions used below ───────
    extern struct inode* namei(char *path);
    extern void ilock(struct inode*);
    extern void iunlockput(struct inode*);
    extern int readi(struct inode*, int user_dst, uint64 dst, uint off, uint n);
    extern void begin_op(void);
    extern void end_op(void);
    extern int printf(const char *fmt, ...);

    // ── ELF32 definitions (mirrored from geos_main.c) ─────────────
    #define ELF_MAGIC 0x464C457FU
    struct elf32_hdr {
        uint  magic;
        uchar ident[12];
        ushort type;
        ushort machine;
        uint  version;
        uint  entry;
        uint  phoff;
        uint  shoff;
        uint  flags;
        ushort ehsize;
        ushort phentsize;
        ushort phnum;
        ushort shentsize;
        ushort shnum;
        ushort shstrndx;
    };
    struct elf32_phdr {
        uint type;
        uint offset;
        uint vaddr;
        uint paddr;
        uint filesz;
        uint memsz;
        uint flags;
        uint align;
    };
    #define PT_LOAD     1
    #define PF_X        1
    #define PF_W        2
    #define PF_R        4
    #define PGSIZE      4096
    #define USER_STACK_PAGES 32

    // ── Open the ELF file ─────────────────────────────────────────
    struct inode *ip = namei(path);
    if (!ip) {
        return -1;
    }
    ilock(ip);
    if (ip->type != 2) { // T_FILE = 2
        iunlockput(ip);
        return -1;
    }

    // ── Read ELF32 header ─────────────────────────────────────────
    struct elf32_hdr hdr;
    begin_op();
    int r = readi(ip, 0, (uint64)&hdr, 0, sizeof(hdr));
    end_op();
    if (r < (int)sizeof(hdr)) {
        iunlockput(ip);
        return -1;
    }
    if (hdr.magic != ELF_MAGIC || hdr.ident[0] != 1) {
        iunlockput(ip);
        return -1;
    }

    // ── Create root page table ────────────────────────────────────
    pagetable_t root_pt = alloc_pgtbl();
    if (!root_pt) {
        iunlockput(ip);
        return -1;
    }
    uint root_pa = (uint)root_pt;

    // ── Identity-map kernel ───────────────────────────────────────
    for (uint va = 0x80000000; va < 0x80600000; va += PGSIZE) {
        if (sv32_map_page(root_pt, va, va, PTE_V | PTE_R | PTE_W | PTE_X) != 0) {
            iunlockput(ip);
            return -1;
        }
    }

    // ── Load PT_LOAD segments ─────────────────────────────────────
    uint nloaded = 0;
    for (int i = 0; i < hdr.phnum && i < 32; i++) {
        struct elf32_phdr ph;
        begin_op();
        r = readi(ip, 0, (uint64)&ph, hdr.phoff + i * sizeof(ph), sizeof(ph));
        end_op();
        if (r < (int)sizeof(ph)) break;
        if (ph.type != PT_LOAD) continue;

        uint seg_start = ph.vaddr & ~(PGSIZE - 1);
        uint seg_end = (ph.vaddr + ph.memsz + PGSIZE - 1) & ~(PGSIZE - 1);
        uint seg_pages = (seg_end - seg_start) / PGSIZE;

        for (uint off = 0; off < seg_pages; off++) {
            uint va = seg_start + off * PGSIZE;
            void *pa = kalloc();
            if (!pa) { iunlockput(ip); return -1; }
            uint pa_val = (uint)pa;

            // Zero the page
            for (int b = 0; b < PGSIZE; b++)
                ((char*)pa)[b] = 0;

            // Read segment data
            uint page_start = seg_start + off * PGSIZE;
            uint page_end = page_start + PGSIZE;
            uint copy_start = (page_start < ph.vaddr) ? ph.vaddr : page_start;
            uint copy_end = (page_end < ph.vaddr + ph.filesz) ? page_end : (ph.vaddr + ph.filesz);
            uint buf_offset = copy_start - ph.vaddr;
            uint copy_len = (copy_end > copy_start) ? (copy_end - copy_start) : 0;

            if (copy_len > 0) {
                begin_op();
                readi(ip, 0, (uint64)((char*)pa + (copy_start - page_start)),
                      ph.offset + buf_offset, copy_len);
                end_op();
            }

            uint perm = PTE_V | PTE_U;
            if (ph.flags & PF_R) perm |= PTE_R;
            if (ph.flags & PF_W) perm |= PTE_W;
            if (ph.flags & PF_X) perm |= PTE_X;

            if (sv32_map_page(root_pt, va, pa_val, perm) != 0) {
                iunlockput(ip);
                return -1;
            }
        }
        nloaded++;
    }

    if (nloaded == 0) {
        iunlockput(ip);
        return -1;
    }

    // ── Map user stack ────────────────────────────────────────────
    uint stack_top = 0x80000000;  // kernel boundary; SP starts just below this
    uint stack_base = stack_top - USER_STACK_PAGES * PGSIZE;
    for (uint va = stack_base; va < stack_top; va += PGSIZE) {
        void *pa = kalloc();
        if (!pa) { iunlockput(ip); return -1; }
        for (int b = 0; b < PGSIZE; b++)
            ((char*)pa)[b] = 0;
        if (sv32_map_page(root_pt, va, (uint)pa, PTE_V | PTE_U | PTE_R | PTE_W) != 0) {
            iunlockput(ip);
            return -1;
        }
    }

    iunlockput(ip);

    // ── Install new page tables ───────────────────────────────────
    struct proc *p = myproc();

    p->pagetable = root_pt;
    // Set sz to end of BSS (page-aligned) for proper heap/sbrk behavior.
    // fetchaddr/argstr are patched to allow up to kernel boundary.
    // The LOAD segment's memsz gives us the full size including BSS.
    uint prog_end = 0;
    for (int i = 0; i < hdr.phnum && i < 32; i++) {
        // Re-read PH to compute max end address
        struct elf32_phdr ph2;
        begin_op();
        r = readi(ip, 0, (uint64)&ph2, hdr.phoff + i * sizeof(ph2), sizeof(ph2));
        end_op();
        if (r < (int)sizeof(ph2)) break;
        if (ph2.type != PT_LOAD) continue;
        uint seg_end = ph2.vaddr + ph2.memsz;
        if (seg_end > prog_end) prog_end = seg_end;
    }
    p->sz = (prog_end + PGSIZE - 1) & ~(PGSIZE - 1);
    if (p->sz == 0) p->sz = PGSIZE;

    // Write satp (Sv32 mode bit | PPN)
    uint satp_val = 0x80000000 | (root_pa >> 12);
    w_satp(satp_val);
    sfence_vma();

    // ── Set trapframe for new program ─────────────────────────────
    // New user stack layout (growing down from stack_top):
    //   [strings] [argv[] pointers] [argc] ← sp

    // Count argc and calculate total string data size
    extern int strlen(const char *);
    int argc = 0;
    uint total_str_len = 0;
    if (argv) {
        for (int i = 0; argv[i]; i++) {
            total_str_len += strlen(argv[i]) + 1;
            argc++;
        }
    }
    
    // Layout sizes
    uint argv_array_size = (argc + 1) * sizeof(uint32); // char *argv[] + NULL
    uint total_size = 4 + argv_array_size + total_str_len; // argc + argv[] + strings
    total_size = (total_size + 3) & ~3; // align to 4 bytes
    
    uint user_sp = stack_top - total_size;
    char *stack_ptr = (char *)(uint64)user_sp;
    
    // Write argc at stack base
    *(uint32 *)stack_ptr = (uint32)argc;
    stack_ptr += 4;
    
    // argv pointers go here (user-space VA addresses)
    uint32 *argv_ptrs = (uint32 *)stack_ptr;
    stack_ptr += argv_array_size;
    // Copy strings to user stack, record their user-space addresses
    for (int i = 0; i < argc; i++) {
        uint32 str_va = (uint32)(uint64)stack_ptr;
        argv_ptrs[i] = str_va;
        const char *src = argv[i];
        while (*src) *stack_ptr++ = *src++;
        *stack_ptr++ = '\0';
    }
    argv_ptrs[argc] = 0; // NULL terminator
    
    if (p->trapframe) {
        p->trapframe->epc = hdr.entry;
        p->trapframe->sp = (uint32)(uint64)(stack_top - total_size);
        p->trapframe->a0 = (uint32)argc;
        p->trapframe->a1 = (uint32)(uint64)argv_ptrs; // user-space VA
        p->trapframe->ra = 0xFFFFFFFF; // no return address
    }

    // ── Signal sepc override ──────────────────────────────────────
    // The stvec_handler does: csrr sepc; addi sepc,4; sret
    // We need sret to jump to hdr.entry, so we write sepc = entry - 4
    // After stvec_handler's addi: sepc = entry, sret → entry
    //
    // Override saved a1 on the kernel stack so stvec_handler restores
    // the correct argv pointer (tf[9] = saved a1 slot at offset 36)
    saved_tf[9] = (uint32)(uint64)argv_ptrs;
    
    // Return argc (not 0) so syscall() sets trapframe->a0 = argc.
    // The stvec_handler writes this value to the saved a0 slot,
    // so the new program starts with a0 = argc (via lw a0, 4(sp)).
    exec_pending = 1;
    w_sepc(hdr.entry - 4);

    return argc;
}

int
growproc(int n)
{
    struct proc *p = myproc();
    uint sz = p->sz;
    
    if (n > 0) {
        // Grow: allocate and map pages from old sz to new sz
        uint new_sz = sz + n;
        // Page-align
        new_sz = (new_sz + PGSIZE - 1) & ~(PGSIZE - 1);
        
        // Don't grow past the kernel boundary
        if (new_sz > 0x80000000u)
            new_sz = 0x80000000u;
        if (new_sz <= sz)
            return 0;  // already at max
        
        for (uint va = (sz + PGSIZE - 1) & ~(PGSIZE - 1); va < new_sz; va += PGSIZE) {
            void *pa = kalloc();
            if (!pa) return -1;
            // Zero the page
            for (int b = 0; b < PGSIZE; b++)
                ((char*)pa)[b] = 0;
            // Map in process page table
            if (sv32_map_page(p->pagetable, va, (uint)pa, PTE_V | PTE_U | PTE_R | PTE_W) != 0) {
                kfree(pa);
                return -1;
            }
        }
        p->sz = new_sz;
    } else if (n < 0) {
        // Shrink (not implemented — return success)
        uint new_sz;
        if ((uint)(-n) > sz)
            new_sz = 0;
        else
            new_sz = sz + n;
        // In a real system we'd free pages here; for now just update sz
        p->sz = new_sz;
    }
    return 0;
}

int
kkill(int pid)
{
    return -1;
}

int
either_copyin(char *dst, int user_src, uint64 src, uint64 len)
{
    stub_memmove(dst, (void *)src, len);
    return 0;
}

int
copyinstr(pagetable_t pagetable, char *dst, uint64 srcva, uint64 max)
{
    // Read string from user address space by walking the provided page table.
    // DO NOT read SATP — SATP may point to a different process's page table
    // (the page table is NOT updated on context switches).
    
    // Use the provided pagetable directly (physical address of root PT)
    uint32 *pagetable_phys = (uint32 *)pagetable;
    
    // Walk the page table: VA = [VPN1:10][VPN0:10][offset:12]
    uint32 vpn1 = (srcva >> 22) & 0x3FF;
    uint32 vpn0 = (srcva >> 12) & 0x3FF;
    uint32 offset = srcva & 0xFFF;
    
    // Read L1 PTE
    uint32 l1_pte = pagetable_phys[vpn1];
    if (!(l1_pte & 1)) return -1;  // V bit not set
    
    // Get L2 table base: PPN(pte) << 12
    uint32 *l2_table = (uint32 *)(PTE_PPN(l1_pte) << 12);
    
    // Read L2 PTE
    uint32 l2_pte = l2_table[vpn0];
    if (!(l2_pte & 1)) return -1;  // V bit not set
    
    // Get physical page address: PPN(pte) << 12 (no offset — current_offset handles it)
    char *phys_src = (char *)((PTE_PPN(l2_pte) << 12));
    
    // Read the string byte by byte, handling page boundaries
    uint64 i;
    for (i = 0; i < max - 1; i++) {
        // Check if we've crossed a page boundary
        uint32 current_offset = (srcva + i) & 0xFFF;
        if (current_offset == 0 && i > 0) {
            // Need to walk the page table again for the new page
            uint32 new_va = srcva + i;
            vpn1 = (new_va >> 22) & 0x3FF;
            vpn0 = (new_va >> 12) & 0x3FF;
            
            l1_pte = pagetable_phys[vpn1];
            if (!(l1_pte & 1)) return -1;
            
            l2_table = (uint32 *)(PTE_PPN(l1_pte) << 12);
            l2_pte = l2_table[vpn0];
            if (!(l2_pte & 1)) return -1;
            
            phys_src = (char *)(PTE_PPN(l2_pte) << 12);
        }
        
        char c = phys_src[current_offset];
        dst[i] = c;
        if (i == 0) {
            // copyinstr debug disabled
            (void)srcva; (void)pagetable_phys; (void)vpn1; (void)vpn0;
            (void)offset; (void)l1_pte; (void)l2_pte; (void)phys_src; (void)c;
        }
        if (c == '\0') return 0;  // success
    }
    dst[i] = '\0';
    return 0;
}

// ── Ticks and timer stubs ─────────────────────────────────────────────

struct spinlock tickslock;
int ticks;

int
killed(struct proc *p)
{
    return 0;
}

// ── Sv32 Page Table Support (continued) ─────────────────────────
//
// Sv32: two-level page table. Root has 1024 PTEs (4KB), each PTE points
// to a 2nd-level page table (also 1024 PTEs). Leaf PTEs map 4KB pages.

// Sv32 VPN fields
#define VPN1(va)   (((va) >> 22) & 0x3FF)
#define VPN0(va)   (((va) >> 12) & 0x3FF)
#define VA_OFFSET(va) ((va) & 0xFFF)
#define PAGE_ALIGN_DOWN(va) ((va) & ~0xFFF)
#define PAGE_ALIGN_UP(va)   (((va) + 0xFFF) & ~0xFFF)

// CSR access (we don't include riscv.h — conflicting inline stubs)
static inline void w_satp(uint val) {
    asm volatile("csrw satp, %0" : : "r"(val) : "memory");
}

static inline uint r_satp(void) {
    uint val;
    asm volatile("csrr %0, satp" : "=r"(val));
    return val;
}

static inline void w_stvec(uint val) {
    asm volatile("csrw stvec, %0" : : "r"(val) : "memory");
}

static inline void w_sepc(uint val) {
    asm volatile("csrw sepc, %0" : : "r"(val) : "memory");
}

static inline void w_mepc(uint val) {
    asm volatile("csrw mepc, %0" : : "r"(val) : "memory");
}

static inline uint r_mstatus(void) {
    uint val;
    asm volatile("csrr %0, mstatus" : "=r"(val));
    return val;
}

static inline void w_mstatus(uint val) {
    asm volatile("csrw mstatus, %0" : : "r"(val) : "memory");
}

static inline void w_mie(uint val) {
    asm volatile("csrw mie, %0" : : "r"(val) : "memory");
}

static inline void w_medeleg(uint val) {
    asm volatile("csrw medeleg, %0" : : "r"(val) : "memory");
}

// SFENCE.VMA via raw encoding (may not be in march)
static inline void sfence_vma(void) {
    asm volatile(".word 0x12000073" ::: "memory");
}

// ── Page Table Operations ───────────────────────────────────────────
//
// Creates and manages Sv32 page tables for user-space execution.
// Kernel identity map: 0x80000000 → 0x80000000 (for S-mode kernel code)
// User map: 0x0 → kalloc'd physical pages (for user binary segments)

#define PGT_VPN1_SHIFT 22
#define PGT_VPN0_SHIFT 12

// Allocate a new 4KB zeroed page for use as a page table level.
pagetable_t
alloc_pgtbl(void)
{
    pagetable_t pt = (pagetable_t)kalloc();
    if (!pt) return 0;
    for (int i = 0; i < 1024; i++)
        pt[i] = 0;
    return pt;
}

// Walk the Sv32 page tables and install a leaf PTE mapping va → pa.
// Creates intermediate page table pages as needed.
// pt: virt addr of root page table. va/pa: 4KB-aligned virtual/physical.
// perm: PTE permission bits (e.g., PTE_R | PTE_W | PTE_X | PTE_U | PTE_V)
int
sv32_map_page(pagetable_t root, uint va, uint pa, uint perm)
{
    if (va & 0xFFF) return -1;  // not page-aligned
    if (pa & 0xFFF) return -1;  // not page-aligned

    int idx1 = VPN1(va);
    int idx0 = VPN0(va);

    // Read L1 PTE
    uint l1_pte = root[idx1];

    if ((l1_pte & PTE_V) == 0) {
        // No L1 entry — allocate a level-2 page table
        pagetable_t l2 = alloc_pgtbl();
        if (!l2) return -1;
        uint l2_pa = (uint)l2;  // kalloc returns physical address
        // L1 PTE: points to L2 page table (non-leaf — V only, no R/W/X)
        // Without R/W/X, the MMU treats this as a pointer to the next level.
        uint ppn = l2_pa >> 12;
        root[idx1] = MAKE_PTE(ppn, PTE_V);
    }

    // Re-read L1 (in case we just allocated it)
    l1_pte = root[idx1];
    uint l2_pa = PTE_PPN(l1_pte) << 12;

    // L2 is at physical address l2_pa. We need its virtual address to write.
    // Since we're in bare mode (M-mode) with no page tables, virtual == physical.
    pagetable_t l2 = (pagetable_t)(uint64)l2_pa;

    // Write leaf PTE
    uint ppn = pa >> 12;
    l2[idx0] = MAKE_PTE(ppn, perm);
    return 0;
}

// ── Sv32 Activation ─────────────────────────────────────────────────
//
// Called from geos_main.c after page tables are set up and ELF is loaded.
// Configures satp, mstatus.MPP for S-mode transition, sets mepc to entry,
// then executes mret to drop into S-mode with Sv32 enabled.
//
// This function never returns — mret jumps to the user entry point.

// Defined in geos_sys.S — sets up CSRs and does mret
extern void sv32_enter_user(uint entry, uint root_pa) __attribute__((noreturn));

// ── Syscall Handler (called from stvec_handler) ─────────────────────
//
// Handles xv6 user-space syscalls from S-mode. The user program calls
// ecall with syscall number in a7 and args in a0-a5.
// stvec_handler saves context and calls this function.

// Declare the xv6 syscall dispatcher
extern void syscall(void);

void
handle_non_syscall_trap(uint32 scause, uint32 sepc)
{
    struct proc *p = myproc();
    printf("trap: scause=%x sepc=%x pid=%d\n", scause, sepc, p ? p->pid : -1);
}

int
handle_syscall(uint32 *tf, int sysno, int arg0, int arg1, int arg2, int arg3, int arg4, int arg5)
{
    saved_tf = tf;

    struct proc *p = myproc();
    // printf("handle_syscall: pid=%d sysno=%d epc=%x\n", p ? p->pid : -1, sysno, tf[32]);
    
    // DEBUG: check memory at the shell's .rodata address (VA 0x10b4)
    // Walk the current process's page table
    if (p && p->pagetable) {
        uint va = 0x10b4;
        uint vpn1 = (va >> 22) & 0x3FF;
        uint vpn0 = (va >> 12) & 0x3FF;
        uint off = va & 0xFFF;
        uint *root = (uint *)p->pagetable;
        uint l1 = root[vpn1];
        if (l1 & PTE_V) {
            uint *l2 = (uint *)(PTE_PPN(l1) << 12);
            uint l2e = l2[vpn0];
            if (l2e & PTE_V) {
                char *phys = (char *)((PTE_PPN(l2e) << 12) + off);
                // [SVC-DEBUG suppressed]
                (void)phys;
            }
        }
    }
    
    // Force SBRK_EAGER (arg1=1) for sys_sbrk
    if (sysno == 12) {
        arg1 = 1;
    }
    
    if (p && p->trapframe) {
        p->trapframe->a7 = sysno;
        p->trapframe->a0 = arg0;
        p->trapframe->a1 = arg1;
        p->trapframe->a2 = arg2;
        p->trapframe->a3 = arg3;
        p->trapframe->a4 = arg4;
        p->trapframe->a5 = arg5;
        p->trapframe->a6 = tf[14]; // a6 is tf[14] (offset 56)

        // Save all other GPRs so they are preserved in fork
        p->trapframe->ra = tf[0];   // ra is tf[0] (offset 0)
        p->trapframe->gp = tf[1];   // gp is tf[1] (offset 4)
        p->trapframe->tp = tf[2];   // tp is tf[2] (offset 8)
        p->trapframe->t0 = tf[3];   // t0 is tf[3] (offset 12)
        p->trapframe->t1 = tf[4];   // t1 is tf[4] (offset 16)
        p->trapframe->t2 = tf[5];   // t2 is tf[5] (offset 20)
        p->trapframe->s0 = tf[6];   // s0 is tf[6] (offset 24)
        p->trapframe->s1 = tf[7];   // s1 is tf[7] (offset 28)
        p->trapframe->s2 = tf[16];  // s2 is tf[16] (offset 64)
        p->trapframe->s3 = tf[17];  // s3 is tf[17] (offset 68)
        p->trapframe->s4 = tf[18];  // s4 is tf[18] (offset 72)
        p->trapframe->s5 = tf[19];  // s5 is tf[19] (offset 76)
        p->trapframe->s6 = tf[20];  // s6 is tf[20] (offset 80)
        p->trapframe->s7 = tf[21];  // s7 is tf[21] (offset 84)
        p->trapframe->s8 = tf[22];  // s8 is tf[22] (offset 88)
        p->trapframe->s9 = tf[23];  // s9 is tf[23] (offset 92)
        p->trapframe->s10 = tf[24]; // s10 is tf[24] (offset 96)
        p->trapframe->s11 = tf[25]; // s11 is tf[25] (offset 100)
        p->trapframe->t3 = tf[26];  // t3 is tf[26] (offset 104)
        p->trapframe->t4 = tf[27];  // t4 is tf[27] (offset 108)
        p->trapframe->t5 = tf[28];  // t5 is tf[28] (offset 112)
        p->trapframe->t6 = tf[29];  // t6 is tf[29] (offset 116)
        p->trapframe->sp = tf[30];  // user sp is tf[30] (offset 120)

        // Save current sepc from stack slot (offset 128 / word 32)
        p->trapframe->epc = tf[32];
    }

    // Call standard xv6 syscall handler dispatcher
    syscall();

    // The dispatcher updates p->trapframe->a0 with the return value.
    if (p->trapframe) {
        // Write syscall return value back to tf[8] (a0 stack slot)
        tf[8] = p->trapframe->a0;
        // Write updated epc back to stack slot tf[32] so it gets restored to sepc.
        // If exec_pending is set, subtract 4 because the stvec assembly handler
        // will add 4 to tf[32] right after returning from handle_syscall.
        if (exec_pending) {
            tf[32] = p->trapframe->epc - 4;
            exec_pending = 0;
        } else {
            tf[32] = p->trapframe->epc;
        }
        // Trace syscall completion for child
        if (p->pid == 2) {
            // [trace suppressed]
            (void)p;
        }
        return p->trapframe->a0;
    }
    return -1;
}