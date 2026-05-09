; DESCRIPTION: Draws a magenta circle centered at (121, 142) with radius 47.
; PLAN: r0=121(x), r1=142(y), r2=47(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 121
LDI r1, 142
LDI r2, 47
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
