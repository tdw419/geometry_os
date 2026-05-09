; DESCRIPTION: Renders a white disk with center (432, 185) and radius 57.
; PLAN: r0=432(x), r1=185(y), r2=57(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 432
LDI r1, 185
LDI r2, 57
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
