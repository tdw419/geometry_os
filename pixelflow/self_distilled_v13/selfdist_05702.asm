; DESCRIPTION: Draws a magenta circle centered at (142, 127) with radius 34.
; PLAN: r0=142(x), r1=127(y), r2=34(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 142
LDI r1, 127
LDI r2, 34
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
