; DESCRIPTION: Draws a green circle centered at (402, 113) with radius 36.
; PLAN: r0=402(x), r1=113(y), r2=36(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 402
LDI r1, 113
LDI r2, 36
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
