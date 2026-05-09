; DESCRIPTION: Draws a magenta line from (200, 53) to (316, 98).
; PLAN: r0=200(x1), r1=53(y1), r2=316(x2), r3=98(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 53
LDI r2, 316
LDI r3, 98
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
