; DESCRIPTION: Draws a purple line from (94, 136) to (22, 225).
; PLAN: r0=94(x1), r1=136(y1), r2=22(x2), r3=225(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 136
LDI r2, 22
LDI r3, 225
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
