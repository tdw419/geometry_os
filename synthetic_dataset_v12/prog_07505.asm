; DESCRIPTION: Draws a purple line from (116, 248) to (51, 85).
; PLAN: r0=116(x1), r1=248(y1), r2=51(x2), r3=85(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 248
LDI r2, 51
LDI r3, 85
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
