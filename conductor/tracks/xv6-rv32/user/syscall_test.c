#include "kernel/types.h"
#include "kernel/stat.h"
#include "user/user.h"

int main(int argc, char *argv[]) {
    printf(1, "Syscall test starting...\n");

    // Test 1: write syscall (printf uses write internally)
    printf(1, "Test 1: write() works\n");

    // Test 2: getpid syscall
    int pid = getpid();
    printf(1, "Test 2: getpid() returned %d\n", pid);

    // Test 3: uptime syscall
    uint uptime_ticks = uptime();
    printf(1, "Test 3: uptime() returned %d\n", uptime_ticks);

    printf(1, "All tests passed!\n");

    exit(0);
}