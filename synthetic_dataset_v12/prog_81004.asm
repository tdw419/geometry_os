; DESCRIPTION: Draws a magenta line from (116, 217) to (9, 52).
; PLAN: r0=116(x1), r1=217(y1), r2=9(x2), r3=52(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 217
LDI r2, 9
LDI r3, 52
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
