; DESCRIPTION: Renders a white disk with center (56, 121) and radius 25.
; PLAN: r0=56(x), r1=121(y), r2=25(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 56
LDI r1, 121
LDI r2, 25
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
