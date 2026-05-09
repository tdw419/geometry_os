; DESCRIPTION: Renders a white disk with center (264, 131) and radius 38.
; PLAN: r0=264(x), r1=131(y), r2=38(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 264
LDI r1, 131
LDI r2, 38
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
