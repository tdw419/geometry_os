; DESCRIPTION: Draws a yellow circle centered at (121, 157) with radius 49.
; PLAN: r0=121(x), r1=157(y), r2=49(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 121
LDI r1, 157
LDI r2, 49
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
