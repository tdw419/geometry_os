; DESCRIPTION: Renders a green disk with center (72, 167) and radius 26.
; PLAN: r0=72(x), r1=167(y), r2=26(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 72
LDI r1, 167
LDI r2, 26
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
