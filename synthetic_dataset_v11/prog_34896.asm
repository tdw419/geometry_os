; DESCRIPTION: Renders a yellow line between points (55, 162) and (169, 157).
; PLAN: r0=55(x1), r1=162(y1), r2=169(x2), r3=157(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 162
LDI r2, 169
LDI r3, 157
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
