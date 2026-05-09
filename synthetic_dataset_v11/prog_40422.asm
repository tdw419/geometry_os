; DESCRIPTION: Renders a red line between points (162, 189) and (147, 174).
; PLAN: r0=162(x1), r1=189(y1), r2=147(x2), r3=174(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 189
LDI r2, 147
LDI r3, 174
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
