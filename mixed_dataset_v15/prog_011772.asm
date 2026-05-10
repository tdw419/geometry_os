; DESCRIPTION: Draws a magenta line from (140, 66) to (140, 145).
; PLAN: r0=140(x1), r1=66(y1), r2=140(x2), r3=145(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 66
LDI r2, 140
LDI r3, 145
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
