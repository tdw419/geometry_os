#include "types.h"
#include "param.h"
#include "spinlock.h"
#include "sleeplock.h"
#include "riscv.h"
#include "defs.h"
#include "fs.h"
#include "buf.h"
#include "proc.h"

void
main()
{
  printfinit();
  printf("\\n");
  printf("xv6 native kernel is booting on Geometry OS\\n");
  printf("\\n");

  // Initialize kernel subsystems in order
  kinit();            // physical page allocator
  kvminit();          // create kernel page table
  kvminithart();      // turn on paging
  procinit();         // process table
  trapinit();         // trap vectors
  trapinithart();     // install kernel trap vector
  binit();            // buffer cache
  iinit();            // inode table
  fileinit();         // file table
  virtio_disk_init(); // emulated hard disk

  printf("Filesystem initialized.\\n");

  // Create first user process (will call fsinit and exec /sh)
  userinit();

  printf("Starting scheduler...\\n");

  // Start the scheduler (never returns)
  scheduler();
}

// Minimal cpuid stub for single-hart system
int cpuid(void) { return 0; }

// Minimal mycpu stub
struct cpu* mycpu(void) {
  extern struct cpu cpus[NCPU];
  return &cpus[0];
}

// Minimal myproc stub
struct proc* myproc(void) {
  struct cpu *c = mycpu();
  return c->proc;
}

// Yield stub
void yield(void) {
  // For now, just return
}

// Minimal acquire/release for spinlocks
void acquire(struct spinlock *lk) {
  // Minimal implementation
  while (__atomic_test_and_set(&lk->locked, __ATOMIC_ACQUIRE)) {
    // spin
  }
}

void release(struct spinlock *lk) {
  __atomic_clear(&lk->locked, __ATOMIC_RELEASE);
}

// Minimal acquire/release for sleeplocks
void acquiresleep(struct sleeplock *lk) {
  acquire(&lk->lk);
  while (lk->locked) {
    // sleep on lk
  }
  lk->locked = 1;
  lk->pid = myproc()->pid;
  release(&lk->lk);
}

void releasesleep(struct sleeplock *lk) {
  acquire(&lk->lk);
  lk->locked = 0;
  lk->pid = 0;
  release(&lk->lk);
}

int holdingsleep(struct sleeplock *lk) {
  int r;
  acquire(&lk->lk);
  r = lk->locked && (lk->pid == myproc()->pid);
  release(&lk->lk);
  return r;
}