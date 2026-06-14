// fork_test: Test fork() and wait() syscalls
#include "types.h"
#include "stat.h"
#include "user/user.h"

int
main(int argc, char *argv[])
{
  int pid;
  
  printf(1, "fork_test: Testing fork/wait syscalls\n");
  
  // Test 1: Basic fork
  pid = fork();
  if (pid < 0) {
    printf(1, "fork_test: fork() FAILED\n");
    exit(1);
  }
  
  if (pid == 0) {
    // Child process
    printf(1, "Child: running (pid=%d)\n", getpid());
    exit(0);  // Exit successfully
  } else {
    // Parent process
    printf(1, "Parent: forked child pid=%d\n", pid);
    
    // Wait for child
    int wpid = wait();
    if (wpid != pid) {
      printf(1, "Parent: wait() FAILED (expected %d, got %d)\n", pid, wpid);
      exit(1);
    }
    
    printf(1, "Parent: child reaped\n");
    printf(1, "fork_test: PASSED\n");
    exit(0);
  }
}