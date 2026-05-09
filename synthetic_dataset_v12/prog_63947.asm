; DESCRIPTION: Renders a white disk with center (134, 126) and radius 26.
; PLAN: r0=134(x), r1=126(y), r2=26(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 134
LDI r1, 126
LDI r2, 26
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
