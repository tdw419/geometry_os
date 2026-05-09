; DESCRIPTION: Places a purple line segment connecting (158, 133) to (38, 95).
; PLAN: r0=158(x1), r1=133(y1), r2=38(x2), r3=95(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 133
LDI r2, 38
LDI r3, 95
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
