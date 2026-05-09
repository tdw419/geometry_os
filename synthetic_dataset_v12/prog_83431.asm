; DESCRIPTION: Draws a blue line from (380, 100) to (311, 34).
; PLAN: r0=380(x1), r1=100(y1), r2=311(x2), r3=34(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 100
LDI r2, 311
LDI r3, 34
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
