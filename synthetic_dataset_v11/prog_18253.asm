; DESCRIPTION: Draws a green circle centered at (21, 219) with radius 14.
; PLAN: r0=21(x), r1=219(y), r2=14(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 21
LDI r1, 219
LDI r2, 14
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
