; DESCRIPTION: Draws a red line from (232, 72) to (61, 206).
; PLAN: r0=232(x1), r1=72(y1), r2=61(x2), r3=206(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 72
LDI r2, 61
LDI r3, 206
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
