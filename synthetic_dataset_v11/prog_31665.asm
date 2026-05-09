; DESCRIPTION: Draws a yellow circle centered at (171, 144) with radius 66.
; PLAN: r0=171(x), r1=144(y), r2=66(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 171
LDI r1, 144
LDI r2, 66
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
