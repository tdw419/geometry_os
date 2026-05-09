; DESCRIPTION: Renders a purple line between points (391, 25) and (316, 112).
; PLAN: r0=391(x1), r1=25(y1), r2=316(x2), r3=112(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 25
LDI r2, 316
LDI r3, 112
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
