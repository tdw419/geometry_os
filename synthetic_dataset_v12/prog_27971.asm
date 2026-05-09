; DESCRIPTION: Renders a yellow line between points (427, 1) and (505, 200).
; PLAN: r0=427(x1), r1=1(y1), r2=505(x2), r3=200(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 1
LDI r2, 505
LDI r3, 200
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
