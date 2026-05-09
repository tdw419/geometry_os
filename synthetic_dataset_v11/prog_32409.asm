; DESCRIPTION: Draws a magenta line from (105, 217) to (16, 140).
; PLAN: r0=105(x1), r1=217(y1), r2=16(x2), r3=140(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 217
LDI r2, 16
LDI r3, 140
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
