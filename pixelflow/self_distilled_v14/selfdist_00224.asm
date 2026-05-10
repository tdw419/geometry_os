; DESCRIPTION: Renders a blue circular shape at (334, 132) with radius 26.
; PLAN: r0=334(x), r1=132(y), r2=26(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 334
LDI r1, 132
LDI r2, 26
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
