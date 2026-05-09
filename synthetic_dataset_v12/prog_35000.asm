; DESCRIPTION: Draws a green circle centered at (25, 118) with radius 18.
; PLAN: r0=25(x), r1=118(y), r2=18(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 25
LDI r1, 118
LDI r2, 18
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
