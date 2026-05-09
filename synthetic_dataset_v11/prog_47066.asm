; DESCRIPTION: Renders a white disk with center (183, 80) and radius 56.
; PLAN: r0=183(x), r1=80(y), r2=56(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 183
LDI r1, 80
LDI r2, 56
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
