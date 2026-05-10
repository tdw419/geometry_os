; DESCRIPTION: Places a purple line segment connecting (205, 91) to (486, 25).
; PLAN: r0=205(x1), r1=91(y1), r2=486(x2), r3=25(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 91
LDI r2, 486
LDI r3, 25
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
