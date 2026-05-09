; DESCRIPTION: Renders a blue disk with center (76, 187) and radius 26.
; PLAN: r0=76(x), r1=187(y), r2=26(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 76
LDI r1, 187
LDI r2, 26
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
