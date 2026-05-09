; DESCRIPTION: Renders a green line between points (288, 118) and (496, 224).
; PLAN: r0=288(x1), r1=118(y1), r2=496(x2), r3=224(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 118
LDI r2, 496
LDI r3, 224
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
