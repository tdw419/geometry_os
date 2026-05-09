; DESCRIPTION: Draws a red line from (0, 104) to (158, 7).
; PLAN: r0=0(x1), r1=104(y1), r2=158(x2), r3=7(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 104
LDI r2, 158
LDI r3, 7
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
