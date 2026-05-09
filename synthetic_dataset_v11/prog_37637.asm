; DESCRIPTION: Renders a green disk with center (89, 125) and radius 64.
; PLAN: r0=89(x), r1=125(y), r2=64(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 89
LDI r1, 125
LDI r2, 64
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
