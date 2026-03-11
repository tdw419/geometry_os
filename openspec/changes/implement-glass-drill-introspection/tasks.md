# Tasks: Implement Glass Drill

- [x] **Core Logic**: Verify/Implement `xy2h` (Inverse Hilbert) utility.
    - [x] Check `fast_hilbert` capabilities.
    - [x] Implement wrapper in `TectonicSimulator`.
- [x] **App Integration**: Update `InfiniteMapApp` loop.
    - [x] Detect hover over `TectonicWindow`.
    - [x] Calculate relative coordinates.
    - [x] Call `resolve_address`.
- [x] **UI Layer**: Add Visual Feedback.
    - [x] Add `hovered_address` state to `App`.
    - [x] Render a "Reticle" (debug drawing or simple cursor update).
    - [x] Display Address/Value in `DiagnosticOverlay` or new `IntrospectionWindow`.
- [x] **Validation**: Verify that hovering the "start" of the chunk shows the Base Address.
