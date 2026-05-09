; DESCRIPTION: Draws a magenta circle centered at (46, 123) with radius 31.
; PLAN: r0=46(x), r1=123(y), r2=31(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 46
LDI r1, 123
LDI r2, 31
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
