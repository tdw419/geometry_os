; DESCRIPTION: Draws a blue circle centered at (61, 63) with radius 39.
; PLAN: r0=61(x), r1=63(y), r2=39(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 61
LDI r1, 63
LDI r2, 39
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
