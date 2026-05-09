; DESCRIPTION: Draws a red line from (316, 84) to (430, 173).
; PLAN: r0=316(x1), r1=84(y1), r2=430(x2), r3=173(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 84
LDI r2, 430
LDI r3, 173
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
