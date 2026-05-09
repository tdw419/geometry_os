; DESCRIPTION: Renders a green disk with center (187, 109) and radius 54.
; PLAN: r0=187(x), r1=109(y), r2=54(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 187
LDI r1, 109
LDI r2, 54
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
