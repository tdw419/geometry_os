; DESCRIPTION: Renders a yellow line between points (162, 79) and (147, 104).
; PLAN: r0=162(x1), r1=79(y1), r2=147(x2), r3=104(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 79
LDI r2, 147
LDI r3, 104
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
