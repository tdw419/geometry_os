; DESCRIPTION: Places a yellow line segment connecting (158, 174) to (54, 133).
; PLAN: r0=158(x1), r1=174(y1), r2=54(x2), r3=133(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 174
LDI r2, 54
LDI r3, 133
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
