; DESCRIPTION: Draws a purple line from (227, 33) to (85, 102).
; PLAN: r0=227(x1), r1=33(y1), r2=85(x2), r3=102(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 33
LDI r2, 85
LDI r3, 102
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
