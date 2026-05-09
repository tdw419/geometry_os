; DESCRIPTION: Renders a black disk with center (276, 174) and radius 19.
; PLAN: r0=276(x), r1=174(y), r2=19(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 276
LDI r1, 174
LDI r2, 19
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
