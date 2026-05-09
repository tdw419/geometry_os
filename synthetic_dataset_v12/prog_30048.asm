; DESCRIPTION: Draws a magenta line from (357, 142) to (81, 87).
; PLAN: r0=357(x1), r1=142(y1), r2=81(x2), r3=87(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 142
LDI r2, 81
LDI r3, 87
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
