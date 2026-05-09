; DESCRIPTION: Renders a white disk with center (336, 85) and radius 20.
; PLAN: r0=336(x), r1=85(y), r2=20(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 336
LDI r1, 85
LDI r2, 20
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
