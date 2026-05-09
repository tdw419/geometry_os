; DESCRIPTION: Places a purple line segment connecting (217, 153) to (158, 176).
; PLAN: r0=217(x1), r1=153(y1), r2=158(x2), r3=176(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 153
LDI r2, 158
LDI r3, 176
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
