; DESCRIPTION: Draws a magenta circle centered at (35, 48) with radius 23.
; PLAN: r0=35(x), r1=48(y), r2=23(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 35
LDI r1, 48
LDI r2, 23
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
