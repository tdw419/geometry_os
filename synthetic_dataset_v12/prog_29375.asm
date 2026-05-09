; DESCRIPTION: Draws a magenta line from (316, 64) to (388, 167).
; PLAN: r0=316(x1), r1=64(y1), r2=388(x2), r3=167(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 64
LDI r2, 388
LDI r3, 167
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
