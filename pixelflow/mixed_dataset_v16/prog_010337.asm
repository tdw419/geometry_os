; DESCRIPTION: Draws a orange line from (246, 190) to (265, 229).
; PLAN: r0=246(x1), r1=190(y1), r2=265(x2), r3=229(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 190
LDI r2, 265
LDI r3, 229
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
