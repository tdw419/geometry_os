; DESCRIPTION: Draws a magenta circle centered at (115, 82) with radius 66.
; PLAN: r0=115(x), r1=82(y), r2=66(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 115
LDI r1, 82
LDI r2, 66
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
