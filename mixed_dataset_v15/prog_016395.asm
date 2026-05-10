; DESCRIPTION: Draws a magenta line from (311, 107) to (109, 10).
; PLAN: r0=311(x1), r1=107(y1), r2=109(x2), r3=10(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 107
LDI r2, 109
LDI r3, 10
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
