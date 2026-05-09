; DESCRIPTION: Draws a yellow circle centered at (215, 163) with radius 19.
; PLAN: r0=215(x), r1=163(y), r2=19(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 215
LDI r1, 163
LDI r2, 19
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
