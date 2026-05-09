; DESCRIPTION: Draws a red line from (246, 157) to (251, 191).
; PLAN: r0=246(x1), r1=157(y1), r2=251(x2), r3=191(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 157
LDI r2, 251
LDI r3, 191
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
