; DESCRIPTION: Draws a magenta circle centered at (161, 103) with radius 37.
; PLAN: r0=161(x), r1=103(y), r2=37(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 161
LDI r1, 103
LDI r2, 37
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
