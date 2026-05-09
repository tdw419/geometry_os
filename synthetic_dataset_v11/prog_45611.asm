; DESCRIPTION: Renders a white disk with center (50, 80) and radius 34.
; PLAN: r0=50(x), r1=80(y), r2=34(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 50
LDI r1, 80
LDI r2, 34
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
