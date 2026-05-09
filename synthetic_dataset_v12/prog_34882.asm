; DESCRIPTION: Renders a white disk with center (261, 121) and radius 40.
; PLAN: r0=261(x), r1=121(y), r2=40(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 261
LDI r1, 121
LDI r2, 40
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
