; DESCRIPTION: Renders a black disk with center (161, 192) and radius 22.
; PLAN: r0=161(x), r1=192(y), r2=22(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 161
LDI r1, 192
LDI r2, 22
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
