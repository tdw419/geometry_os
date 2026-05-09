; DESCRIPTION: Renders a green disk with center (88, 141) and radius 63.
; PLAN: r0=88(x), r1=141(y), r2=63(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 88
LDI r1, 141
LDI r2, 63
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
