; DESCRIPTION: Draws a magenta circle centered at (112, 205) with radius 46.
; PLAN: r0=112(x), r1=205(y), r2=46(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 112
LDI r1, 205
LDI r2, 46
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
