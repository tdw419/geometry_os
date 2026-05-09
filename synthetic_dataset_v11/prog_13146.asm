; DESCRIPTION: Renders a white disk with center (138, 126) and radius 54.
; PLAN: r0=138(x), r1=126(y), r2=54(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 138
LDI r1, 126
LDI r2, 54
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
