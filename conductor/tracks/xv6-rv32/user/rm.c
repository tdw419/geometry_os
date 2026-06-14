// rm: remove a file
#include "types.h"
#include "stat.h"
#include "user/user.h"

int
main(int argc, char *argv[])
{
  int i;

  if (argc < 2) {
    printf(2, "usage: rm files...\n");
    exit(1);
  }

  for (i = 1; i < argc; i++) {
    if (unlink(argv[i]) < 0) {
      printf(2, "rm: %s failed to delete\n", argv[i]);
      exit(1);
    }
  }
  exit(0);
}
