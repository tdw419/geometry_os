; DESCRIPTION: Draws a blue circle centered at (465, 152) with radius 37.
; PLAN: r0=465(x), r1=152(y), r2=37(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 465
LDI r1, 152
LDI r2, 37
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
