; DESCRIPTION: Draws a magenta circle centered at (52, 60) with radius 55.
; PLAN: r0=52(x), r1=60(y), r2=55(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 52
LDI r1, 60
LDI r2, 55
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
