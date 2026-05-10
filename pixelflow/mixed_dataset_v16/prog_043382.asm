; DESCRIPTION: Renders a white disk with center (60, 185) and radius 49.
; PLAN: r0=60(x), r1=185(y), r2=49(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 60
LDI r1, 185
LDI r2, 49
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
