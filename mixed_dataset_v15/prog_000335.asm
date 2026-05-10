; DESCRIPTION: Draws a yellow circle centered at (250, 195) with radius 35.
; PLAN: r0=250(x), r1=195(y), r2=35(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 250
LDI r1, 195
LDI r2, 35
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
