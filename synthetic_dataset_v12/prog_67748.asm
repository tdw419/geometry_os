; DESCRIPTION: Draws a magenta circle centered at (322, 179) with radius 68.
; PLAN: r0=322(x), r1=179(y), r2=68(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 322
LDI r1, 179
LDI r2, 68
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
