; DESCRIPTION: Renders a black disk with center (89, 154) and radius 38.
; PLAN: r0=89(x), r1=154(y), r2=38(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 89
LDI r1, 154
LDI r2, 38
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
