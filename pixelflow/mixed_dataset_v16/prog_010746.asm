; DESCRIPTION: Draws a magenta circle centered at (121, 91) with radius 74.
; PLAN: r0=121(x), r1=91(y), r2=74(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 121
LDI r1, 91
LDI r2, 74
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
