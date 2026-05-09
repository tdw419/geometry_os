; DESCRIPTION: Draws a magenta line from (190, 23) to (217, 106).
; PLAN: r0=190(x1), r1=23(y1), r2=217(x2), r3=106(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 23
LDI r2, 217
LDI r3, 106
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
