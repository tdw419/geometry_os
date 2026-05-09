; DESCRIPTION: Draws a purple line from (378, 72) to (399, 230).
; PLAN: r0=378(x1), r1=72(y1), r2=399(x2), r3=230(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 72
LDI r2, 399
LDI r3, 230
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
