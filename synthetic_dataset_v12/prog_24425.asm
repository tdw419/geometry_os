; DESCRIPTION: Draws a purple line from (60, 2) to (33, 49).
; PLAN: r0=60(x1), r1=2(y1), r2=33(x2), r3=49(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 2
LDI r2, 33
LDI r3, 49
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
