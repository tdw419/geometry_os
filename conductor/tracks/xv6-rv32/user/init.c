// init: the first user-space process.
// Opens console devices for stdin/stdout/stderr,
// then launches geos_init and sh.
#include "types.h"
#include "stat.h"
#include "user/user.h"
#include "fcntl.h"

char *sh_argv[] = { "sh", 0 };
char *geos_argv[] = { "geos_init", 0 };

int
main(void)
{
  int pid;

  if (open("console", O_RDWR) < 0) {
    mknod("console", 1, 1);
    open("console", O_RDWR);
  }
  dup(0);  // stdout
  dup(0);  // stderr

  // Spawn geos-init as background
  pid = fork();
  if (pid == 0) {
    exec("/geos_init", geos_argv);
    printf(1, "init: exec geos_init failed\x0a");
    exit(1);
  }

  // Loop spawning shell
  for (;;) {
    printf(1, "init: starting sh\x0a");
    pid = fork();
    if (pid < 0) {
      printf(1, "init: fork failed\x0a");
      exit(1);
    }
    if (pid == 0) {
      exec("/sh", sh_argv);
      printf(1, "init: exec sh failed\x0a");
      exit(1);
    }

    // Wait for shell to exit
    for (;;) {
      int wpid = wait();
      if (wpid == pid) {
        break; // Shell exited
      } else if (wpid < 0) {
        printf(1, "init: wait returned an error\x0a");
        exit(1);
      }
    }
  }
}
