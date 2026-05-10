; DESCRIPTION: Renders a red line segment connecting (43, 188) to (390, 133).
; PLAN: r0=43(x1), r1=188(y1), r2=390(x2), r3=133(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 188
LDI r2, 390
LDI r3, 133
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
