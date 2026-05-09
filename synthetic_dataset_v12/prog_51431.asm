; DESCRIPTION: Draws a blue line from (259, 131) to (316, 252).
; PLAN: r0=259(x1), r1=131(y1), r2=316(x2), r3=252(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 131
LDI r2, 316
LDI r3, 252
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
