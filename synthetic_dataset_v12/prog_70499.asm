; DESCRIPTION: Draws a magenta circle centered at (372, 87) with radius 70.
; PLAN: r0=372(x), r1=87(y), r2=70(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 372
LDI r1, 87
LDI r2, 70
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
