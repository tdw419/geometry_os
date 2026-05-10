; DESCRIPTION: Draws a green line from (101, 54) to (316, 30).
; PLAN: r0=101(x1), r1=54(y1), r2=316(x2), r3=30(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 54
LDI r2, 316
LDI r3, 30
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
