; DESCRIPTION: Draws a magenta line from (153, 78) to (467, 181).
; PLAN: r0=153(x1), r1=78(y1), r2=467(x2), r3=181(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 78
LDI r2, 467
LDI r3, 181
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
