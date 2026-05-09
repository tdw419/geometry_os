; DESCRIPTION: Renders a white disk with center (389, 179) and radius 56.
; PLAN: r0=389(x), r1=179(y), r2=56(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 389
LDI r1, 179
LDI r2, 56
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
