; DESCRIPTION: Draws a red line from (70, 61) to (118, 29).
; PLAN: r0=70(x1), r1=61(y1), r2=118(x2), r3=29(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 61
LDI r2, 118
LDI r3, 29
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
