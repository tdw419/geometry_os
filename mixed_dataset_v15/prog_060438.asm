; DESCRIPTION: Places a purple line segment connecting (87, 33) to (23, 205).
; PLAN: r0=87(x1), r1=33(y1), r2=23(x2), r3=205(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 33
LDI r2, 23
LDI r3, 205
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
