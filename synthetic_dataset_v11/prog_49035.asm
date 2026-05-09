; DESCRIPTION: Places a purple line segment connecting (187, 72) to (162, 9).
; PLAN: r0=187(x1), r1=72(y1), r2=162(x2), r3=9(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 72
LDI r2, 162
LDI r3, 9
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
