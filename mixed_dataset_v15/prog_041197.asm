; DESCRIPTION: Creates a blue circular shape at (266, 132) with radius 71.
; PLAN: r0=266(x), r1=132(y), r2=71(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 266
LDI r1, 132
LDI r2, 71
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
