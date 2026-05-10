; DESCRIPTION: Draws a magenta line from (105, 45) to (97, 22).
; PLAN: r0=105(x1), r1=45(y1), r2=97(x2), r3=22(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 45
LDI r2, 97
LDI r3, 22
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
