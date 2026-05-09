; DESCRIPTION: Places a purple line segment connecting (45, 135) to (68, 85).
; PLAN: r0=45(x1), r1=135(y1), r2=68(x2), r3=85(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 135
LDI r2, 68
LDI r3, 85
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
