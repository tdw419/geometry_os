; DESCRIPTION: Renders a blue disk with center (204, 143) and radius 26.
; PLAN: r0=204(x), r1=143(y), r2=26(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 204
LDI r1, 143
LDI r2, 26
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
