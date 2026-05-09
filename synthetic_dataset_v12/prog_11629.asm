; DESCRIPTION: Renders a white disk with center (93, 62) and radius 50.
; PLAN: r0=93(x), r1=62(y), r2=50(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 93
LDI r1, 62
LDI r2, 50
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
