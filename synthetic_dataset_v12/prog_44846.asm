; DESCRIPTION: Draws a yellow circle centered at (157, 135) with radius 76.
; PLAN: r0=157(x), r1=135(y), r2=76(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 157
LDI r1, 135
LDI r2, 76
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
