; DESCRIPTION: Draws a purple line from (311, 100) to (34, 171).
; PLAN: r0=311(x1), r1=100(y1), r2=34(x2), r3=171(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 100
LDI r2, 34
LDI r3, 171
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
