; DESCRIPTION: Renders a white disk with center (184, 85) and radius 47.
; PLAN: r0=184(x), r1=85(y), r2=47(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 184
LDI r1, 85
LDI r2, 47
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
