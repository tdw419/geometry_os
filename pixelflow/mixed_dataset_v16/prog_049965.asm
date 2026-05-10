; DESCRIPTION: Renders a purple line segment connecting (15, 186) to (316, 72).
; PLAN: r0=15(x1), r1=186(y1), r2=316(x2), r3=72(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 186
LDI r2, 316
LDI r3, 72
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
