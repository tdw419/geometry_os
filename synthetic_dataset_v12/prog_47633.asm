; DESCRIPTION: Draws a orange line from (316, 248) to (103, 30).
; PLAN: r0=316(x1), r1=248(y1), r2=103(x2), r3=30(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 248
LDI r2, 103
LDI r3, 30
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
