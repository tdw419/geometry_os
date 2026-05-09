; DESCRIPTION: Renders a green disk with center (130, 124) and radius 76.
; PLAN: r0=130(x), r1=124(y), r2=76(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 130
LDI r1, 124
LDI r2, 76
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
