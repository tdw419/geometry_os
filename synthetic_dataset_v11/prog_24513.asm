; DESCRIPTION: Draws a red line from (0, 30) to (246, 54).
; PLAN: r0=0(x1), r1=30(y1), r2=246(x2), r3=54(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 30
LDI r2, 246
LDI r3, 54
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
