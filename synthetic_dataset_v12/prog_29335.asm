; DESCRIPTION: Renders a white disk with center (338, 152) and radius 76.
; PLAN: r0=338(x), r1=152(y), r2=76(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 338
LDI r1, 152
LDI r2, 76
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
