; DESCRIPTION: Draws a magenta line from (181, 229) to (116, 157).
; PLAN: r0=181(x1), r1=229(y1), r2=116(x2), r3=157(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 229
LDI r2, 116
LDI r3, 157
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
