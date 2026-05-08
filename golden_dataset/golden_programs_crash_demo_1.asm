; DESCRIPTION: Draw object: pos=the screen, color=blue, size=fixed size.

; Phase 104: Crash Demo - spawns a child that accesses unmapped memory
; The child triggers a segfault, which the scheduler catches and writes
; a core dump to /var/core/2.txt, then renders a crash dialog on screen.

; Primary draws a blue background, then spawns a child
LDI r12, 1
LDI r0, 0x0000FF
FILL r0

; Spawn child at label (page-aligned .org needed)
LDI r11, child
SPAWN r11

; Primary animation loop - keeps rendering while child runs
primary_loop:
    FRAME
    JMP primary_loop

.org 0x400
child:
    ; Child tries to access high unmapped address
    ; This will trigger a segfault when the scheduler detects it
    LDI r3, 0xFF00
    LOAD r9, r3
    HALT
