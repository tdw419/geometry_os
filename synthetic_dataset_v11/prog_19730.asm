; DESCRIPTION: Renders a yellow line between points (169, 195) and (201, 252).
; PLAN: r0=169(x1), r1=195(y1), r2=201(x2), r3=252(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 195
LDI r2, 201
LDI r3, 252
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
