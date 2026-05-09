; DESCRIPTION: Places a purple line segment connecting (14, 222) to (23, 161).
; PLAN: r0=14(x1), r1=222(y1), r2=23(x2), r3=161(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 222
LDI r2, 23
LDI r3, 161
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
