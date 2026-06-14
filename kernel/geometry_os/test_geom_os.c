/*
 * Geometry OS Kernel Module Userspace Test
 *
 * Tests ioctl interface for /dev/geometry_os
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/ioctl.h>
#include <errno.h>

#include "geometry_os_uapi.h"

/* Simple SPIR-V test program (magic header only) */
static const uint32_t test_spirv[] = {
    0x07230203,  /* Magic */
    0x00010000,  /* Version 1.0 */
    0x00000000,  /* Generator */
    1,           /* Bound */
    0,           /* Schema */
};

int main(int argc, char *argv[])
{
    int fd;
    int ret;
    struct gpu_info info;
    struct glyph_submit submit;
    struct glyph_result result;
    struct dmabuf_export dmabuf;

    printf("═════════════════════════════════════════════════════════════\n");
    printf("  Geometry OS Kernel Module Test\n");
    printf("═════════════════════════════════════════════════════════════\n\n");

    /* Open device */
    printf("[1] Opening /dev/geometry_os...\n");
    fd = open("/dev/geometry_os", O_RDWR);
    if (fd < 0) {
        printf("    ✗ Failed to open device: %s\n", strerror(errno));
        printf("    Is the module loaded? Try: sudo insmod geometry_os.ko\n");
        return 1;
    }
    printf("    ✓ Device opened (fd=%d)\n", fd);

    /* Get GPU info */
    printf("\n[2] Querying GPU info...\n");
    ret = ioctl(fd, GEOMETRY_OS_IOC_INFO, &info);
    if (ret < 0) {
        printf("    ✗ ioctl(INFO) failed: %s\n", strerror(errno));
    } else {
        printf("    ✓ GPU Info:\n");
        printf("      Vendor ID: 0x%04x\n", info.vendor_id);
        printf("      Device ID: 0x%04x\n", info.device_id);
        printf("      Compute Units: %u\n", info.compute_units);
        printf("      VRAM: %u MB\n", info.vram_size_mb);
        printf("      Driver Version: 0x%06x\n", info.driver_version);
    }

    /* Submit SPIR-V program */
    printf("\n[3] Submitting glyph program...\n");
    memset(&submit, 0, sizeof(submit));
    submit.spirv_ptr = (uint64_t)test_spirv;
    submit.spirv_size = sizeof(test_spirv);
    submit.workgroup_x = 64;
    submit.workgroup_y = 1;
    submit.workgroup_z = 1;

    ret = ioctl(fd, GEOMETRY_OS_IOC_SUBMIT, &submit);
    if (ret < 0) {
        printf("    ✗ ioctl(SUBMIT) failed: %s\n", strerror(errno));
    } else {
        printf("    ✓ Program submitted: %u bytes, dispatch 64x1x1\n",
               submit.spirv_size);
    }

    /* Execute */
    printf("\n[4] Executing program...\n");
    ret = ioctl(fd, GEOMETRY_OS_IOC_EXEC, NULL);
    if (ret < 0) {
        printf("    ✗ ioctl(EXEC) failed: %s\n", strerror(errno));
    } else {
        printf("    ✓ Execution started\n");
    }

    /* Wait for completion */
    printf("\n[5] Waiting for completion...\n");
    memset(&result, 0, sizeof(result));
    ret = ioctl(fd, GEOMETRY_OS_IOC_WAIT, &result);
    if (ret < 0) {
        printf("    ✗ ioctl(WAIT) failed: %s\n", strerror(errno));
    } else {
        printf("    ✓ Execution complete:\n");
        printf("      Status: %u\n", result.status);
        printf("      Cycles: %lu\n", (unsigned long)result.cycles);
    }

    /* Export DMA-BUF */
    printf("\n[6] Exporting DMA-BUF...\n");
    memset(&dmabuf, 0, sizeof(dmabuf));
    ret = ioctl(fd, GEOMETRY_OS_IOC_DMABUF, &dmabuf);
    if (ret < 0) {
        printf("    ✗ ioctl(DMABUF) failed: %s\n", strerror(errno));
    } else {
        printf("    ✓ DMA-BUF export:\n");
        printf("      FD: %d\n", dmabuf.fd);
        printf("      Size: %u\n", dmabuf.size);
    }

    /* Read device status */
    printf("\n[7] Reading device status...\n");
    char buf[256];
    ret = read(fd, buf, sizeof(buf) - 1);
    if (ret < 0) {
        printf("    ✗ read() failed: %s\n", strerror(errno));
    } else {
        buf[ret] = '\0';
        printf("    ✓ Status: %s", buf);
    }

    close(fd);

    printf("\n═════════════════════════════════════════════════════════════\n");
    printf("  Kernel Module Test Complete\n");
    printf("═════════════════════════════════════════════════════════════\n");

    return 0;
}
