; DESCRIPTION: Draws a purple line from (54, 60) to (37, 30).
; PLAN: r0=54(x1), r1=60(y1), r2=37(x2), r3=30(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 60
LDI r2, 37
LDI r3, 30
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
