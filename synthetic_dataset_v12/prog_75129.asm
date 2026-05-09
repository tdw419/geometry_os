; DESCRIPTION: Draws a yellow circle centered at (77, 118) with radius 19.
; PLAN: r0=77(x), r1=118(y), r2=19(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 77
LDI r1, 118
LDI r2, 19
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
