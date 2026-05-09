; DESCRIPTION: Draws a magenta line from (457, 97) to (448, 232).
; PLAN: r0=457(x1), r1=97(y1), r2=448(x2), r3=232(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 97
LDI r2, 448
LDI r3, 232
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
