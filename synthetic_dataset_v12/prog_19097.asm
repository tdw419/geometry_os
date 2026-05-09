; DESCRIPTION: Draws a purple line from (348, 177) to (201, 182).
; PLAN: r0=348(x1), r1=177(y1), r2=201(x2), r3=182(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 177
LDI r2, 201
LDI r3, 182
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
