; DESCRIPTION: Draws a yellow line from (201, 183) to (85, 56).
; PLAN: r0=201(x1), r1=183(y1), r2=85(x2), r3=56(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 183
LDI r2, 85
LDI r3, 56
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
