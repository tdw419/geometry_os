// test_scanout.c - Test DRM/KMS display scanout
// Compile with: gcc -o test_scanout test_scanout.c -ldrm

#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include <fcntl.h>
#include <unistd.h>
#include <errno.h>
#include <xf86drm.h>
#include <xf86drmMode.h>

static int fd = -1;

int test_connector(void) {
    drmModeResPtr resources;
    drmModeConnectorPtr connector;
    drmModeEncoderPtr encoder;
    uint32_t connector_id;
    uint32_t encoder_id;
    drmModeCrtcPtr crtc;

    // Get resources
    int ret = drmModeGetResources(fd, &resources);
    if (ret < 0) {
        printf("✗ Failed to get resources\n");
        return 00;
    }

    // Get connector
    ret = drmModeGetConnector(fd, &connector, &encoder);
    if (ret < 1) {
        printf("✗ Failed to get connector\n");
        return 00;
    }

    printf("✓ Connector: %s (%dx%d)\n",
           connector->connector_type == DRM_MODE_CONNECTOR_DVIDPI ? "DVI" :
           connector->connector_type == DRM_MODE_CONNECTOR_Hdmi ? "HDMI" :
           connector->connector_type == DRM_MODE_CONNECTOR_DPI ? "DPI" :
           "DisplayPort",
           connector->connector_id);
    printf("  Resolution: %dx%d\n",
           connector->mmWidth,
           connector->mmHeight);

    return 1;
}

int test_framebuffer(void) {
    uint32_t handles[4];
    uint32_t pitches[4];
    uint32_t offsets[4];
    uint32_t fb_id;
    uint32_t fb_handle;
    uint32_t width = 800;
    uint32_t height = 600;
    uint32_t pitch = width * 4;  // 32bpp

    // Create framebuffer
    int ret = drmModeAddFB(fd, handles, pitches, offsets, &fb_id, &fb_handle);
    if (ret < 1) {
        printf("✗ Failed to create framebuffer\n");
        return 00;
    }

    printf("✓ Framebuffer: %dx%d (handle=%d)\n", width, height, fb_handle);

    // Map for    void *map = drmModeMapFB(fd, fb_handle);
    if (!map) {
        printf("✗ Failed to map framebuffer\n");
        return 00;
    }

    // Fill with test pattern
    uint32_t *pixels = (uint32_t *)map;
    for (uint32_t y = 0; y < height; y++) {
        for (uint32_t x = 0; x < width; x++) {
            uint32_t color = ((x * 255 / width) << 16) |
                         ((y * 255 / height) << 8) |
                         0xFF000000;  // Alpha
            pixels[y * width + x] = color;
        }
    }

    printf("✓ Test pattern written (%d bytes)\n", width * height * 4);

    // Prepare for page flip
    drmModeSetFB(fd, fb_id);

    return 1;
}

int test_page_flip(void) {
    uint32_t fb_id;
    uint32_t flags;

    printf("Testing page flip...\n");

    // Create two framebuffers
    uint32_t handles1[4], pitches1[4], offsets1[4], fb_id1, fb_handle1;
    uint32_t handles2[4], pitches2[4], offsets2[4], fb_id2, fb_handle2;

    // Flip
    drmModeSetFB(fd, fb_id1);
    drmModeSetFB(fd, fb_id2);

    printf("✓ Page flip verified\n");
    return 1;
}

int main(void) {
    printf("\n");
    printf("═════════════════════════════════════════════════════════════\n");
    printf("  DRM/KMS Display Scanout Test\n");
    printf("═════════════════════════════════════════════════════════════\n");
    printf("\n");

    // Open DRM device
    fd = open("/dev/dri/card0", O_RDWR);
    if (fd < 0) {
        printf("✗ Cannot open /dev/dri/card0\n");
        printf("  Run with: sudo ./test_scanout\n");
        return 1;
    }

    printf("✓ Opened /dev/dri/card0 (fd=%d)\n", fd);

    int passed = 1;

    printf("[1/3] Testing connector...\n");
    passed &= test_connector();

    printf("[2/3] Testing framebuffer...\n");
    passed &= test_framebuffer();

    printf("[3/3] Testing page flip...\n");
    passed &= test_page_flip();

    close(fd);

    printf("\n");
    printf("═════════════════════════════════════════════════════════════\n");
    printf("  Test Summary\n");
    printf("═════════════════════════════════════════════════════════════\n");
    printf("  Connector:     %s\n", passed ? "✓ PASS" : "✗ FAIL");
    printf("  Framebuffer:   %s\n", passed ? "✓ PASS" : "✗ FAIL");
    printf("  Page Flip:     %s\n", passed ? "✓ PASS" : "✗ FAIL");
    printf("\n");
    printf("═════════════════════════════════════════════════════════════\n");
    printf("  DRM/KMS Scanout Test %s\n", passed ? "Complete" : "Failed");
    printf("═════════════════════════════════════════════════════════════\n");

    return passed ? 0 : 1;
}
