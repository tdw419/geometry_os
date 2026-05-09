; DESCRIPTION: Renders a white disk with center (115, 158) and radius 67.
; PLAN: r0=115(x), r1=158(y), r2=67(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 115
LDI r1, 158
LDI r2, 67
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
