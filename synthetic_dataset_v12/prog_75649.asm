; DESCRIPTION: Draws a purple line from (333, 170) to (370, 0).
; PLAN: r0=333(x1), r1=170(y1), r2=370(x2), r3=0(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 170
LDI r2, 370
LDI r3, 0
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
