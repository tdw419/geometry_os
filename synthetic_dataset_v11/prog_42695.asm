; DESCRIPTION: Draws a yellow circle centered at (26, 184) with radius 18.
; PLAN: r0=26(x), r1=184(y), r2=18(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 26
LDI r1, 184
LDI r2, 18
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
