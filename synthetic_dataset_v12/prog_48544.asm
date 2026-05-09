; DESCRIPTION: Renders a green disk with center (438, 188) and radius 62.
; PLAN: r0=438(x), r1=188(y), r2=62(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 438
LDI r1, 188
LDI r2, 62
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
