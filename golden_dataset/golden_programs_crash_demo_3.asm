; DESCRIPTION: This GeOS assembly code spawns a child process that attempts to access an unmapped memory address, triggering a segmentation fault. The scheduler catches this exception, writes a core dump to `/var/core/2.txt`, and renders a crash dialog on screen while the primary process maintains a blue background animation.

; Phase 104: Crash Demo - spawns a child that accesses unmapped memory
; The child triggers a segfault, which the scheduler catches and writes
; a core dump to /var/core/2.txt, then renders a crash dialog on screen.

; Primary draws a blue background, then spawns a child
LDI r8, 1
LDI r9, 0x0000FF
FILL r9

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
    LDI r12, 0xFF00
    LOAD r13, r12
    HALT
