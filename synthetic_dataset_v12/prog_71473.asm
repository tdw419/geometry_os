; DESCRIPTION: Renders a green disk with center (140, 25) and radius 13.
; PLAN: r0=140(x), r1=25(y), r2=13(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 140
LDI r1, 25
LDI r2, 13
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
