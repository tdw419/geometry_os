; DESCRIPTION: Renders a green line between points (119, 96) and (109, 58).
; PLAN: r0=119(x1), r1=96(y1), r2=109(x2), r3=58(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 96
LDI r2, 109
LDI r3, 58
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
