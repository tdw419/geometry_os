/* pci.c - PCI enumeration implementation */
#include <stdint.h>
#include "pci.h"

/* I/O port functions */
static inline void outl(uint16_t port, uint32_t val) {
    __asm__ volatile ("outl %0, %1" : : "a"(val), "Nd"(port));
}

static inline uint32_t inl(uint16_t port) {
    uint32_t val;
    __asm__ volatile ("inl %1, %0" : "=a"(val) : "Nd"(port));
    return val;
}

/* Read PCI config register */
uint32_t pci_read_config(uint8_t bus, uint8_t dev, uint8_t func, uint8_t offset) {
    uint32_t addr = (1 << 31) |        /* Enable bit */
                   ((uint32_t)bus << 16) |
                   ((uint32_t)dev << 11) |
                   ((uint32_t)func << 8) |
                   (offset & 0xFC);
    outl(PCI_CONFIG_ADDR, addr);
    return inl(PCI_CONFIG_DATA);
}

/* Write PCI config register */
void pci_write_config(uint8_t bus, uint8_t dev, uint8_t func, uint8_t offset, uint32_t value) {
    uint32_t addr = (1 << 31) |
                   ((uint32_t)bus << 16) |
                   ((uint32_t)dev << 11) |
                   ((uint32_t)func << 8) |
                   (offset & 0xFC);
    outl(PCI_CONFIG_ADDR, addr);
    outl(PCI_CONFIG_DATA, value);
}

/* Find Intel GPU via PCI enumeration */
int pci_find_intel_gpu(PciDevice *dev) {
    /* Scan PCI bus 0-255, devices 0-31, function 0 */
    for (int bus = 0; bus < 256; bus++) {
        for (int d = 0; d < 32; d++) {
            uint32_t vendor_device = pci_read_config(bus, d, 0, 0);
            uint16_t vendor = vendor_device & 0xFFFF;

            if (vendor == 0xFFFF) {
                continue;  /* No device */
            }

            if (vendor == INTEL_VENDOR_ID) {
                /* Check class code - VGA controller is 0x03 */
                uint32_t class_rev = pci_read_config(bus, d, 0, PCI_CLASS_REV);
                uint8_t class_code = (class_rev >> 24) & 0xFF;

                if (class_code == 0x03) {  /* VGA controller */
                    dev->vendor_id = vendor;
                    dev->device_id = (vendor_device >> 16) & 0xFFFF;
                    dev->revision = (class_rev >> 16) & 0xFF;
                    dev->class_code = class_code;

                    /* Read BAR0 (MMIO) */
                    uint32_t bar0_low = pci_read_config(bus, d, 0, PCI_BAR0);
                    uint32_t bar0_high = pci_read_config(bus, d, 0, PCI_BAR1);
                    dev->bar0 = ((uint64_t)bar0_high << 32) | (bar0_low & PCI_BAR_MASK);

                    /* Read BAR2 (alternate MMIO) */
                    uint32_t bar2_low = pci_read_config(bus, d, 0, PCI_BAR2);
                    uint32_t bar2_high = pci_read_config(bus, d, 0, PCI_BAR3);
                    dev->bar2 = ((uint64_t)bar2_high << 32) | (bar2_low & PCI_BAR_MASK);

                    return 0;  /* Found */
                }
            }
        }
    }
    return -1;  /* Not found */
}
