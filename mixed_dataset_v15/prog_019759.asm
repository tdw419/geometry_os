; DESCRIPTION: Places a purple line segment connecting (316, 19) to (276, 98).
; PLAN: r0=316(x1), r1=19(y1), r2=276(x2), r3=98(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 19
LDI r2, 276
LDI r3, 98
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
