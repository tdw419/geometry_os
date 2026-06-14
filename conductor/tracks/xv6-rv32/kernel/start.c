#include "types.h"
#include "param.h"
#include "memlayout.h"
#include "riscv.h"
#include "defs.h"

void main();
void timerinit();

// entry.S needs one stack per CPU.
__attribute__((aligned(16))) char stack0[4096 * NCPU];

// entry.S jumps here in machine mode on stack0.
void
start()
{
  // set M Previous Privilege mode to Supervisor, for mret.
  unsigned long x = r_mstatus();
  x &= ~MSTATUS_MPP_MASK;
  x |= MSTATUS_MPP_S;
  w_mstatus(x);

  // set M Exception Program Counter to main, for mret.
  w_mepc((uint32)main);

  // disable paging for now.
  w_satp(0);

  // delegate all interrupts and exceptions to supervisor mode.
  w_medeleg(0xffff);
  w_mideleg(0xffff);
  w_sie(r_sie() | SIE_SEIE | SIE_STIE);

  // configure Physical Memory Protection to give supervisor mode
  // access to all of physical memory.
  // RV32: 34-bit physical address, PMP granularity is usually 4 bytes,
  // but the simplest config is to allow access to all of memory.
  // PMP address 0xFFFFFFFF covers the full 32-bit physical space.
  w_pmpaddr0(0xFFFFFFFF);
  w_pmpcfg0(0xf);

  // ask for clock interrupts via SBI timer.
  timerinit();

  // keep each CPU's hartid in its tp register, for cpuid().
  int id = r_mhartid();
  w_tp(id);

  // switch to supervisor mode and jump to main().
  asm volatile("mret");
}

// SBI ecall helper
static inline uint32
sbi_ecall(uint32 ext, uint32 fid, uint32 a0, uint32 a1)
{
  register uint32 r0 asm("a0") = a0;
  register uint32 r1 asm("a1") = a1;
  register uint32 r6 asm("a6") = fid;
  register uint32 r7 asm("a7") = ext;
  asm volatile("ecall"
    : "+r"(r0), "+r"(r1)
    : "r"(r6), "r"(r7)
    : "memory");
  return r0;
}

// ask each hart to generate timer interrupts.
// Uses SBI TIME extension (0x54494D45), fid=0 (set_timer)
// instead of the Sstc (stimecmp) CSR that xv6 normally uses.
void
timerinit()
{
  // Allow supervisor to read the time CSR.
  w_mcounteren(r_mcounteren() | 2);

  // Schedule the first timer interrupt: current time + ~100ms
  // read the time CSR
  uint32 now;
  asm volatile("csrr %0, time" : "=r"(now));
  uint32 next = now + 100000;

  // SBI_TIME set_timer: fid=0, next_time in (a0, a1)
  // For RV32, the timer value may be 64 bits, passed as (lo, hi)
  sbi_ecall(0x54494D45, 0, next, 0);
}
