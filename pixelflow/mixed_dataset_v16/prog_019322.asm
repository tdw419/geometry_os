; DESCRIPTION: Renders a purple line between points (491, 195) and (316, 230).
; PLAN: r0=491(x1), r1=195(y1), r2=316(x2), r3=230(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 195
LDI r2, 316
LDI r3, 230
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
