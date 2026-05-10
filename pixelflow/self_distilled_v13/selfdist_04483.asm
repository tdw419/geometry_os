; DESCRIPTION: Draws a magenta circle centered at (364, 36) with radius 23.
; PLAN: r0=364(x), r1=36(y), r2=23(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 364
LDI r1, 36
LDI r2, 23
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
