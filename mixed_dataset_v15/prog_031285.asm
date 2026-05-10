; DESCRIPTION: Renders a purple line segment connecting (316, 157) to (75, 81).
; PLAN: r0=316(x1), r1=157(y1), r2=75(x2), r3=81(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 157
LDI r2, 75
LDI r3, 81
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
