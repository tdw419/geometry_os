; DESCRIPTION: Renders a green disk with center (72, 89) and radius 68.
; PLAN: r0=72(x), r1=89(y), r2=68(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 72
LDI r1, 89
LDI r2, 68
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
