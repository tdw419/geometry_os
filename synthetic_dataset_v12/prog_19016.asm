; DESCRIPTION: Places a purple line segment connecting (181, 186) to (252, 167).
; PLAN: r0=181(x1), r1=186(y1), r2=252(x2), r3=167(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 186
LDI r2, 252
LDI r3, 167
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
