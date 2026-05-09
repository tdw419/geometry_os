; DESCRIPTION: Draws a magenta line from (343, 141) to (312, 179).
; PLAN: r0=343(x1), r1=141(y1), r2=312(x2), r3=179(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 141
LDI r2, 312
LDI r3, 179
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
