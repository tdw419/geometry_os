; DESCRIPTION: Draws a magenta circle centered at (141, 207) with radius 46.
; PLAN: r0=141(x), r1=207(y), r2=46(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 141
LDI r1, 207
LDI r2, 46
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
