; DESCRIPTION: Draws a yellow circle centered at (343, 179) with radius 38.
; PLAN: r0=343(x), r1=179(y), r2=38(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 343
LDI r1, 179
LDI r2, 38
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
