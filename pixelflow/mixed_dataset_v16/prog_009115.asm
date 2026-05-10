; DESCRIPTION: Draws a purple line from (361, 110) to (348, 196).
; PLAN: r0=361(x1), r1=110(y1), r2=348(x2), r3=196(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 110
LDI r2, 348
LDI r3, 196
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
