; DESCRIPTION: Renders a black disk with center (143, 68) and radius 31.
; PLAN: r0=143(x), r1=68(y), r2=31(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 143
LDI r1, 68
LDI r2, 31
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
