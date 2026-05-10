; DESCRIPTION: Draws a purple line from (251, 170) to (111, 209).
; PLAN: r0=251(x1), r1=170(y1), r2=111(x2), r3=209(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 170
LDI r2, 111
LDI r3, 209
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
