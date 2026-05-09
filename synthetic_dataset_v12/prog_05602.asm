; DESCRIPTION: Renders a black disk with center (323, 55) and radius 30.
; PLAN: r0=323(x), r1=55(y), r2=30(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 323
LDI r1, 55
LDI r2, 30
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
