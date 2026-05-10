; DESCRIPTION: Draws a orange line from (246, 72) to (342, 174).
; PLAN: r0=246(x1), r1=72(y1), r2=342(x2), r3=174(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 72
LDI r2, 342
LDI r3, 174
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
