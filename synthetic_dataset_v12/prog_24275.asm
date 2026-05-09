; DESCRIPTION: Renders a black disk with center (475, 211) and radius 13.
; PLAN: r0=475(x), r1=211(y), r2=13(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 475
LDI r1, 211
LDI r2, 13
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
