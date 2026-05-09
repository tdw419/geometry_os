; DESCRIPTION: Renders a white disk with center (131, 159) and radius 47.
; PLAN: r0=131(x), r1=159(y), r2=47(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 131
LDI r1, 159
LDI r2, 47
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
