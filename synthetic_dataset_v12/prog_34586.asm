; DESCRIPTION: Draws a green line from (316, 178) to (1, 251).
; PLAN: r0=316(x1), r1=178(y1), r2=1(x2), r3=251(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 178
LDI r2, 1
LDI r3, 251
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
