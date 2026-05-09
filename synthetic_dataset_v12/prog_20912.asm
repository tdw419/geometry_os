; DESCRIPTION: Renders a black disk with center (173, 71) and radius 26.
; PLAN: r0=173(x), r1=71(y), r2=26(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 173
LDI r1, 71
LDI r2, 26
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
