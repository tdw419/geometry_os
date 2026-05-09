; DESCRIPTION: Draws a green circle centered at (184, 181) with radius 63.
; PLAN: r0=184(x), r1=181(y), r2=63(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 184
LDI r1, 181
LDI r2, 63
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
