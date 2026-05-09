; DESCRIPTION: Renders a green disk with center (130, 95) and radius 49.
; PLAN: r0=130(x), r1=95(y), r2=49(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 130
LDI r1, 95
LDI r2, 49
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
