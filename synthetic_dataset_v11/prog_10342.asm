; DESCRIPTION: Draws a purple circle centered at (114, 64) with radius 59.
; PLAN: r0=114(x), r1=64(y), r2=59(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 114
LDI r1, 64
LDI r2, 59
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
