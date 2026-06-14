#include "kernel/types.h"
#include "kernel/stat.h"
#include "user/user.h"
#include "fcntl.h"

#define FB_SIZE (256 * 256 * 4)

static uint32 pixels[256 * 256];

int main(int argc, char *argv[]) {
    printf(1, "Starting /dev/fb moving gradient demo...\x0a");

    int fd = open("fb", O_WRONLY);
    if (fd < 0) {
        printf(1, "Error: could not open /dev/fb (did you run init?)\x0a");
        exit(1);
    }

    // Run animation frames
    for (int frame = 0; frame < 100; frame++) {
        for (int y = 0; y < 256; y++) {
            for (int x = 0; x < 256; x++) {
                // Generate a moving color gradient
                uint8 r = (x + frame * 4) & 0xFF;
                uint8 g = (y + frame * 2) & 0xFF;
                uint8 b = (128 + frame) & 0xFF;
                uint8 a = 0xFF; // opaque

                // Color layout in GeOS is 0xRRGGBBAA
                pixels[y * 256 + x] = (r << 24) | (g << 16) | (b << 8) | a;
            }
        }

        // Write the whole frame to /dev/fb
        int n = write(fd, pixels, FB_SIZE);
        if (n != FB_SIZE) {
            printf(1, "Warning: short write to /dev/fb: %d bytes\x0a", n);
        }

        sleep(2); // small delay to let it animate
    }

    close(fd);
    printf(1, "Finished /dev/fb demo.\x0a");
    exit(0);
}
