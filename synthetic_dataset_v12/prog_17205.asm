; DESCRIPTION: Places a purple line segment connecting (222, 61) to (366, 208).
; PLAN: r0=222(x1), r1=61(y1), r2=366(x2), r3=208(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 61
LDI r2, 366
LDI r3, 208
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
