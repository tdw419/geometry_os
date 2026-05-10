; DESCRIPTION: Draws a magenta circle centered at (32, 114) with radius 74.
; PLAN: r0=32(x), r1=114(y), r2=74(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 32
LDI r1, 114
LDI r2, 74
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
