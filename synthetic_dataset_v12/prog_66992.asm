; DESCRIPTION: Renders a white disk with center (149, 64) and radius 37.
; PLAN: r0=149(x), r1=64(y), r2=37(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 149
LDI r1, 64
LDI r2, 37
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
