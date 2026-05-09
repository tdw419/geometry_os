; DESCRIPTION: Draws a magenta line from (316, 26) to (47, 239).
; PLAN: r0=316(x1), r1=26(y1), r2=47(x2), r3=239(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 26
LDI r2, 47
LDI r3, 239
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
