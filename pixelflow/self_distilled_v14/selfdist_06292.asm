; DESCRIPTION: Draws a green circle centered at (74, 137) with radius 18.
; PLAN: r0=74(x), r1=137(y), r2=18(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 137
LDI r2, 18
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
