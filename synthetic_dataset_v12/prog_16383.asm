; DESCRIPTION: Draws a magenta line from (132, 212) to (129, 124).
; PLAN: r0=132(x1), r1=212(y1), r2=129(x2), r3=124(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 212
LDI r2, 129
LDI r3, 124
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
