; DESCRIPTION: Draws a magenta circle centered at (97, 124) with radius 59.
; PLAN: r0=97(x), r1=124(y), r2=59(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 97
LDI r1, 124
LDI r2, 59
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
