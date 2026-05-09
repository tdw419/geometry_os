; DESCRIPTION: Draws a green circle centered at (141, 56) with radius 36.
; PLAN: r0=141(x), r1=56(y), r2=36(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 141
LDI r1, 56
LDI r2, 36
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
