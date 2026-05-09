; DESCRIPTION: Draws a green line from (316, 103) to (343, 133).
; PLAN: r0=316(x1), r1=103(y1), r2=343(x2), r3=133(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 103
LDI r2, 343
LDI r3, 133
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
