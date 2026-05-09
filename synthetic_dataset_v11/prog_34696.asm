; DESCRIPTION: Renders a green disk with center (60, 188) and radius 13.
; PLAN: r0=60(x), r1=188(y), r2=13(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 60
LDI r1, 188
LDI r2, 13
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
