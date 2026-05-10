; DESCRIPTION: Draws a magenta line from (132, 156) to (19, 51).
; PLAN: r0=132(x1), r1=156(y1), r2=19(x2), r3=51(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 156
LDI r2, 19
LDI r3, 51
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
