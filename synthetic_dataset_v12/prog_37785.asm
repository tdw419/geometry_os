; DESCRIPTION: Draws a magenta circle centered at (457, 124) with radius 13.
; PLAN: r0=457(x), r1=124(y), r2=13(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 457
LDI r1, 124
LDI r2, 13
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
