; DESCRIPTION: Renders a white disk with center (85, 200) and radius 54.
; PLAN: r0=85(x), r1=200(y), r2=54(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 85
LDI r1, 200
LDI r2, 54
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
