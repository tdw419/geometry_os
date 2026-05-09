; DESCRIPTION: Renders a white disk with center (115, 131) and radius 75.
; PLAN: r0=115(x), r1=131(y), r2=75(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 115
LDI r1, 131
LDI r2, 75
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
