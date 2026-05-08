; DESCRIPTION: Geometry OS program to draw a blue object.

; Phase 104: Crash Demo - spawns a child that accesses unmapped memory
; The child triggers a segfault, which the scheduler catches and writes
; a core dump to /var/core/2.txt, then renders a crash dialog on screen.

; Primary draws a blue background, then spawns a child
LDI r11, 1
LDI r1, 0x0000FF
FILL r1

; Spawn child at label (page-aligned .org needed)
LDI r5, child
SPAWN r5

; Primary animation loop - keeps rendering while child runs
primary_loop:
    FRAME
    JMP primary_loop

.org 0x400
child:
    ; Child tries to access high unmapped address
    ; This will trigger a segfault when the scheduler detects it
    LDI r12, 0xFF00
    LOAD r7, r12
    HALT
