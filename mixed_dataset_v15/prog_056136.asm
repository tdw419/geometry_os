; DESCRIPTION: Renders a black disk with center (258, 154) and radius 31.
; PLAN: r0=258(x), r1=154(y), r2=31(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 258
LDI r1, 154
LDI r2, 31
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
