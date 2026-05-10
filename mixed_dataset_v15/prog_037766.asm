; DESCRIPTION: Draws a magenta line from (351, 170) to (399, 115).
; PLAN: r0=351(x1), r1=170(y1), r2=399(x2), r3=115(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 170
LDI r2, 399
LDI r3, 115
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
