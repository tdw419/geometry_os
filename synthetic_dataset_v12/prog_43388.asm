; DESCRIPTION: Renders a white disk with center (84, 103) and radius 79.
; PLAN: r0=84(x), r1=103(y), r2=79(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 84
LDI r1, 103
LDI r2, 79
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
