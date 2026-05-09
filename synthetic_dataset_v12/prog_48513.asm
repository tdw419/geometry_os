; DESCRIPTION: Draws a magenta line from (177, 145) to (350, 84).
; PLAN: r0=177(x1), r1=145(y1), r2=350(x2), r3=84(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 145
LDI r2, 350
LDI r3, 84
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
