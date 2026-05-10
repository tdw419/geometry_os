; DESCRIPTION: Draws a yellow circle centered at (192, 184) with radius 69.
; PLAN: r0=192(x), r1=184(y), r2=69(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 192
LDI r1, 184
LDI r2, 69
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
