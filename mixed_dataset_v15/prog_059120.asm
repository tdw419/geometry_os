; DESCRIPTION: Draws a red line from (57, 102) to (232, 72).
; PLAN: r0=57(x1), r1=102(y1), r2=232(x2), r3=72(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 102
LDI r2, 232
LDI r3, 72
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
