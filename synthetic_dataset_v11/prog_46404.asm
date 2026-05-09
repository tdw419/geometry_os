; DESCRIPTION: Renders a black disk with center (62, 206) and radius 21.
; PLAN: r0=62(x), r1=206(y), r2=21(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 62
LDI r1, 206
LDI r2, 21
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
