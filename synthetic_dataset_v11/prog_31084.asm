; DESCRIPTION: Draws a purple line from (190, 64) to (112, 121).
; PLAN: r0=190(x1), r1=64(y1), r2=112(x2), r3=121(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 64
LDI r2, 112
LDI r3, 121
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
