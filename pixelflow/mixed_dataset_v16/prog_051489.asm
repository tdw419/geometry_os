; DESCRIPTION: Draws a red line from (216, 121) to (153, 15).
; PLAN: r0=216(x1), r1=121(y1), r2=153(x2), r3=15(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 121
LDI r2, 153
LDI r3, 15
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
