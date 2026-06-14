// min_read.c - Minimal test for sys_read syscall
#include "kernel/types.h"
#include "kernel/stat.h"
#include "user/user.h"

int main(int argc, char *argv[]) {
    printf(1, "min_read: Testing sys_read...\n");

    char buf[16];
    int n = read(0, buf, sizeof(buf));

    printf(1, "min_read: read returned %d\n", n);

    if (n > 0) {
        printf(1, "min_read: bytes: ");
        for (int i = 0; i < n; i++) {
            if (buf[i] >= ' ' && buf[i] <= '~') {
                printf(1, "%c", buf[i]);
            } else {
                printf(1, "\\x%02x", (unsigned char)buf[i]);
            }
        }
        printf(1, "\n");
    }

    exit(0);
}