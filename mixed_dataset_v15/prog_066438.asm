; DESCRIPTION: Renders a orange line between points (316, 173) and (221, 229).
; PLAN: r0=316(x1), r1=173(y1), r2=221(x2), r3=229(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 173
LDI r2, 221
LDI r3, 229
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
