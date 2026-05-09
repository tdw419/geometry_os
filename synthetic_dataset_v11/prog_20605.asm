; DESCRIPTION: Renders a white disk with center (74, 121) and radius 73.
; PLAN: r0=74(x), r1=121(y), r2=73(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 121
LDI r2, 73
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
