#include "kernel/types.h"
#include "kernel/stat.h"
#include "user/user.h"
#include "user/geos_protocol.h"

int main(int argc, char *argv[]) {
    printf(1, "Starting GeOS test producer...\x0a");

    // Submit a Clear command (opcode 3 is Clear)
    Command clear = { .op = 3, .x = 0, .y = 0, .w = 256, .h = 256, .color = 0x1a1a2eff };
    submit_command(clear);

    // Submit a FillRect command (a box)
    Command box = { .op = 1, .x = 50, .y = 50, .w = 100, .h = 100, .color = 0x00ff00ff };
    submit_command(box);

    // Present
    Command present = { .op = 2, .x = 0, .y = 0, .w = 0, .h = 0, .color = 0 };
    submit_command(present);

    printf(1, "Commands submitted to GeOS display server.\x0a");
    exit(0);
}
