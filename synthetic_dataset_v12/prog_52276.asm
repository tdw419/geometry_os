; DESCRIPTION: Draws a green circle centered at (287, 219) with radius 33.
; PLAN: r0=287(x), r1=219(y), r2=33(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 287
LDI r1, 219
LDI r2, 33
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
