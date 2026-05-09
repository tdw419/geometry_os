; DESCRIPTION: Draws a magenta line from (79, 200) to (311, 122).
; PLAN: r0=79(x1), r1=200(y1), r2=311(x2), r3=122(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 200
LDI r2, 311
LDI r3, 122
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
