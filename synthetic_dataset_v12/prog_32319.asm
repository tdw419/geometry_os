; DESCRIPTION: Draws a purple line from (44, 170) to (411, 148).
; PLAN: r0=44(x1), r1=170(y1), r2=411(x2), r3=148(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 170
LDI r2, 411
LDI r3, 148
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
