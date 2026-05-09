; DESCRIPTION: Draws a yellow circle centered at (94, 184) with radius 62.
; PLAN: r0=94(x), r1=184(y), r2=62(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 94
LDI r1, 184
LDI r2, 62
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
