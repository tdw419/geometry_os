; DESCRIPTION: Renders a white disk with center (68, 158) and radius 49.
; PLAN: r0=68(x), r1=158(y), r2=49(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 68
LDI r1, 158
LDI r2, 49
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
