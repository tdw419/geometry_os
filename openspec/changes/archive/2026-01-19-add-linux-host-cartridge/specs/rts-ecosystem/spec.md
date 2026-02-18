# Capability: Linux Cartridge Support

## ADDED Requirements

### Requirement: Embedded Linux Container
The system SHALL support wrapping a Linux Kernel and Initrd into a PixelRTS container.

#### Scenario: Linux Boot Packing
- **WHEN** the converter is invoked with a Linux ISO
- **THEN** it extracts the kernel and initrd
- **AND** injects the application payload into the initrd
- **AND** generates a bootable PNG containing the full OS
- **VISUAL** Resulting texture appears as high-entropy "Digital Concrete"
