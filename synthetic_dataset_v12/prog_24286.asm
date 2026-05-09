; DESCRIPTION: Draws a red line from (372, 158) to (5, 132).
; PLAN: r0=372(x1), r1=158(y1), r2=5(x2), r3=132(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 158
LDI r2, 5
LDI r3, 132
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
