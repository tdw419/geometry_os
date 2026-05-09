; DESCRIPTION: Draws a red line from (5, 159) to (476, 104).
; PLAN: r0=5(x1), r1=159(y1), r2=476(x2), r3=104(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 159
LDI r2, 476
LDI r3, 104
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
