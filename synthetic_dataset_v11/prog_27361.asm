; DESCRIPTION: Draws a magenta line from (97, 201) to (58, 247).
; PLAN: r0=97(x1), r1=201(y1), r2=58(x2), r3=247(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 201
LDI r2, 58
LDI r3, 247
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
