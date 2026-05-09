; DESCRIPTION: Draws a magenta circle centered at (122, 177) with radius 65.
; PLAN: r0=122(x), r1=177(y), r2=65(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 122
LDI r1, 177
LDI r2, 65
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
