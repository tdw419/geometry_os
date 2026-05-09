; DESCRIPTION: Renders a black disk with center (439, 113) and radius 71.
; PLAN: r0=439(x), r1=113(y), r2=71(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 439
LDI r1, 113
LDI r2, 71
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
