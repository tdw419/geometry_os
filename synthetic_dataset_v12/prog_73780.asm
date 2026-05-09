; DESCRIPTION: Draws a magenta line from (467, 222) to (311, 178).
; PLAN: r0=467(x1), r1=222(y1), r2=311(x2), r3=178(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 222
LDI r2, 311
LDI r3, 178
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
