; DESCRIPTION: Renders a white disk with center (411, 154) and radius 76.
; PLAN: r0=411(x), r1=154(y), r2=76(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 411
LDI r1, 154
LDI r2, 76
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
