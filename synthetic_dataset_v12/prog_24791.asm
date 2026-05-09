; DESCRIPTION: Renders a green disk with center (282, 91) and radius 43.
; PLAN: r0=282(x), r1=91(y), r2=43(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 282
LDI r1, 91
LDI r2, 43
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
