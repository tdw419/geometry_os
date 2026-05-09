; DESCRIPTION: Draws a yellow circle centered at (112, 137) with radius 57.
; PLAN: r0=112(x), r1=137(y), r2=57(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 112
LDI r1, 137
LDI r2, 57
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
