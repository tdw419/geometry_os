; DESCRIPTION: Places a purple line segment connecting (146, 101) to (252, 168).
; PLAN: r0=146(x1), r1=101(y1), r2=252(x2), r3=168(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 101
LDI r2, 252
LDI r3, 168
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
