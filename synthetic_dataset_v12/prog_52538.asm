; DESCRIPTION: Renders a green disk with center (105, 212) and radius 26.
; PLAN: r0=105(x), r1=212(y), r2=26(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 105
LDI r1, 212
LDI r2, 26
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
