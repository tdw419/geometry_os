; DESCRIPTION: Places a orange circle of radius 17 at center (478, 147).
; PLAN: r0=478(x), r1=147(y), r2=17(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 478
LDI r1, 147
LDI r2, 17
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
