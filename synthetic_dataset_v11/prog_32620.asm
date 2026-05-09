; DESCRIPTION: Places a purple line segment connecting (231, 160) to (95, 233).
; PLAN: r0=231(x1), r1=160(y1), r2=95(x2), r3=233(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 160
LDI r2, 95
LDI r3, 233
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
