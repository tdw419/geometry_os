; DESCRIPTION: Draws a red line from (246, 83) to (35, 247).
; PLAN: r0=246(x1), r1=83(y1), r2=35(x2), r3=247(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 83
LDI r2, 35
LDI r3, 247
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
