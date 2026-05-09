; DESCRIPTION: Draws a red line from (232, 104) to (452, 137).
; PLAN: r0=232(x1), r1=104(y1), r2=452(x2), r3=137(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 104
LDI r2, 452
LDI r3, 137
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
