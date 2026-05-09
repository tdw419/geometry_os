; DESCRIPTION: Renders a white disk with center (477, 202) and radius 34.
; PLAN: r0=477(x), r1=202(y), r2=34(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 477
LDI r1, 202
LDI r2, 34
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
