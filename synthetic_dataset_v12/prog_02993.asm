; DESCRIPTION: Renders a green disk with center (167, 241) and radius 13.
; PLAN: r0=167(x), r1=241(y), r2=13(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 167
LDI r1, 241
LDI r2, 13
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
