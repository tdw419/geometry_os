#include "kernel/types.h"
#include "kernel/stat.h"
#include "user/user.h"
#include "user/geos_protocol.h"

int main(int argc, char *argv[]) {
    printf(1, "Starting GeOS demo animation...\x0a");

    int x = 50, y = 50;
    int dx = 5, dy = 5;
    int w = 40, h = 40;

    for (int i = 0; i < 200; i++) {
        // Clear screen (using opcode 3: Clear)
        Command clear = { .op = 3, .x = 0, .y = 0, .w = 256, .h = 256, .color = 0x050508ff };
        submit_command(clear);

        // Update position
        x += dx;
        y += dy;

        // Bounce
        if (x <= 0 || x + w >= 256) dx = -dx;
        if (y <= 0 || y + h >= 256) dy = -dy;

        // Submit box (opcode 1: FillRect)
        Command box = { .op = 1, .x = x, .y = y, .w = w, .h = h, .color = 0x00ff00ff };
        submit_command(box);

        // Present (opcode 2: Present)
        Command present = { .op = 2, .x = 0, .y = 0, .w = 0, .h = 0, .color = 0 };
        submit_command(present);
        
        sleep(5); // Throttle
    }

    printf(1, "Demo finished.\x0a");
    exit(0);
}
