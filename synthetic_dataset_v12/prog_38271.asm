; DESCRIPTION: Draws a yellow circle centered at (413, 155) with radius 36.
; PLAN: r0=413(x), r1=155(y), r2=36(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 413
LDI r1, 155
LDI r2, 36
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
