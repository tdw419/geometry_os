; DESCRIPTION: Renders a white circular shape at (142, 119) with radius 47.
; PLAN: r0=142(x), r1=119(y), r2=47(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 142
LDI r1, 119
LDI r2, 47
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
