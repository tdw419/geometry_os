; DESCRIPTION: Draws a magenta line from (6, 88) to (183, 97).
; PLAN: r0=6(x1), r1=88(y1), r2=183(x2), r3=97(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 88
LDI r2, 183
LDI r3, 97
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
