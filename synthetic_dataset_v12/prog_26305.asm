; DESCRIPTION: Draws a yellow circle centered at (195, 72) with radius 17.
; PLAN: r0=195(x), r1=72(y), r2=17(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 195
LDI r1, 72
LDI r2, 17
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
