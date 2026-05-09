; DESCRIPTION: Draws a red line from (351, 132) to (182, 105).
; PLAN: r0=351(x1), r1=132(y1), r2=182(x2), r3=105(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 132
LDI r2, 182
LDI r3, 105
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
