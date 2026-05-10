; DESCRIPTION: Draws a yellow circle centered at (19, 184) with radius 36.
; PLAN: r0=19(x), r1=184(y), r2=36(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 19
LDI r1, 184
LDI r2, 36
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
