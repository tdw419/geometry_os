; DESCRIPTION: Renders a white disk with center (89, 182) and radius 53.
; PLAN: r0=89(x), r1=182(y), r2=53(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 89
LDI r1, 182
LDI r2, 53
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
