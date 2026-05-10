; DESCRIPTION: Creates a blue circular shape at (427, 184) with radius 52.
; PLAN: r0=427(x), r1=184(y), r2=52(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 427
LDI r1, 184
LDI r2, 52
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
