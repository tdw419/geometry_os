; DESCRIPTION: Draws a red line from (431, 227) to (463, 49).
; PLAN: r0=431(x1), r1=227(y1), r2=463(x2), r3=49(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 227
LDI r2, 463
LDI r3, 49
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
