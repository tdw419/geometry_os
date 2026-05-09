; DESCRIPTION: Places a magenta line segment connecting (221, 90) to (316, 167).
; PLAN: r0=221(x1), r1=90(y1), r2=316(x2), r3=167(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 90
LDI r2, 316
LDI r3, 167
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
