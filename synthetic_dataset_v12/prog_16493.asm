; DESCRIPTION: Renders a green disk with center (137, 35) and radius 16.
; PLAN: r0=137(x), r1=35(y), r2=16(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 137
LDI r1, 35
LDI r2, 16
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
