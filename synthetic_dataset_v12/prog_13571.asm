; DESCRIPTION: Places a purple line segment connecting (316, 212) to (51, 234).
; PLAN: r0=316(x1), r1=212(y1), r2=51(x2), r3=234(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 212
LDI r2, 51
LDI r3, 234
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
