; DESCRIPTION: Draws a white line from (311, 188) to (483, 22).
; PLAN: r0=311(x1), r1=188(y1), r2=483(x2), r3=22(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 188
LDI r2, 483
LDI r3, 22
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
