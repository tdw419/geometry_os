; DESCRIPTION: Draws a magenta circle centered at (458, 137) with radius 48.
; PLAN: r0=458(x), r1=137(y), r2=48(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 458
LDI r1, 137
LDI r2, 48
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
