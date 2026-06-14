// test_fork.c - Test fork/wait/exit syscalls
#include "syscall.h"
#include "types.h"

int main(void) {
    printf("test_fork: starting\n");
    
    int pid = fork();
    if (pid < 0) {
        printf("fork failed!\n");
        exit(1);
    }
    
    if (pid == 0) {
        // Child process
        printf("child: PID %d running\n", getpid());
        for (int i = 0; i < 3; i++) {
            printf("child: counting %d\n", i);
        }
        printf("child: exiting with code 42\n");
        exit(42);
    }
    
    // Parent process
    printf("parent: forked child %d\n", pid);
    
    int status;
    int child_pid = wait(&status);
    if (child_pid < 0) {
        printf("wait failed!\n");
        exit(1);
    }
    
    printf("parent: child %d exited with status %d\n", child_pid, status);
    
    if (status == 42) {
        printf("test_fork: PASS - fork/wait/exit working correctly\n");
    } else {
        printf("test_fork: FAIL - expected exit status 42, got %d\n", status);
    }
    
    exit(0);
}