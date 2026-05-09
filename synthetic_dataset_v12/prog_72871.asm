; DESCRIPTION: Renders a white disk with center (463, 207) and radius 23.
; PLAN: r0=463(x), r1=207(y), r2=23(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 463
LDI r1, 207
LDI r2, 23
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
