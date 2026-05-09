; DESCRIPTION: Draws a purple line from (225, 142) to (170, 99).
; PLAN: r0=225(x1), r1=142(y1), r2=170(x2), r3=99(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 142
LDI r2, 170
LDI r3, 99
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
