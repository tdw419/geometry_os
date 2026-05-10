; DESCRIPTION: Renders a white disk with center (60, 135) and radius 58.
; PLAN: r0=60(x), r1=135(y), r2=58(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 60
LDI r1, 135
LDI r2, 58
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
