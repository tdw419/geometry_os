; DESCRIPTION: Draws a purple line from (102, 217) to (55, 52).
; PLAN: r0=102(x1), r1=217(y1), r2=55(x2), r3=52(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 217
LDI r2, 55
LDI r3, 52
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
