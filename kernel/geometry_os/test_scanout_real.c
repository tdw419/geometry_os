// test_scanout_real.c - Real DRM/KMS framebuffer display
// Compile with: gcc -o test_scanout_real test_scanout_real.c
// Run with: sudo ./test_scanout_real

#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <fcntl.h>
#include <unistd.h>
#include <errno.h>
#include <sys/ioctl.h>
#include <sys/mman.h>
#include <drm/drm.h>
#include <drm/drm_mode.h>
#include <drm/drm_fourcc.h>

// DRM connector status (from xf86drmMode.h)
#define DRM_MODE_CONNECTED 1
#include <dirent.h>

#define ARRAY_SIZE(x) (sizeof(x) / sizeof((x)[0]))

static int drm_fd = -1;

// DRM ioctl wrapper
static int drm_ioctl(int fd, unsigned long request, void *arg) {
    int ret;
    do {
        ret = ioctl(fd, request, arg);
    } while (ret == -1 && errno == EINTR);
    return ret;
}

// Get DRM resources
static int get_resources(int fd, struct drm_mode_card_res *res) {
    memset(res, 0, sizeof(*res));
    if (drm_ioctl(fd, DRM_IOCTL_MODE_GETRESOURCES, res))
        return -1;

    res->fb_id_ptr = (uint64_t)(uintptr_t)malloc(res->count_fbs * sizeof(uint32_t));
    res->crtc_id_ptr = (uint64_t)(uintptr_t)malloc(res->count_crtcs * sizeof(uint32_t));
    res->connector_id_ptr = (uint64_t)(uintptr_t)malloc(res->count_connectors * sizeof(uint32_t));
    res->encoder_id_ptr = (uint64_t)(uintptr_t)malloc(res->count_encoders * sizeof(uint32_t));

    if (drm_ioctl(fd, DRM_IOCTL_MODE_GETRESOURCES, res))
        return -1;

    return 0;
}

// Get connector info
static int get_connector(int fd, uint32_t conn_id, struct drm_mode_get_connector *conn) {
    memset(conn, 0, sizeof(*conn));
    conn->connector_id = conn_id;

    if (drm_ioctl(fd, DRM_IOCTL_MODE_GETCONNECTOR, conn))
        return -1;

    conn->props_ptr = (uint64_t)(uintptr_t)malloc(conn->count_props * sizeof(uint32_t));
    conn->prop_values_ptr = (uint64_t)(uintptr_t)malloc(conn->count_props * sizeof(uint64_t));
    conn->modes_ptr = (uint64_t)(uintptr_t)malloc(conn->count_modes * sizeof(struct drm_mode_modeinfo));
    conn->encoders_ptr = (uint64_t)(uintptr_t)malloc(conn->count_encoders * sizeof(uint32_t));

    if (drm_ioctl(fd, DRM_IOCTL_MODE_GETCONNECTOR, conn))
        return -1;

    return 0;
}

// Create dumb buffer
static int create_dumb_buffer(int fd, uint32_t width, uint32_t height, uint32_t bpp,
                               uint32_t *handle, uint32_t *pitch, uint64_t *size) {
    struct drm_mode_create_dumb creq = {
        .width = width,
        .height = height,
        .bpp = bpp,
    };

    if (drm_ioctl(fd, DRM_IOCTL_MODE_CREATE_DUMB, &creq))
        return -1;

    *handle = creq.handle;
    *pitch = creq.pitch;
    *size = creq.size;

    return 0;
}

// Map dumb buffer
static void *map_dumb_buffer(int fd, uint32_t handle, uint64_t size) {
    struct drm_mode_map_dumb mreq = {
        .handle = handle,
    };

    if (drm_ioctl(fd, DRM_IOCTL_MODE_MAP_DUMB, &mreq))
        return NULL;

    return mmap(NULL, size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, mreq.offset);
}

// Create framebuffer from dumb buffer
static int create_framebuffer(int fd, uint32_t width, uint32_t height, uint32_t pitch,
                               uint32_t handle, uint32_t *fb_id) {
    struct drm_mode_fb_cmd2 fcmd = {
        .width = width,
        .height = height,
        .pixel_format = DRM_FORMAT_XRGB8888,
        .flags = 0,
    };
    fcmd.handles[0] = handle;
    fcmd.pitches[0] = pitch;
    fcmd.offsets[0] = 0;

    if (drm_ioctl(fd, DRM_IOCTL_MODE_ADDFB2, &fcmd))
        return -1;

    *fb_id = fcmd.fb_id;
    return 0;
}

// Set CRTC to display framebuffer
static int set_crtc(int fd, uint32_t crtc_id, uint32_t fb_id,
                    uint32_t conn_id, struct drm_mode_modeinfo *mode) {
    struct drm_mode_crtc crtc = {
        .crtc_id = crtc_id,
        .fb_id = fb_id,
        .mode_valid = 1,
        .set_connectors_ptr = (uint64_t)(uintptr_t)&conn_id,
        .count_connectors = 1,
    };
    memcpy(&crtc.mode, mode, sizeof(*mode));

    return drm_ioctl(fd, DRM_IOCTL_MODE_SETCRTC, &crtc);
}

// Find connected connector
static uint32_t find_connected_connector(int fd, struct drm_mode_card_res *res,
                                          struct drm_mode_get_connector *conn_out,
                                          struct drm_mode_modeinfo *mode_out) {
    uint32_t *connectors = (uint32_t *)(uintptr_t)res->connector_id_ptr;

    for (int i = 0; i < res->count_connectors; i++) {
        struct drm_mode_get_connector conn;
        if (get_connector(fd, connectors[i], &conn))
            continue;

        // Debug: show connector status
        printf("    Connector %d: connection=%d, modes=%d\n",
               connectors[i], conn.connection, conn.count_modes);

        if (conn.connection == DRM_MODE_CONNECTED && conn.count_modes > 0) {
            *conn_out = conn;
            // Pick first mode (usually the preferred/native mode)
            struct drm_mode_modeinfo *modes = (struct drm_mode_modeinfo *)(uintptr_t)conn.modes_ptr;
            *mode_out = modes[0];
            return connectors[i];
        }

        free((void *)(uintptr_t)conn.props_ptr);
        free((void *)(uintptr_t)conn.prop_values_ptr);
        free((void *)(uintptr_t)conn.modes_ptr);
        free((void *)(uintptr_t)conn.encoders_ptr);
    }

    return 0;
}

// Find CRTC for connector
static uint32_t find_crtc(int fd, struct drm_mode_card_res *res,
                          struct drm_mode_get_connector *conn) {
    uint32_t *encoders = (uint32_t *)(uintptr_t)conn->encoders_ptr;
    uint32_t *crtcs = (uint32_t *)(uintptr_t)res->crtc_id_ptr;

    for (int i = 0; i < conn->count_encoders; i++) {
        struct drm_mode_get_encoder enc = { .encoder_id = encoders[i] };
        if (drm_ioctl(fd, DRM_IOCTL_MODE_GETENCODER, &enc))
            continue;

        // Find an available CRTC
        for (int j = 0; j < res->count_crtcs; j++) {
            if (enc.possible_crtcs & (1 << j)) {
                return crtcs[j];
            }
        }
    }

    return 0;
}

// Draw test pattern
static void draw_test_pattern(uint32_t *pixels, uint32_t width, uint32_t height, uint32_t pitch) {
    // Draw a colorful gradient pattern
    for (uint32_t y = 0; y < height; y++) {
        for (uint32_t x = 0; x < width; x++) {
            uint32_t color;

            // Create gradient with some geometric patterns
            int region = (x * 3 / width);
            switch (region) {
                case 0: // Red gradient
                    color = 0xFF000000 | (y * 255 / height);
                    break;
                case 1: // Green gradient
                    color = 0xFF000000 | ((y * 255 / height) << 8);
                    break;
                case 2: // Blue gradient
                    color = 0xFF000000 | ((y * 255 / height) << 16);
                    break;
            }

            // Add some geometric shapes
            if ((x > 100 && x < 200 && y > 100 && y < 200) ||
                (x > width - 200 && x < width - 100 && y > 100 && y < 200)) {
                color = 0xFFFFFFFF; // White squares
            }

            // Center cross
            if ((x > width/2 - 50 && x < width/2 + 50) ||
                (y > height/2 - 5 && y < height/2 + 5)) {
                color = 0xFFFFFF00; // Yellow cross
            }

            pixels[y * (pitch / 4) + x] = color;
        }
    }

    // Add text-like pattern at bottom
    for (uint32_t y = height - 60; y < height - 20; y++) {
        for (uint32_t x = 20; x < width - 20; x++) {
            if (((x - 20) / 10) % 2 == ((y - (height - 60)) / 10) % 2) {
                pixels[y * (pitch / 4) + x] = 0xFF00FF00; // Checkerboard
            }
        }
    }
}

int main(void) {
    printf("\n");
    printf("═════════════════════════════════════════════════════════════\n");
    printf("  Real DRM/KMS Framebuffer Display Test\n");
    printf("═════════════════════════════════════════════════════════════\n");
    printf("\n");

    // Step 1: Open DRM device
    printf("[1/7] Opening DRM device...\n");

    // Try card1 first (where eDP display is), then card0
    const char *devices[] = {"/dev/dri/card1", "/dev/dri/card0", NULL};

    for (int i = 0; devices[i]; i++) {
        drm_fd = open(devices[i], O_RDWR | O_CLOEXEC);
        if (drm_fd >= 0) {
            printf("    ✓ Opened %s (fd=%d)\n", devices[i], drm_fd);
            break;
        }
    }

    if (drm_fd < 0) {
        printf("    ✗ Cannot open any DRM device: %s\n", strerror(errno));
        printf("    Run with: sudo ./test_scanout_real\n");
        return 1;
    }

    // Step 2: Get resources
    printf("\n[2/7] Getting DRM resources...\n");
    struct drm_mode_card_res res;
    if (get_resources(drm_fd, &res) < 0) {
        printf("    ✗ Failed to get resources\n");
        close(drm_fd);
        return 1;
    }
    printf("    ✓ Found %d connectors, %d CRTCs, %d encoders\n",
           res.count_connectors, res.count_crtcs, res.count_encoders);

    // Step 3: Find connected display
    printf("\n[3/7] Finding connected display...\n");
    struct drm_mode_get_connector conn;
    struct drm_mode_modeinfo mode;
    uint32_t conn_id = find_connected_connector(drm_fd, &res, &conn, &mode);
    if (!conn_id) {
        printf("    ✗ No connected display found\n");
        close(drm_fd);
        return 1;
    }
    printf("    ✓ Connector %d: %dx%d (%s)\n",
           conn_id, mode.hdisplay, mode.vdisplay, mode.name);

    // Step 4: Find CRTC
    printf("\n[4/7] Finding CRTC...\n");
    uint32_t crtc_id = find_crtc(drm_fd, &res, &conn);
    if (!crtc_id) {
        printf("    ✗ No suitable CRTC found\n");
        close(drm_fd);
        return 1;
    }
    printf("    ✓ CRTC %d available\n", crtc_id);

    // Step 5: Create dumb buffer
    printf("\n[5/7] Creating framebuffer...\n");
    uint32_t width = mode.hdisplay;
    uint32_t height = mode.vdisplay;
    uint32_t handle, pitch;
    uint64_t size;

    if (create_dumb_buffer(drm_fd, width, height, 32, &handle, &pitch, &size) < 0) {
        printf("    ✗ Failed to create dumb buffer: %s\n", strerror(errno));
        close(drm_fd);
        return 1;
    }
    printf("    ✓ Created dumb buffer: %dx%d, pitch=%d, size=%lu\n",
           width, height, pitch, size);

    // Map buffer
    void *map = map_dumb_buffer(drm_fd, handle, size);
    if (!map) {
        printf("    ✗ Failed to map buffer: %s\n", strerror(errno));
        close(drm_fd);
        return 1;
    }
    printf("    ✓ Mapped buffer at %p\n", map);

    // Create framebuffer
    uint32_t fb_id;
    if (create_framebuffer(drm_fd, width, height, pitch, handle, &fb_id) < 0) {
        printf("    ✗ Failed to create framebuffer: %s\n", strerror(errno));
        munmap(map, size);
        close(drm_fd);
        return 1;
    }
    printf("    ✓ Created framebuffer ID %d\n", fb_id);

    // Step 6: Draw test pattern
    printf("\n[6/7] Drawing test pattern...\n");
    memset(map, 0, size);  // Clear first
    draw_test_pattern((uint32_t *)map, width, height, pitch);
    printf("    ✓ Test pattern drawn (%d x %d pixels)\n", width, height);

    // Step 7: Set CRTC to display
    printf("\n[7/7] Setting display mode...\n");
    if (set_crtc(drm_fd, crtc_id, fb_id, conn_id, &mode) < 0) {
        if (errno == EACCES || errno == EPERM) {
            printf("    ✗ Permission denied - need root/sudo to change display\n");
            printf("    The display is likely controlled by X11/Wayland.\n");
            printf("    Run with: sudo ./test_scanout_real\n");
            printf("    Or switch to a TTY (Ctrl+Alt+F3) and run from there.\n");
        } else {
            printf("    ✗ Failed to set CRTC: %s\n", strerror(errno));
        }
        munmap(map, size);
        close(drm_fd);
        return 1;
    }
    printf("    ✓ Display mode set successfully!\n");

    // Summary
    printf("\n");
    printf("═════════════════════════════════════════════════════════════\n");
    printf("  Display Active!\n");
    printf("═════════════════════════════════════════════════════════════\n");
    printf("  Resolution:    %d x %d\n", width, height);
    printf("  Framebuffer:   ID %d (%lu bytes)\n", fb_id, size);
    printf("  Connector:     %d\n", conn_id);
    printf("  CRTC:          %d\n", crtc_id);
    printf("\n");
    printf("  Look at your display - you should see a test pattern!\n");
    printf("  Press Enter to exit and restore original mode...\n");
    printf("═════════════════════════════════════════════════════════════\n");

    // Wait for user input
    getchar();

    // Cleanup
    printf("\nCleaning up...\n");

    // Restore original mode (blank)
    struct drm_mode_crtc crtc = {
        .crtc_id = crtc_id,
        .mode_valid = 0,
    };
    drm_ioctl(drm_fd, DRM_IOCTL_MODE_SETCRTC, &crtc);

    munmap(map, size);
    close(drm_fd);

    printf("✓ Cleanup complete\n");

    return 0;
}
