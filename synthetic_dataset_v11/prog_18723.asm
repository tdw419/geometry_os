; DESCRIPTION: Draws a purple line from (91, 110) to (1, 77).
; PLAN: r0=91(x1), r1=110(y1), r2=1(x2), r3=77(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 110
LDI r2, 1
LDI r3, 77
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
