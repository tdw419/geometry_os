; DESCRIPTION: Draws a red line from (172, 79) to (12, 246).
; PLAN: r0=172(x1), r1=79(y1), r2=12(x2), r3=246(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 79
LDI r2, 12
LDI r3, 246
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
