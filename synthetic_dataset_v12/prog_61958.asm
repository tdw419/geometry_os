; DESCRIPTION: Draws a red line from (232, 135) to (292, 35).
; PLAN: r0=232(x1), r1=135(y1), r2=292(x2), r3=35(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 135
LDI r2, 292
LDI r3, 35
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
