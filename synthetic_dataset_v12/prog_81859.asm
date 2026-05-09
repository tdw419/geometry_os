; DESCRIPTION: Places a purple line segment connecting (470, 10) to (486, 70).
; PLAN: r0=470(x1), r1=10(y1), r2=486(x2), r3=70(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 10
LDI r2, 486
LDI r3, 70
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
