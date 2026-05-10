; DESCRIPTION: Draws a yellow circle centered at (343, 172) with radius 29.
; PLAN: r0=343(x), r1=172(y), r2=29(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 343
LDI r1, 172
LDI r2, 29
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
