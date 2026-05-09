; DESCRIPTION: Draws a magenta line from (233, 211) to (37, 85).
; PLAN: r0=233(x1), r1=211(y1), r2=37(x2), r3=85(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 211
LDI r2, 37
LDI r3, 85
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
