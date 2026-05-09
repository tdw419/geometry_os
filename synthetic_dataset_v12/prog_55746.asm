; DESCRIPTION: Draws a white line from (157, 103) to (316, 10).
; PLAN: r0=157(x1), r1=103(y1), r2=316(x2), r3=10(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 103
LDI r2, 316
LDI r3, 10
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
