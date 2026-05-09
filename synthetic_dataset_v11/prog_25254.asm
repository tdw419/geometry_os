; DESCRIPTION: Places a purple line segment connecting (150, 34) to (14, 212).
; PLAN: r0=150(x1), r1=34(y1), r2=14(x2), r3=212(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 34
LDI r2, 14
LDI r3, 212
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
