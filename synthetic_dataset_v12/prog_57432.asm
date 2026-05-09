; DESCRIPTION: Renders a black disk with center (336, 217) and radius 16.
; PLAN: r0=336(x), r1=217(y), r2=16(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 336
LDI r1, 217
LDI r2, 16
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
