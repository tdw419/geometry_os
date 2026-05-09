; DESCRIPTION: Draws a magenta circle centered at (143, 208) with radius 17.
; PLAN: r0=143(x), r1=208(y), r2=17(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 143
LDI r1, 208
LDI r2, 17
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
