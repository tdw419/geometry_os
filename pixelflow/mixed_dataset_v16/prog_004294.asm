; DESCRIPTION: Renders a white disk with center (217, 100) and radius 65.
; PLAN: r0=217(x), r1=100(y), r2=65(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 217
LDI r1, 100
LDI r2, 65
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
