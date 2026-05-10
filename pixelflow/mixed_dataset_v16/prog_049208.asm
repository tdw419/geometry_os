; DESCRIPTION: Places a purple line segment connecting (214, 87) to (445, 79).
; PLAN: r0=214(x1), r1=87(y1), r2=445(x2), r3=79(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 87
LDI r2, 445
LDI r3, 79
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
