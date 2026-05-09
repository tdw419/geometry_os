; DESCRIPTION: Draws a red line from (142, 90) to (74, 110).
; PLAN: r0=142(x1), r1=90(y1), r2=74(x2), r3=110(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 90
LDI r2, 74
LDI r3, 110
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
