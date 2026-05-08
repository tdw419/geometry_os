; DESCRIPTION: A blue object centered at the screen with fixed size.

; Phase 104: Crash Demo - spawns a child that accesses unmapped memory
; The child triggers a segfault, which the scheduler catches and writes
; a core dump to /var/core/2.txt, then renders a crash dialog on screen.

; Primary draws a blue background, then spawns a child
LDI r13, 1
LDI r3, 0x0000FF
FILL r3

; Spawn child at label (page-aligned .org needed)
LDI r15, child
SPAWN r15

; Primary animation loop - keeps rendering while child runs
primary_loop:
    FRAME
    JMP primary_loop

.org 0x400
child:
    ; Child tries to access high unmapped address
    ; This will trigger a segfault when the scheduler detects it
    LDI r7, 0xFF00
    LOAD r6, r7
    HALT
