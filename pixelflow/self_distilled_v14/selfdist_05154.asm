; DESCRIPTION: Draws a magenta circle centered at (210, 157) with radius 64.
; PLAN: r0=210(x), r1=157(y), r2=64(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 210
LDI r1, 157
LDI r2, 64
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
