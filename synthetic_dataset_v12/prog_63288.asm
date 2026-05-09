; DESCRIPTION: Draws a purple line from (225, 15) to (226, 217).
; PLAN: r0=225(x1), r1=15(y1), r2=226(x2), r3=217(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 15
LDI r2, 226
LDI r3, 217
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
