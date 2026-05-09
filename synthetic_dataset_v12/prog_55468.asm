; DESCRIPTION: Draws a purple line from (362, 215) to (316, 35).
; PLAN: r0=362(x1), r1=215(y1), r2=316(x2), r3=35(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 215
LDI r2, 316
LDI r3, 35
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
