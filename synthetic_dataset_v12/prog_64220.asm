; DESCRIPTION: Draws a yellow circle centered at (157, 187) with radius 13.
; PLAN: r0=157(x), r1=187(y), r2=13(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 157
LDI r1, 187
LDI r2, 13
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
