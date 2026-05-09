; DESCRIPTION: Draws a magenta circle centered at (64, 139) with radius 37.
; PLAN: r0=64(x), r1=139(y), r2=37(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 64
LDI r1, 139
LDI r2, 37
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
