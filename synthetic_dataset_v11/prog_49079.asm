; DESCRIPTION: Draws a red line from (2, 246) to (153, 12).
; PLAN: r0=2(x1), r1=246(y1), r2=153(x2), r3=12(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 246
LDI r2, 153
LDI r3, 12
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
