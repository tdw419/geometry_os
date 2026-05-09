; DESCRIPTION: Draws a purple line from (452, 200) to (156, 40).
; PLAN: r0=452(x1), r1=200(y1), r2=156(x2), r3=40(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 200
LDI r2, 156
LDI r3, 40
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
