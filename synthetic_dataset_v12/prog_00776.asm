; DESCRIPTION: Draws a green circle centered at (401, 136) with radius 62.
; PLAN: r0=401(x), r1=136(y), r2=62(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 401
LDI r1, 136
LDI r2, 62
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
