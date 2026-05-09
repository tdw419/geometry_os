; DESCRIPTION: Draws a magenta line from (169, 132) to (217, 243).
; PLAN: r0=169(x1), r1=132(y1), r2=217(x2), r3=243(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 132
LDI r2, 217
LDI r3, 243
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
