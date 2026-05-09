; DESCRIPTION: Renders a black disk with center (207, 44) and radius 17.
; PLAN: r0=207(x), r1=44(y), r2=17(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 207
LDI r1, 44
LDI r2, 17
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
