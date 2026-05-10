; DESCRIPTION: Draws a purple line from (407, 95) to (324, 30).
; PLAN: r0=407(x1), r1=95(y1), r2=324(x2), r3=30(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 95
LDI r2, 324
LDI r3, 30
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
