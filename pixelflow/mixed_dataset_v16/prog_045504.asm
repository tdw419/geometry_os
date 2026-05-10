; DESCRIPTION: Renders a white disk with center (447, 80) and radius 55.
; PLAN: r0=447(x), r1=80(y), r2=55(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 447
LDI r1, 80
LDI r2, 55
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
