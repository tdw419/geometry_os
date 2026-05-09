; DESCRIPTION: Renders a green disk with center (87, 99) and radius 76.
; PLAN: r0=87(x), r1=99(y), r2=76(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 87
LDI r1, 99
LDI r2, 76
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
