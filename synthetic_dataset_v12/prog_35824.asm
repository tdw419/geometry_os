; DESCRIPTION: Draws a yellow circle centered at (79, 167) with radius 73.
; PLAN: r0=79(x), r1=167(y), r2=73(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 79
LDI r1, 167
LDI r2, 73
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
