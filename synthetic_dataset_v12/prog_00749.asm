; DESCRIPTION: Draws a magenta circle centered at (322, 52) with radius 48.
; PLAN: r0=322(x), r1=52(y), r2=48(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 322
LDI r1, 52
LDI r2, 48
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
