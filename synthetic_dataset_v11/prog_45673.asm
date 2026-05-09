; DESCRIPTION: Renders a green disk with center (55, 123) and radius 32.
; PLAN: r0=55(x), r1=123(y), r2=32(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 55
LDI r1, 123
LDI r2, 32
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
