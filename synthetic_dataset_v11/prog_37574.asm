; DESCRIPTION: Draws a red line from (84, 118) to (101, 84).
; PLAN: r0=84(x1), r1=118(y1), r2=101(x2), r3=84(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 118
LDI r2, 101
LDI r3, 84
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
