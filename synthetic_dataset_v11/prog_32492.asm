; DESCRIPTION: Renders a green disk with center (76, 112) and radius 62.
; PLAN: r0=76(x), r1=112(y), r2=62(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 76
LDI r1, 112
LDI r2, 62
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
