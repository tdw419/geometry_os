; DESCRIPTION: Places a purple line segment connecting (483, 78) to (465, 77).
; PLAN: r0=483(x1), r1=78(y1), r2=465(x2), r3=77(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 78
LDI r2, 465
LDI r3, 77
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
