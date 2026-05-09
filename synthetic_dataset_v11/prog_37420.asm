; DESCRIPTION: Draws a magenta circle centered at (105, 109) with radius 46.
; PLAN: r0=105(x), r1=109(y), r2=46(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 105
LDI r1, 109
LDI r2, 46
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
