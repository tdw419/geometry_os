; DESCRIPTION: Draws a purple line from (167, 30) to (80, 112).
; PLAN: r0=167(x1), r1=30(y1), r2=80(x2), r3=112(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 30
LDI r2, 80
LDI r3, 112
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
