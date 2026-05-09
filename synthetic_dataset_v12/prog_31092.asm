; DESCRIPTION: Renders a white disk with center (293, 131) and radius 19.
; PLAN: r0=293(x), r1=131(y), r2=19(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 293
LDI r1, 131
LDI r2, 19
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
