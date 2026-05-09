; DESCRIPTION: Draws a purple line from (90, 170) to (163, 236).
; PLAN: r0=90(x1), r1=170(y1), r2=163(x2), r3=236(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 170
LDI r2, 163
LDI r3, 236
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
