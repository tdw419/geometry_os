#include "types.h"
#include "stat.h"
#include "user.h"

int main(void)
{
    int pid, status;

    printf(1, "forktest: starting\n");

    pid = fork();
    if (pid < 0) {
        printf(1, "forktest: fork failed!\n");
        exit(1);
    }

    if (pid == 0) {
        // Child process
        printf(1, "forktest: child running (PID %d)\n", getpid());
        printf(1, "forktest: child exiting with status 42\n");
        exit(42);
    }

    // Parent process
    printf(1, "forktest: parent waiting for child (PID %d)\n", pid);
    status = wait();

    if (status < 0) {
        printf(1, "forktest: wait failed!\n");
        exit(1);
    }

    printf(1, "forktest: child exited with status %d\n", status);
    printf(1, "forktest: parent exiting\n");
    exit(0);
}