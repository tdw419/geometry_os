; DESCRIPTION: Renders a white disk with center (440, 183) and radius 70.
; PLAN: r0=440(x), r1=183(y), r2=70(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 440
LDI r1, 183
LDI r2, 70
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
