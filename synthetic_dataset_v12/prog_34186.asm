; DESCRIPTION: Renders a black disk with center (283, 38) and radius 17.
; PLAN: r0=283(x), r1=38(y), r2=17(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 283
LDI r1, 38
LDI r2, 17
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
