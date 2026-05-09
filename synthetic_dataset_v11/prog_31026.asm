; DESCRIPTION: Draws a red line from (117, 83) to (232, 135).
; PLAN: r0=117(x1), r1=83(y1), r2=232(x2), r3=135(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 83
LDI r2, 232
LDI r3, 135
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
