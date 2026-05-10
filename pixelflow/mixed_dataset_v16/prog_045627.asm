; DESCRIPTION: Draws a yellow circle centered at (358, 60) with radius 35.
; PLAN: r0=358(x), r1=60(y), r2=35(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 358
LDI r1, 60
LDI r2, 35
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
