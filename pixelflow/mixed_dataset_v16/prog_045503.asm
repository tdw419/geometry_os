; DESCRIPTION: Draws a magenta line from (323, 156) to (382, 191).
; PLAN: r0=323(x1), r1=156(y1), r2=382(x2), r3=191(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 156
LDI r2, 382
LDI r3, 191
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
