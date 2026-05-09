; DESCRIPTION: Draws a magenta circle centered at (97, 184) with radius 64.
; PLAN: r0=97(x), r1=184(y), r2=64(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 97
LDI r1, 184
LDI r2, 64
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
