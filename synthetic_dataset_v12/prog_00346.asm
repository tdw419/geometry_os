; DESCRIPTION: Draws a red line from (66, 246) to (250, 247).
; PLAN: r0=66(x1), r1=246(y1), r2=250(x2), r3=247(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 246
LDI r2, 250
LDI r3, 247
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
