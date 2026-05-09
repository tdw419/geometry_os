; DESCRIPTION: Draws a magenta circle centered at (207, 94) with radius 22.
; PLAN: r0=207(x), r1=94(y), r2=22(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 207
LDI r1, 94
LDI r2, 22
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
