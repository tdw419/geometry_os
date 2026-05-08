; DESCRIPTION: Display a object using color blue at the screen.

; Phase 104: Crash Demo - spawns a child that accesses unmapped memory
; The child triggers a segfault, which the scheduler catches and writes
; a core dump to /var/core/2.txt, then renders a crash dialog on screen.

; Primary draws a blue background, then spawns a child
LDI r7, 1
LDI r1, 0x0000FF
FILL r1

; Spawn child at label (page-aligned .org needed)
LDI r14, child
SPAWN r14

; Primary animation loop - keeps rendering while child runs
primary_loop:
    FRAME
    JMP primary_loop

.org 0x400
child:
    ; Child tries to access high unmapped address
    ; This will trigger a segfault when the scheduler detects it
    LDI r2, 0xFF00
    LOAD r3, r2
    HALT
