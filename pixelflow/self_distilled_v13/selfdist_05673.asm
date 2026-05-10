; DESCRIPTION: Draws a purple line from (348, 8) to (54, 88).
; PLAN: r0=348(x1), r1=8(y1), r2=54(x2), r3=88(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 8
LDI r2, 54
LDI r3, 88
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
