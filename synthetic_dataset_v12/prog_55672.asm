; DESCRIPTION: Draws a magenta circle centered at (416, 139) with radius 51.
; PLAN: r0=416(x), r1=139(y), r2=51(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 416
LDI r1, 139
LDI r2, 51
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
