; DESCRIPTION: Draws a magenta circle centered at (370, 78) with radius 53.
; PLAN: r0=370(x), r1=78(y), r2=53(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 370
LDI r1, 78
LDI r2, 53
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
