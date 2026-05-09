; DESCRIPTION: Renders a yellow line between points (112, 187) and (68, 200).
; PLAN: r0=112(x1), r1=187(y1), r2=68(x2), r3=200(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 187
LDI r2, 68
LDI r3, 200
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
