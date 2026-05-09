; DESCRIPTION: Renders a green disk with center (143, 76) and radius 19.
; PLAN: r0=143(x), r1=76(y), r2=19(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 143
LDI r1, 76
LDI r2, 19
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
