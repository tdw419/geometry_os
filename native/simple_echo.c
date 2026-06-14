// Simple echo test - just writes "hello" and exits
#include "kernel/types.h"
#include "kernel/stat.h"
#include "user/user.h"

int main(int argc, char *argv[]) {
    write(1, "hello\n", 6);
    exit(0);
    return 0;
}