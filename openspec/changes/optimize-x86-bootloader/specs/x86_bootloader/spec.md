# Specification: x86_bootloader

# x86 Bootloader Specification

## Component Purpose
The `x86_bootloader` component is essential for initializing the execution of the Geometry OS on x86 architecture computers. It acts as a bridge between the hardware and the operating system, ensuring that the system boots up correctly and efficiently.

## Interface Definition
### Input/Output Channels
- **Input**: 
  - Boot device (e.g., hard drive, USB flash drive)
  - Kernel image address
- **Output**:
  - Jump to kernel execution

### Communication Protocol
- The bootloader communicates with the hardware through BIOS interrupts and direct memory access.
- The kernel image is loaded into a specific memory location by the bootloader.

## Behavior Specification
1. **Boot Device Detection**: 
   - Scan bootable devices listed in BIOS settings.
   - Select the primary boot device based on system configuration.

2. **Kernel Image Loading**:
   - Locate the kernel image within the selected boot device.
   - Load the kernel image into memory starting from a predefined address (e.g., 0x1000).

3. **Execution Control**:
   - Once the kernel image is loaded, jump to its entry point.

4. **Error Handling**:
   - If no bootable devices are found, display an error message and halt the system.
   - If the kernel image cannot be located or loaded, display an error message and halt the system.

## Performance Requirements
- **Boot Time**: 
  - The bootloader should complete its task within 50 milliseconds to minimize performance bottlenecks.
- **Memory Usage**:
  - The bootloader should not consume more than 1MB of memory during operation to ensure compatibility with various hardware configurations.

## Error Handling
- If the bootloader encounters an error (e.g., no bootable device, kernel image missing), it will display a clear error message and halt the system. The error messages should be user-friendly and provide guidance on how to resolve the issue (e.g., check BIOS settings, verify kernel image).

### Example Error Messages
- **No Bootable Device Found**:
  ```
  ERROR: No bootable device found.
  Please check your BIOS settings and ensure a valid boot device is selected.
  System halted.
  ```

- **Kernel Image Missing**:
  ```
  ERROR: Kernel image not found.
  Please verify that the kernel image is correctly placed on the boot device.
  System halted.
  ```

By adhering to these specifications, the `x86_bootloader` will ensure a smooth and efficient boot process, enhancing the overall performance of Geometry OS on x86 hardware.