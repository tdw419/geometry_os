; DESCRIPTION: Renders a white disk with center (186, 81) and radius 34.
; PLAN: r0=186(x), r1=81(y), r2=34(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 186
LDI r1, 81
LDI r2, 34
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
