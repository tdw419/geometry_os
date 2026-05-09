; DESCRIPTION: Renders a green disk with center (189, 83) and radius 61.
; PLAN: r0=189(x), r1=83(y), r2=61(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 189
LDI r1, 83
LDI r2, 61
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
