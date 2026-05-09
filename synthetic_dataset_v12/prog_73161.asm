; DESCRIPTION: Draws a blue circle centered at (383, 137) with radius 53.
; PLAN: r0=383(x), r1=137(y), r2=53(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 383
LDI r1, 137
LDI r2, 53
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
