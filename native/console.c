// native/console.c -- Custom console for xv6 native port on GeOS
//
// Replaces xv6's UART-driven console with GeOS ecall-based I/O.
// Output: putchar ecall (SBI_CONSOLE_PUTCHAR)
// Input:  getchar_impl ecall (SBI_CONSOLE_GETCHAR) -- non-blocking poll
//
// Instead of blocking on UART interrupts, consoleread polls the getchar
// ecall in a tight loop.  The GeOS interpreter delivers host-typed characters
// through its UART rx_buf, which the SBI handler serves directly.

#include "types.h"
#include "param.h"
#include "spinlock.h"
#include "sleeplock.h"
#include "fs.h"
#include "file.h"
#include "memlayout.h"
#include "riscv.h"
#include "defs.h"
#include "proc.h"

#define BACKSPACE 0x100       // erase the last output character
#define C(x)      ((x) - '@') // Control-x

// External ecall wrappers
extern int getchar_impl(void);
extern void putchar(int c);
extern void uartwrite(char *buf, int n);
extern void procdump(void);
extern int killed(struct proc *p);
extern struct proc *myproc(void);

// ── Console buffer ────────────────────────────────────────────────────
struct {
  struct spinlock lock;

  // input circular buffer
#define INPUT_BUF_SIZE 128
  char buf[INPUT_BUF_SIZE];
  uint r; // Read index
  uint w; // Write index
  uint e; // Edit index
} cons;

// ── Output: single character ──────────────────────────────────────────
void
consputc(int c)
{
  if (c == BACKSPACE) {
    // if the user typed backspace, overwrite with a space.
    putchar('\b');
    putchar(' ');
    putchar('\b');
  } else {
    putchar(c);
  }
}

// ── Write syscall handler ─────────────────────────────────────────────
// user_src=1 means src is a user-space address.
// In our native port, all addresses are flat (no page table switch),
// so we can access user addresses directly.
int
consolewrite(int user_src, uint64 src, int n)
{
  char buf[32];
  int i = 0;

  while (i < n) {
    int nn = sizeof(buf);
    if (nn > n - i)
      nn = n - i;
    // Direct copy from user space (flat address space in native mode)
    char *src_p = (char *)src + i;
    for (int j = 0; j < nn; j++) buf[j] = src_p[j];
    uartwrite(buf, nn);
    i += nn;
  }

  return i;
}

// ── Read syscall handler (polling with yield) ─────────────────────────
// Polls getchar_impl() and yields to scheduler when no input.
// Characters echoed and buffered by line.
int
consoleread(int user_dst, uint64 dst, int n)
{
  uint target;
  int c;

  // Forward declaration for yield
  extern void yield(void);

  target = n;
  acquire(&cons.lock);

  while (n > 0) {
    // Wait until the console buffer has data
    while (cons.r == cons.w) {
      // No data in buffer — poll for external input from the GeOS host.
      // We drop the lock while polling (consoleintr may need it for echo).
      release(&cons.lock);

      int ch = getchar_impl();
      if (ch != -1 && (uint32)ch != 0xFFFFFFFF) {
        // Got a character — echo it and buffer it
        if (ch == '\r') ch = '\n';
        consputc(ch);

        acquire(&cons.lock);
        if (ch != 0 && cons.e - cons.r < INPUT_BUF_SIZE) {
          cons.buf[cons.e++ % INPUT_BUF_SIZE] = (char)ch;
          // Always make the character immediately readable
          cons.w = cons.e;
        }
        // We have at least one byte now — exit the inner wait
        break;
      }

      acquire(&cons.lock);
      // Check if process was killed
      if (killed(myproc())) {
        release(&cons.lock);
        return -1;
      }
      // No input available — yield CPU to let other processes run.
      // Release the lock before yielding to avoid deadlock with the
      // scheduler.  We'll re-acquire when rescheduled.
      release(&cons.lock);
      yield();
      acquire(&cons.lock);
    }

    // If we broke out of the inner loop but buffer is still empty
    // (e.g. killed during poll), abort.
    if (cons.r == cons.w) {
      release(&cons.lock);
      return -1;
    }

    // Read one byte from the buffer
    c = cons.buf[cons.r++ % INPUT_BUF_SIZE];

    // Copy to user buffer
    release(&cons.lock);
    ((char *)dst)[0] = (char)c;
    acquire(&cons.lock);

    dst++;
    --n;

    if (c == '\n') {
      // A whole line has arrived, return.
      break;
    }
  }

  release(&cons.lock);
  return target - n;
}

// ── Input interrupt handler (called when polling gets a char) ────────
// Process a single input character: erase/kill processing, echo, buffer.
// This mirrors xv6's consoleintr() but can be called from the poll path.
void
consoleintr(int c)
{
  acquire(&cons.lock);

  switch (c) {
  case C('P'): // Print process list.
    procdump();
    break;

  case C('U'): // Kill line.
    while (cons.e != cons.w &&
           cons.buf[(cons.e - 1) % INPUT_BUF_SIZE] != '\n') {
      cons.e--;
      consputc(BACKSPACE);
    }
    break;

  case C('H'): // Backspace
  case '\x7f': // Delete key
    if (cons.e != cons.w) {
      cons.e--;
      consputc(BACKSPACE);
    }
    break;

  default:
    if (c != 0 && cons.e - cons.r < INPUT_BUF_SIZE) {
      c = (c == '\r') ? '\n' : c;

      // echo back to the user.
      consputc(c);

      // store for consumption by consoleread().
      cons.buf[cons.e++ % INPUT_BUF_SIZE] = (char)c;

      if (c == '\n' || c == C('D') || cons.e - cons.r == INPUT_BUF_SIZE) {
        // wake up consoleread() if a whole line (or end-of-file)
        // has arrived.
        cons.w = cons.e;
      }
    }
    break;
  }

  release(&cons.lock);
}

// ── Initialization ────────────────────────────────────────────────────
void
consoleinit(void)
{
  initlock(&cons.lock, "cons");

  // Connect read and write system calls to our handlers.
  devsw[CONSOLE].read = consoleread;
  devsw[CONSOLE].write = consolewrite;
}
