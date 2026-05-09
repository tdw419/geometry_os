; DESCRIPTION: Places a purple line segment connecting (405, 95) to (428, 68).
; PLAN: r0=405(x1), r1=95(y1), r2=428(x2), r3=68(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 95
LDI r2, 428
LDI r3, 68
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
