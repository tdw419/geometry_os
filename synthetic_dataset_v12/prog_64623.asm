; DESCRIPTION: Draws a green circle centered at (63, 181) with radius 59.
; PLAN: r0=63(x), r1=181(y), r2=59(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 63
LDI r1, 181
LDI r2, 59
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
