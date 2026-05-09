; DESCRIPTION: Renders a green disk with center (117, 144) and radius 58.
; PLAN: r0=117(x), r1=144(y), r2=58(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 117
LDI r1, 144
LDI r2, 58
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
