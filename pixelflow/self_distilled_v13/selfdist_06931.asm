; DESCRIPTION: Draws a magenta line from (145, 70) to (158, 107).
; PLAN: r0=145(x1), r1=70(y1), r2=158(x2), r3=107(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 70
LDI r2, 158
LDI r3, 107
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
