; Geometry OS Native Spatial Bootloader
; Navigation = Execution

:main
    FRAME               ; wait for sync
    MOUSEQ r1, r2, r3   ; get x, y, buttons
    HILBERT_XY2D r4, r1, r2 ; get Hilbert index
    
    ; If click (r3 > 0), jump to coordinate
    LDI r0, 0
    SUB r5, r3, r0
    JNZ r5, :dispatch
    
    JMP :main

:dispatch
    JMP r4              ; execute fragment
