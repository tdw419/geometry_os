; DESCRIPTION: Renders a green disk with center (137, 44) and radius 29.
; PLAN: r0=137(x), r1=44(y), r2=29(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 137
LDI r1, 44
LDI r2, 29
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
