; singularity_demo.asm - Semantic Zoom: Nested World
; Entered by zooming into a building on the map.
; Zoom out past level 0 to collapse back.

LDI r1, 0x180828
FILL r1

; Title
LDI r1, 60
LDI r2, 100
LDI r3, 0x9000
STRO r3, "NESTED WORLD"
LDI r4, 0xFFFFFF
LDI r5, 0
DRAWTEXT r1, r2, r3, r4, r5

; Instructions
LDI r1, 30
LDI r2, 130
LDI r3, 0x9020
STRO r3, "Scroll down to collapse"
DRAWTEXT r1, r2, r3, r4, r5

; Animate a blinking dot so it's clearly alive
LDI r10, 0
loop:
    LDI r11, 128
    LDI r12, 180
    LDI r13, 0xFF4444
    PSET r11, r12, r13
    FRAME
    LDI r13, 0x180828
    PSET r11, r12, r13
    FRAME
    ADDI r10, 1
    JMP loop
