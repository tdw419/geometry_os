; DESCRIPTION: Renders a white disk with center (115, 128) and radius 76.
; PLAN: r0=115(x), r1=128(y), r2=76(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 115
LDI r1, 128
LDI r2, 76
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
