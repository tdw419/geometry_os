; DESCRIPTION: Draws a red line from (428, 38) to (286, 118).
; PLAN: r0=428(x1), r1=38(y1), r2=286(x2), r3=118(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 38
LDI r2, 286
LDI r3, 118
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
