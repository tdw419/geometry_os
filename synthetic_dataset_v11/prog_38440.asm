; DESCRIPTION: Renders a green disk with center (189, 77) and radius 39.
; PLAN: r0=189(x), r1=77(y), r2=39(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 189
LDI r1, 77
LDI r2, 39
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
