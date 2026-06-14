// Physical memory layout (GeOS emulator version)
//
// Our emulator maps RAM at PA 0x80000000.
// No UART at 0x10000000 — we use SBI DBCN for console.
// No PLIC — interrupts are handled by the emulator's SBI layer.
// No virtio — we don't have a block device yet.
//
// Layout:
//   80000000 -- _entry, kernel text and data
//   end      -- start of kernel page allocation area
//   PHYSTOP  -- end of RAM

#define KERNBASE 0x80000000L
// Temporarily reduced for emulator testing: 4MB instead of 128MB
// PHYSTOP  (KERNBASE + 128 * 1024 * 1024)
#define PHYSTOP  (KERNBASE + 4 * 1024 * 1024)

// map the trampoline page to the highest address,
// in both user and kernel space.
// Sv32 virtual address space:
//   0x00000000 - 0x7FFFFFFF  user space (2GB)
//   0x80000000 - 0xFFFFFFFF  kernel space (2GB)
// MAXVA = 0x40000000 is the boundary for user addresses.
// The trampoline and trapframe go in kernel space at the top.
#define TRAMPOLINE (0xFFFFFFFF - PGSIZE + 1)  // 0xFFFFF000

// map kernel stacks beneath the trampoline,
// each surrounded by invalid guard pages.
#define KSTACK(p) (TRAMPOLINE - ((p) + 1) * 2 * PGSIZE)

// User memory layout.
// Address zero first:
//   text
//   original data and bss
//   fixed-size stack
//   expandable heap
//   ...
//   TRAPFRAME (p->trapframe, used by the trampoline)
//   TRAMPOLINE (the same page as in the kernel)
#define TRAPFRAME (TRAMPOLINE - PGSIZE)
