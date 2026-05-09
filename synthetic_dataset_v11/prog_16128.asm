; DESCRIPTION: Renders a green disk with center (212, 100) and radius 40.
; PLAN: r0=212(x), r1=100(y), r2=40(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 212
LDI r1, 100
LDI r2, 40
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
