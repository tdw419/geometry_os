; DESCRIPTION: Draws a magenta circle centered at (323, 115) with radius 78.
; PLAN: r0=323(x), r1=115(y), r2=78(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 323
LDI r1, 115
LDI r2, 78
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
