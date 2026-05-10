; DESCRIPTION: Draws a red line from (121, 12) to (93, 77).
; PLAN: r0=121(x1), r1=12(y1), r2=93(x2), r3=77(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 12
LDI r2, 93
LDI r3, 77
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
