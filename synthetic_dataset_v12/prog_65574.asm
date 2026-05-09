; DESCRIPTION: Draws a magenta circle centered at (181, 114) with radius 14.
; PLAN: r0=181(x), r1=114(y), r2=14(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 181
LDI r1, 114
LDI r2, 14
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
