; DESCRIPTION: Draws a green line from (486, 84) to (316, 101).
; PLAN: r0=486(x1), r1=84(y1), r2=316(x2), r3=101(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 84
LDI r2, 316
LDI r3, 101
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
