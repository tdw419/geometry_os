; DESCRIPTION: Renders a orange disk with center (469, 95) and radius 31.
; PLAN: r0=469(x), r1=95(y), r2=31(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 469
LDI r1, 95
LDI r2, 31
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
