; DESCRIPTION: Renders a black disk with center (207, 58) and radius 11.
; PLAN: r0=207(x), r1=58(y), r2=11(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 207
LDI r1, 58
LDI r2, 11
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
