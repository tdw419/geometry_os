; DESCRIPTION: Draws a magenta line from (246, 9) to (140, 201).
; PLAN: r0=246(x1), r1=9(y1), r2=140(x2), r3=201(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 9
LDI r2, 140
LDI r3, 201
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
