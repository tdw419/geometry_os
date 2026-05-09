; DESCRIPTION: Renders a green disk with center (34, 109) and radius 19.
; PLAN: r0=34(x), r1=109(y), r2=19(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 34
LDI r1, 109
LDI r2, 19
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
