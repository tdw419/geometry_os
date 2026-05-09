; DESCRIPTION: Draws a blue circle centered at (73, 169) with radius 62.
; PLAN: r0=73(x), r1=169(y), r2=62(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 73
LDI r1, 169
LDI r2, 62
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
