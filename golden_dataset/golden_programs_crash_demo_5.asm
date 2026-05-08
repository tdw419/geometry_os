; DESCRIPTION: Draws a blue object at the screen with fixed size.

; Phase 104: Crash Demo - spawns a child that accesses unmapped memory
; The child triggers a segfault, which the scheduler catches and writes
; a core dump to /var/core/2.txt, then renders a crash dialog on screen.

; Primary draws a blue background, then spawns a child
LDI r4, 1
LDI r10, 0x0000FF
FILL r10

; Spawn child at label (page-aligned .org needed)
LDI r12, child
SPAWN r12

; Primary animation loop - keeps rendering while child runs
primary_loop:
    FRAME
    JMP primary_loop

.org 0x400
child:
    ; Child tries to access high unmapped address
    ; This will trigger a segfault when the scheduler detects it
    LDI r6, 0xFF00
    LOAD r9, r6
    HALT
