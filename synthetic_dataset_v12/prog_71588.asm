; DESCRIPTION: Renders a white disk with center (447, 135) and radius 60.
; PLAN: r0=447(x), r1=135(y), r2=60(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 447
LDI r1, 135
LDI r2, 60
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
