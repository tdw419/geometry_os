; DESCRIPTION: Draws a magenta circle centered at (81, 119) with radius 22.
; PLAN: r0=81(x), r1=119(y), r2=22(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 81
LDI r1, 119
LDI r2, 22
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
