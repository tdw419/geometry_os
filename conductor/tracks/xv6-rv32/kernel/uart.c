//
// Console output via SBI DBCN extension.
// Replaces the 16550a UART driver xv6 uses on real hardware.
// Our emulator intercepts SBI ecalls and routes console output
// to its internal buffer.
//
// SBI DBCN extensions used:
//   SBI_EXT_DBCN (0x4442434E), fid=2: console_write_byte
//   SBI_EXT_DBCN (0x4442434E), fid=1: console_read
//

#include "types.h"
#include "param.h"
#include "memlayout.h"
#include "riscv.h"
#include "spinlock.h"
#include "proc.h"
#include "defs.h"

static struct spinlock tx_lock;
static int tx_busy;

extern volatile int panicking; // from printf.c
extern volatile int panicked;  // from printf.c

// SBI ecall helper: returns (a0, a1)
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
  return r0; // return value is in a0
}

void
uartinit(void)
{
  initlock(&tx_lock, "uart");
  tx_busy = 0;
}

// write a byte via SBI DBCN
void
uartputc_sync(int c)
{
  if (panicking == 0)
    push_off();

  if (panicked) {
    for (;;)
      ;
  }

  // SBI DBCN console_write_byte (ext=0x4442434E, fid=2, a0=char)
  sbi_ecall(0x4442434E, 2, (uint32)c, 0);

  if (panicking == 0)
    pop_off();
}

// transmit buf[] via SBI DBCN
void
uartwrite(char buf[], int n)
{
  acquire(&tx_lock);

  int i;
  for (i = 0; i < n; i++) {
    // no TX-complete interrupt to wait for with SBI DBCN
    sbi_ecall(0x4442434E, 2, (uint32)buf[i], 0);
  }

  release(&tx_lock);
}

// try to read one input character via SBI DBCN console_read.
// return -1 if none is waiting.
static int
uartgetc(void)
{
  // Try SBI DBCN console_read (ext=0x4442434E, fid=1, a0=0)
  // Returns (success, char) in a0, a1
  register uint32 r0 asm("a0") = 0;
  register uint32 r1 asm("a1") = 0;
  register uint32 r6 asm("a6") = 1; // fid = console_read
  register uint32 r7 asm("a7") = 0x4442434E; // SBI_EXT_DBCN

  asm volatile("ecall"
    : "+r"(r0), "+r"(r1)
    : "r"(r6), "r"(r7)
    : "memory");

  // SBI_SUCCESS = 0, r1 contains the character
  if (r0 == 0) {
    return (int)r1;
  }
  return -1;
}

// handle a uart interrupt
void
uartintr(void)
{
  // No hardware interrupts for UART in our emulator.
  // Process any pending input.
  while (1) {
    int c = uartgetc();
    if (c == -1)
      break;
    consoleintr(c);
  }
}
