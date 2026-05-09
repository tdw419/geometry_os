; DESCRIPTION: Draws a magenta circle centered at (61, 54) with radius 11.
; PLAN: r0=61(x), r1=54(y), r2=11(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 61
LDI r1, 54
LDI r2, 11
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
