; DESCRIPTION: Draws a red line from (265, 80) to (381, 104).
; PLAN: r0=265(x1), r1=80(y1), r2=381(x2), r3=104(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 80
LDI r2, 381
LDI r3, 104
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
