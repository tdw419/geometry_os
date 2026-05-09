; DESCRIPTION: Draws a blue circle centered at (208, 66) with radius 39.
; PLAN: r0=208(x), r1=66(y), r2=39(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 208
LDI r1, 66
LDI r2, 39
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
