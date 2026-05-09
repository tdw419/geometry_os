; DESCRIPTION: Draws a red line from (207, 238) to (339, 104).
; PLAN: r0=207(x1), r1=238(y1), r2=339(x2), r3=104(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 238
LDI r2, 339
LDI r3, 104
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
