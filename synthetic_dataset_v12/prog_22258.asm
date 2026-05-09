; DESCRIPTION: Draws a magenta circle centered at (245, 208) with radius 31.
; PLAN: r0=245(x), r1=208(y), r2=31(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 245
LDI r1, 208
LDI r2, 31
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
