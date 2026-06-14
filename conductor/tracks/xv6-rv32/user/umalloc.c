#include "types.h"
#include "stat.h"
#include "user/user.h"

// Simple sbrk-based malloc/free.

void* malloc(uint nbytes)
{
  char *p;
  uint n = nbytes + sizeof(uint);
  
  p = sbrk(n);
  if (p == (char*) -1)
    return 0;
  
  // store size at the start of the allocation
  *(uint*)p = nbytes;
  return p + sizeof(uint);
}

void free(void *ap)
{
  // In this minimal allocator, free is a no-op.
  // Real xv6 has a more complex freelist-based allocator,
  // but for the shell and basic tools, leaking is fine
  // since process memory is reclaimed on exit.
  (void)ap;
}
