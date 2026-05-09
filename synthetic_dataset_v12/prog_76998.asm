; DESCRIPTION: Draws a red line from (72, 26) to (297, 75).
; PLAN: r0=72(x1), r1=26(y1), r2=297(x2), r3=75(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 26
LDI r2, 297
LDI r3, 75
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
