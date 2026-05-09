; DESCRIPTION: Renders a green disk with center (188, 77) and radius 43.
; PLAN: r0=188(x), r1=77(y), r2=43(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 188
LDI r1, 77
LDI r2, 43
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
