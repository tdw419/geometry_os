; DESCRIPTION: Renders a green disk with center (302, 91) and radius 73.
; PLAN: r0=302(x), r1=91(y), r2=73(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 302
LDI r1, 91
LDI r2, 73
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
