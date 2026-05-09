; DESCRIPTION: Draws a purple line from (25, 28) to (195, 77).
; PLAN: r0=25(x1), r1=28(y1), r2=195(x2), r3=77(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 28
LDI r2, 195
LDI r3, 77
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
