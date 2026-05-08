; DESCRIPTION: Draws a blue object at the screen with fixed size.

; Phase 104: Crash Demo - spawns a child that accesses unmapped memory
; The child triggers a segfault, which the scheduler catches and writes
; a core dump to /var/core/2.txt, then renders a crash dialog on screen.

; Primary draws a blue background, then spawns a child
LDI r7, 1
LDI r12, 0x0000FF
FILL r12

; Spawn child at label (page-aligned .org needed)
LDI r3, child
SPAWN r3

; Primary animation loop - keeps rendering while child runs
primary_loop:
    FRAME
    JMP primary_loop

.org 0x400
child:
    ; Child tries to access high unmapped address
    ; This will trigger a segfault when the scheduler detects it
    LDI r8, 0xFF00
    LOAD r4, r8
    HALT
