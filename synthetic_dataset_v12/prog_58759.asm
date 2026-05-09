; DESCRIPTION: Draws a purple line from (324, 77) to (134, 95).
; PLAN: r0=324(x1), r1=77(y1), r2=134(x2), r3=95(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 77
LDI r2, 134
LDI r3, 95
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
