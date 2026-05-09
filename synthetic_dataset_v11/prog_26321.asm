; DESCRIPTION: Renders a green line between points (5, 136) and (118, 123).
; PLAN: r0=5(x1), r1=136(y1), r2=118(x2), r3=123(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 136
LDI r2, 118
LDI r3, 123
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
