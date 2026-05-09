; DESCRIPTION: Renders a white disk with center (79, 81) and radius 79.
; PLAN: r0=79(x), r1=81(y), r2=79(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 79
LDI r1, 81
LDI r2, 79
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
