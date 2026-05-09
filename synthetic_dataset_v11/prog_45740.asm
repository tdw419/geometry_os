; DESCRIPTION: Draws a purple line from (117, 25) to (142, 211).
; PLAN: r0=117(x1), r1=25(y1), r2=142(x2), r3=211(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 25
LDI r2, 142
LDI r3, 211
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
