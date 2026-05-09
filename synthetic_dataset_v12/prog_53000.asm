; DESCRIPTION: Renders a green disk with center (259, 80) and radius 78.
; PLAN: r0=259(x), r1=80(y), r2=78(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 259
LDI r1, 80
LDI r2, 78
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
