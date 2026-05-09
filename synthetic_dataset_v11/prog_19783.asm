; DESCRIPTION: Renders a green disk with center (93, 91) and radius 64.
; PLAN: r0=93(x), r1=91(y), r2=64(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 93
LDI r1, 91
LDI r2, 64
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
