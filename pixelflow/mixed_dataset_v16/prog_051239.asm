; DESCRIPTION: Draws a purple line from (145, 229) to (311, 69).
; PLAN: r0=145(x1), r1=229(y1), r2=311(x2), r3=69(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 229
LDI r2, 311
LDI r3, 69
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
