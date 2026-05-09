; DESCRIPTION: Draws a yellow circle centered at (77, 105) with radius 74.
; PLAN: r0=77(x), r1=105(y), r2=74(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 77
LDI r1, 105
LDI r2, 74
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
