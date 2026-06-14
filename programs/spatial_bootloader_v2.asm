; Geometry OS Spatial Bootloader
; Navigation = Execution
; Click a map pixel to SPAWN execution at that address
; MOUSEQ r1 -> r1=x, r2=y, r3=buttons

main:
    FRAME               ; Sync with display
    MOUSEQ r1           ; r1=x, r2=y, r3=buttons
    HILBERT_XY2D r4, r1, r2  ; Get Hilbert Index in r4

    ; If mouse clicked (r3 != 0), dispatch
    JZ r3, main

    ; Spawn a child process at the computed Hilbert address
    ; SPAWN addr_reg -- starts a new process at address in register
    SPAWN r4
    JMP main
