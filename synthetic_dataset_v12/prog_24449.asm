; DESCRIPTION: Draws a magenta line from (278, 3) to (179, 61).
; PLAN: r0=278(x1), r1=3(y1), r2=179(x2), r3=61(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 3
LDI r2, 179
LDI r3, 61
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
