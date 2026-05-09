; DESCRIPTION: Renders a white disk with center (171, 137) and radius 74.
; PLAN: r0=171(x), r1=137(y), r2=74(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 171
LDI r1, 137
LDI r2, 74
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
