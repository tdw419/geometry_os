#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/ioctl.h>
#include <stdint.h>
#include "geometry_os_uapi.h"

int main() {
    int fd = open("/dev/geometry_os", O_RDWR);
    if (fd < 0) {
        perror("Failed to open /dev/geometry_os");
        return 1;
    }

    printf("Successfully opened /dev/geometry_os\n");

    // 1. Get GPU Info
    struct gpu_info info;
    if (ioctl(fd, GEOMETRY_OS_IOC_INFO, &info) < 0) {
        perror("ioctl(INFO) failed");
    } else {
        printf("GPU Vendor: 0x%04x, Device: 0x%04x\n", info.vendor_id, info.device_id);
    }

    // 2. Pin Interaction Bus
    uint64_t bus_addr = 0x10000000;
    if (ioctl(fd, GEOMETRY_OS_IOC_PIN_BUS, &bus_addr) < 0) {
        perror("ioctl(PIN_BUS) failed");
    } else {
        printf("Interaction bus pinned at 0x%lx\n", bus_addr);
    }

    // 3. Update Mouse
    struct mouse_event ev = {
        .x = 100,
        .y = 200,
        .buttons = 1,
        .dx = 5,
        .dy = 5
    };
    if (ioctl(fd, GEOMETRY_OS_IOC_UPDATE_MOUSE, &ev) < 0) {
        perror("ioctl(UPDATE_MOUSE) failed");
    } else {
        printf("Mouse updated: %d,%d\n", ev.x, ev.y);
    }

    // 4. Hardware VCC Attestation
    struct vcc_attest attest = {0};
    // Example hash
    for (int i = 0; i < 8; i++) attest.expected_hash[i] = i;
    
    if (ioctl(fd, GEOMETRY_OS_IOC_ATTEST, &attest) < 0) {
        perror("ioctl(ATTEST) failed");
    } else {
        printf("VCC Attestation Status: %s\n", attest.status ? "PASSED" : "FAILED");
    }

    close(fd);
    return 0;
}
