; DESCRIPTION: Draws a purple line from (248, 2) to (463, 149).
; PLAN: r0=248(x1), r1=2(y1), r2=463(x2), r3=149(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 2
LDI r2, 463
LDI r3, 149
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
