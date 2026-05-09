; DESCRIPTION: Draws a green circle centered at (222, 118) with radius 35.
; PLAN: r0=222(x), r1=118(y), r2=35(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 222
LDI r1, 118
LDI r2, 35
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
