; DESCRIPTION: Places a purple line segment connecting (23, 118) to (267, 7).
; PLAN: r0=23(x1), r1=118(y1), r2=267(x2), r3=7(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 118
LDI r2, 267
LDI r3, 7
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
