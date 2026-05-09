; DESCRIPTION: Draws a magenta circle centered at (55, 57) with radius 50.
; PLAN: r0=55(x), r1=57(y), r2=50(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 55
LDI r1, 57
LDI r2, 50
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
