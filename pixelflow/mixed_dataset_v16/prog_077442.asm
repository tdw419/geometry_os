; DESCRIPTION: Draws a magenta line from (407, 30) to (116, 198).
; PLAN: r0=407(x1), r1=30(y1), r2=116(x2), r3=198(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 30
LDI r2, 116
LDI r3, 198
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
