// Stub implementations for devices not present in the GeOS emulator.
// Our emulator doesn't emulate PLIC, virtio, or UART at MMIO addresses.
// Interrupts are delivered via the SBI layer.
//
// The virtio disk stub uses pre-computed block data from stubs_data.h
// which is auto-generated from the user binaries during the build.

#include "types.h"
#include "riscv.h"
#include "defs.h"
#include "param.h"
#include "spinlock.h"
#include "sleeplock.h"
#include "fs.h"
#include "buf.h"
#include "stubs_data.h"

void
plicinit(void)
{
}

void
plicinithart(void)
{
}

int
plic_claim(void)
{
  return 0;
}

void
plic_complete(int irq)
{
}

void
virtio_disk_init(void)
{
  // All initialization is in the pre-computed data.
  // The superblock (block 1) is already available in stubs_data.h,
  // so fsinit() can read it directly without extra setup.
}

void
virtio_disk_rw(struct buf *b, int write)
{
  uint blockno = b->blockno;

  if (blockno >= FSSIZE) {
    memset(b->data, 0, BSIZE);
    return;
  }

  if (write) {
    stubs_write_block(blockno, b->data);
  } else {
    // First check the write cache (for blocks written during this boot)
    if (!stubs_read_block(blockno, b->data)) {
      // Fall back to pre-computed data
      stubs_get_block(blockno, b->data);
    }
  }
}

void
virtio_disk_intr(void)
{
  // No virtio interrupts.
}
