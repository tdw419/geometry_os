; DESCRIPTION: Draws a purple line from (9, 25) to (138, 190).
; PLAN: r0=9(x1), r1=25(y1), r2=138(x2), r3=190(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 25
LDI r2, 138
LDI r3, 190
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
