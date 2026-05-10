; DESCRIPTION: Renders a red line between points (133, 147) and (205, 135).
; PLAN: r0=133(x1), r1=147(y1), r2=205(x2), r3=135(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 147
LDI r2, 205
LDI r3, 135
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
