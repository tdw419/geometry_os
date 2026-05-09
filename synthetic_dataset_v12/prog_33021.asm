; DESCRIPTION: Renders a green disk with center (115, 98) and radius 73.
; PLAN: r0=115(x), r1=98(y), r2=73(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 115
LDI r1, 98
LDI r2, 73
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
