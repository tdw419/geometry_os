; DESCRIPTION: Draws a yellow circle centered at (380, 184) with radius 49.
; PLAN: r0=380(x), r1=184(y), r2=49(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 380
LDI r1, 184
LDI r2, 49
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
