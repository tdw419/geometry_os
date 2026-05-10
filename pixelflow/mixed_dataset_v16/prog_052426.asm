; DESCRIPTION: Draws a red line from (471, 20) to (353, 181).
; PLAN: r0=471(x1), r1=20(y1), r2=353(x2), r3=181(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 20
LDI r2, 353
LDI r3, 181
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
