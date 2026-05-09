; DESCRIPTION: Places a blue line segment connecting (158, 52) to (316, 146).
; PLAN: r0=158(x1), r1=52(y1), r2=316(x2), r3=146(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 52
LDI r2, 316
LDI r3, 146
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
