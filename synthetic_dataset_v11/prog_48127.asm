; DESCRIPTION: Renders a red line between points (147, 123) and (65, 149).
; PLAN: r0=147(x1), r1=123(y1), r2=65(x2), r3=149(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 123
LDI r2, 65
LDI r3, 149
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
