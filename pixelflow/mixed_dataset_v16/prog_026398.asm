; DESCRIPTION: Draws a magenta line from (205, 97) to (373, 147).
; PLAN: r0=205(x1), r1=97(y1), r2=373(x2), r3=147(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 97
LDI r2, 373
LDI r3, 147
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
