; DESCRIPTION: Places a purple line segment connecting (85, 26) to (202, 205).
; PLAN: r0=85(x1), r1=26(y1), r2=202(x2), r3=205(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 26
LDI r2, 202
LDI r3, 205
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
