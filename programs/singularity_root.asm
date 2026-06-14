; singularity_root.asm - The Recursive Singularity Launcher
; Demonstrates "One pixel = everything" by expanding a pixel into a nested map.

LDI r20, 0x101820 ; dark background
FILL r20

; Place the Singularity Gate at center (128, 128)
; A "Building" pixel with prefix 0xBB
LDI r10, 128
LDI r11, 128
LDI r12, 0xBB000001 ; Building #1 (nested_app)
PSET r10, r11, r12

; Draw a box around it so user can see it
LDI r13, 8
LDI r8, 124
RECTF r8, r8, r13, r13, r12

loop:
    ; Draw status text
    LDI r1, 10
    LDI r2, 230
    LDI r3, 0x9000
    STRO r3, "ZOOM INTO PIXEL TO EXPAND"
    LDI r4, 0xFFFFFF
    LDI r5, 0
    DRAWTEXT r1, r2, r3, r4, r5
    
    ; Monitor zoom level (RAM 0x7812)
    LDI r14, 0x7812
    LOAD r15, r14
    
    ; Draw current zoom
    LDI r1, 10
    LDI r2, 10
    LDI r3, 0x9100
    STRO r3, "ZOOM: "
    DRAWTEXT r1, r2, r3, r4, r5
    
    FRAME
    JMP loop
