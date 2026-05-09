; DESCRIPTION: Draws a red line from (143, 100) to (101, 29).
; PLAN: r0=143(x1), r1=100(y1), r2=101(x2), r3=29(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 100
LDI r2, 101
LDI r3, 29
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
