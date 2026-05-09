; DESCRIPTION: Draws a yellow circle centered at (339, 86) with radius 73.
; PLAN: r0=339(x), r1=86(y), r2=73(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 339
LDI r1, 86
LDI r2, 73
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
