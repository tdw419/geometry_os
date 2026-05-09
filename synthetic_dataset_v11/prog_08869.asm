; DESCRIPTION: Renders a green disk with center (156, 34) and radius 34.
; PLAN: r0=156(x), r1=34(y), r2=34(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 156
LDI r1, 34
LDI r2, 34
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
