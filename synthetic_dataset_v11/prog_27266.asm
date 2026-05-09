; DESCRIPTION: Renders a green disk with center (88, 132) and radius 60.
; PLAN: r0=88(x), r1=132(y), r2=60(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 88
LDI r1, 132
LDI r2, 60
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
