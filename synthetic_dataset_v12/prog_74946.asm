; DESCRIPTION: Draws a magenta circle centered at (475, 31) with radius 13.
; PLAN: r0=475(x), r1=31(y), r2=13(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 475
LDI r1, 31
LDI r2, 13
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
