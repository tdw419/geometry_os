; DESCRIPTION: Draws a purple line from (219, 190) to (170, 74).
; PLAN: r0=219(x1), r1=190(y1), r2=170(x2), r3=74(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 190
LDI r2, 170
LDI r3, 74
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
