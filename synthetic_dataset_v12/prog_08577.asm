; DESCRIPTION: Renders a white disk with center (244, 153) and radius 62.
; PLAN: r0=244(x), r1=153(y), r2=62(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 244
LDI r1, 153
LDI r2, 62
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
