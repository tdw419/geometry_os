// simple_user.c - Minimal xv6 user program to test Sv32 translation
// Just prints a message and exits

#include "user.h"
#include "stat.h"

int main(void) {
    printf(1, "simple_user: Sv32 translation works!\n");
    printf(1, "simple_user: Executing in U-mode\n");
    exit(0);
}