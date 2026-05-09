; DESCRIPTION: Draws a yellow circle centered at (44, 215) with radius 37.
; PLAN: r0=44(x), r1=215(y), r2=37(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 44
LDI r1, 215
LDI r2, 37
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
