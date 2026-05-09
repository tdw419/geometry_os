; DESCRIPTION: Draws a purple line from (3, 245) to (60, 78).
; PLAN: r0=3(x1), r1=245(y1), r2=60(x2), r3=78(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 245
LDI r2, 60
LDI r3, 78
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
