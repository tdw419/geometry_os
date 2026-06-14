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

#define FB_BASE 0x60000000
#define FB_SIZE (256 * 256 * 4) // 262144 bytes
#define FB_CONTROL (FB_BASE + FB_SIZE)

#define FB_MAJOR 4

static struct {
  struct spinlock lock;
  uint32 offset;
} fb;

int
fbwrite(int user_src, uint64 src, int n)
{
  acquire(&fb.lock);

  // If the user writes a full screen, or if the write would overflow,
  // reset offset.
  if (n == FB_SIZE || fb.offset + n > FB_SIZE) {
    fb.offset = 0;
  }

  // Direct copy from user address to MMIO region (flat address space)
  char *dest = (char *)(FB_BASE + fb.offset);
  char *src_ptr = (char *)src;

  for (int i = 0; i < n; i++) {
    dest[i] = src_ptr[i];
  }

  fb.offset += n;
  if (fb.offset >= FB_SIZE) {
    fb.offset = 0;
  }

  // Write 1 to control register to flush / present
  volatile uint32 *ctrl = (volatile uint32 *)FB_CONTROL;
  *ctrl = 1;

  release(&fb.lock);
  return n;
}

int
fbread(int user_dst, uint64 dst, int n)
{
  acquire(&fb.lock);
  if (fb.offset + n > FB_SIZE) {
    fb.offset = 0;
  }
  
  char *src = (char *)(FB_BASE + fb.offset);
  char *dst_ptr = (char *)dst;
  for (int i = 0; i < n; i++) {
    dst_ptr[i] = src[i];
  }
  fb.offset += n;
  if (fb.offset >= FB_SIZE) {
    fb.offset = 0;
  }
  release(&fb.lock);
  return n;
}

void
fbinit(void)
{
  initlock(&fb.lock, "fb");
  fb.offset = 0;

  devsw[FB_MAJOR].read = fbread;
  devsw[FB_MAJOR].write = fbwrite;
}
