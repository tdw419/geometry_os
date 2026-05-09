; DESCRIPTION: Draws a purple line from (357, 97) to (58, 64).
; PLAN: r0=357(x1), r1=97(y1), r2=58(x2), r3=64(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 97
LDI r2, 58
LDI r3, 64
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
