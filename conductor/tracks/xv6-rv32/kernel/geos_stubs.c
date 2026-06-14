#include "types.h"
#include "param.h"
#include "spinlock.h"
#include "sleeplock.h"
#include "riscv.h"
#include "defs.h"
#include "fs.h"
#include "buf.h"
#include "proc.h"

// Write a byte to MMIO for text output
void consputc(int c) {
    *(volatile uint32*)0xFFFB0000 = c;
}

void uartputc(int c) {
    *(volatile uint32*)0xFFFB0000 = c;
}

void uartputc_sync(int c) {
    *(volatile uint32*)0xFFFB0000 = c;
}

// Memory allocator stubs (use ecalls 0x100 and 0x101)
void* kalloc(void) {
    register void* a0 asm("a0");
    register uint32 a7 asm("a7") = 0x100;
    asm volatile("ecall"
                 : "=r"(a0)
                 : "r"(a7)
                 : );
    return a0;
}

void kfree(void *p) {
    if (!p) return;
    register void* a0 asm("a0") = p;
    register uint32 a7 asm("a7") = 0x101;
    asm volatile("ecall"
                 :
                 : "r"(a0), "r"(a7)
                 : );
}

// Identity or no-op replacements for page tables (flat layout)
void kvminit(void) {}
void kvminithart(void) {}
void kvmmap(pagetable_t gp, uint64 va, uint64 pa, uint64 sz, int perm) {}
int mappages(pagetable_t gp, uint64 va, uint64 pa, uint64 sz, int perm) { return 0; }
pagetable_t uvmcreate(void) { return (pagetable_t)0x1; } // dummy non-null
uint64 uvmalloc(pagetable_t gp, uint32 oldsz, uint32 newsz, int perm) { return newsz; }
uint64 uvmdealloc(pagetable_t gp, uint32 oldsz, uint32 newsz) { return newsz; }
void uvmfree(pagetable_t gp, uint32 sz) {}
void uvmunmap(pagetable_t gp, uint32 va, uint32 sz, int do_free) {}
void uvmclear(pagetable_t gp, uint64 va) {}
uint64 walkaddr(pagetable_t gp, uint64 va) { return va; } // Identity mapping
int copyout(pagetable_t gp, uint32 dstva, char *src, uint32 len) {
    memmove((void*)(uint32)dstva, src, len);
    return 0;
}
int copyin(pagetable_t gp, char *dst, uint32 srcva, uint32 len) {
    memmove(dst, (void*)(uint32)srcva, len);
    return 0;
}
int copyinstr(pagetable_t gp, char *dst, uint32 srcva, uint32 max) {
    char *src = (char*)(uint32)srcva;
    uint32 i = 0;
    while(i < max) {
        dst[i] = src[i];
        if(src[i] == '\0')
            return 0;
        i++;
    }
    return -1;
}

// Disk block read/write stub using custom VM disk opcodes
void virtio_disk_rw(struct buf *b, int write) {
    register uint32 a0 asm("a0") = b->blockno;
    register void* a1 asm("a1") = b->data;
    register uint32 a7 asm("a7") = write ? 0x201 : 0x200;
    
    asm volatile("ecall"
                 :
                 : "r"(a0), "r"(a1), "r"(a7)
                 : "memory");
}

// Other unused hardware subsystem stubs
void plicinit(void) {}
void plicinithart(void) {}
int plic_claim(void) { return 0; }
void plic_complete(int irq) {}
void virtio_disk_init(void) {}
void virtio_disk_intr(void) {}
void consoleinit(void) {}
void uartinit(void) {}

// Lock and process scheduling stubs (single-hart flat layout)
void initlock(struct spinlock *lk, char *name) {}
void acquire(struct spinlock *lk) {}
void release(struct spinlock *lk) {}
int holding(struct spinlock *lk) { return 1; }
void sleep(void *chan, struct spinlock *lk) {}
void wakeup(void *chan) {}
int killed(struct proc *p) { return 0; }

int either_copyout(int user_dst, uint64 dst, void *src, uint64 len) {
    memmove((void*)(uint32)dst, src, len);
    return 0;
}

int either_copyin(void *dst, int user_src, uint64 src, uint64 len) {
    memmove(dst, (void*)(uint32)src, len);
    return 0;
}
