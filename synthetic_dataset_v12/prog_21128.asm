; DESCRIPTION: Renders a white disk with center (100, 165) and radius 49.
; PLAN: r0=100(x), r1=165(y), r2=49(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 100
LDI r1, 165
LDI r2, 49
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
