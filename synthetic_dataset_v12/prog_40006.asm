; DESCRIPTION: Draws a magenta circle centered at (126, 201) with radius 46.
; PLAN: r0=126(x), r1=201(y), r2=46(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 126
LDI r1, 201
LDI r2, 46
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
