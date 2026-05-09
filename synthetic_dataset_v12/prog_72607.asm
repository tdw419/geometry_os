; DESCRIPTION: Draws a green line from (489, 158) to (35, 49).
; PLAN: r0=489(x1), r1=158(y1), r2=35(x2), r3=49(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 158
LDI r2, 35
LDI r3, 49
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
