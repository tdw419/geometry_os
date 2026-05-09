; DESCRIPTION: Draws a magenta line from (68, 77) to (227, 179).
; PLAN: r0=68(x1), r1=77(y1), r2=227(x2), r3=179(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 77
LDI r2, 227
LDI r3, 179
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
