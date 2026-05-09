; DESCRIPTION: Draws a magenta line from (142, 66) to (84, 15).
; PLAN: r0=142(x1), r1=66(y1), r2=84(x2), r3=15(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 66
LDI r2, 84
LDI r3, 15
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
