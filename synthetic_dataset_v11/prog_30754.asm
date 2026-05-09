; DESCRIPTION: Draws a magenta circle centered at (97, 171) with radius 16.
; PLAN: r0=97(x), r1=171(y), r2=16(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 97
LDI r1, 171
LDI r2, 16
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
