; DESCRIPTION: Draws a magenta line from (153, 167) to (85, 201).
; PLAN: r0=153(x1), r1=167(y1), r2=85(x2), r3=201(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 167
LDI r2, 85
LDI r3, 201
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
