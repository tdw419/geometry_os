# Visual Shell Specification Delta

## ADDED Requirements

### Requirement: Tectonic Bridge Observability
The system SHALL utilize a non-blocking, event-driven file watcher to synchronize the Antigravity Daemon state with the Visual Substrate.

#### Scenario: File System Event
- **WHEN** the `antigravity.pixelrts.png` file is modified (atomic rename)
- **THEN** the system detects the change within 100ms.
- **AND** the texture is reloaded asynchronously without dropping render frames.
- **VISUAL** The ground truth substrate updates to reflect new confidence/fatigue levels.

#### Scenario: Resource Management
- **WHEN** a new texture is loaded
- **THEN** the previous texture resource is dropped only after the new bind group is active.
- **AND** `wgpu::Queue::write_texture` is used for upload.
