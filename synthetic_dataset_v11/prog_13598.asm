; DESCRIPTION: Draws a magenta circle centered at (163, 47) with radius 34.
; PLAN: r0=163(x), r1=47(y), r2=34(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 163
LDI r1, 47
LDI r2, 34
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
