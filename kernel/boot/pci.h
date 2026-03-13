/* pci.h - PCI enumeration via I/O ports */
#ifndef _PCI_H
#define _PCI_H

#include <stdint.h>

/* I/O ports for PCI config space */
#define PCI_CONFIG_ADDR  0xCF8
#define PCI_CONFIG_DATA  0xCFC

/* PCI config register offsets */
#define PCI_VENDOR_ID    0x00
#define PCI_DEVICE_ID    0x02
#define PCI_COMMAND      0x04
#define PCI_STATUS       0x06
#define PCI_CLASS_REV     0x08
#define PCI_BAR0          0x10
#define PCI_BAR1          0x14
#define PCI_BAR2          0x18
#define PCI_BAR3          0x1C
#define PCI_BAR4          0x20
#define PCI_BAR5          0x24

/* PCI BAR flags */
#define PCI_BAR_IO        0x00000001
#define PCI_BAR_64BIT     0x00000004
#define PCI_BAR_MASK      0xFFFFFFF0

/* Intel vendor ID */
#define INTEL_VENDOR_ID  0x8086

/* PCI device structure */
typedef struct {
    uint16_t vendor_id;
    uint16_t device_id;
    uint8_t revision;
    uint8_t class_code;
    uint64_t bar0;          /* MMIO base address */
    uint64_t bar2;          /* Alternate MMIO */
} PciDevice;

/* Functions */
int pci_find_intel_gpu(PciDevice *dev);
uint32_t pci_read_config(uint8_t bus, uint8_t dev, uint8_t func, uint8_t offset);
void pci_write_config(uint8_t bus, uint8_t dev, uint8_t func, uint8_t offset, uint32_t value);

#endif /* _PCI_H */
